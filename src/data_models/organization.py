from pydantic import BaseModel
from datetime import datetime

class Organization(BaseModel):
    name: str
    npotype_id: int
    email: str
    phone_number: str
    area_id: int
    street: str