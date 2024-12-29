from .database import get_db_connection, release_db_connection

def get_table_data(section):
    """
    Realiza una consulta para obtener los datos de una tabla específica.
    """
    connection = None

    queries = {
    'categories_resources': 
    """
    SELECT id AS "ID", name_category AS "Categoría"
    FROM categories_resources
    """,
    'catalogue_resources': 
    """
    SELECT res.id AS "ID", res.name_resource AS "Recurso", res.description AS "Descripción",
    CONCAT('$', TO_CHAR(res.price, 'FM999,999,999.00')) AS "Precio",
    cat.name_category AS "Categoría", sup.name_supplier AS "Proveedor"
    FROM resources res
    INNER JOIN categories_resources cat ON res.id_category = cat.id
    INNER JOIN supplier sup ON res.id_supplier = sup.id
    """,
    'supplier': 
    """
    SELECT id AS "ID", name_supplier AS "Proveedor", address AS "Dirección",
    lada AS "Lada", phone AS "Teléfono", email AS "Email", delivery_time AS "Tiempo de distribución"
    FROM supplier
    """,
    'categories_products': 'categories_products',
    'catalogue_products': 'products',
    'factories': 'factories',
    'equipment': 'equipment'
    }

    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        query = queries.get(section)
        cursor.execute(query)
        data = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        cursor.close()
        return columns, data
    except Exception as e:
        raise Exception(f"Error al consultar la tabla: {e}")
    finally:
        if connection:
            release_db_connection(connection)
