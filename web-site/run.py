import os
from flask import Flask, session
from app import routes
from app.stats import stats_api
#from app.AI.routes_ai import ai_blueprint

def create_app():
  app = Flask(__name__, template_folder=os.path.join(os.path.dirname(__file__), 'templates'))
  app.secret_key = os.urandom(24)
  app.register_blueprint(routes.main)
  app.register_blueprint(stats_api, url_prefix='/stats')
  #app.register_blueprint(ai_blueprint, url_prefix='/ai-model')

  return app

app = create_app()

if __name__ == "__main__":
  app.run(debug=True)
