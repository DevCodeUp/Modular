import os
from app import create_app

app = create_app()

if __name__ == "__main__":
    debug_mode = os.getenv('FLASK_DEBUG', '1') == '1'  # Usa '1' para activar depuración
    app.run(debug=debug_mode)