from data_models import Event
from db_connector import DBConnector

class VolunteerDatabaseService:
    def __init__(self, db_Connector: DBConnector):
        self.db_connector = db_Connector

    def read_all_vendors(self):
        json_data = {}

        query = """
                SELECT 
                    v.VendorID, 
                    v.Name AS VendorName, 
                    IF(v.CanDeliver = 1, 'Yes', 'No') AS CanDeliver, 
                    v.PhoneNumber,
                    vt.Type,
                    v.Street, 
                    a.City, 
                    a.State, 
                    a.ZIP, 
                    a.Country
                FROM vendor v
                JOIN vendortype vt ON vt.TypeID = v.TypeID
                JOIN area a ON a.AreaID = v.AreaID"""

        json_data = self.db_connector.execute_select_query(query, fetchall=True)
        return json_data
    
    def read_all_areas(self):
        query = """ SELECT * FROM area; """

        json_data = self.db_connector.execute_select_query(query, fetchall=True)
        return json_data

    def read_ticket_attendance_percentage(self, EventID):
        query = """
                SELECT
	                o.Name AS Hosting_Organization,
	                e.EventType AS Event_Type,
	                t.EventID,
	                ROUND(100.0 * SUM(t.Attendance) / COUNT(*), 2) AS Percentage_Of_Attendance
                FROM events e 
                JOIN ticket t ON t.EventID = e.EventID
                JOIN organization o ON o.OrgID = e.OrgID
                WHERE t.EventID = %s;"""

        json_data = self.db_connector.execute_select_query(query, [EventID], fetchall=True)
        return json_data
    
    def read_event_for_eventid(self, EventID):
        query = """
                SELECT *
                FROM events e
                WHERE e.EventID = %s;"""

        json_data = self.db_connector.execute_select_query(query, [EventID], fetchall=True)
        return json_data
    
    def read_ticket_volunteerids(self, EventID):
        query = """  Select T.TicketID, V.Name, T.Attendance from ticket T
                     left join volunteer V on T.VolunteerID = V.VolunteerID
                     where EventID = %s; """
   
        json_data = self.db_connector.execute_select_query(query, [EventID], fetchall=True)
        return json_data
    
    def read_vendors_area(self, AreaID):
        query = """  SELECT V.VendorID, V.Name, VT.Type, V.CanDeliver, V.PhoneNumber FROM vendor V 
                    left join vendortype VT on VT.TypeID = V.TypeID
                    Where V.AreaID = %s; """
   
        json_data = self.db_connector.execute_select_query(query, [AreaID], fetchall=True)
        return json_data
    
    def read_organization(self, OrgID):
        query = """ SELECT Name, NPOTypeID, Email, PhoneNumber, AreaID, Street FROM organization 
                    Where OrgID = %s; """
   
        json_data = self.db_connector.execute_select_query(query, [OrgID], fetchall=False)
        return json_data

    def modify_ticket_inform_attendance(self, TicketID = "", EventID = ""):
        if (TicketID == "" or EventID == ""):
            raise ValueError("Missing Ticket ID or Event ID for query operation")
        
        query = """ update ticket 
                    set Attendance = 1 
                    where TicketID = %s and EventID = %s; """
 
        json_data = self.db_connector.execute_update_query(query, (TicketID, EventID,))
        return json_data
    
    def modify_organization_for_orid(self, OrgID = "", OName_ = "", NPOTypeID = "", Email_ = "", PhoneNumber = "", AreaID = "", Street = ""):
        if (OrgID == "" or OName_ == "" or NPOTypeID == "" or PhoneNumber == "" or AreaID == ""):
            raise ValueError("Missing one or more parameters for operation")
        
        query = """ update organization 
                    set Name = %s, 
                        NPOTypeID = %s, 
                        Email = %s, 
                        PhoneNumber = %s, 
                        AreaID = %s, 
                        Street = %s 
                    where OrgID = %s; """
        
        json_data = self.db_connector.execute_update_query(query, (OName_, NPOTypeID, Email_, PhoneNumber, AreaID, Street, OrgID,))
        return json_data
    
    def modify_event_for_eventid(self, EventID = "", EventType = "", EventTime = "", OrgID = "", AreaID = "", Street = ""):
        if (EventID == "" or EventType == "" or EventTime == "" or OrgID == "" or AreaID == ""):
            raise ValueError("Missing one or more parameters for operation")
        
        query = """ update events 
                    set EventType = %s, 
                        EventTime = %s, 
                        OrgID = %s, 
                        AreaID = %s, 
                        Street = %s 
                    where EventID = %s; """
 
        json_data = self.db_connector.execute_update_query(query, (EventType, EventTime, OrgID, AreaID, Street, EventID,))
        return json_data
    
    def read_organization_eventslist(self, OrgID):
        query = """select EventID from events where OrgID = %s; """

        json_data = self.db_connector.execute_select_query(query, [OrgID], fetchall=True)
        return json_data

    def create_event(self, event:Event):
        query = """ insert into events (EventType, EventTime, OrgID, AreaID, Street)
                    values (%s, %s, %s, %s, %s); """

        row_id = self.db_connector.execute_insert_query(query, 
            (event.event_type, event.event_time, event.org_id, event.area_id, event.street))
        
        return row_id
    
    def create_ticket_for_eventid(self, VolunteerID, EventID): 
        query = """ insert into ticket (VolunteerID, EventID, Attendance)
                    values (%s, %s, false); """
        row_id = self.db_connector.execute_insert_query(query, 
            (VolunteerID, EventID))
        return row_id