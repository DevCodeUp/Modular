from flask import Blueprint, render_template
from .AI.utils import cargar_ventas_por_producto
from .AI.ai_model import predecir_combinado_por_producto, generar_plan_multiproducto

ai_api = Blueprint('ai_api', __name__)

@ai_api.route('/config')
def config():
    try:
        datos = cargar_ventas_por_producto()
        predicciones = predecir_combinado_por_producto(datos)
        plan = generar_plan_multiproducto(predicciones)

        resumen = plan.groupby('ID_Product')['ventas'].sum().reset_index()
        producto_top = resumen.sort_values(by='ventas', ascending=False).iloc[0]

        return render_template('resultados.html', plan=plan, producto_top=producto_top)

    except Exception as e:
        return f"<h3>Error al generar predicciones: {e}</h3>"
