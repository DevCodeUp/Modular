from flask import Blueprint, render_template, request, redirect, url_for
from .queries import *

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

@main.route('/stadistics')
def stadistics():
  return render_template('stadistics.html')

@main.route('/production-order')
def production_orders():
  return render_template('production_orders.html')

@main.route('/config-parameters/<string:section>')
def config_parameters(section):
  titles = {
    'categories_resources': 'Categorías de Recursos',
    'catalogue_resources': 'Catálogo de recursos',
    'supplier': 'Proveedores',
    'categories_products': 'Categorías de Productos',
    'catalogue_products': 'Catálogo de Productos',
    'factories': 'Fábricas',
    'equipment': 'Equipo/Maquinaria',
    'inventory': 'Materia Prima',
    'store' : 'Producto Terminado',
    'production' : 'Producción en proceso'
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
    'production' : 'production'
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

@main.route('/update-item/<string:table_name>/<int:item_id>', methods=['POST'])
def update_item(table_name, item_id):
  try:
    # Obtener los datos del formulario
    form_data = request.form.to_dict()
    
    # Construir la consulta de actualización
    set_values = ", ".join([f"{col} = ?" for col in form_data.keys()])
    query = f"UPDATE {table_name} SET {set_values} WHERE ID = ?"
    
    # Obtener los valores en el orden correcto
    values = tuple(form_data.values()) + (item_id,)

    # Ejecutar la actualización
    success = run_query(query, values)

    if success:
      return redirect(request.referrer)  # Volver a la página anterior
    else:
      return "Error al actualizar el elemento", 500

  except Exception as e:
    print(f"Error al actualizar el elemento: {e}")
    return "Error interno", 500
