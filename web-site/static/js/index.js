document.addEventListener('DOMContentLoaded', function () {
  const loginBtn = document.getElementById('login-btn');
  const loginForm = document.getElementById('login-form');
  const closeLogin = document.getElementById('close-login');
  const loginFormContent = document.getElementById('login-form-content');
  const configButton = document.getElementById('config-link');
  const statisticsButton = document.getElementById('statistics-link');
  const iaButton = document.getElementById('ia-link');
  const productLinks = document.querySelectorAll('.product-link');
  const navbar = document.getElementById('navbar');
  const sections = document.querySelectorAll('.content-section');
  const loginError = document.getElementById('login-error');

  let currentUser = null;

  // Ocultar las secciones y el navbar antes de iniciar sesión
  navbar.style.display = 'none';
  sections.forEach(section => section.style.display = 'none');

  // Mostrar el formulario de inicio de sesión
  loginBtn.addEventListener('click', function () {
    loginForm.style.display = 'block';
  });

  // Cerrar el formulario de inicio de sesión
  closeLogin.addEventListener('click', function () {
    loginForm.style.display = 'none';
  });

  // Manejar el inicio de sesión con AJAX
  loginFormContent.addEventListener('submit', function (e) {
    e.preventDefault();
    
    const employeeNumber = document.getElementById('employee-number').value;
    const password = document.getElementById('password').value;
    const role = document.getElementById('role').value;

    fetch('/login', {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            employee_number: employeeNumber,
            password: password,
            role: role
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            currentUser = { employeeNumber, role };
            applyRoleRestrictions(role);
            loginForm.style.display = 'none';
            loginBtn.textContent = `Cerrar sesión (${role})`;
            navbar.style.display = 'block';
            sections.forEach(section => section.style.display = 'block');
        } else {
            loginError.style.display = 'block';
            loginError.textContent = "Usuario o contraseña incorrectos";
        }
    })
    .catch(error => console.error("Error:", error));
  });

  // Aplicar restricciones de acceso según el rol
  function applyRoleRestrictions(role) {
    if (role === 'IT') {
      configButton.style.display = 'block';
      statisticsButton.style.display = 'block';
      iaButton.style.display = 'block';
      productLinks.forEach(link => link.style.display = 'block');
    } else if (role === 'Supervisor') {
      configButton.style.display = 'none';
      statisticsButton.style.display = 'block';
      iaButton.style.display = 'none';
      productLinks.forEach(link => link.style.display = 'block');
    } else if (role === 'Empleado') {
      configButton.style.display = 'none';
      statisticsButton.style.display = 'block';
      iaButton.style.display = 'none';
      productLinks.forEach(link => link.style.display = 'none');
      document.getElementById('product-menu').style.display = 'none';
    }
  }

  // Bloquear acceso a los enlaces de productos para supervisores y empleados sin permisos
  productLinks.forEach(link => {
    link.addEventListener('click', function (e) {
      if (currentUser && (currentUser.role === 'Supervisor' || currentUser.role === 'Empleado')) {
        e.preventDefault();
        alert('No tienes permiso para acceder a este contenido.');
      }
    });
  });
});
