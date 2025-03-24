import os
from flask import Flask
from app import routes
from app.stats import stats_api
from app.ai import ai_api

def create_app():
  app = Flask(__name__, template_folder=os.path.join(os.path.dirname(__file__), 'templates'))
  app.register_blueprint(routes.main)
  app.register_blueprint(stats_api, url_prefix='/stats')
  app.register_blueprint(ai_api, url_prefix='/ai')

  return app

app = create_app()

if __name__ == "__main__":
  app.run(debug=True)
