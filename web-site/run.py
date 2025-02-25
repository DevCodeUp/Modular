from flask import Flask
from app.routes import main  # Importar correctamente el Blueprint

def create_app():
    app = Flask(__name__)  # No es necesario especificar template_folder
    
    # Registrar el Blueprint correctamente
    app.register_blueprint(main)
    
    return app

app = create_app()

if __name__ == "__main__":
    app.run(debug=True)
