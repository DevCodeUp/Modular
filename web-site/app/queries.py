from .database import get_db_connection, close_db_connection
import ibm_db_dbi
import ibm_db
import pandas as pd

def getData(query):
    connection = None
    try:
        connection = get_db_connection()
        conn_dbi = ibm_db_dbi.Connection(connection)
        df = pd.read_sql(query, conn_dbi)
        return df  
    except Exception as e:
        raise Exception(f"Error en la consulta: {e}")
        return pd.DataFrame()
    finally:
        if connection:
            close_db_connection(connection)

def run_query(query,  params=None):
    connection = None
    try:
        # Obtener conexión a DB2
        connection = get_db_connection()

        # Preparar y ejecutar la consulta
        stmt = ibm_db.prepare(connection, query)
        
        if params:
            ibm_db.execute(stmt, params)
        else:
            ibm_db.execute(stmt)

        return True  # Éxito en la ejecución
    except Exception as e:
        print(f"Error en la consulta: {e}")
        return False  # Error en la ejecución
    finally:
        if connection:
            close_db_connection(connection)  # Cierra la conexión

# Funciones Específicas para Cada Consulta
def getCategoriesResources():
    query = """
    SELECT id AS "ID", name_category AS "Categoría"
    FROM categories_resources
    """
    return getData(query)

def getCatalogueResources():
    query = """
    SELECT 
    res.id AS "ID",
    res.name_resource AS "Recurso",
    res.description AS "Descripción",
    '$' || TRIM(CHAR(DECIMAL(res.price, 10, 2))) AS "Precio",
    cat.name_category AS "Categoría",
    sup.name_supplier AS "Proveedor"
    FROM resources res
    INNER JOIN categories_resources cat ON res.id_category = cat.id
    INNER JOIN supplier sup ON res.id_supplier = sup.id
    """
    return getData(query)

def getSuppliers():
    query = """
    SELECT id AS "ID", name_supplier AS "Proveedor", address AS "Dirección",
    lada AS "Lada", phone AS "Teléfono", delivery_time AS "Tiempo de distribución (Días)"
    FROM supplier
    """
    return getData(query)

def getInventory():
    query = """
    SELECT inv.id AS "ID", re.name_resource AS "Nombre del producto",
    inv.no_lot AS "Número de lote", inv.stock AS "Stock", inv.minimum_stock AS "Stock mínimo",
    inv.expiration_date AS "Fecha de caducidad"
    FROM inventory inv
    INNER JOIN resources re ON inv.id_resource = re.id
    """
    return getData(query)

def getCategoriesProducts():
    query = """
    SELECT id AS "ID", name_category AS "Categoría" FROM categories_products
    """
    return getData(query)

def getCatalogueProducts():
    query = """
    SELECT 
    pr.id AS "ID",
    pr.name_product AS "Producto",
    pr.description AS "Descripción",
    '$' || TRIM(CHAR(DECIMAL(pr.price, 10, 2))) AS "Precio",
    cat.name_category AS "Categoría"
    FROM products pr
    INNER JOIN categories_products cat ON pr.id_category = cat.id
    """
    return getData(query)

def getFactories():
    query = """
    SELECT id AS "ID", name AS "Fábrica", cod_postal AS "Código Postal", address AS "Dirección",
    country AS "País", state AS "Estado"
    FROM factories
    """
    return getData(query)

def getEquipment():
    query = """
    SELECT 
    equ.id AS "ID",
    equ.name AS "Máquina/Equipo",
    fac.name AS "Fábrica",
    pr.name_product AS "Producto Producido",
    TRIM(CHAR(DECIMAL(equ.min_prod, 10, 0))) || ' ' || equ.unit_measure AS "Mínimo de Producción",
    TRIM(CHAR(DECIMAL(equ.time, 10, 0))) || ' ' || equ.unit_time AS "Tiempo Necesario de Producción"
    FROM equipment equ
    INNER JOIN factories fac ON equ.id_factory = fac.id
    INNER JOIN products pr ON equ.id_product = pr.id
    """
    return getData(query)

def getProduction():
    query = """
    WITH cteEquipment AS (
    SELECT e.id, e.ID_FACTORY, p.NAME_PRODUCT, e.NAME, e.MIN_PROD, e.UNIT_MEASURE, e."TIME", e.UNIT_TIME 
    FROM EQUIPMENT e
    INNER JOIN PRODUCTS p ON e.ID_PRODUCT = p.ID
    )
    SELECT p.ID AS "ID", e.NAME AS "Equipo/Máquina", p."DATE" AS "Fecha", p.QUANT_PROD AS "Cantidad a producir", p.UNIT_MEASURE AS "Unidad de medida",
    p."TIME" AS "Tiempo",  p.UNIT_TIME AS "Unidad de tiempo", e.NAME_PRODUCT AS "Producto fabricado"
    FROM PRODUCTION p
    INNER JOIN cteEquipment e ON p.ID_EQUIPMENT = e.ID;
    """
    return getData(query)

