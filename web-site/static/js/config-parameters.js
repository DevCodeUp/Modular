// Variable enviada desde Flask al cargar el sitio
const parameter = section;

// Referencias a elementos HTML
const addItemButton = document.getElementById('add-item-button');
const formOverlayAdd = document.getElementById('form-overlay-add');
const formOverlayEdit = document.getElementById('form-overlay-edit');
const formFields = document.getElementById('form-fields');
const cancelButtonAdd = document.getElementById('close-form-add');

// Mostrar formulario flotante Add Item al presionar el botón
addItemButton.addEventListener('click', () => {
    formOverlayAdd.classList.remove('hidden');
});

// Ocultar formulario flotante Add Item al presionar "Cancelar"
cancelButtonAdd.addEventListener('click', () => {
    formOverlayAdd.classList.add('hidden');
});

// Mostrar formulario flotante Edit Item al presionar el botón
function showEditForm(data){
    formOverlayEdit.classList.remove('hidden');
    data.forEach((value, index) => {
        const inputElement = document.getElementById(`input-${index}`);
        const selectElement = document.getElementById(`select-${index}`);
            
        // Si el campo es un input (tipo text), asignar el valor directamente
        if (inputElement) {
            inputElement.value = value;
        }
        
        // Si el campo es un select, buscar la opción con el texto que coincida
        if (selectElement) {
            // Buscar la opción cuyo texto coincida con el valor
            const optionToSelect = Array.from(selectElement.options).find(option => option.text === value);
            if (optionToSelect) {
                optionToSelect.selected = true;
            }
        }
    });
}

// Ocultar formulario flotante Edit Item al presionar "Cancelar"
function hideEditForm(){
    formOverlayEdit.classList.add('hidden');
}


function confirmDelete(itemId) {
    let confirmAction = confirm("¿Estás seguro de que deseas eliminar este elemento?");
    
    if (confirmAction) {
        document.getElementById(`delete-form-${itemId}`).submit();
    } else {
        alert("Operación cancelada.");
    }
}

function confirmUpload() {
    let confirmAction = confirm("¿Estás seguro de que deseas subir este archivo CSV y cargar sus datos en la base de datos?");
    
    if (confirmAction) {
        document.getElementById(`csv-upload-form`).submit();
    } else {
        alert("Operación cancelada.");
    }
}
