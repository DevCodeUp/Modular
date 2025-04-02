from flask import Blueprint, render_template, request, redirect
from .queries import *
import csv
import io

main = Blueprint('main', __name__)

@main.route('/')
def index():
  return render_template('index.html')

@main.route('/config')
def config():
  return render_template('config.html')

@main.route('/materia-prima')
def materia_prima():
  return render_template('materia_prima.html')

@main.route('/producto-terminado')
def producto_terminado():
    return render_template('producto_terminado.html')

@main.route('/plan-produccion')
def plan_produccion():
    return render_template('plan_produccion.html')

@main.route('/production-order')
def production_orders():
  return render_template('production_orders.html')

@main.route('/config-parameters/<string:section>')
def config_parameters(section):
  titles = {
    'categories_resources': 'Categorías de Recursos',
    'catalogue_resources': 'Catálogo de Recursos',
    'supplier': 'Proveedores',
    'categories_products': 'Categorías de Productos',
    'catalogue_products': 'Catálogo de Productos',
    'factories': 'Fábricas',
    'equipment': 'Equipo/Maquinaria',
    'inventory': 'Materia Prima',
    'store' : 'Producto Terminado',
    'production' : 'Producción en proceso',
    'sales': 'Ventas'
  }
  title_section = titles.get(section, 'Gestión General')

  tables = {
    'categories_resources': 'categories_resources',
    'catalogue_resources': 'resources',
    'supplier': 'supplier',
    'categories_products': 'categories_products',
    'catalogue_products': 'products',
    'factories': 'factories',
    'equipment': 'equipment',
    'inventory' : 'inventory',
    'store' : 'store',
    'production' : 'production',
    'sales': 'sales'
  }
  table = tables.get(section)

  if not table:
    return "Sección no válida", 404

  try:
    df = get_table_data(section)
    df2 = get_table_columns(table)
    options_dictionary = getAllOptions(table)
  except Exception as e:
    return f"Error al obtener los datos: {e}", 500
  
  
  return render_template(
    'config-parameters.html',
    section=section,
    title_section=title_section,
    columns=df.columns,
    data=df.values.tolist(),
    id_columns=df2.values.tolist(),
    options_dictionary=options_dictionary,
    table=table
  )

@main.route('/upload-sales')
def upload_sales():
  
  title_section = "Histórico de ventas"
  table = "sales"
  
  return render_template(
    'sales.html',
    title_section=title_section,
    table=table
  )

@main.route('/save-data/<string:table_name>', methods=['POST'])
def save_data(table_name):
  """
  Recibe los datos del formulario y la tabla como parámetro en la URL.
  """
  if request.method == 'POST':
    # Obtener datos del formulario
    form_data = request.form.to_dict()

    # Extraer las columnas de los datos recibidos
    columns = list(form_data.keys())

    # Insertar en la base de datos DB2
    success = addItem(table_name, columns, form_data)

    if success:
      return redirect(request.referrer)  # Se asegura que 'main.' esté presente
    else:
      return "Error al guardar en la base de datos", 500

@main.route('/delete-item/<string:table_name>/<int:item_id>', methods=['POST'])
def delete_item(table_name, item_id):
  """
  Elimina un elemento de la base de datos según su ID.
  """
  try:
    # Crear la consulta SQL para eliminar
    query = f"DELETE FROM {table_name.upper()} WHERE ID = ?"

    # Ejecutar la consulta con el ID proporcionado
    success = run_query(query, (item_id,))

    if success:
      return redirect(request.referrer)  # Regresar a la misma página
    else:
      return "Error al eliminar el elemento", 500

  except Exception as e:
    return f"Error al eliminar el elemento: {e}", 500

@main.route('/update-data/<string:table_name>', methods=['POST'])
def update_data(table_name):
  if request.method == 'POST':
    # Obtener datos del formulario
    form_data = request.form.to_dict()

    # Extraer las columnas de los datos recibidos
    columns = list(form_data.keys())

    # Insertar en la base de datos DB2
    success = updateItem(table_name, columns, form_data)

    if success:
      return redirect(request.referrer)  # Se asegura que 'main.' esté presente
    else:
      return "Error al guardar en la base de datos", 500
    
@main.route('/upload_csv/<string:table_name>', methods=['POST'])
def upload_csv(table_name):
    file = request.files.get('csv_file')

    if not file or not file.filename.endswith('.csv'):
        return redirect(request.referrer)

    stream = io.StringIO(file.stream.read().decode("UTF8"), newline=None)
    reader = csv.reader(stream)
    headers = next(reader)  # Lee la primera fila como encabezados

    if headers[0].upper() == 'ID':
        headers = headers[1:]
        data = [row[1:] for row in reader]
    else:
        data = [row for row in reader]

    placeholders = ', '.join(['?'] * len(headers))
    columns = ', '.join(headers)
    query = f"INSERT INTO {table_name.upper()} ({columns.upper()}) VALUES ({placeholders.upper()})"

    uploadFile(query, columns, data)

    return redirect(request.referrer)
