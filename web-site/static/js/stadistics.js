document.addEventListener('DOMContentLoaded', function () {

  // Gráfica de rendimiento (producción diaria)
  fetch('/stats/api/rendimiento')
    .then(res => res.json())
    .then(({ labels, data }) => {
      const ctx = document.getElementById('chartRendimiento').getContext('2d');
      new Chart(ctx, {
        type: 'line',
        data: {
          labels: labels,
          datasets: [{
            label: 'Producción diaria',
            data: data,
            borderColor: 'rgba(75, 192, 192, 1)',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderWidth: 2
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    });

  // Gráfica de inventario (stock por recurso)
  fetch('/stats/api/stock')
    .then(res => res.json())
    .then(({ labels, data }) => {
      const ctx = document.getElementById('chartStock').getContext('2d');
      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: labels,
          datasets: [{
            label: 'Stock por recurso',
            data: data,
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    });

  // Gráfica de producción por máquina (tiempo promedio)
  fetch('/stats/api/tiempo_promedio_maquina')
    .then(res => res.json())
    .then(({ labels, data }) => {
      const ctx = document.getElementById('chartTiempoMaquina').getContext('2d');
      new Chart(ctx, {
        type: 'bar',
        data: {
          labels: labels,
          datasets: [{
            label: 'Tiempo promedio de producción',
            data: data,
            backgroundColor: 'rgba(255, 159, 64, 0.2)',
            borderColor: 'rgba(255, 159, 64, 1)',
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    });
});
