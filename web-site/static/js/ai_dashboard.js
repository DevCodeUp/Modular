function confirmUpload() {
    const form = document.getElementById('csv-upload-form');
    const formData = new FormData(form);
    const fileInput = form.querySelector('input[type="file"]');
    const file = fileInput.files[0];

    if (!file || !file.name.endsWith('.csv')) {
        alert("Por favor selecciona un archivo CSV válido.");
        return;
    }

    fetch(form.action, {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("Error al entrenar el modelo.");
        }
        return response.json();
    })
    .then(resultados => {
        const forecastElement = document.getElementById('progressInfo');
        const chartContainer = document.getElementById('purchaseOrders');

        forecastElement.innerHTML = '';
        chartContainer.innerHTML = '';

        resultados.forEach(result => {
            if (result.forecast === 'error') {
                forecastElement.innerHTML += `<p><strong>Producto ${result.product_id}:</strong> Error: ${result.error}</p>`;
            } else {
                forecastElement.innerHTML += `<p><strong>Producto ${result.product_id}:</strong> Predicción: ${result.forecast}</p>`;
                chartContainer.innerHTML += `
                    <div style="margin-bottom: 20px;">
                        <img src="data:image/png;base64,${result.chart}" style="max-width:100%;">
                    </div>
                `;
            }
        });
    })
    .catch(error => {
        console.error(error);
        alert("Ocurrió un error durante el entrenamiento.");
    });
}
