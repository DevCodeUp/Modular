-- TABLAS PRINCIPALES
-- Creación de la tabla Categories_Resources
CREATE TABLE Categories_Resources (
    ID SERIAL PRIMARY KEY,
    Name_Category VARCHAR(255) NOT NULL
);

-- Creación de la tabla Supplier
CREATE TABLE Supplier (
    ID SERIAL PRIMARY KEY,
    Name_Supplier VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL,
    Lada INTEGER NOT NULL,
    Phone NUMERIC(10, 0) NOT NULL
);

-- Creación de la tabla Resources
CREATE TABLE Resources (
    ID SERIAL PRIMARY KEY,
    Name_Resource VARCHAR(255) NOT NULL,
    Description TEXT,
    Price FLOAT NOT NULL,
    ID_Category INTEGER NOT NULL REFERENCES Categories_Resources(ID),
    ID_Supplier INTEGER NOT NULL REFERENCES Supplier(ID)
);

-- Creación de la tabla Inventory
CREATE TABLE Inventory (
    ID SERIAL PRIMARY KEY,
    ID_Resource INTEGER NOT NULL REFERENCES Resources(ID),
    No_Lot INTEGER NOT NULL,
    Stock INTEGER NOT NULL,
    Minimum_Stock INTEGER NOT NULL,
    Expiration_Date DATE
);

-- Creación de la tabla Categories_Products
CREATE TABLE Categories_Products (
    ID SERIAL PRIMARY KEY,
    Name_Category VARCHAR(255) NOT NULL
);

-- Creación de la tabla Products
CREATE TABLE Products (
    ID SERIAL PRIMARY KEY,
    Name_Product VARCHAR(255) NOT NULL,
    Description TEXT,
    Price FLOAT NOT NULL,
    ID_Category INTEGER NOT NULL REFERENCES Categories_Products(ID)
);

-- Creación de la tabla Production
CREATE TABLE Production (
    ID SERIAL PRIMARY KEY,
    ID_Product INTEGER NOT NULL REFERENCES Products(ID),
    No_Lot INTEGER NOT NULL,
    Amount INTEGER NOT NULL,
    Expiration_Date DATE,
    Production_Date DATE NOT NULL
);

-- Creación de la tabla Sales
CREATE TABLE Sales (
    ID SERIAL PRIMARY KEY,
    ID_Product INTEGER NOT NULL REFERENCES Products(ID),
    Amount INTEGER NOT NULL,
    Price FLOAT NOT NULL,
    Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Creación de la tabla Employees
CREATE TABLE Employees (
    ID SERIAL PRIMARY KEY,
    Name_Employee VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password TEXT NOT NULL
);

--TABLAS SECUNDARIAS
-- Tablas de Logs
CREATE TABLE Inventory_Log (
    ID SERIAL PRIMARY KEY,
    ID_Resource INTEGER,
    Change_Type VARCHAR(50),
    Old_Stock INTEGER,
    New_Stock INTEGER,
    Change_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INDICES
CREATE INDEX idx_resources_name ON Resources(Name_Resource);
CREATE INDEX idx_products_name ON Products(Name_Product);
CREATE INDEX idx_sales_date ON Sales(Date);

-- VISTAS
-- Ventas Totales
CREATE VIEW SalesSummary AS
SELECT 
    ID_Product, 
    SUM(Amount * Price) AS Total_Sales 
FROM Sales
GROUP BY ID_Product;

-- TRIGERS
--Inventory
CREATE OR REPLACE FUNCTION log_inventory_changes()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO Inventory_Log (ID_Resource, Change_Type, Old_Stock, New_Stock)
    VALUES (OLD.ID_Resource, 'UPDATE', OLD.Stock, NEW.Stock);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inventory_update_trigger
AFTER UPDATE ON Inventory
FOR EACH ROW EXECUTE FUNCTION log_inventory_changes();


-- ROLES
-- Crear el rol de administrador con control total
CREATE ROLE admin_role WITH LOGIN PASSWORD 'admin_password';
GRANT ALL PRIVILEGES ON DATABASE modular TO admin_role;

-- Crear el rol de análisis de ventas (lectura en tablas de ventas y productos)
CREATE ROLE sales_analyst_role WITH LOGIN PASSWORD 'sales_password';
GRANT CONNECT ON DATABASE modular TO sales_analyst_role;
GRANT USAGE ON SCHEMA public TO sales_analyst_role;

-- Crear el rol de producción (lectura en productos, insumos, inventario y producción)
CREATE ROLE production_role WITH LOGIN PASSWORD 'production_password';
GRANT CONNECT ON DATABASE modular TO production_role;
GRANT USAGE ON SCHEMA public TO production_role;

-- PERMISOS PARA ROLES
-- Administrador
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_role;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO admin_role;

-- Analista de ventas
GRANT SELECT ON Sales, Products TO sales_analyst_role;
GRANT SELECT ON Categories_Products TO sales_analyst_role;
GRANT SELECT ON salessummary TO sales_analyst_role;

-- Operador de Producción
GRANT SELECT ON Resources, Inventory, Products, Production TO production_role;
GRANT SELECT ON Categories_Resources, Categories_Products TO production_role;
GRANT SELECT ON Supplier TO production_role;

-- USUARIOS
-- Crear usuarios y asignarlos a los roles
CREATE USER admin_user WITH PASSWORD 'admin_user_password';
GRANT admin_role TO admin_user;

CREATE USER sales_user WITH PASSWORD 'sales_user_password';
GRANT sales_analyst_role TO sales_user;

CREATE USER production_user WITH PASSWORD 'production_user_password';
GRANT production_role TO production_user;






