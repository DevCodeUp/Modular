import os
from flask import Flask
from app import routes  # Asegúrate de que routes está correctamente importado
 
def create_app():
  # Usa la ruta relativa basada en el archivo actual
  app = Flask(__name__, template_folder=os.path.join(os.path.dirname(__file__), 'templates'))
    
  # Registra las rutas del blueprint (asegúrate de que 'routes.main' es un blueprint)
  app.register_blueprint(routes.main)
    
  return app
 
# Crea la aplicación
app = create_app()
 
# Ejecuta la aplicación si este archivo es el principal
if __name__ == "__main__":
  app.run(debug=True)