def getStore():
    query = """
    SELECT s.ID AS "ID", p.NAME_PRODUCT AS "Producto", s.NO_LOT AS "Número de lote", s.AMOUNT AS "Cantidad",
    s.EXPIRATION_DATE AS "Fecha de caducidad", s.PRODUCTION_DATE AS "Fecha de producción"
    FROM PRODUCTS p
    INNER JOIN STORE s ON p.ID = s.ID_PRODUCT ;
    """
    return getData(query)

def getRecipes():
    query = """
    SELECT r.RECIPEID AS "ID", p.NAME_PRODUCT AS "Producto", re.NAME_RESOURCE AS "Recurso", r.QUANTITY AS "Cantidad", r.UNIT AS "Unidad de Medida"
    FROM RECIPES r
    INNER JOIN PRODUCTS p  ON p.ID = r.PRODUCTID
    INNER JOIN RESOURCES re ON re.ID = r.RESOURCEID;
    """
    return getData(query)

def getOrders():
    query = """
    SELECT 
        o.ID, 
        r.NAME_RESOURCE AS "Recurso", 
        o.QUANTITY AS "Cantidad", 
        o."DATE" AS "Fecha de solicitud", 
        CASE 
            WHEN o.DELIVERED = 1 THEN 'Solicitado'
            WHEN o.DELIVERED = 0 THEN 'Entregado' 
            ELSE 'Desconocido'
        END AS "Status"
    FROM 
        ORDERS o
    INNER JOIN 
        RESOURCES r ON o.ID_RESOURCE = r.ID;
    """
    return getData(query)

def getEquipmentProduct(id_product):
    query = f"""
    SELECT 
        ID,
        ID_PRODUCT
    FROM 
        EQUIPMENT
    WHERE ID_PRODUCT = '{id_product}';
    """
    data = getData(query)
    return data[0]
  
# Función para obtener datos según la sección
def get_table_data(section):
    """
    Obtiene los datos de la tabla correspondiente a la sección.
    """
    queries = {
        'categories_resources': getCategoriesResources,
        'catalogue_resources': getCatalogueResources,
        'supplier': getSuppliers,
        'inventory': getInventory,
        'categories_products': getCategoriesProducts,
        'catalogue_products': getCatalogueProducts,
        'factories': getFactories,
        'equipment': getEquipment,
        'production': getProduction,
        'store': getStore,
        'recipes': getRecipes,
        'orders': getOrders
    }

    # Verifica si la sección existe en el diccionario
    if section in queries:
        return queries[section]()  # Llama a la función correspondiente
    else:
        raise ValueError(f"Consulta no encontrada para la sección: {section}")

def get_table_columns(table_name):
  """
  Obtiene los nombres de las columnas de una tabla en DB2.
  """
  try:
    query = f"""
        SELECT 
            NAME,
            COLTYPE
        FROM SYSIBM.SYSCOLUMNS
        WHERE TBNAME = '{table_name.upper()}';
    """
    columns = getData(query)
    return columns
  except Exception as e:
    print(f"Error al obtener columnas: {e}")
    return []

def get_options_for_column(table_name):
    """
    Obtiene las opciones disponibles para un campo que sea una clave foránea en la base de datos.
    Detecta automáticamente la tabla y la segunda columna a mostrar.
    """
    try:
        
        # Buscar si la tabla realmente existe en la base de datos
        check_query = f"""
        SELECT NAME 
        FROM SYSIBM.SYSTABLES 
        WHERE NAME = UPPER('{table_name}')
        """
        result = getData(check_query)
        if result.empty:
            raise ValueError(f"No se encontró una tabla que coincida con '{table_name}'.")

        # Obtener las columnas de la tabla detectada
        columns_result = get_table_columns(table_name)
        columns = columns_result.values

        id_column = columns[0][0]  # Primera columna (ID)
        second_column = columns[1][0]  # Segunda columna (valor a mostrar)

        # Obtener los valores de la tabla detectada
        options_query = f"""
        SELECT {id_column}, {second_column}
        FROM {table_name}
        """
        options = getData(options_query)

        return options

    except Exception as e:
        print(f"Error al obtener opciones para {table_name}: {e}")
        return []

def getAllOptions(table_name):
    try:
        
        # Buscar si la tabla realmente existe en la base de datos
        query = f"""
        SELECT 
            FK.FKTABLE_NAME  AS Tabla_Origen,
            FK.FKCOLUMN_NAME  AS Columna_Origen,
            PK.TABLE_NAME  AS Tabla_Destino,
            PK.COLUMN_NAME  AS Columna_Destino
        FROM
        SYSIBM.SQLFOREIGNKEYS FK
        JOIN SYSIBM.SQLPRIMARYKEYS PK
        ON FK.PKTABLE_NAME = PK.TABLE_NAME 
        AND FK.PKCOLUMN_NAME = PK.COLUMN_NAME 
        WHERE FK.FKTABLE_NAME = UPPER('{table_name}');
        """
        result = getData(query)
        if result.empty:
            raise ValueError(f"No se encontró una tabla que coincida con '{table_name}'.")

        result = result.values
        result_options = {}
        for row in result:
            # Obtener las columnas de la tabla detectada
            options_for_column = get_options_for_column(row[2])
            result_options[row[1]] = [options_for_column.values]

        return result_options

    except Exception as e:
        print(f"Error al obtener opciones para {table_name}: {e}")
        return []

