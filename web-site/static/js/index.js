document.addEventListener('DOMContentLoaded', function () {
  const loginBtn = document.getElementById('login-btn');
  const loginForm = document.getElementById('login-form');
  const closeLogin = document.getElementById('close-login');
  const loginFormContent = document.getElementById('login-form-content');
  
  // Mostrar el formulario de inicio de sesión al hacer clic en el botón de login
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

    fetch('/login', {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            employee_number: employeeNumber,
            password: password
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert(`Bienvenido ${employeeNumber}. Tu rol es: ${data.role}`);
            // Redirigir o mostrar el menú dependiendo de la respuesta
            window.location.href = '/'; // Redirigir a la página principal
        } else {
            alert('Credenciales inválidas');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un error al procesar tu solicitud.');
    });
  });
});
