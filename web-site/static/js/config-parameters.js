// Variable enviada desde Flask al cargar el sitio
const parameter = section;

// Referencias a elementos HTML
const addItemButton = document.getElementById('add-item-button');
const formOverlay = document.getElementById('form-overlay');
const formFields = document.getElementById('form-fields');
const cancelButton = document.getElementById('cancel-button');

// Mostrar el formulario al hacer clic en el botón
addItemButton.addEventListener('click', () => {
    alert(fields);
    // Generar los campos dinámicamente desde la variable "fields"
    //formFields.innerHTML = fields.map(field => 
    //    <div class="form-field">
    //        <label for="${field.name}">${field.label}:</label>
    //        <input type="${field.type || 'text'}" id="${field.name}" name="${field.name}" placeholder="${field.label}" required>
    //    </div>
    //).join('');

    // Mostrar el formulario flotante
    //formOverlay.classList.remove('hidden');
});

// Ocultar el formulario al hacer clic en cancelar
cancelButton.addEventListener('click', () => {
    formOverlay.classList.add('hidden');
});

// Enviar los datos del formulario
document.getElementById('dynamic-form').addEventListener('submit', (event) => {
    event.preventDefault();

    const formData = new FormData(event.target);
    const data = Object.fromEntries(formData.entries());

    // Enviar datos al servidor
    fetch('/add-item', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ parameter, data }),
    })
    .then(response => response.json())
    .then(result => {
        alert(result.message);
        formOverlay.classList.add('hidden');
    })
    .catch(error => {
        console.error('Error:', error);
    });
});