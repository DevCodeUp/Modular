// Variable enviada desde Flask al cargar el sitio
const parameter = section;

// Referencias a elementos HTML
const addItemButton = document.getElementById('add-item-button');
const formOverlay = document.getElementById('form-overlay');
const formFields = document.getElementById('form-fields');
const cancelButton = document.getElementById('cancel-button');

// Mostrar formulario flotante al presionar el botón
addItemButton.addEventListener('click', () => {
    fetchForm(parameter); // Cargar campos de formulario dinámico
    formOverlay.classList.remove('hidden');
});

// Ocultar formulario flotante al presionar "Cancelar"
cancelButton.addEventListener('click', () => {
    formOverlay.classList.add('hidden');
});

// Función para cargar los campos dinámicos del formulario
function fetchForm(formType) {
    fetch('/get_form', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ form_type: formType })
    })
    .then(response => response.json())
    .then(fields => {
        formFields.innerHTML = ''; // Limpiar campos anteriores
        fields.forEach(field => {
            // Crear label
            const label = document.createElement('label');
            label.htmlFor = field.name; // Relacionar el label con el input
            label.textContent = field.label; // Usar 'label' del servidor o el nombre del campo
            formFields.appendChild(label);

            // Crear input
            const input = document.createElement('input');
            
            input.name = field.name;
            input.type = field.type;
            input.placeholder = field.label;
            input.required = true;
            formFields.appendChild(input);
            formFields.appendChild(document.createElement('br'));
        });
    });
}

// Manejar el envío del formulario
document.getElementById('dynamic-form').addEventListener('submit', (e) => {
    e.preventDefault();
    alert('Formulario enviado');
    formOverlay.classList.add('hidden');
});
