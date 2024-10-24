-- Creación de la tabla "Productos/Inventario" para almacenar información sobre productos en inventario
CREATE TABLE "Productos/Inventario" (
    -- ID de producto único generado automáticamente para identificar cada producto
    "ID de producto" SERIAL PRIMARY KEY,
    -- Nombre del producto, no puede ser nulo
    "Nombre del producto" VARCHAR(255) NOT NULL,
    -- Descripción del producto (opcional)
    "Descripción" TEXT,
    -- Precio unitario del producto, no puede ser nulo
    "Precio" NUMERIC(10, 2) NOT NULL,
    -- Categoría a la que pertenece el producto (opcional)
    "Categoría" VARCHAR(100),
    -- Cantidad disponible en el inventario
    "Stock disponible" INTEGER,
    -- Cantidad mínima deseada en el inventario para reabastecer
    "Stock mínimo" INTEGER
);

-- Creación de la tabla "Pedidos/Ventas" para almacenar información sobre pedidos y ventas
CREATE TABLE "Pedidos/Ventas" (
    -- ID de pedido/venta único generado automáticamente para identificar cada pedido o venta
    "ID de pedido/venta" SERIAL PRIMARY KEY,
    -- ID del cliente asociado al pedido o venta
    "ID de cliente" INTEGER REFERENCES Clientes("ID"), -- Corregido
    -- Fecha y hora en que se realizó el pedido o venta
    "Fecha y hora del pedido/venta" TIMESTAMP,
    -- Tipo de pedido o venta (por ejemplo, comida a domicilio, consumo en el lugar, etc.)
    "Tipo de pedido/venta" VARCHAR(255),
    -- Estado del pedido o venta (por ejemplo, pendiente, en proceso, entregado, etc.)
    "Estado del pedido/venta" VARCHAR(255),
    -- Total de la venta
    "Total" NUMERIC(10, 2),
    -- Método de pago utilizado, referenciando la tabla "Métodos de Pago"
    "De método de pago" INTEGER REFERENCES "Métodos de Pago"("ID"),
    -- ID del empleado asociado al pedido o venta
    "ID de empleado" INTEGER REFERENCES Empleados("ID de empleado") -- Corregido
);

-- Creación de la tabla "Tickets" para almacenar información sobre tickets de ventas
CREATE TABLE Tickets (
    -- ID de ticket único generado automáticamente para identificar cada ticket
    "ID de ticket" SERIAL PRIMARY KEY,
    -- ID del pedido/venta asociado al ticket
    "ID de pedido/venta" INTEGER REFERENCES "Pedidos/Ventas"("ID de pedido/venta"),
    -- Fecha y hora de emisión del ticket
    "Fecha y hora de emisión" TIMESTAMP,
    -- Total de la venta reflejado en el ticket
    "Total" NUMERIC(10, 2),
    -- Detalles adicionales del ticket
    "Detalles" TEXT
);

-- Creación de la tabla "Facturas" para almacenar información sobre facturas generadas
CREATE TABLE Facturas (
    -- ID de factura único generado automáticamente para identificar cada factura
    "ID de factura" SERIAL PRIMARY KEY,
    -- ID del cliente asociado a la factura
    "ID de cliente" INTEGER REFERENCES Clientes("ID"), -- Corregido
    -- Fecha y hora de emisión de la factura
    "Fecha y hora de emisión" TIMESTAMP,
    -- Total de la factura
    "Total" NUMERIC(10, 2),
    -- Método de pago utilizado, referenciando la tabla "Métodos de Pago"
    "Método de pago" INTEGER REFERENCES "Métodos de Pago"("ID"),
    -- ID del empleado asociado a la factura
    "ID de empleado" INTEGER REFERENCES Empleados("ID de empleado"), -- Corregido
    -- ID del pedido/venta asociado a la factura
    "ID de pedido/venta" INTEGER REFERENCES "Pedidos/Ventas"("ID de pedido/venta"),
    -- Número de factura único para identificarla
    "Número de factura" VARCHAR(255),
    -- Detalles adicionales de la factura
    "Detalles adicionales" TEXT
);

