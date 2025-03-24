import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import train_test_split
from statsmodels.tsa.arima.model import ARIMA
import warnings

warnings.filterwarnings("ignore")

def entrenar_regresion(df):
    df['dias'] = (df['fecha'] - df['fecha'].min()).dt.days
    X = df[['dias']]
    y = df['ventas']
    modelo = LinearRegression()
    modelo.fit(X, y)
    dias_futuros = np.array(range(df['dias'].max() + 1, df['dias'].max() + 31)).reshape(-1, 1)
    pred = modelo.predict(dias_futuros)
    fechas = pd.date_range(df['fecha'].max() + pd.Timedelta(days=1), periods=30)
    return pd.DataFrame({'fecha': fechas, 'ventas': pred})

def entrenar_arima(df):
    ts = df.set_index('fecha')['ventas'].asfreq('D').fillna(method='ffill')
    modelo = ARIMA(ts, order=(5,1,0)).fit()
    forecast = modelo.forecast(steps=30)
    return pd.DataFrame({'fecha': forecast.index, 'ventas': forecast.values})

def entrenar_mlp(df):
    df['dias'] = (df['fecha'] - df['fecha'].min()).dt.days
    X = df[['dias']]
    y = df['ventas']
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
    modelo = MLPRegressor(hidden_layer_sizes=(100, 50), max_iter=1000)
    modelo.fit(X_train, y_train)
    dias_futuros = np.array(range(df['dias'].max() + 1, df['dias'].max() + 31)).reshape(-1, 1)
    pred = modelo.predict(dias_futuros)
    fechas = pd.date_range(df['fecha'].max() + pd.Timedelta(days=1), periods=30)
    return pd.DataFrame({'fecha': fechas, 'ventas': pred})

def predecir_combinado_por_producto(df):
    productos = df['ID_Product'].unique()
    resultados = []

    for prod_id in productos:
        df_prod = df[df['ID_Product'] == prod_id].copy()
        df_prod['fecha'] = pd.to_datetime(df_prod['Date'])
        df_prod['ventas'] = df_prod['Amount']

        pred_reg = entrenar_regresion(df_prod)
        pred_arima = entrenar_arima(df_prod)
        pred_mlp = entrenar_mlp(df_prod)

        pred = pd.DataFrame({
            'fecha': pred_reg['fecha'],
            'regresion': pred_reg['ventas'],
            'arima': pred_arima['ventas'].values,
            'mlp': pred_mlp['ventas'].values
        })
        pred['ventas'] = pred[['regresion', 'arima', 'mlp']].mean(axis=1)
        pred['ID_Product'] = prod_id
        resultados.append(pred[['fecha', 'ventas', 'ID_Product']])

    return pd.concat(resultados, ignore_index=True)

def generar_plan_multiproducto(df_pred):
    df_pred['produccion'] = df_pred['ventas'] * 1.10
    return df_pred