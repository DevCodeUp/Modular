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
    lada AS "Lada", phone AS "Teléfono", email AS "Email", delivery_time AS "Tiempo de distribución (Días)"
    FROM supplier
    """,
    'categories_products': 
    """
    SELECT id AS "ID", name_category AS "Categoría" FROM categories_products
    """,
    'catalogue_products': 
    """
    SELECT pr.id AS "ID", pr.name_product AS "Producto", pr.description AS "Descripción",
    CONCAT('$', TO_CHAR(pr.price, 'FM999,999,999.00')) AS "Precio",
    cat.name_category AS "Categoría"  FROM products pr
    INNER JOIN categories_products cat ON pr.id_category = cat.id
    """,
    'factories': 
    """
    SELECT id AS "ID", name AS "Fábrica", cod_postal AS "Código Postal",
    address AS "Dirección", country AS "País", state AS "Estado"
    FROM factories
    """,
    'equipment': 
    """
    SELECT equ.id AS "ID", fac.name AS "Fábrica", pr.name_product AS "Producto Producido",
    equ.name AS "Máquina/Equipo", CONCAT(TO_CHAR(equ.min_prod, 'FM999,999,999'), ' ', equ.unit_measure) AS "Mínimo de Producción",
    CONCAT(TO_CHAR(equ.time, 'FM999,999,999'), ' ', equ.unit_time) AS "Tiempo Necesario de Producción"
    FROM equipment equ
    INNER JOIN factories fac ON equ.id_factory = fac.id
    INNER JOIN products pr ON equ.id_product = pr.id
    """
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

