document.addEventListener("DOMContentLoaded", () => {
    setupEventListeners();
    loadFromLocalStorage();
});

// Configura eventos
function setupEventListeners() {
    const addCompraBtn = document.getElementById("add-compra-btn");
    if (addCompraBtn) {
        addCompraBtn.addEventListener("click", addCompra);
    }
}

// Agregar una compra de materia prima
function addCompra() {
    const materiaPrima = prompt("Materia Prima:");
    const proveedor = prompt("Proveedor:");
    const cantidad = prompt("Cantidad:");

    if (materiaPrima && proveedor && cantidad) {
        const table = document.querySelector("#compras-table tbody");
        const newRow = table.insertRow();

        newRow.innerHTML = `
            <td>${generateID()}</td>
            <td>${materiaPrima}</td>
            <td>${proveedor}</td>
            <td>${cantidad}</td>
            <td>
                <button class="edit-btn" onclick="editCompra(this)">Editar</button>
                <button class="delete-btn" onclick="deleteCompra(this)">Eliminar</button>
            </td>
        `;

        saveToLocalStorage();
    }
}

// Editar una compra
function editCompra(button) {
    const row = button.closest("tr");
    const newMateriaPrima = prompt("Editar Materia Prima:", row.cells[1].textContent);
    const newProveedor = prompt("Editar Proveedor:", row.cells[2].textContent);
    const newCantidad = prompt("Editar Cantidad:", row.cells[3].textContent);

    if (newMateriaPrima && newProveedor && newCantidad) {
        row.cells[1].textContent = newMateriaPrima;
        row.cells[2].textContent = newProveedor;
        row.cells[3].textContent = newCantidad;

        saveToLocalStorage();
    }
}

// Eliminar una compra
function deleteCompra(button) {
    if (confirm("¿Seguro que deseas eliminar esta compra?")) {
        const row = button.closest("tr");
        row.remove();

        saveToLocalStorage();
    }
}

// Generar un ID único
function generateID() {
    return Math.floor(Math.random() * 10000);
}

// Guardar en localStorage
function saveToLocalStorage() {
    const tableData = document.querySelector("#compras-table tbody").innerHTML;
    localStorage.setItem("compras", tableData);
}

// Cargar datos desde localStorage
function loadFromLocalStorage() {
    const tableBody = document.querySelector("#compras-table tbody");
    tableBody.innerHTML = localStorage.getItem("compras") || "";
}