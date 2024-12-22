// Añadir Material
document.querySelector('button').addEventListener('click', function() {
    const nombre = prompt('Nombre del Material:');
    const cantidad = prompt('Cantidad del Material:');
    const proveedor = prompt('Proveedor del Material:');

    if (nombre && cantidad && proveedor) {
        const table = document.querySelector('table tbody');
        const newRow = table.insertRow();
        
        const cell1 = newRow.insertCell(0);
        const cell2 = newRow.insertCell(1);
        const cell3 = newRow.insertCell(2);
        const cell4 = newRow.insertCell(3);

        cell1.textContent = nombre;
        cell2.textContent = cantidad;
        cell3.textContent = proveedor;

        const editBtn = document.createElement('button');
        editBtn.textContent = 'Editar';
        editBtn.classList.add('edit-btn');
        editBtn.addEventListener('click', editMaterial);
        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = 'Eliminar';
        deleteBtn.classList.add('delete-btn');
        deleteBtn.addEventListener('click', deleteMaterial);

        cell4.appendChild(editBtn);
        cell4.appendChild(deleteBtn);
    }
});

// Función para editar material
function editMaterial(e) {
    const row = e.target.closest('tr');
    const nombre = row.cells[0].textContent;
    const cantidad = row.cells[1].textContent;
    const proveedor = row.cells[2].textContent;

    const newNombre = prompt('Editar nombre del Material:', nombre);
    const newCantidad = prompt('Editar cantidad del Material:', cantidad);
    const newProveedor = prompt('Editar proveedor del Material:', proveedor);

    if (newNombre && newCantidad && newProveedor) {
        row.cells[0].textContent = newNombre;
        row.cells[1].textContent = newCantidad;
        row.cells[2].textContent = newProveedor;
    }
}

// Función para eliminar material
function deleteMaterial(e) {
    const row = e.target.closest('tr');
    row.remove();
}

// Funcionalidad para proveedores (opcional si lo deseas hacer igual)
document.querySelector('button').addEventListener('click', function() {
    const nombre = prompt('Nombre del Proveedor:');
    const telefono = prompt('Teléfono del Proveedor:');
    const direccion = prompt('Dirección del Proveedor:');

    if (nombre && telefono && direccion) {
        const table = document.querySelector('#supplier-table tbody');
        const newRow = table.insertRow();

        const cell1 = newRow.insertCell(0);
        const cell2 = newRow.insertCell(1);
        const cell3 = newRow.insertCell(2);
        const cell4 = newRow.insertCell(3);

        cell1.textContent = nombre;
        cell2.textContent = telefono;
        cell3.textContent = direccion;

        const editBtn = document.createElement('button');
        editBtn.textContent = 'Editar';
        editBtn.classList.add('edit-btn');
        editBtn.addEventListener('click', editMaterial);
        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = 'Eliminar';
        deleteBtn.classList.add('delete-btn');
        deleteBtn.addEventListener('click', deleteMaterial);

        cell4.appendChild(editBtn);
        cell4.appendChild(deleteBtn);
    }
});
