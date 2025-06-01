import json
import os
import mysql.connector

from typing import Union
from typing import Annotated
from fastapi import Depends, FastAPI

from utils.json_utils import load_json
from db_connector import DBConnector
from volunteer_db_service import VolunteerDatabaseService
from data_models import Event


current_dir = os.path.dirname(os.path.abspath(__file__))
dbConnectionStrings = load_json(current_dir, "..\dev\dbConnectionStrings.json")
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
def read_TicketInform_volunteers(EventID: str,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.read_ticket_volunteerids(EventID)
    return json_data

@app.get("/EventInform/UpdateAttendance/{TicketID},{EventID}")
def Update_TicketInform_Attendance(TicketID: str, EventID: str,
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.modify_ticket_inform_attendance(TicketID,EventID)
    return json_data

@app.get("/UpdateOrganization")
def Update_Organization(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.modify_organization_for_orid("1", "Human Rights Watch", "1", "info@humanrightswatch.org", "(166) 822-6378", "100", "Cherry St")
    return json_data

@app.get("/UpdateEvents")
def Update_Event(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.modify_event_for_eventid("1", "Food Distribution", "2021-05-24 11:47:00", "1", "100", "Cherry St")
    return json_data

@app.post("/events/", status_code=201)
def create_event(
    event: Event,
    database_dependency:
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    event_id = database_dependency.database_broker.create_event(event)
    json_data = database_dependency.database_broker.read_event_for_eventid(event_id)
    return json_data

@app.get("/AddTickets")
def Insert_Tickets(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = database_dependency.database_broker.create_ticket_for_eventid("1", "1")
    return json_data