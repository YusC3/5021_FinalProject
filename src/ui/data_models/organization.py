from pydantic import BaseModel

class OrganizationUpdate(BaseModel):
    OrgID: int
    Name: str 
    NPOTypeID: int 
    Email: str 
    PhoneNumber: str 
    AreaID: int 
    Street: str