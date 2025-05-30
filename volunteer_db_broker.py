import mysql.connector

from utils.json_utils import format_sql_rows_to_json

class VolunteerDatabaseBroker:
    def __init__(self, connection):
        self.connection = connection
        return
    
    def execute_query_fetchall(self, query, cursor, where_filter = ""):
        print("trying query...")
        if where_filter == "":
            cursor.execute(query)
        else:
            cursor.execute(query, where_filter)
        print(where_filter)
        print("worked!") 
        json_data = format_sql_rows_to_json(cursor)
        return json_data

    
    def read_all_vendors(self, country='USA'):
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

        try:
            db_cursor = self.connection.cursor()
            json_data = self.execute_query_fetchall(query, db_cursor)
            db_cursor.close()
        except mysql.connector.errors.Error as err:
            json_data = {err: err.msg}
        finally:
            self.connection.close()
        return json_data
    
    def TicketInform_Ticketcount(self, EventID = ""):
        json_data = {}

        query = """  Select (TA.TotalAttendance/TC.TicketCount) as persentage
                     from (
                         Select count(*) as TicketCount from ticket where Event_EventID = %s ) as TC
                     cross join (
                         Select count(*) as TotalAttendance from ticket where Event_EventID = %s and Attendance = 1 ) as TA; """

        try:
            db_cursor = self.connection.cursor()
            json_data = self.execute_query_fetchall(query, db_cursor, (EventID, EventID,))
            db_cursor.close()
        except mysql.connector.errors.Error as err:
            json_data = {err: err.msg}
        finally:
            self.connection.close()
        return json_data
            
    def TicketInform_volunteers(self, EventID = ""):
        json_data = {}
        if EventID == "":
            print("parameter error")
            return
        
        query = """  Select * from ticket 
                     left join volunteer on VolunteerID = Volunteer_VolunteerID
                     where Event_EventID = %s; """
   
        try:
            db_cursor = self.connection.cursor()
            json_data = self.execute_query_fetchall(query, db_cursor, (EventID,))
            db_cursor.close()
        except mysql.connector.errors.Error as err:
            json_data = {err: err.msg}
        finally:
            self.connection.close()
        return json_data
    
    def TicketInform_UpdateAttendance(self, TicketID = "", EventID = ""):
        json_data = {}
        if (TicketID == "" or EventID == ""):
            print("parameter error")
            return
        
        query = """ update ticket set Attendance = 1 where TicketID = %s and Event_EventID = %s; """
 
        try:
            db_cursor = self.connection.cursor()
            json_data = self.execute_query_fetchall(query, db_cursor, (TicketID, EventID,))
            db_cursor.close()
        except mysql.connector.errors.Error as err:
            json_data = {err: err.msg}
        finally:
            self.connection.close()
        return json_data
    
    def UpdateOrganization(self, OrgID = "", OName_ = "", NPOTypeID = "", Email_ = "", PhoneNumber = "", AreaID = "", Street = ""):
        json_data = {}
        if (OrgID == "" or OName_ == "" or NPOTypeID == "" or PhoneNumber == "" or AreaID == ""):
            print("parameter error")
            return
        
        query = " update organization set Name = %s, NPOTypeID = %s, Email = %s, PhoneNumber = %s, AreaID = %s, Street = %s where OrgID = %s; "
 
        try:
            db_cursor = self.connection.cursor()
            json_data = self.execute_query_fetchall(query, db_cursor, (OName_, NPOTypeID, Email_, PhoneNumber, AreaID, Street, OrgID,))
            db_cursor.close()
        except mysql.connector.errors.Error as err:
            json_data = {err: err.msg}
        finally:
            self.connection.close()
        return json_data