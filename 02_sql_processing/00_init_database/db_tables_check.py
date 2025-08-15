import pyodbc

def get_all_table_names():
    """Retrieves and prints all table names from the database"""
    try:
        # Connection parameters
        server = 'DESKTOP-939GPCA'
        database = 'English Premier League and Championship'
        
        # Establish connection
        conn = pyodbc.connect(
            Driver='{SQL Server}',
            Server=server,
            Database=database,
            Trusted_Connection='yes'
        )

        # Get all base tables
        with conn.cursor() as cursor:
            cursor.execute("""
                SELECT TABLE_SCHEMA, TABLE_NAME 
                FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_TYPE='BASE TABLE'
                ORDER BY TABLE_SCHEMA, TABLE_NAME
            """)
            
            tables = cursor.fetchall()

            # Print results with schema information
            print("\nTables in the database:")
            print("-" * 40)
            current_schema = None
            for schema, table in tables:
                if schema != current_schema:
                    print(f"\nSchema: {schema}")
                    print("-" * 30)
                    current_schema = schema
                print(f"  - {table}")

            print(f"\nTotal tables found: {len(tables)}")

    except pyodbc.Error as e:
        print(f"Database error occurred: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
    finally:
        if 'conn' in locals():
            conn.close()

if __name__ == "__main__":
    get_all_table_names()