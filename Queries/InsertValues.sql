-- Script para poblar la base de datos DB2 para el ERP de una fábrica de pasteles
-- Incluye datos simulados suficientes para entrenar un modelo de IA
-- Simula un plan de producción y ventas de los últimos 5 años

-- Población de la tabla Categories_Resources
INSERT INTO Categories_Resources (Name_Category) VALUES 
('Harinas'), ('Lácteos'), ('Endulzantes'), ('Frutas'), ('Decoraciones');

-- Población de la tabla Supplier
INSERT INTO Supplier (Name_Supplier, Address, Lada, Phone, delivery_time) VALUES 
('Harinas Premium', 'Calle A #123, CDMX', 55, 5551234567, 3),
('Lácteos Deliciosos', 'Calle B #456, Monterrey', 81, 8117654321, 2),
('Endulzantes SA', 'Calle C #789, Guadalajara', 33, 3312345678, 4),
('Frutas Selectas', 'Calle D #321, Puebla', 222, 2228765432, 5),
('Decorarte SA', 'Calle E #654, Querétaro', 442, 4421122334, 3);

-- Población de la tabla Resources
INSERT INTO Resources (Name_Resource, Description, Price, ID_Category, ID_Supplier) VALUES 
('Harina de Trigo', 'Harina refinada para repostería', 25.5, 1, 1),
('Leche Entera', 'Leche fresca pasteurizada', 18.0, 2, 2),
('Azúcar Morena', 'Azúcar sin refinar', 15.0, 3, 3),
('Fresas Frescas', 'Fresas orgánicas seleccionadas', 45.0, 4, 4),
('Perlas de Chocolate', 'Decoración de chocolate semi-amargo', 50.0, 5, 5);

-- Población de la tabla Inventory
INSERT INTO Inventory (ID_Resource, No_Lot, Stock, Minimum_Stock, Expiration_Date) VALUES 
(1, 1001, 500, 100, '2025-12-31'),
(2, 1002, 300, 50, '2025-09-30'),
(3, 1003, 400, 80, '2025-11-15'),
(4, 1004, 200, 30, '2025-08-01'),
(5, 1005, 150, 20, '2025-10-10');

-- Población de la tabla Categories_Products
INSERT INTO Categories_Products (Name_Category) VALUES 
('Pasteles de Chocolate'), ('Pasteles de Fruta'), ('Pasteles de Vainilla');

-- Población de la tabla Products
INSERT INTO Products (Name_Product, Description, Price, ID_Category) VALUES 
('Pastel Triple Chocolate', 'Pastel con tres capas de chocolate', 350.0, 1),
('Pastel de Fresas', 'Pastel esponjoso con fresas frescas', 300.0, 2),
('Pastel Clásico de Vainilla', 'Pastel de vainilla con betún', 280.0, 3);

-- Población de la tabla Store
INSERT INTO Store (ID_Product, No_Lot, Amount, Expiration_Date, Production_Date) VALUES 
(1, 2001, 50, '2025-06-30', '2025-01-15'),
(2, 2002, 30, '2025-07-20', '2025-01-20'),
(3, 2003, 40, '2025-08-10', '2025-02-01');

-- Población de la tabla Employees
INSERT INTO Employees (Name_Employee, LastName, Email, Password) VALUES 
('Juan', 'Pérez', 'juan.perez@erp.com', 'hashed_password1'),
('Ana', 'García', 'ana.garcia@erp.com', 'hashed_password2'),
('Luis', 'Martínez', 'luis.martinez@erp.com', 'hashed_password3');

-- Población de la tabla Product_Resources
INSERT INTO Product_Resources (ID_Product, ID_Resource, Quantity) VALUES 
(1, 1, 2), (1, 5, 1), (2, 1, 1), (2, 4, 2), (3, 1, 1), (3, 2, 1);

-- Población de la tabla Orders
INSERT INTO Orders (ID_Resource, Quantity, Delivered) VALUES 
(1, 100, 1), (2, 200, 1), (3, 150, 1), (4, 80, 1), (5, 60, 1);

-- Población de la tabla Factories
INSERT INTO Factories (cod_postal, address, name, Country, State) VALUES 
(12345, 'Parque Industrial #1', 'Fábrica Central', 'México', 'CDMX');

-- Población de la tabla Equipment
INSERT INTO Equipment (ID_Factory, ID_Product, Name, Min_Prod, Unit_Measure, Time, Unit_Time) VALUES 
(1, 1, 'Horno Triple Choc', 10, 'kg', 2, 'h'),
(1, 2, 'Batidora Fresas', 8, 'kg', 1, 'h'),
(1, 3, 'Horno Vainilla', 12, 'kg', 2, 'h');

-- Población de la tabla Production (Datos simulados de producción por equipo)
INSERT INTO Production (ID_Equipment, Quant_Prod, Unit_Measure, Time, Unit_Time) VALUES 
(1, 200, 'kg', 3, 'h'),
(2, 150, 'kg', 2, 'h'),
(3, 220, 'kg', 4, 'h');

-- Inserción de recetas simuladas para productos existentes

-- Pastel Triple Chocolate (PRODUCTID = 1)
INSERT INTO RECIPES (PRODUCTID, RESOURCEID, QUANTITY, UNIT) VALUES
(1, 1, 1.50, 'kg'),      -- Harina de Trigo
(1, 2, 0.75, 'lt'),      -- Leche Entera
(1, 3, 0.50, 'kg'),      -- Azúcar Morena
(1, 5, 200, 'g');        -- Perlas de Chocolate

-- Pastel de Fresas (PRODUCTID = 2)
INSERT INTO RECIPES (PRODUCTID, RESOURCEID, QUANTITY, UNIT) VALUES
(2, 1, 1.20, 'kg'),      -- Harina de Trigo
(2, 2, 0.80, 'lt'),      -- Leche Entera
(2, 3, 0.40, 'kg'),      -- Azúcar Morena
(2, 4, 0.90, 'kg');      -- Fresas Frescas

-- Pastel Clásico de Vainilla (PRODUCTID = 3)
INSERT INTO RECIPES (PRODUCTID, RESOURCEID, QUANTITY, UNIT) VALUES
(3, 1, 1.00, 'kg'),      -- Harina de Trigo
(3, 2, 1.00, 'lt'),      -- Leche Entera
(3, 3, 0.60, 'kg'),      -- Azúcar Morena
(3, 5, 100, 'g');        -- Perlas de Chocolate como decoración opcional

--Usuarios
INSERT INTO USERS (USERNAME, PASSWORD, ROL) VALUES
('IT_user', 'IT1234', 'IT'),
('Sup_user', 'Sup1234', 'Supervisor'),
('Op_user', 'Op1234', 'Operator');
