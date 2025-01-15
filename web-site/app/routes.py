from flask import Blueprint, render_template
from .queries import get_table_data

main = Blueprint('main', __name__)

@main.route('/')
def index():
  return render_template('index.html')

@main.route('/config')
def config():
  return render_template('config.html')

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
    'store' : 'Producto en Proceso',
    'production' : 'Producto Terminado'
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


@main.route('/config-parameters/mrp')
def config_mrp():
    title_section = "Gestión de MRP"
    
    # Configuración de las tablas para la gestión
    tables = ['BOM', 'Production_Plan']
    fields_configuration = {
        'BOM': [
            {'name': 'ID_Product', 'type': 'select', 'label': 'Producto', 'options': 'products'},
            {'name': 'ID_Resource', 'type': 'select', 'label': 'Recurso', 'options': 'resources'},
            {'name': 'Quantity', 'type': 'number', 'label': 'Cantidad'}
        ],
        'Production_Plan': [
            {'name': 'ID_Product', 'type': 'select', 'label': 'Producto', 'options': 'products'},
            {'name': 'Planned_Quantity', 'type': 'number', 'label': 'Cantidad Planeada'},
            {'name': 'Start_Date', 'type': 'datetime-local', 'label': 'Fecha de Inicio'},
            {'name': 'End_Date', 'type': 'datetime-local', 'label': 'Fecha de Finalización'}
        ]
    }

    return render_template(
        'config-mrp.html',
        title_section=title_section,
        tables=tables,
        fields=fields_configuration
    )


  fields_configuration = {
    'categories_resources': [
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
    ],
    'catalogue_resources': [
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
    ],
    'supplier': [
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
    ],
    'categories_products': [
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
    ],
    'catalogue_products': [
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
    ],
    'factories':[
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
    ],
    'equipment':[
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
      {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
    ]

  }
  fields = fields_configuration.get(section, [])

  if not table:
    return "Sección no válida", 404

  try:
    columns, data = get_table_data(section)
  except Exception as e:
    return f"Error al obtener los datos: {e}", 500
  
  return render_template(
    'config-parameters.html',
    section=section,
    title_section=title_section,
    columns=columns,
    data=data,
    fields=fields
  )