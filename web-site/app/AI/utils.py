# app/utils.py
import pandas as pd
from ..database import *

def cargar_ventas_por_producto():
    conn = get_db_connection()
    query = """
        SELECT ID_Product, Date, SUM(Amount) AS Amount
        FROM Sales
        GROUP BY ID_Product, Date
        ORDER BY ID_Product, Date
    """
    stmt = ibm_db.exec_immediate(conn, query)

    rows = []
    result = ibm_db.fetch_assoc(stmt)
    while result:
        rows.append(result)
        result = ibm_db.fetch_assoc(stmt)

    close_db_connection(conn)
    df = pd.DataFrame(rows)
    df['Date'] = pd.to_datetime(df['DATE'])
    df['Amount'] = df['AMOUNT'].astype(int)
    df['ID_Product'] = df['ID_PRODUCT'].astype(int)
    return df
