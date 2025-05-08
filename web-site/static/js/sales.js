function confirmUpload() {
    let confirmAction = confirm("¿Estás seguro de que deseas subir este archivo CSV y cargar sus datos en la base de datos?");
    
    if (confirmAction) {
        document.getElementById(`csv-upload-form`).submit();
    } else {
        alert("Operación cancelada.");
    }
}