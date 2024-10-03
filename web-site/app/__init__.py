import os
from flask import Flask

def create_app():
    app = Flask(__name__, template_folder=os.path.join(os.getcwd(), 'templates'))

    # Importa las rutas
    from .routes import main
    app.register_blueprint(main)

    return app