def addItem(table, columns, data):
    connection = None

    try:
        # Obtener conexión a DB2
        connection = get_db_connection()

        column_names = ", ".join(columns)  # "col1, col2, col3"
        placeholders = ", ".join(["?" for _ in columns])  # "?, ?, ?"

        query = f"INSERT INTO {table.upper()} ({column_names}) VALUES ({placeholders})"

        # Obtener valores de los datos del formulario en el mismo orden de las columnas
        values = tuple(data[col] for col in columns)
        # Preparar y ejecutar la consulta
        stmt = ibm_db.prepare(connection, query)
        ibm_db.execute(stmt, values)
        return True
    except Exception as e:
        print(f"Error al añadir item en {table}: {e}")
        return False
    finally:
        if connection:
            close_db_connection(connection)  # Cierra la conexión

def updateItem(table, columns, form_data):
    connection = None
    try:
        # Obtener conexión a DB2
        connection = get_db_connection()

        # Extraer el ID de la primer columna de form_data (asumimos que el ID está en la primera posición)
        record_id = form_data[columns[0]]  # Suponiendo que la primer columna contiene el ID

        # Construir la parte de SET de la consulta (por ejemplo, "col1 = ?, col2 = ?")
        set_clause = ", ".join([f"{col} = ?" for col in columns[1:]])  # Ignoramos la primera columna, ya que es el ID

        # Crear la consulta SQL de actualización
        query = f"UPDATE {table.upper()} SET {set_clause} WHERE ID = ?"

        # Obtener los valores de los datos del formulario en el mismo orden de las columnas, excepto el ID
        # Si el valor comienza con '$', eliminamos el signo
        values = []
        for col in columns[1:]:  # Iterar solo por las columnas a actualizar (sin contar el ID)
            value = form_data[col]
            if isinstance(value, str) and value.startswith('$'):
                value = value[1:]  # Eliminar el signo '$'
            values.append(value)
        # Añadimos el ID al final de los valores
        values.append(record_id)

        # Preparar y ejecutar la consulta
        stmt = ibm_db.prepare(connection, query)
        ibm_db.execute(stmt, tuple(values))

        return True  # Indicar que la actualización fue exitosa
    except Exception as e:
        print(f"Error al actualizar item en {table}: {e}")
        return False  # Indicar que ocurrió un error
    finally:
        if connection:
            close_db_connection(connection)  # Cerrar la conexión

def uploadFile(query, columns, data):
    connection = None
    try:
        # Obtener conexión a DB2
        connection = get_db_connection()

        # Preparar la consulta
        stmt = ibm_db.prepare(connection, query)

        if isinstance(columns, str):
            columns = columns.split(',')

        # Iterar sobre los datos
        for row in data:
            # Crear una lista para los valores de la fila
            values = []

            # Recorrer las columnas y agregar los valores correspondientes
            for i in range(len(columns)):
                values.append(row[i])
            
            # Ejecutar la consulta con los valores de la fila
            ibm_db.execute(stmt, tuple(values))

        return True  # Éxito en la ejecución

    except Exception as e:
        print(f"Error en la consulta: {e}")
        return False  # Error en la ejecución

    finally:
        if connection:
            close_db_connection(connection)  # Cerrar la conexión

# Conexión a la base de datos (conexión DB2)
def get_sales_data():
    try:
        conn = get_db_connection()
        query = "SELECT AMOUNT, PRICE, DATE FROM SALES"
        stmt = ibm_db.exec_immediate(conn, query)
        sales_data = []
        while ibm_db.fetch_row(stmt):
            sales_data.append({
                'Amount': ibm_db.result(stmt, 0),
                'Price': ibm_db.result(stmt, 1),
                'Date': ibm_db.result(stmt, 2)
            })
        df = pd.DataFrame(sales_data)
        ibm_db.close(conn)
        return df
    except Exception as e:
        print(f"Error al obtener los datos: {e}")
        return None

# Función para verificar el usuario en la tabla USERS
def verify_user(employee_number, password):
    try:
        conn = get_db_connection()
        query = "SELECT ROL FROM USERS WHERE USERNAME = ? AND PASSWORD = ?"
        stmt = ibm_db.prepare(conn, query)
        ibm_db.bind_param(stmt, 1, employee_number)
        ibm_db.bind_param(stmt, 2, password)
        ibm_db.execute(stmt)

        result = ibm_db.fetch_assoc(stmt)
        
        if result:
            return result['ROL']
        else:
            return None  # Si no se encuentra el usuario o la contraseña es incorrecta

    except Exception as e:
        raise Exception(f"Error al verificar el usuario: {e}")
    finally:
        close_db_connection(conn)
