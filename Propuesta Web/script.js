document.addEventListener("DOMContentLoaded", () => {
    const sections = document.querySelectorAll("main section");
  
    window.showSection = (id) => {
      sections.forEach((section) => section.classList.add("hidden"));
      document.getElementById(id).classList.remove("hidden");
    };
  
    // Forms actions (add data dynamically)
    const categoriesTable = document.querySelector("#categories-table tbody");
    const suppliersTable = document.querySelector("#suppliers-table tbody");
  
    // Example for handling categories
    document.querySelector("#add-category-form").addEventListener("submit", (e) => {
      e.preventDefault();
      const categoryName = document.querySelector("#category-name").value;
      const id = categoriesTable.children.length + 1;
      categoriesTable.innerHTML += `
        <tr>
          <td>${id}</td>
          <td>${categoryName}</td>
          <td><button onclick="deleteRow(this)">Eliminar</button></td>
        </tr>`;
      document.querySelector("#category-name").value = "";
    });
  
    window.deleteRow = (btn) => {
      const row = btn.parentElement.parentElement;
      row.parentElement.removeChild(row);
    };
  });
  
