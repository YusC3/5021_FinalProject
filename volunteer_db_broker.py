import mysql.connector

from utils.json_utils import format_sql_rows_to_json

class VolunteerDatabaseBroker:
    def __init__(self, connection):
        self.connection = connection
        return
    
    def execute_query_fetchall(self, query, cursor):
        print("trying query...")
        cursor.execute(query)
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
            