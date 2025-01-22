from flask import Blueprint, render_template, request, jsonify
from .queries import get_table_data
import json

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
    'equipment': 'Equipo/Maquinaria'
  }
  title_section = titles.get(section, 'Gestión General')

  tables = {
    'categories_resources': 'categories_resources',
    'catalogue_resources': 'resources',
    'supplier': 'supplier',
    'categories_products': 'categories_products',
    'catalogue_products': 'products',
    'factories': 'factories',
    'equipment': 'equipment'
  }
  table = tables.get(section)

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
    data=data
  )

# Formulario de Configuración de parámetros
@main.route('/get_form', methods=['POST'])
def get_form():
    data = request.json
    form_type = data.get('form_type', 'default')

    if form_type == 'categories_resources':
      fields = [
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
      ]
    elif form_type == 'catalogue_resources':
      fields = [
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
      ]
    elif form_type == 'supplier':
      fields = [
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
      ]
    elif form_type == 'categories_products':
      fields = [
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
      ]
    elif form_type == 'catalogue_products':
      fields = [
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
      ]
    elif form_type == 'factories':
      fields = [
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
      ]
    elif form_type == 'equipment':
      fields = [
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'},
        {'name': 'name_category', 'type': 'text', 'label': 'Categoría'}
      ]

    return jsonify(fields)