-- Creación del tipo de dato enum "RolEmpleado" con dos valores posibles: "Administrador" y "UsuarioRegular"
CREATE TYPE RolEmpleado AS ENUM ('Administrador', 'UsuarioRegular');

-- Creación de la tabla "Empleados" para almacenar información sobre empleados de la empresa
CREATE TABLE Empleados (
    -- ID de empleado único generado automáticamente para identificar cada empleado
    "ID de empleado" SERIAL PRIMARY KEY,
    -- Nombre del empleado
    "Nombre" VARCHAR(255),
    -- Apellido del empleado
    "Apellido" VARCHAR(255),
    -- Correo electrónico del empleado
    "Correo electrónico" VARCHAR(255),
    -- Contraseña del empleado
    "Contraseña" VARCHAR(255),
    -- Puesto del empleado en la empresa
    "Puesto" VARCHAR(255),
    -- Rol del empleado (Administrador o UsuarioRegular), utilizando el tipo de dato enum definido previamente
    "Rol" RolEmpleado,
    -- Indicador booleano para especificar si el empleado tiene acceso a la configuración del sistema
    "Acceso a la configuración del sistema" BOOLEAN
);

-- Creación de la tabla "Usuarios" para almacenar información sobre usuarios del sistema
CREATE TABLE Usuarios (
    -- ID de usuario único generado automáticamente para identificar cada usuario
    "ID" SERIAL PRIMARY KEY,
    -- Nombre de usuario único
    "NombreUsuario" VARCHAR(50) UNIQUE NOT NULL,
    -- Contraseña del usuario (almacenada de forma segura utilizando un hash)
    "ContraseñaHash" VARCHAR(255) NOT NULL,
    -- Rol del usuario en el sistema (Administrador o UsuarioRegular)
    "Rol" VARCHAR(50) NOT NULL -- Cambiado a VARCHAR
);

-- Creación de la tabla "Clientes" para almacenar información sobre clientes de la empresa
CREATE TABLE Clientes (
    -- ID de cliente único generado automáticamente para identificar cada cliente
    "ID" SERIAL PRIMARY KEY,
    -- Nombre del cliente
    "Nombre" VARCHAR(255),
    -- Apellido del cliente
    "Apellido" VARCHAR(255),
    -- Correo electrónico del cliente
    "Correo electrónico" VARCHAR(255),
    -- Número de teléfono del cliente
    "Teléfono" VARCHAR(20),
    -- Dirección física del cliente
    "Dirección" VARCHAR(255)
);
-- Creación de la tabla "Catálogo de Productos" para almacenar información sobre productos disponibles
CREATE TABLE "Catálogo de Productos" (
    -- ID de producto en el catálogo único generado automáticamente para identificar cada producto
    "ID" SERIAL PRIMARY KEY,
    -- Nombre del producto
    "Nombre" VARCHAR(255),
    -- Descripción detallada del producto
    "Descripción" TEXT,
    -- Precio unitario del producto
    "Precio" NUMERIC(10, 2),
    -- Cantidad disponible en el inventario del producto
    "Cantidad Disponible" INTEGER,
    -- Categoría a la que pertenece el producto
    "Categoría" VARCHAR(100)
);
-- Creación de la tabla "Métodos de Pago" para almacenar información sobre métodos de pago aceptados
CREATE TABLE "Métodos de Pago" (
    -- ID de método de pago único generado automáticamente para identificar cada método de pago
    "ID" SERIAL PRIMARY KEY,
    -- Nombre descriptivo del método de pago
    "Nombre del Método" VARCHAR(255),
    -- Descripción detallada del método de pago
    "Descripción" TEXT,
    -- Indicador booleano para especificar si el método de pago está activo
    "Activo" BOOLEAN
);

