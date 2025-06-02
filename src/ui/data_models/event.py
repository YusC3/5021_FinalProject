from pydantic import BaseModel
from datetime import datetime

class Event(BaseModel):
    event_type:str
    event_time:datetime
    org_id:int 
    area_id:int
    street:str

class EventUpdate(BaseModel):
    EventID: int
    event_type:str
    event_time:datetime
    org_id:int 
    area_id:int
    street:str