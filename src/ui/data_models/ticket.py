from pydantic import BaseModel

class Ticket(BaseModel):
    VolunteerID:int
    EventID:int

class TicketUpdateAttendance(BaseModel):
    TicketID:int
    EventID:int