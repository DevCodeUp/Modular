from flask import Blueprint, jsonify, render_template, request, redirect
import os
from werkzeug.utils import secure_filename
from .trainModelAI import *
from ..queries import addItem, getEquipmentProduct

ai_blueprint = Blueprint('ai', __name__)
UPLOAD_FOLDER = './app/AI'
ALLOWED_EXTENSIONS = {'csv'}

@ai_blueprint.route('/ai-dashboard')
def ai_dashboard():
    return render_template('ai_dashboard.html')

# Verifica extensión permitida
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@ai_blueprint.route('/train', methods=['POST'])
def train_model():
    file = request.files.get('csv_file')
    if not file or not file.filename.endswith('.csv'):
        return redirect(request.referrer)

    filename = secure_filename(file.filename)
    filepath = os.path.join(UPLOAD_FOLDER, filename)
    file.save(filepath)

    # Obtener productos únicos
    sales_data = pd.read_csv(filepath)
    sales_data['DATE'] = sales_data['DATE'].str.replace("'", "")
    sales_data['DATE'] = pd.to_datetime(sales_data['DATE'], format='%Y-%m-%d %H:%M:%S')
    product_ids = sales_data['ID_PRODUCT'].unique()

    resultados = []

    for pid in product_ids:
        try:
            forecast, forecast_total = trainModel(pid, filepath)

            resultados.append({
                'product_id': int(pid),
                'forecast_total': int(forecast_total)
            })

            # Iterar sobre cada elemento de forecast y ejecutar la función addItem
            for forecast_date, forecast_value in forecast.items():
                # Aquí definimos los datos que se van a insertar
                col = ['ID_EQUIPMENT', 'DATE', 'QUANT_PROD', 'UNIT_MEASURE', 'TIME', 'UNIT_TIME']
                information = {
                    'ID_EQUIPMENT': str(getEquipmentProduct(pid)),  # Asumiendo que esta función está definida
                    'DATE': forecast_date.strftime('%Y-%m-%d'),  # Formato de fecha
                    'QUANT_PROD': str(forecast_value),
                    'UNIT_MEASURE': 'pz',
                    'TIME': str(8),  # Tiempo de fabricación (siempre es 8)
                    'UNIT_TIME': 'h',  # Unidad de tiempo (siempre 'h')
                }
                
                # Llamar a la función addItem para insertar los datos en la base de datos
                success = addItem('production', col, information)  # 'production' es el nombre de la tabla
                if not success:
                    print(f"Error al insertar la predicción para el producto {pid} y fecha {forecast_date}")

        except Exception as e:
            resultados.append({
                'product_id': int(pid),
                'forecast_total': 'error',
                'error': str(e)
            })
    
    # Eliminar el archivo después del procesamiento
    if os.path.exists(filepath):
        os.remove(filepath)
        
    return jsonify(resultados)
