from flask import Blueprint, jsonify, render_template
from .database import *

# Crear el blueprint de estadísticas
stats_api = Blueprint('stats_api', __name__)

# Ruta para mostrar el dashboard de estadísticas
@stats_api.route('/dashboard')
def dashboard():
    return render_template('stadistics.html')

# Ruta para rendimiento (producción diaria)
@stats_api.route('/api/rendimiento')
def rendimiento():
    connection = None
    try:
        # Obtener conexión a DB2
        connection = get_db_connection()

        query = """
            SELECT 
                DATE(Production_Date) AS dia, 
                SUM(Amount) AS total_produccion
            FROM Store
            GROUP BY DATE(Production_Date)
            ORDER BY DATE(Production_Date)
        """
        
        # Ejecutar la consulta con exec_immediate
        stmt = ibm_db.exec_immediate(connection, query)
        
        # Obtener los resultados con fetch_assoc
        results = []
        row = ibm_db.fetch_assoc(stmt)
        while row:
            results.append(row)
            row = ibm_db.fetch_assoc(stmt)

        # Extraer los datos de los resultados
        dias = [row['DIA'] for row in results]
        valores = [row['TOTAL_PRODUCCION'] for row in results]

        return jsonify({'labels': dias, 'data': valores})
    
    except Exception as e:
        print(f"Error al obtener los datos de rendimiento: {e}")
        return jsonify({'error': 'Error al obtener los datos de rendimiento'}), 500

    finally:
        if connection:
            close_db_connection(connection)  # Cerrar la conexión

@stats_api.route('/api/stock')
def stock():
    connection = None
    try:
        # Obtener conexión a DB2
        connection = get_db_connection()

        query = """
            SELECT 
                r.Name_Resource, 
                i.Stock
            FROM Inventory i
            JOIN Resources r ON i.ID_Resource = r.ID
        """
        
        # Ejecutar la consulta con exec_immediate
        stmt = ibm_db.exec_immediate(connection, query)
        
        # Obtener los resultados con fetch_assoc
        results = []
        row = ibm_db.fetch_assoc(stmt)
        while row:
            results.append(row)
            row = ibm_db.fetch_assoc(stmt)

        # Extraer los datos de los resultados
        recursos = [row['NAME_RESOURCE'] for row in results]
        stock = [row['STOCK'] for row in results]

        return jsonify({'labels': recursos, 'data': stock})
    
    except Exception as e:
        print(f"Error al obtener los datos de stock: {e}")
        return jsonify({'error': 'Error al obtener los datos de stock'}), 500

    finally:
        if connection:
            close_db_connection(connection)  # Cerrar la conexión

@stats_api.route('/api/tiempo_promedio_maquina')
def tiempo_promedio_maquina():
    connection = None
    try:
        # Obtener conexión a DB2
        connection = get_db_connection()

        query = """
            SELECT 
                e.Name, 
                AVG(p.Time) AS avg_time
            FROM Production p
            JOIN Equipment e ON p.ID_Equipment = e.ID
            GROUP BY e.Name
        """
        
        # Ejecutar la consulta con exec_immediate
        stmt = ibm_db.exec_immediate(connection, query)
        
        # Obtener los resultados con fetch_assoc
        results = []
        row = ibm_db.fetch_assoc(stmt)
        while row:
            results.append(row)
            row = ibm_db.fetch_assoc(stmt)

        # Extraer los datos de los resultados
        maquinas = [row['NAME'] for row in results]
        tiempos = [row['AVG_TIME'] for row in results]

        return jsonify({'labels': maquinas, 'data': tiempos})
    
    except Exception as e:
        print(f"Error al obtener los datos de tiempo promedio por máquina: {e}")
        return jsonify({'error': 'Error al obtener los datos de tiempo promedio por máquina'}), 500

    finally:
        if connection:
            close_db_connection(connection)  # Cerrar la conexión
