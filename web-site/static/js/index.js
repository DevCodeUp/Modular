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
});