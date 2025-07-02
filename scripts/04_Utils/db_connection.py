# scripts/utils/db_connection.py
import pyodbc

def get_sql_server_connection():
    """
    Establishes a connection to SQL Server using Windows Authentication
    Returns: pyodbc.Connection object
    """
    server = 'DESKTOP-939GPCA'  # Your computer name
    database = 'English Premier League and Championship'  # Your database name
    
    try:
        conn = pyodbc.connect(
            Driver='{SQL Server}',
            Server=server,
            Database=database,
            Trusted_Connection='yes'  # Windows Authentication
        )
        print("Successfully connected to SQL Server!")
        return conn
    except Exception as e:
        print(f"Connection failed: {e}")
        raise