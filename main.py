import json
import os
import mysql.connector

from typing import Union
from typing import Annotated
from fastapi import Depends, FastAPI

from utils.json_utils import load_json
from volunteer_db_broker import VolunteerDatabaseBroker


current_dir = os.path.dirname(os.path.abspath(__file__))
dbConnectionStrings = load_json(current_dir, "dev\dbConnectionStrings.json")
app = FastAPI()

class DatabaseConnectionDependency:
    def __init__(self):
        connection = mysql.connector.connect(
            user = dbConnectionStrings["user"],
            password = dbConnectionStrings["password"],
            host = dbConnectionStrings["host"],
            database = dbConnectionStrings["database"]
        )

        self.database_broker = VolunteerDatabaseBroker(connection)

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/vendorType/")
def read_vendor_type(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = None

    json_data = database_dependency.database_broker.read_all_vendors()
    return json_data

@app.get("/EventInform/Ticketcount")
def read_TicketInform_Ticketcount(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = None

    json_data = database_dependency.database_broker.TicketInform_Ticketcount("1")
    return json_data

@app.get("/EventInform/volunteers")
def read_TicketInform_volunteers(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = None

    json_data = database_dependency.database_broker.TicketInform_volunteers("1")
    return json_data

@app.get("/EventInform/UpdateAttendance")
def read_TicketInform_UpdateAttendance(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = None

    json_data = database_dependency.database_broker.TicketInform_UpdateAttendance("1","1")
    return json_data

@app.get("/UpdateOrganization")
def read_UpdateOrganization(
    database_dependency: 
        Annotated[DatabaseConnectionDependency, 
        Depends(DatabaseConnectionDependency)]):
    json_data = None

    json_data = database_dependency.database_broker.UpdateOrganization("1", "Human Rights Watch", "1", "info@humanrightswatch.org", "(166) 822-6378", "100", "Cherry St")
    return json_data