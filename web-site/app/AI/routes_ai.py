from flask import Blueprint, jsonify, render_template, request, redirect
import os
from werkzeug.utils import secure_filename
import matplotlib.pyplot as plt
import io
import base64
from .trainModelAI import trainModel

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
    #file.save(filepath)

    # Cargar el CSV completo
    import pandas as pd
    sales_data = pd.read_csv(filepath)

    # Limpiar y procesar fechas
    sales_data['DATE'] = sales_data['DATE'].str.replace("'", "")
    sales_data['DATE'] = pd.to_datetime(sales_data['DATE'], format='%Y-%m-%d %H:%M:%S')
    sales_data['Year_Month'] = sales_data['DATE'].dt.to_period('M')

    # Obtener todos los productos únicos
    product_ids = sales_data['ID_PRODUCT'].unique()

    resultados = []

    for pid in product_ids:
        try:
            forecast, series = trainModel(pid, filepath)

            # Generar gráfica
            import matplotlib.pyplot as plt
            import io, base64

            fig, ax = plt.subplots(figsize=(8, 3))
            series.plot(ax=ax)
            ax.set_title(f"Producto {pid}")
            ax.set_xlabel("Mes")
            ax.set_ylabel("Ventas")
            plt.tight_layout()

            buf = io.BytesIO()
            plt.savefig(buf, format="png")
            buf.seek(0)
            img_base64 = base64.b64encode(buf.read()).decode('utf-8')
            plt.close(fig)

            resultados.append({
                'product_id': int(pid),
                'forecast': int(forecast),
                'chart': img_base64
            })

        except Exception as e:
            resultados.append({
                'product_id': int(pid),
                'forecast': 'error',
                'error': str(e)
            })

    return jsonify(resultados)

