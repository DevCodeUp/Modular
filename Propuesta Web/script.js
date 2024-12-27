document.addEventListener("DOMContentLoaded", () => {
  const sections = document.querySelectorAll("main section");
  const modals = document.querySelectorAll(".modal");

  window.showSection = (id) => {
    sections.forEach(section => section.classList.add("hidden"));
    document.getElementById(id).classList.remove("hidden");
  };

  window.openModal = (id) => {
    document.getElementById(id).classList.remove("hidden");
  };

  window.closeModal = (id) => {
    document.getElementById(id).classList.add("hidden");
  };

  // Add categories
  window.addCategory = () => {
    const name = document.getElementById("category-name").value;
    const table = document.querySelector("#categories-table tbody");
    const id = table.children.length + 1;
    table.innerHTML += `<tr><td>${id}</td><td>${name}</td></tr>`;
    closeModal("category-modal");
  };

  // Add suppliers
  window.addSupplier = () => {
    const name = document.getElementById("supplier-name").value;
    const address = document.getElementById("supplier-address").value;
    const phone = document.getElementById("supplier-phone").value;
    const table = document.querySelector("#suppliers-table tbody");
    const id = table.children.length + 1;
    table.innerHTML += `<tr><td>${id}</td><td>${name}</td><td>${address}</td><td>${phone}</td></tr>`;
    closeModal("supplier-modal");
  };

  // Add resources
  window.addResource = () => {
    const name = document.getElementById("resource-name").value;
    const description = document.getElementById("resource-description").value;
    const price = document.getElementById("resource-price").value;
    const table = document.querySelector("#resources-table tbody");
    const id = table.children.length + 1;
    table.innerHTML += `<tr><td>${id}</td><td>${name}</td><td>${description}</td><td>${price}</td></tr>`;
    closeModal("resource-modal");
  };

  // Add inventory
  window.addInventory = () => {
    const resource = document.getElementById("inventory-resource").value;
    const quantity = document.getElementById("inventory-quantity").value;
    const expiration = document.getElementById("inventory-expiration").value;
    const table = document.querySelector("#inventory-table tbody");
    const id = table.children.length + 1;
    table.innerHTML += `<tr><td>${id}</td><td>${resource}</td><td>${quantity}</td><td>${expiration}</td></tr>`;
    closeModal("inventory-modal");
  };
});
