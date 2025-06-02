import mysql.connector

from mysql.connector import errorcode
from fastapi import FastAPI, HTTPException
from utils.json_utils import format_sql_rows_to_json, format_one_sql_row_to_json

class DBConnector:
    def __init__(self, connection):
        self.connection = connection
        return
    
    def execute_insert_query(self, query, params):
        row_id = None
        db_cursor = self.connection.cursor()

        try:
            db_cursor.execute(query, params)
            self.connection.commit()
            self._validate_insert(db_cursor, query)
            row_id = db_cursor.lastrowid

        except errorcode.ER_X_BAD_INSERT_DATA as insert_err:
            self.connection.rollback()
            raise HTTPException(status_code=400, detail="Event could not be created due to bad data")
        
        except mysql.connector.Error as err:
            self.connection.rollback()
            print("Error occured while running the query {}: {}".format(query,err))

        finally:
            db_cursor.close()

        return row_id
    
    def execute_update_query(self, query, params=None):
        print("TO DO")
        return

    def execute_select_query(self, query, params=None, fetchall=False):
        json_data = {}
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
    
    def _validate_insert(self, db_cursor, query):
        if db_cursor.rowcount <= 0:
            raise errorcode.ER_X_BAD_INSERT_DATA("The data could not be inserted for the query: {}".format(query))
        
    def execute_stored_procedure(self, proc_name:str, params=None):
        row_id = None
        db_cursor = self.connection.cursor()

        try:
            params.ag
            result_args = db_cursor.callproc(proc_name, params)
            row_id = result_args[6]
        
        except mysql.connector.Error as err:
            self.connection.rollback()
            print("Error occured while running the stored procedure {}: {}".format(proc_name,err))

        finally:
            db_cursor.close()

        return row_id