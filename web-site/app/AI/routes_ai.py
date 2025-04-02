from flask import Blueprint, jsonify, render_template
from .train_model import train_regression_model, generate_alert_message

ai_blueprint = Blueprint('ai', __name__)

@ai_blueprint.route('/ai-dashboard')
def ai_dashboard():
    return render_template('ai_dashboard.html')

@ai_blueprint.route('/train', methods=['GET'])
def train_model():
    model, plot_url, loss_plot_url, r2, mse = train_regression_model()
    
    if model is None:
        return jsonify({"message": "Hubo un error al entrenar el modelo."}), 400

    message = generate_alert_message(r2, mse)
    
    return jsonify({
        "plot_url": plot_url,
        "loss_plot_url": loss_plot_url,
        "r2": r2,
        "mse": mse,
        "message": message
    })