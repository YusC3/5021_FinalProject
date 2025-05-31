import mysql.connector

from utils.json_utils import format_sql_rows_to_json, format_one_sql_row_to_json

class VolunteerDatabaseBroker:
    def __init__(self, connection):
        self.connection = connection
        return
    
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

        json_data = self.execute_select_query(query, fetchall=True)
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

        json_data = self.execute_select_query(query, [EventID])
        return json_data
            
    def read_ticket_volunteerids(self, EventID = ""):
        if EventID == "":
            raise ValueError("Missing Event ID for query operation")
        
        query = """  Select * from ticket T
                     left join volunteer V on T.VolunteerID = V.VolunteerID
                     where Event_EventID = %s; """
   
        json_data = self.execute_select_query(query, (EventID,))
        return json_data
    
    def modify_ticket_inform_attendance(self, TicketID = "", EventID = ""):
        if (TicketID == "" or EventID == ""):
            raise ValueError("Missing Ticket ID or Event ID for query operation")
        
        query = """ update ticket 
                    set Attendance = 1 
                    where TicketID = %s and EventID = %s; """
 
        json_data = self.execute_update_query(query, (TicketID, EventID,))
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
        
        json_data = self.execute_update_query(query, (OName_, NPOTypeID, Email_, PhoneNumber, AreaID, Street, OrgID,))
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
 
        json_data = self.execute_select_query(query, (EventType, EventTime, OrgID, AreaID, Street, EventID,))
        return json_data
    
    def create_event(self, EventType = "", EventTime = "", OrgID = "", AreaID = "", Street = ""):
        if (EventType == "" or EventTime == "" or OrgID == "" or AreaID == ""):
            raise ValueError("Missing one or more parameters for operation")
        
        query = """ insert into events (EventType, EventTime, OrgID, AreaID, Street)
                    values (%s, %s, %s, %s, %s); """

        json_data = self.execute_select_query(query, (EventType, EventTime, OrgID, AreaID, Street,))
        return json_data
    
    def create_ticket_for_eventid(self, VolunteerID = "", EventID = ""):
        if (VolunteerID == "" or EventID == ""):
            raise ValueError("Missing one or more parameters for operation")
        
        query = """ insert into ticket (VolunteerID, EventID, Attendance)
                    values (%s, %s, false); """
 
        json_data = self.execute_select_query(query, (VolunteerID, EventID,))
        return json_data
    
    def execute_insert_query(self, query, params=None):
        print("TO DO")
        return
    
    def execute_update_query(self, query, params=None):
        print("TO DO")
        return

    def execute_select_query(self, query, params=None, fetchall=False):
        json_data = {};
        db_cursor = self.connection.cursor()

        try:
            if params:
                db_cursor.execute(query, params)
            else:
                db_cursor.execute(query)

            if fetchall:
                json_data = format_sql_rows_to_json(db_cursor)
            else:
                json_data = format_one_sql_row_to_json(db_cursor)

        except mysql.connector.Error as err:
            print("Error occured while running the query {}: {}".format(query,err))

        finally:
            db_cursor.close()
            self.connection.close()

        return json_data