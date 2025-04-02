import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.optimizers import Adam
from sklearn.metrics import mean_squared_error, r2_score
from flask import jsonify
import io
import base64
from ..queries import get_sales_data
import time


def train_neural_network_model():
    # Obtener datos históricos de ventas
    df = get_sales_data()

    if df is None or df.empty:
        return None, None, None, None, None

    # Preparar los datos: 'Amount' como variable dependiente y 'Price' como independiente
    X = df[['Price']]  # Variables independientes
    y = df['Amount']   # Variable dependiente

    # Escalar los datos
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    # Dividir los datos en entrenamiento y prueba
    X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

    # Crear el modelo de red neuronal
    model = Sequential()
    model.add(Dense(units=64, activation='relu', input_dim=X_train.shape[1]))  # Capa oculta
    model.add(Dense(units=32, activation='relu'))  # Capa oculta adicional
    model.add(Dense(units=1))  # Capa de salida para predicción de cantidad (regresión)

    # Compilar el modelo
    model.compile(optimizer=Adam(learning_rate=0.001), loss='mean_squared_error', metrics=['accuracy'])

    # Listas para guardar los valores de las pérdidas y la efectividad
    training_losses = []
    training_accuracy = []
    validation_losses = []
    validation_accuracy = []
    training_epochs = []

    # Entrenamiento del modelo
    start_time = time.time()
    total_epochs = 100  # Número de epochs

    # Entrenar el modelo
    history = model.fit(X_train, y_train, epochs=total_epochs, batch_size=32, validation_data=(X_test, y_test), verbose=1)

    # Graficar el progreso de efectividad (accuracy)
    fig, ax = plt.subplots(figsize=(8, 6))
    ax.plot(history.history['accuracy'], label='Accuracy (Entrenamiento)')
    ax.plot(history.history['val_accuracy'], label='Accuracy (Validación)', linestyle='dashed')
    ax.set_title('Progreso de Accuracy')
    ax.set_xlabel('Número de Epochs')
    ax.set_ylabel('Accuracy')
    ax.set_ylim(0, 1)  # Limitar el eje Y de 0 a 1 (ya que accuracy va entre 0 y 1)
    ax.legend()

    # Graficar las pérdidas (loss)
    fig2, ax2 = plt.subplots(figsize=(8, 6))
    ax2.plot(history.history['loss'], label='Loss (Entrenamiento)')
    ax2.plot(history.history['val_loss'], label='Loss (Validación)', linestyle='dashed')
    ax2.set_title('Progreso de Pérdidas')
    ax2.set_xlabel('Número de Epochs')
    ax2.set_ylabel('Loss')
    ax2.legend()

    # Codificar las gráficas a base64 para mostrar en la interfaz web
    buf = io.BytesIO()
    fig.savefig(buf, format='png')
    buf.seek(0)
    plot_url = base64.b64encode(buf.getvalue()).decode('utf8')

    buf2 = io.BytesIO()
    fig2.savefig(buf2, format='png')
    buf2.seek(0)
    loss_plot_url = base64.b64encode(buf2.getvalue()).decode('utf8')

    # Calcular el R² y MSE en el conjunto de prueba
    y_pred = model.predict(X_test)
    mse_test = mean_squared_error(y_test, y_pred)
    r2 = r2_score(y_test, y_pred)

    return model, plot_url, loss_plot_url, r2, mse_test


def generate_alert_message(r2, mse):
    if r2 is not None:
        return f"Entrenamiento completado con un R² de {r2:.2f} y un MSE de {mse:.2f}. El modelo es efectivo."
    return "Hubo un error al entrenar el modelo."