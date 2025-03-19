// Variable enviada desde Flask al cargar el sitio
const parameter = section;

// Referencias a elementos HTML
const addItemButton = document.getElementById('add-item-button');
const formOverlay = document.getElementById('form-overlay');
const formFields = document.getElementById('form-fields');
const cancelButton = document.getElementById('close-form');

// Mostrar formulario flotante al presionar el botón
addItemButton.addEventListener('click', () => {
    formOverlay.classList.remove('hidden');
});

// Ocultar formulario flotante al presionar "Cancelar"
cancelButton.addEventListener('click', () => {
    formOverlay.classList.add('hidden');
});

function confirmDelete(itemId) {
    let confirmAction = confirm("¿Estás seguro de que deseas eliminar este elemento?");
    
    if (confirmAction) {
      document.getElementById(`delete-form-${itemId}`).submit();
    } else {
      alert("Operación cancelada.");
    }
}

// Abre el formulario de edición y llena los campos con los datos actuales
function openEditForm(itemId, rowData) {
    document.getElementById("edit-form-overlay").classList.remove("hidden");
    
    // Llenar los campos con los valores de la fila seleccionada
    document.getElementById("edit-id").value = itemId;
    
    let keys = Object.keys(rowData);
    for (let i = 1; i < keys.length; i++) {  // Empieza en 1 para omitir ID
      let colName = keys[i];
      let colValue = rowData[colName];

      let inputField = document.getElementById("edit-" + colName);
      if (inputField) {
        inputField.value = colValue;
      }
    }
}

// Cierra el formulario de edición
function closeEditForm() {
    document.getElementById("edit-form-overlay").classList.add("hidden");
}

// Confirma la edición y envía los datos
function confirmEdit() {
    let confirmAction = confirm("¿Estás seguro de que deseas actualizar este elemento?");
    
    if (confirmAction) {
      document.getElementById("edit-form").submit();
    } else {
      alert("Operación cancelada.");
    }
}