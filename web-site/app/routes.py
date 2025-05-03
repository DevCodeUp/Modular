from flask import Blueprint, render_template, request, redirect, jsonify, session, url_for
from .queries import *
import csv
import io

main = Blueprint('main', __name__)

@main.route('/')
def index():
    # Verificar si el usuario está autenticado
    current_user = None
    if 'employee_number' in session:
        current_user = {
            'employee_number': session['employee_number'],
            'role': session['role']
        }
    # Pasar a la plantilla la información del usuario
    return render_template('index.html', current_user=current_user)

@main.route('/config')
def config():
    # Verificar si el usuario tiene el rol adecuado para acceder a la configuración
    if 'role' not in session or (session['role'] != 'IT' and session['role'] != 'AdminRole'):
        # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
        return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
    
    # Si tiene el rol adecuado, mostrar la página de configuración
    return render_template('config.html')

@main.route('/inventory')
def inventory():
    # Verificar si el usuario tiene el rol adecuado para acceder a la configuración
    if 'role' not in session or (session['role'] not in ['Supervisor'] and session['role'] != 'AdminRole'):
        # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
        return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
    
    # Si tiene el rol adecuado, mostrar la página de configuración
    return redirect(url_for('main.config_parameters', section='inventory'))

@main.route('/store')
def store():
    # Verificar si el usuario tiene el rol adecuado para acceder a la configuración
    if 'role' not in session or (session['role'] not in ['Supervisor'] and session['role'] != 'AdminRole'):
        # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
        return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
    
    # Si tiene el rol adecuado, mostrar la página de configuración
    return redirect(url_for('main.config_parameters', section='store'))

@main.route('/production')
def production():
    # Verificar si el usuario tiene el rol adecuado para acceder a la configuración
    if 'role' not in session or (session['role'] not in ['Supervisor'] and session['role'] != 'AdminRole'):
        # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
        return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
    
    # Si tiene el rol adecuado, mostrar la página de configuración
    return redirect(url_for('main.config_parameters', section='production'))

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
    'production' : 'Plan de producción',
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
  if 'role' not in session or (session['role'] != 'IT' and session['role'] != 'AdminRole'):
    # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
    return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
  
  title_section = "Histórico de ventas"
  table = "sales"
  
  return render_template(
    'sales.html',
    title_section=title_section,
    table=table
  )

@main.route('/config-ai')
def config_ai():
  if 'role' not in session or (session['role'] != 'IT' and session['role'] != 'AdminRole'):
    # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
    return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
  
  return render_template(
    'ai_dashboard.html'
  )

@main.route('/save-data/<string:table_name>', methods=['POST'])
def save_data(table_name):
  if 'role' not in session or (session['role'] != 'IT' and session['role'] != 'AdminRole'):
    # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
    return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
  
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
  if 'role' not in session or (session['role'] != 'IT' and session['role'] != 'AdminRole'):
    # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
    return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
  
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
  if 'role' not in session or (session['role'] != 'IT' and session['role'] != 'AdminRole'):
    # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
    return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)
  
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
    if 'role' not in session or (session['role'] != 'IT' and session['role'] != 'AdminRole'):
      # Si no tiene el rol adecuado, redirigirlo a la página principal o a un error
      return redirect(url_for('main.index'))  # Redirige a la página principal (o una página de error)

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

@main.route('/login', methods=['POST'])
def login():
    data = request.get_json()

    employee_number = data.get('employee_number')
    password = data.get('password')

    # Verificar el usuario y la contraseña
    role = verify_user(employee_number, password)
    
    if role:
        session['employee_number'] = employee_number
        session['role'] = role
        # Lógica de inicio de sesión exitoso
        return jsonify(success=True, role=role)
    else:
        # Si las credenciales son incorrectas, devolver error
        return jsonify(success=False), 401
