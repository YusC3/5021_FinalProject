# Final Project - 5021 (Databases): Volunteer DB and API
### Date: 06/02/2025
### Engineers: Yusuf Corr, Peter Hsu, Zoya Soy

## Introduction: 
This is a final project for 5021 (Databases) at Seattle University, SPRING 2025. We build an inital DB (database) and API using python, FastAPI, and MySQL.

This docuemnt will explain how to set up and run this project from a local machine. If you don't have these libraries (FastAPI or mysql) download them here:
  - https://fastapi.tiangolo.com/
  - https://pypi.org/project/mysql-connector-python/


## DB Initalization and connection:

This section assumes you have a local MySQL db connection set up for you machine. 

1. Run this command from the repository root (replace '<>' with actual values): **mysql -u <username> -p <password> <database_name> < database_script/milestone2dump.sql**
2. Test that the DB is loaded using whatever method you like

## Run local instance of the API:
1. Add the connection values to directly to the file 'dbConnectionStrings.json' (in the dev folder)
2. In a terminal window (cmd, bash, ect..) run this command from the /src folder: **fastapi dev main.py**
3. Go to the local server address (something like this  http://100.0.0.1:8000/docs. this should show on the terminal window)
4. Use the GUI to test your http request!