INSERT INTO Clientes ("Nombre", "Apellido", "Correo electrónico", "Teléfono", "Dirección") VALUES
('Juan', 'Perez', 'juan@example.com', '1234567890', 'Calle Principal 123'),
('María', 'González', 'maria@example.com', '9876543210', 'Avenida Central 456'),
('Pedro', 'Martínez', 'pedro@example.com', '5551234567', 'Calle Sol 789'),
('Ana', 'López', 'ana@example.com', '8885551234', 'Avenida Norte 456'),
('Carlos', 'Sánchez', 'carlos@example.com', '7778889999', 'Calle Luna 789'),
('Laura', 'Ramírez', 'laura@example.com', '6667778888', 'Avenida Este 456'),
('Luis', 'Díaz', 'luis@example.com', '9996665555', 'Calle Oeste 789'),
('Sofía', 'Hernández', 'sofia@example.com', '1112223333', 'Avenida Sur 456'),
('Elena', 'Moreno', 'elena@example.com', '4441112222', 'Calle Estrella 789'),
('Javier', 'Gómez', 'javier@example.com', '3334445555', 'Avenida Sol 456');

select * from clientes;

select * from "Productos/Inventario";

select * from "Catálogo de Productos";

select * from Usuarios;

select * from "Métodos de Pago";

select * from Empleados;

select * from "Pedidos/Ventas";

select * from Tickets;

select * from Facturas;

DELETE FROM "Catálogo de Productos" WHERE "ID" = 9;

DELETE FROM "Productos/Inventario" WHERE "ID de producto" = 14;

DELETE FROM clientes WHERE "ID" < 12;

DELETE FROM Usuarios WHERE "ID" = 2;


-- Modificar la tabla "Catálogo de Productos" para agregar la columna de relación con el inventario
ALTER TABLE "Catálogo de Productos"
ADD COLUMN "ID de producto en inventario" INTEGER REFERENCES "Productos/Inventario"("ID de producto");

INSERT INTO "Productos/Inventario" ("Nombre del producto", "Descripción", "Precio", "Categoría", "Stock disponible", "Stock mínimo") 
VALUES 
('Manzana', 'Manzana roja deliciosa', 0.25, 'Comida', 100, 10),
('iPhone 13', 'Teléfono inteligente de Apple', 999.99, 'Electrónica', 50, 5),
('Martillo', 'Martillo de acero', 19.99, 'Herramientas', 30, 3),
('El Gran Gatsby', 'Novela clásica de F. Scott Fitzgerald', 9.99, 'Libros', 20, 2),
('Zanahoria', 'Zanahoria fresca', 0.15, 'Comida', 200, 20),
('Samsung Galaxy S21', 'Teléfono inteligente de Samsung', 799.99, 'Electrónica', 40, 4),
('Destornillador', 'Destornillador de acero', 9.99, 'Herramientas', 60, 6),
('1984', 'Novela distópica de George Orwell', 6.99, 'Libros', 15, 1),
('Plátano', 'Plátano maduro', 0.30, 'Comida', 120, 12),
('Sony PlayStation 5', 'Consola de videojuegos de Sony', 499.99, 'Electrónica', 30, 3);

-------------------- Ejemplo de inserciones para futuras pruebas 

INSERT INTO "Productos/Inventario" ("Nombre del producto", "Descripción", "Precio", "Categoría", "Stock disponible", "Stock mínimo") 
VALUES 
('Smartphone Samsung Galaxy S21', 'Último modelo con pantalla AMOLED de 6.2 pulgadas y cámara de alta resolución.', 899.99, 'Electrónicos', 100, 20),
('Portátil Dell Inspiron 15', 'Potente portátil con procesador Intel Core i7 y pantalla táctil de 15.6 pulgadas.', 1299.99, 'Electrónicos', 75, 15),
('Smart TV LG OLED C1 65"', 'Televisor OLED de 65 pulgadas con resolución 4K y tecnología Dolby Vision.', 1999.99, 'Electrónicos', 50, 10);

INSERT INTO "Pedidos/Ventas" ("ID de cliente", "Fecha y hora del pedido/venta", "Tipo de pedido/venta", "Estado del pedido/venta", "Total", "De método de pago", "ID de empleado") 
VALUES 
(101, '2024-04-26 09:45:00', 'Compra en línea', 'Pendiente', 899.99, 1, 123),
(102, '2024-04-26 11:30:00', 'Compra en tienda', 'En proceso', 1299.99, 2, 124),
(103, '2024-04-26 13:15:00', 'Pedido a domicilio', 'Entregado', 1999.99, 3, 125);

