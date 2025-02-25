<<<<<<< HEAD
rom psycopg2 import pool
=======
import os
os.add_dll_directory('D:\\USUARIO\\Documents\\UdeG\\Modular\\web-site\\app\\Drivers\\IBM\\clidriver\\bin')
import ibm_db
>>>>>>> d04b8e0b09ca5919f0d5357678964a2c1c316b47

conn_str='database=bludb;hostname=b1bc1829-6f45-4cd4-bef4-10cf081900bf.c1ogj3sd0tgtu0lqde00.databases.appdomain.cloud;port=32304;protocol=tcpip;uid=nfs41860;pwd=EkJyrZexV79yZRb4'


dsn = (
    "DATABASE=bludb;"
    "HOSTNAME=b1bc1829-6f45-4cd4-bef4-10cf081900bf.c1ogj3sd0tgtu0lqde00.databases.appdomain.cloud;"
    "PORT=32304;"
    "SECURITY=SSL;"
    "SSLServerCertificate=D:\\USUARIO\\Documents\\UdeG\\Modular\\web-site\\app\\DigiCertGlobalRootCA.crt;"
    "UID=nfs41860;"
    "PWD=EkJyrZexV79yZRb4;"
)

# Función para establecer conexión con DB2
def get_db_connection():
    try:
        conn = ibm_db.connect(dsn, "", "")
        return conn
    except Exception as e:
        raise Exception(f"Error al obtener la conexión a la base de datos: {e}")

<<<<<<< HEAD
def release_db_connection(connection):
    """
    Libera la conexión al pool.
    """
    try:
        db_pool.putconn(connection)
    except Exception as e:
        raise Exception(f"Error al liberar la conexión: {e}")
=======
# Función para cerrar la conexión con DB2
def close_db_connection(conn):
    if conn:
        try:
            ibm_db.close(conn)
        except Exception as e:
            raise Exception(f"Error al cerrar la conexión a la base de datos: {e}")
>>>>>>> d04b8e0b09ca5919f0d5357678964a2c1c316b47
