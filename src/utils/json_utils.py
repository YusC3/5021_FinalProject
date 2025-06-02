import os
import json

def load_json(current_dir, file_name):
    json_data = None
    full_file_path = os.path.join(current_dir, file_name)

    with open(full_file_path, 'r') as file:
        json_data = json.load(file)
    
    return json_data

def format_sql_rows_to_json(cursor):
    rows = cursor.fetchall()

    if not rows:
        return {} 
    
    columns = cursor.column_names
    data = [dict(zip(columns, row)) for row in rows]
    return data

def format_one_sql_row_to_json(cursor):
    row = cursor.fetchone()

    if not row:
        return {}  
    
    columns = cursor.column_names
    data = dict(zip(columns, row))
    return data