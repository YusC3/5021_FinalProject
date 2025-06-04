import json
import os
import mysql.connector

from typing import Union
from typing import Annotated
from fastapi import Depends, FastAPI

from utils.json_utils import load_json
from db_connector import DBConnector
from volunteer_db_service import VolunteerDatabaseService
from data_models.event import Event, EventUpdate
from data_models.ticket import Ticket
from data_models.organization import Organization


current_dir = os.path.dirname(os.path.abspath(__file__))
dbConnectionStrings = load_json(current_dir, "dev/dbConnectionStrings.json")
app = FastAPI()

class DatabaseConnectionDependency:
    def __init__(self):
        connection = mysql.connector.connect(
            user = dbConnectionStrings["user"],
            password = dbConnectionStrings["password"],
            host = dbConnectionStrings["host"],
            database = dbConnectionStrings["database"]
        )
        db_connector = DBConnector(connection)
        self.database_broker = VolunteerDatabaseService(db_connector)

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/vendors/")
def read_vendors(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_all_vendors()
    return json_data

@app.get("/areas/")
def read_Areas(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_all_areas()
    return json_data

@app.get("/Organization/{org_id}/EventsList")
def read_Organization_EventsList(
    org_id: int,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_organization_eventslist(org_id)
    return json_data

@app.get("/events/{event_id}/attendance_percentage")
def read_TicketInform_Attendance_Percentage(
    event_id: int,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_ticket_attendance_percentage(event_id)
    return json_data

@app.get("/EventInform/volunteersInEvents/{EventID}")
def read_TicketInform_volunteers(EventID: int,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_ticket_volunteerids(EventID)
    return json_data

@app.get("/Event={EventID}")
def read_Vendors_Area(EventID: int,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_event_for_eventid(EventID)
    return json_data

@app.get("/vendors/area={AreaID}")
def read_Vendors_Area(AreaID: int,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_vendors_area(AreaID)
    return json_data

@app.get("/organization/orgid={OrgID}")
def read_Vendors_Area(OrgID: int,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_organization(OrgID)
    return json_data

@app.put("/EventInform/UpdateAttendance/", status_code=201)
def Update_TicketInform_Attendance(ticket: Ticket,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.modify_ticket_inform_attendance(ticket)
    return json_data

@app.put("/UpdateOrganization", status_code=201)
def Update_Organization(organization: Organization,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.modify_organization_for_orid(organization)
    return json_data

@app.put("/UpdateEvents/", status_code=201)
def Update_Event(eventupdate: EventUpdate,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.modify_event_for_eventid(eventupdate)
    return json_data

@app.post("/events/", )
def create_event(
    event: Event,
    database_dependency:
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    event_id = database_dependency.database_broker.create_event(event)
    json_data = database_dependency.database_broker.read_event_for_eventid(event_id)
    return json_data

@app.post("/AddTickets/", status_code=201)
def create_tickets(
    ticket: Ticket,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.create_ticket_for_eventid(ticket)
    return json_data

@app.post("/organization/", )
def create_organization(
    organization: Organization,
    database_dependency:
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    org_id = database_dependency.database_broker.add_new_organization(organization)
    #json_data = database_dependency.database_broker.read_event_for_eventid(event_id)
    return {"org_id":org_id}