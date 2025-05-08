document.addEventListener("DOMContentLoaded", () => {
    setupEventListeners();
    loadFromLocalStorage();
});

function setupEventListeners() {
    const addPlanBtn = document.getElementById("add-plan-btn");
    if (addPlanBtn) {
        addPlanBtn.addEventListener("click", addPlan);
    }
}

function addPlan() {
    const producto = prompt("Producto a producir:");
    const cantidad = prompt("Cantidad:");
    const fecha = prompt("Fecha de producción (DD/MM/AAAA):");
    const estado = "Pendiente"; // Estado por defecto

    if (producto && cantidad && fecha) {
        const table = document.querySelector("#planes-table tbody");
        const newRow = table.insertRow();

        newRow.innerHTML = `
            <td>${generateID()}</td>
            <td>${producto}</td>
            <td>${cantidad}</td>
            <td>${fecha}</td>
            <td><span class="status-badge">${estado}</span></td>
            <td>
                <button class="edit-btn" onclick="editPlan(this)">Editar</button>
                <button class="complete-btn" onclick="completePlan(this)">Completar</button>
                <button class="delete-btn" onclick="deletePlan(this)">Eliminar</button>
            </td>
        `;

        saveToLocalStorage();
    }
}

function editPlan(button) {
    const row = button.closest("tr");
    const newProducto = prompt("Editar Producto:", row.cells[1].textContent);
    const newCantidad = prompt("Editar Cantidad:", row.cells[2].textContent);
    const newFecha = prompt("Editar Fecha:", row.cells[3].textContent);

    if (newProducto && newCantidad && newFecha) {
        row.cells[1].textContent = newProducto;
        row.cells[2].textContent = newCantidad;
        row.cells[3].textContent = newFecha;
        saveToLocalStorage();
    }
}

function completePlan(button) {
    const row = button.closest("tr");
    row.cells[4].innerHTML = '<span class="status-badge completed">Completado</span>';
    saveToLocalStorage();
}

function deletePlan(button) {
    if (confirm("¿Seguro que deseas eliminar este plan de producción?")) {
        button.closest("tr").remove();
        saveToLocalStorage();
    }
}

function generateID() {
    return Math.floor(Math.random() * 10000);
}

function saveToLocalStorage() {
    const tableData = document.querySelector("#planes-table tbody").innerHTML;
    localStorage.setItem("planesProduccion", tableData);
}

function loadFromLocalStorage() {
    const savedData = localStorage.getItem("planesProduccion");
    if (savedData) {
        document.querySelector("#planes-table tbody").innerHTML = savedData;
    }
}