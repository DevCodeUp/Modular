document.addEventListener("DOMContentLoaded", () => {
    setupEventListeners();
    loadFromLocalStorage();
});

// Configura eventos
function setupEventListeners() {
    const addProductoBtn = document.getElementById("add-producto-btn");
    if (addProductoBtn) {
        addProductoBtn.addEventListener("click", addProducto);
    }
}

// Agregar un producto terminado
function addProducto() {
    const nombre = prompt("Nombre del Producto:");
    const tipo = prompt("Tipo (Pastel/Postre/Pan/Galleta):");
    const cantidad = prompt("Cantidad:");

    if (nombre && tipo && cantidad) {
        const table = document.querySelector("#productos-table tbody");
        const newRow = table.insertRow();

        newRow.innerHTML = `
            <td>${generateID()}</td>
            <td>${nombre}</td>
            <td>${tipo}</td>
            <td>${cantidad}</td>
            <td>
                <button class="edit-btn" onclick="editProducto(this)">Editar</button>
                <button class="delete-btn" onclick="deleteProducto(this)">Eliminar</button>
            </td>
        `;

        saveToLocalStorage();
    }
}

// Editar un producto
function editProducto(button) {
    const row = button.closest("tr");
    const newNombre = prompt("Editar Nombre:", row.cells[1].textContent);
    const newTipo = prompt("Editar Tipo:", row.cells[2].textContent);
    const newCantidad = prompt("Editar Cantidad:", row.cells[3].textContent);

    if (newNombre && newTipo && newCantidad) {
        row.cells[1].textContent = newNombre;
        row.cells[2].textContent = newTipo;
        row.cells[3].textContent = newCantidad;

        saveToLocalStorage();
    }
}

// Eliminar un producto
function deleteProducto(button) {
    if (confirm("¿Seguro que deseas eliminar este producto?")) {
        const row = button.closest("tr");
        row.remove();

        saveToLocalStorage();
    }
}

// Generar un ID único (misma función)
function generateID() {
    return Math.floor(Math.random() * 10000);
}

// Guardar en localStorage
function saveToLocalStorage() {
    const tableData = document.querySelector("#productos-table tbody").innerHTML;
    localStorage.setItem("productos", tableData);
}

// Cargar datos desde localStorage
function loadFromLocalStorage() {
    const tableBody = document.querySelector("#productos-table tbody");
    tableBody.innerHTML = localStorage.getItem("productos") || "";
}