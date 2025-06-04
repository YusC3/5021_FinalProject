from pydantic import BaseModel

class Ticket(BaseModel):
    VolunteerID: int
    TicketID:int
    EventID:int