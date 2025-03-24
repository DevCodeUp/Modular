document.addEventListener('DOMContentLoaded', function () {
  const menuIcon = document.getElementById('menu-icon');
  const navList = document.getElementById('nav-list');
  const loginBtn = document.getElementById('login-btn');
  const loginForm = document.getElementById('login-form');
  const closeLogin = document.getElementById('close-login');

  // Mostrar el menú desplegable en pantallas pequeñas
  menuIcon.addEventListener('click', function () {
    navList.classList.toggle('show');
  });

  // Mostrar el formulario de inicio de sesión
  loginBtn.addEventListener('click', function (e) {
    e.preventDefault();
    loginForm.style.display = 'block';
    document.body.classList.add('show-login-form');
  });

  // Cerrar el formulario de inicio de sesión
  closeLogin.addEventListener('click', function () {
    loginForm.style.display = 'none';
    document.body.classList.remove('show-login-form');
  });

  // Cargar la gráfica de rendimiento con Chart.js
  const ctx = document.getElementById('chartRendimiento').getContext('2d');
  const chartRendimiento = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'],
      datasets: [{
        label: 'Producción diaria',
        data: [120, 190, 300, 500, 220, 330, 410], // Datos de ejemplo, aquí conectarás con la BD
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