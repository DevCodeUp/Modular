from .database import get_db_connection, close_db_connection
import ibm_db_dbi
import pandas as pd

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
    SELECT 
    res.id AS "ID",
    res.name_resource AS "Recurso",
    res.description AS "Descripción",
    '$' || TRIM(CHAR(DECIMAL(res.price, 10, 2))) AS "Precio",
    cat.name_category AS "Categoría",
    sup.name_supplier AS "Proveedor"
    FROM resources res
    INNER JOIN categories_resources cat ON res.id_category = cat.id
    INNER JOIN supplier sup ON res.id_supplier = sup.id;
    """,
    'supplier': 
    """
    SELECT id AS "ID", name_supplier AS "Proveedor", address AS "Dirección",
    lada AS "Lada", phone AS "Teléfono", delivery_time AS "Tiempo de distribución (Días)"
    FROM supplier
    """,
    'inventory': 
    """
    SELECT inv.id AS "ID", re.name_resource AS "Nombre del producto",
    inv.no_lot AS "Número de lote", inv.stock AS "Stock", inv.minimum_stock AS "Stock mínimo",
    inv.expiration_date AS "Fecha de caducidad"
    FROM inventory inv
    INNER JOIN resources re ON inv.id_resource = re.id
    """,
    'categories_products': 
    """
    SELECT id AS "ID", name_category AS "Categoría" FROM categories_products
    """,
    'catalogue_products': 
    """
    SELECT 
    pr.id AS "ID",
    pr.name_product AS "Producto",
    pr.description AS "Descripción",
    '$' || TRIM(CHAR(DECIMAL(pr.price, 10, 2))) AS "Precio",
    cat.name_category AS "Categoría"
    FROM products pr
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
    SELECT 
    equ.id AS "ID",
    fac.name AS "Fábrica",
    pr.name_product AS "Producto Producido",
    equ.name AS "Máquina/Equipo",
    TRIM(CHAR(DECIMAL(equ.min_prod, 10, 0))) || ' ' || equ.unit_measure AS "Mínimo de Producción",
    TRIM(CHAR(DECIMAL(equ.time, 10, 0))) || ' ' || equ.unit_time AS "Tiempo Necesario de Producción"
    FROM equipment equ
    INNER JOIN factories fac ON equ.id_factory = fac.id
    INNER JOIN products pr ON equ.id_product = pr.id;
    """
    }

    try:
        connection = get_db_connection()
        query = queries.get(section)
        if not query:
            raise ValueError(f"Consulta no encontrada para la sección: {section}")
        conn_dbi = ibm_db_dbi.Connection(connection)
        df = pd.read_sql(query, conn_dbi)
        return df
    except Exception as e:
        raise Exception(f"Error en la consulta: {e}")
        return pd.DataFrame()  # Retornar un DataFrame vacío si hay error
    except ValueError as ve:
        raise Exception(f"Error en la consulta: {ve}")
    finally:
        if connection:
            close_db_connection(connection)

