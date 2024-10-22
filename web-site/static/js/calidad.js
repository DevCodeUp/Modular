// Acceso a la cámara
const video = document.getElementById('video');

navigator.mediaDevices.getUserMedia({ video: true })
  .then(stream => {
    video.srcObject = stream;
  })
  .catch(err => {
    console.error('Error al acceder a la cámara:', err);
  });

// Cambiar entre "Bueno" y "Malo" (puede ser controlado por un sistema externo)
const qualityStatus = document.getElementById('quality-status');

// Simulación: cambia a "Malo" después de 5 segundos
setTimeout(() => {
  qualityStatus.textContent = 'Malo';
  qualityStatus.classList.add('bad');
}, 5000);

// Botón para registrar defectos
const registerButton = document.getElementById('register-defect');

registerButton.addEventListener('click', () => {
  alert('Defecto registrado');
  // Aquí podrías enviar datos a una API para registrar el defecto
});