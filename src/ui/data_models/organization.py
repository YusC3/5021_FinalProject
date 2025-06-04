from pydantic import BaseModel

class Organization(BaseModel):
    org_id: int
    name: str
    npotype_id: int
    email: str
    phone_number: str
    area_id: int
    street: str