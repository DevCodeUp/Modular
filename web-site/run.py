import os
from flask import Flask
from app import routes

def create_app():
  app = Flask(__name__, template_folder=os.path.join(os.path.dirname(__file__), 'templates'))
  app.register_blueprint(routes.main)

  return app

app = create_app()

if __name__ == "__main__":
  app.run(debug=True)
