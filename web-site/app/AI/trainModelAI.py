import pandas as pd
from statsmodels.tsa.arima.model import ARIMA
from datetime import datetime
import math

def trainModel(id_product, file_path):
    # Cargar datos
    sales_data = pd.read_csv(file_path)

    # Limpiar y convertir fechas
    sales_data['DATE'] = sales_data['DATE'].str.replace("'", "")
    sales_data['DATE'] = pd.to_datetime(sales_data['DATE'], format='%Y-%m-%d %H:%M:%S')

    # Agrupar por día
    sales_data['Day'] = sales_data['DATE'].dt.to_period('D')
    daily_sales = sales_data.groupby(['ID_PRODUCT', 'Day'])['AMOUNT'].sum().reset_index()

    # Filtrar producto y formatear índice
    product_sales = daily_sales[daily_sales['ID_PRODUCT'] == id_product].set_index('Day')['AMOUNT']
    product_sales.index = product_sales.index.to_timestamp()

    # Entrenar modelo ARIMA
    model = ARIMA(product_sales, order=(1, 1, 1))
    model_fitted = model.fit()

    # Calcular cuántos días quedan en el mes actual
    today = pd.Timestamp(datetime.today().date())
    last_day_of_month = today.replace(day=1) + pd.offsets.MonthEnd(1)
    days_remaining = (last_day_of_month - today).days + 1

    # Predecir
    forecast = model_fitted.forecast(steps=days_remaining)
    forecast.index = pd.date_range(start=today, periods=days_remaining, freq='D')

    # Redondear hacia arriba
    forecast_rounded = forecast.apply(math.ceil)

    # Sumar valores
    forecast_total = int(forecast_rounded.sum())

    return forecast_rounded, forecast_total

# Ejemplo de prueba (comentarlo en producción)
#if __name__ == "__main__":
#    forecast, total, series = trainModel(1, "./app/AI/sales_data_40000_records_with_quotes.csv")
#    print(forecast)
#    print("Total del mes:", total)
