-- TABLAS PRINCIPALES

-- Tabla Users
CREATE TABLE USERS(
	USERNAME VARCHAR(20),
	PASSWORD VARCHAR(50),
	ROL VARCHAR(15)
);

-- Tabla Categories_Resources
CREATE TABLE Categories_Resources (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name_Category VARCHAR(255) NOT NULL
);

-- Tabla Supplier
CREATE TABLE Supplier (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name_Supplier VARCHAR(255) NOT NULL,
    Address CLOB NOT NULL,
    Lada INTEGER NOT NULL,
    Phone BIGINT NOT NULL,
    delivery_time INTEGER NOT NULL
);

-- Tabla Resources
CREATE TABLE Resources (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name_Resource VARCHAR(255) NOT NULL,
    Description CLOB,
    Price DOUBLE NOT NULL,
    ID_Category INTEGER NOT NULL REFERENCES Categories_Resources(ID),
    ID_Supplier INTEGER NOT NULL REFERENCES Supplier(ID)
);

-- Tabla Inventory
CREATE TABLE Inventory (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_Resource INTEGER NOT NULL REFERENCES Resources(ID),
    No_Lot INTEGER NOT NULL,
    Stock INTEGER NOT NULL,
    Minimum_Stock INTEGER NOT NULL,
    Expiration_Date DATE
);

--Tabla Recipes
CREATE TABLE Recipes (
    RecipeID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ProductID INTEGER NOT NULL REFERENCES PRODUCTS(ID),
    ResourceID INTEGER NOT NULL REFERENCES RESOURCES(ID),
    Quantity DECIMAL(10,2) NOT NULL,
    Unit VARCHAR(20) NOT NULL
);

-- Tabla Categories_Products
CREATE TABLE Categories_Products (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name_Category VARCHAR(255) NOT NULL
);

-- Tabla Products
CREATE TABLE Products (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name_Product VARCHAR(255) NOT NULL,
    Description CLOB,
    Price DOUBLE NOT NULL,
    ID_Category INTEGER NOT NULL REFERENCES Categories_Products(ID)
);

-- Tabla Store
CREATE TABLE Store (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_Product INTEGER NOT NULL REFERENCES Products(ID),
    No_Lot INTEGER NOT NULL,
    Amount INTEGER NOT NULL,
    Expiration_Date DATE,
    Production_Date DATE NOT NULL
);

-- Tabla Sales
CREATE TABLE Sales (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_Product INTEGER NOT NULL REFERENCES Products(ID),
    Amount INTEGER NOT NULL,
    Price DOUBLE NOT NULL,
    Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabla Employees
CREATE TABLE Employees (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name_Employee VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password CLOB NOT NULL
);

-- Tabla Product_Resources
CREATE TABLE Product_Resources (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_Product INTEGER NOT NULL REFERENCES Products(ID) ON DELETE CASCADE,
    ID_Resource INTEGER NOT NULL REFERENCES Resources(ID) ON DELETE CASCADE,
    Quantity INTEGER NOT NULL DEFAULT 1
);

-- Tabla Orders
CREATE TABLE Orders (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_Resource INTEGER NOT NULL REFERENCES Resources(ID),
    Quantity INTEGER NOT NULL,
    Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Delivered SMALLINT NOT NULL
);

-- Tabla Factories
CREATE TABLE Factories (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cod_postal INTEGER NOT NULL,
    address VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    State VARCHAR(255) NOT NULL
);

-- Tabla Equipment
CREATE TABLE Equipment (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ID_Factory INTEGER NOT NULL REFERENCES Factories(ID),
    ID_Product INTEGER NOT NULL REFERENCES Products(ID),
    Min_Prod INTEGER NOT NULL,
    Unit_Measure VARCHAR(3) NOT NULL,
    Time INTEGER NOT NULL,
    Unit_Time VARCHAR(1) NOT NULL
);

-- Tabla Production
CREATE TABLE Production (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_Equipment INTEGER NOT NULL REFERENCES Equipment(ID),
    Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Quant_Prod INTEGER NOT NULL,
    Unit_Measure VARCHAR(3) NOT NULL,
    Time INTEGER NOT NULL,
    Unit_Time VARCHAR(1) NOT NULL
);

-- TABLAS SECUNDARIAS
-- Tablas de Logs
CREATE TABLE Inventory_Log (
    ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ID_Resource INTEGER,
    Change_Type VARCHAR(50),
    Old_Stock INTEGER,
    New_Stock INTEGER,
    Change_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--Bill of materials
CREATE TABLE BOM (
    ID SERIAL PRIMARY KEY,
    ID_Product INTEGER NOT NULL REFERENCES Products(ID) ON DELETE CASCADE,
    ID_Resource INTEGER NOT NULL REFERENCES Resources(ID) ON DELETE CASCADE,
    Quantity FLOAT NOT NULL CHECK (Quantity > 0)
);

-- Plan de produccion
CREATE TABLE Production_Plan (
    ID SERIAL PRIMARY KEY,
    ID_Product INTEGER NOT NULL REFERENCES Products(ID) ON DELETE CASCADE,
    Planned_Quantity INTEGER NOT NULL CHECK (Planned_Quantity > 0),
    Start_Date TIMESTAMP NOT NULL,
    End_Date TIMESTAMP NOT NULL
);


-- INDICES
CREATE INDEX idx_resources_name ON Resources(Name_Resource);
CREATE INDEX idx_products_name ON Products(Name_Product);
CREATE INDEX idx_sales_date ON Sales(Date);
CREATE INDEX idx_orders_id_resource ON Orders(ID_Resource);
CREATE INDEX idx_equipment_id_factory ON Equipment(ID_Factory);
CREATE INDEX idx_equipment_id_product ON Equipment(ID_Product);
CREATE INDEX idx_production_id_equipment ON Production(ID_Equipment);

-- VISTAS
CREATE VIEW SalesSummary AS
SELECT 
    ID_Product, 
    SUM(Amount * Price) AS Total_Sales 
FROM Sales
GROUP BY ID_Product;

-- TRIGGERS
CREATE OR REPLACE TRIGGER inventory_update_trigger
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

-- INIDCE DE RECURSOS POR NOMBRE
CREATE INDEX idx_resources_name ON Resources(Name_Resource);
CREATE INDEX idx_orders_id_resource ON Orders(ID_Resource);




