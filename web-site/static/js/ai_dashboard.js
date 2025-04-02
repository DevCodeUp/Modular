document.getElementById("startTrainingBtn").addEventListener("click", function () {
    // Muestra la barra de progreso
    const progressBar = document.getElementById("progressBar");
    progressBar.style.display = "block"; // Asegurarse de que la barra de progreso esté visible
    progressBar.style.width = "0%"; // Empezamos desde 0%

    // Llamada a la API para entrenar el modelo
    fetch("/ai-model/train", {
        method: "GET"
    })
    .then(response => response.json())
    .then(data => {
        // Mostrar las gráficas
        document.getElementById("purchaseOrders").innerText = "Gráfico de Progreso de Entrenamiento:";
        document.getElementById("adjustedOrders").innerText = "Gráfico de Progreso de Pérdidas:";
        document.getElementById("arimaForecast").innerText = `Efectividad del modelo (R2): ${data.r2} | MSE (Prueba): ${data.mse}`;

        // Mostrar gráficas en el HTML
        document.getElementById("purchaseOrders").innerHTML = `<img src="data:image/png;base64,${data.plot_url}" alt="Progreso de Entrenamiento">`;
        document.getElementById("adjustedOrders").innerHTML = `<img src="data:image/png;base64,${data.loss_plot_url}" alt="Progreso de Pérdidas">`;

        // Mostrar información del progreso: epoch, accuracy, loss
        const progressInfo = document.getElementById("progressInfo");
        progressInfo.innerHTML = `Accuracy de Entrenamiento: ${data.r2.toFixed(2)} | Loss de Entrenamiento: ${data.mse.toFixed(4)}`;

        // Actualizar la barra de progreso
        progressBar.style.width = "100%"; // Finalizar barra de progreso
        progressBar.innerText = "Entrenamiento Completado";  // Texto de fin
    })
    .catch(error => {
        console.error("Error al entrenar el modelo:", error);
    });
});
