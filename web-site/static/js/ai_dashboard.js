function confirmUpload() {
    const form = document.getElementById('csv-upload-form');
    const formData = new FormData(form);
    const fileInput = form.querySelector('input[type="file"]');
    const file = fileInput.files[0];

    const formAdd = document.getElementById

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

        forecastElement.innerHTML = '';

        resultados.forEach(result => {
            if (result.forecast === 'error') {
                forecastElement.innerHTML += `<p><strong>Producto ${result.product_id}:</strong> Error: ${result.error}</p>`;
            } else {
                forecastElement.innerHTML += `<p><strong>Producto ${result.product_id}:</strong> Predicción: ${result.forecast_total}</p>`;
            }
        });
    })
    .catch(error => {
        console.error(error);
        alert(error);
    });
}
