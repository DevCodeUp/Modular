from psycopg2 import pool

# Configuración para el pool de conexiones
db_pool = pool.SimpleConnectionPool(
    1,  # Mínimo de conexiones en el pool
    10,  # Máximo de conexiones en el pool
    host="localhost",
    database="modular",
    user="postgres",
    password="1234",
    port=5432
)

def get_db_connection():
    """
    Obtiene una conexión desde el pool.
    """
    try:
        return db_pool.getconn()
    except Exception as e:
        raise Exception(f"Error al obtener la conexión a la base de datos: {e}")

def release_db_connection(connection):
    """
    Libera la conexión al pool.
    """
    try:
        db_pool.putconn(connection)
    except Exception as e:
        raise Exception(f"Error al liberar la conexión: {e}")