INSERT INTO Tickets ("ID de pedido/venta", "Fecha y hora de emisión", "Total", "Detalles") 
VALUES 
(1001, '2024-04-26 10:00:00', 899.99, 'Incluye impuestos y gastos de envío.'),
(1002, '2024-04-26 12:00:00', 1299.99, 'Descuento aplicado por promoción especial.'),
(1003, '2024-04-26 14:00:00', 1999.99, 'Envío urgente con entrega en 24 horas.');

INSERT INTO Facturas ("ID de cliente", "Fecha y hora de emisión", "Total", "Método de pago", "ID de empleado", "ID de pedido/venta", "Número de factura", "Detalles adicionales") 
VALUES 
(101, '2024-04-26 09:50:00', 899.99, 1, 123, 1001, 'INV-2024-04-26-001', 'Descuento aplicado del 10% por cliente frecuente.'),
(102, '2024-04-26 11:45:00', 1299.99, 2, 124, 1002, 'INV-2024-04-26-002', 'Envío gratuito por compra superior a $1000.'),
(103, '2024-04-26 13:30:00', 1999.99, 3, 125, 1003, 'INV-2024-04-26-003', 'Garantía extendida de 2 años incluida.');

INSERT INTO Empleados ("Nombre", "Apellido", "Correo electrónico", "Contraseña", "Puesto", "Rol", "Acceso a la configuración del sistema") 
VALUES 
('Ana', 'García', 'ana.garcia@example.com', 'contraseña123', 'Gerente de Ventas', 'Administrador', true),
('Juan', 'Martínez', 'juan.martinez@example.com', 'clave456', 'Asistente de Almacén', 'UsuarioRegular', false),
('María', 'López', 'maria.lopez@example.com', 'p@ssw0rd', 'Cajero', 'UsuarioRegular', false);

INSERT INTO Usuarios ("NombreUsuario", "ContraseñaHash", "Rol") 
VALUES 
('admin', 'hashed_password_admin', 'Administrador'),
('jmartinez', 'hashed_password_jmartinez', 'UsuarioRegular'),
('mlopez', 'hashed_password_mlopez', 'UsuarioRegular');

INSERT INTO Clientes ("Nombre", "Apellido", "Correo electrónico", "Teléfono", "Dirección") 
VALUES 
('Carlos', 'González', 'carlos.gonzalez@example.com', '555-1234', 'Calle Principal #123'),
('Laura', 'Hernández', 'laura.hernandez@example.com', '555-5678', 'Avenida Central #456'),
('Pedro', 'Díaz', 'pedro.diaz@example.com', '555-9012', 'Calle Secundaria #789');

INSERT INTO "Catálogo de Productos" ("Nombre", "Descripción", "Precio", "Cantidad Disponible", "Categoría") 
VALUES 
('Cámara Canon EOS Rebel T7', 'Cámara réflex digital con sensor de 24.1 MP y video Full HD.', 499.99, 30, 'Electrónicos'),
('Zapatos Deportivos Nike Air Max', 'Zapatos deportivos para correr con tecnología de amortiguación Air Max.', 129.99, 50, 'Calzado'),
('Libro "El Hobbit" de J.R.R. Tolkien', 'Novela de fantasía que narra las aventuras de Bilbo Bolsón.', 19.99, 100, 'Libros');

INSERT INTO "Catálogo de Productos" ("Nombre", "Descripción", "Precio", "Cantidad Disponible", "Categoría") 
VALUES 
('Cámara Canon EOS Rebel T7', 'Cámara réflex digital con sensor de 24.1 MP y video Full HD.', 499.99, 30, 'Electrónicos'),
('Zapatos Deportivos Nike Air Max', 'Zapatos deportivos para correr con tecnología de amortiguación Air Max.', 129.99, 50, 'Calzado'),
('Libro "El Hobbit" de J.R.R. Tolkien', 'Novela de fantasía que narra las aventuras de Bilbo Bolsón.', 19.99, 100, 'Libros');









