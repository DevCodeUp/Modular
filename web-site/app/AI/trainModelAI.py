import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.tsa.stattools import adfuller
from statsmodels.tsa.arima.model import ARIMA
import math

#file_path = './app/AI/sales_data_40000_records_with_quotes.csv'

def trainModel(id_product, file_path):
    # Cargar los datos
    sales_data = pd.read_csv(file_path)

    # Limpiar la columna 'DATE' para eliminar las comillas
    sales_data['DATE'] = sales_data['DATE'].str.replace("'", "")

    # Convertir la columna 'DATE' a formato datetime
    sales_data['DATE'] = pd.to_datetime(sales_data['DATE'], format='%Y-%m-%d %H:%M:%S')

    # Agregar las ventas por producto y mes
    sales_data['Year_Month'] = sales_data['DATE'].dt.to_period('M')  # Extraer el año y mes como periodo
    monthly_sales = sales_data.groupby(['ID_PRODUCT', 'Year_Month'])['AMOUNT'].sum().reset_index()

    # Seleccionar los datos de ventas para un producto específico (por ejemplo, producto con ID 1)
    product_sales = monthly_sales[monthly_sales['ID_PRODUCT'] == id_product].set_index('Year_Month')['AMOUNT']

    # Realizar la prueba ADF para comprobar la estacionariedad
    adf_result = adfuller(product_sales.dropna())  # Eliminar valores NaN antes de aplicar la prueba
    adf_statistic, p_value = adf_result[0], adf_result[1]

    # Imprimir los resultados de la prueba ADF
    print(f"Estadístico ADF: {adf_statistic}")
    print(f"P-valor: {p_value}")

    # Si el p-valor es pequeño, podemos rechazar la hipótesis nula de que la serie tiene una raíz unitaria
    if p_value < 0.05:
        print("La serie temporal es estacionaria. Podemos aplicar ARIMA.")
    else:
        print("La serie temporal no es estacionaria. Se deben tomar pasos adicionales.")

    # Crear el modelo ARIMA y ajustarlo
    model = ARIMA(product_sales, order=(1, 0, 1))  # Parámetros del modelo (p=1, d=0, q=1)
    model_fitted = model.fit()

    # Predecir las ventas para el siguiente mes
    forecast = model_fitted.forecast(steps=1)
    forecast_value = math.ceil(forecast[0])
    return forecast_value, product_sales

    # Imprimir la predicción
    #print(f"Predicción de ventas para el siguiente mes: {forecast_value}")

    # Graficar la serie temporal para visualizar las ventas
    #product_sales.plot(figsize=(10, 6))
    #plt.title("Ventas mensuales para el Producto ID")
    #plt.xlabel("Año-Mes")
    #plt.ylabel("Cantidad Vendida")
    #plt.xticks(rotation=45)
    #plt.grid(True)
    #plt.show()
