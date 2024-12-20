-- 1. Insertar Categorías de Productos
INSERT INTO Categories_Products (Name_Category) VALUES 
('Pastel'),
('Rosca'),
('Cupcake'),
('Pastel Helado');

-- 2. Insertar Categorías de Recursos
INSERT INTO Categories_Resources (Name_Category) VALUES 
('Perecederos'),
('No perecederos');

-- 3. Insertar Proveedores
INSERT INTO Supplier (Name_Supplier, Address, Lada, Phone) VALUES
('Proveedor Harinas S.A.', 'Calle 123, Ciudad A', 55, 1234567890),
('Proveedor Azúcar Ltda.', 'Avenida 456, Ciudad B', 55, 9876543210),
('Proveedor Lácteos Corp.', 'Boulevard 789, Ciudad C', 33, 1231231234),
('Proveedor Decoraciones X.', 'Calle Fina 10, Ciudad D', 44, 9879879870);

-- 4. Insertar Recursos (Ingredientes necesarios)
INSERT INTO Resources (Name_Resource, Description, Price, ID_Category, ID_Supplier) VALUES
('Harina', 'Harina de trigo 1kg', 15.0, 1, 1),
('Azúcar', 'Azúcar refinada 1kg', 12.0, 1, 2),
('Mantequilla', 'Mantequilla fresca 500g', 30.0, 1, 3),
('Huevos', 'Docena de huevos frescos', 25.0, 1, 3),
('Leche', 'Leche entera 1L', 18.0, 1, 3),
('Chocolate', 'Chocolate de repostería 200g', 45.0, 1, 2),
('Decoraciones', 'Decoraciones de azúcar variadas', 35.0, 2, 4),
('Vainilla', 'Esencia de vainilla 50ml', 20.0, 2, 4),
('Mermelada', 'Mermelada de frutas 200g', 22.0, 1, 3);

-- 5. Insertar 10 Productos Únicos
INSERT INTO Products (Name_Product, Description, Price, ID_Category) VALUES
('Pastel de Chocolate', 'Delicioso pastel de chocolate con cobertura', 200.0, 1),
('Pastel de Vainilla', 'Pastel esponjoso de vainilla con crema', 180.0, 1),
('Rosca de Canela', 'Rosca tradicional con un toque de canela', 150.0, 2),
('Rosca de Azúcar', 'Rosca dulce cubierta de azúcar refinada', 140.0, 2),
('Cupcake de Frutos Rojos', 'Cupcake con frutos rojos y crema', 90.0, 3),
('Cupcake de Chocolate', 'Cupcake relleno de chocolate cremoso', 95.0, 3),
('Pastel Helado de Limón', 'Pastel frío con sabor refrescante a limón', 220.0, 4),
('Pastel Helado de Mango', 'Pastel helado con puré natural de mango', 230.0, 4),
('Cupcake de Vainilla', 'Cupcake clásico con sabor a vainilla', 85.0, 3),
('Pastel de Fresas', 'Pastel decorado con fresas frescas y crema', 210.0, 1);

-- 6. Insertar Relación Product_Resources
DO $$
DECLARE
    product_id INTEGER;
    resource_id INTEGER;
BEGIN
    -- Asignar recursos a cada producto
    FOR product_id IN SELECT ID FROM Products LOOP
        FOR resource_id IN (SELECT ID FROM Resources) LOOP
            -- Insertar una cantidad aleatoria de recursos entre 1 y 5
            INSERT INTO Product_Resources (ID_Product, ID_Resource, Quantity)
            VALUES (product_id, resource_id, FLOOR(RANDOM() * 5 + 1));
        END LOOP;
    END LOOP;
END $$;

-- 7. Insertar registros en la tabla Inventory
INSERT INTO Inventory (ID_Resource, No_Lot, Stock, Minimum_Stock, Expiration_Date)
SELECT 
    r.ID AS ID_Resource,
    (FLOOR(RANDOM() * 1000) + 1000) AS No_Lot, -- Genera un número de lote aleatorio entre 1000 y 2000
    (FLOOR(RANDOM() * 50) + 10) AS Stock,      -- Stock inicial aleatorio entre 10 y 60
    5 AS Minimum_Stock,                       -- Stock mínimo fijo
    CASE 
        WHEN cr.Name_Category = 'Perecederos' THEN CURRENT_DATE + (INTERVAL '5 days')  -- Perecederos: 5 días a partir de hoy
        WHEN cr.Name_Category = 'No perecederos' THEN CURRENT_DATE + (INTERVAL '180 days') -- No perecederos: 180 días
    END AS Expiration_Date
FROM Resources r
JOIN Categories_Resources cr ON r.ID_Category = cr.ID;

-- 8. Simular ventas para Sales
DO $$
DECLARE
    v_product_id INTEGER;        -- Variable para el ID del producto
    v_amount INTEGER;            -- Cantidad vendida
    v_price FLOAT;               -- Precio total calculado
    v_date TIMESTAMP;            -- Fecha de venta aleatoria
    v_counter INTEGER := 0;      -- Contador de registros
BEGIN
    -- Generar 100,000 registros
    WHILE v_counter < 100000 LOOP
        -- Seleccionar aleatoriamente un producto de la tabla Products
        SELECT ID, Price
        INTO v_product_id, v_price
        FROM Products
        ORDER BY RANDOM()
        LIMIT 1;

        -- Generar cantidad vendida (entre 1 y 10 unidades)
        v_amount := FLOOR(RANDOM() * 10) + 1;

        -- Generar fecha de venta aleatoria en los últimos 5 años
        v_date := NOW() - (RANDOM() * INTERVAL '5 years');

        -- Insertar el registro en la tabla Sales
        INSERT INTO Sales (ID_Product, Amount, Price, Date)
        VALUES (v_product_id, v_amount, v_price * v_amount, v_date);

        -- Incrementar el contador
        v_counter := v_counter + 1;
    END LOOP;
END $$;

-- INSERTAR UNA FÁBRICA EN LA TABLA Factories
INSERT INTO Factories (cod_postal, address, name, Country, State)
VALUES 
(12345, 'Av. Principal 123', 'Fábrica Pastelitos Felices', 'México', 'Ciudad de México');

-- INSERTAR MÁQUINAS EN LA TABLA Equipment
-- Máquinas asignadas a productos existentes (simulando una producción ideal)
INSERT INTO Equipment (ID_Factory, ID_Product, Name, Min_Prod, Unit_Measure, Time, Unit_Time)
VALUES
(1, 1, 'Mezcladora Industrial', 50, 'kg', 2, 'h'),
(1, 2, 'Horno Rotatorio', 200, 'pz', 4, 'h'),
(1, 3, 'Decoradora Automática', 150, 'pz', 3, 'h');

-- SIMULAR PRODUCCIONES EN LA TABLA Production (500 registros)
-- Producciones que alcanzan el objetivo (Min_Prod) y producciones fallidas
DO $$
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO Production (ID_Equipment, Date, Quant_Prod, Unit_Measure, Time, Unit_Time)
        VALUES 
        (
            (CASE WHEN i % 3 = 0 THEN 1 WHEN i % 3 = 1 THEN 2 ELSE 3 END), -- Alternar entre las 3 máquinas
            NOW() - (i || ' days')::INTERVAL,                              -- Fecha simulada (últimos 500 días)
            (CASE WHEN i % 5 = 0 THEN (SELECT Min_Prod FROM Equipment WHERE ID = (i % 3 + 1)) - 10 
                  ELSE (SELECT Min_Prod FROM Equipment WHERE ID = (i % 3 + 1)) + 5 END), -- Éxitos y fallos
            (SELECT Unit_Measure FROM Equipment WHERE ID = (i % 3 + 1)),
            (SELECT Time FROM Equipment WHERE ID = (i % 3 + 1)),
            (SELECT Unit_Time FROM Equipment WHERE ID = (i % 3 + 1))
        );
    END LOOP;
END $$;

-- LLENAR LA TABLA Store CON LOS PRODUCTOS PRODUCIDOS (RELACIONADO CON Production)
DO $$
BEGIN
    FOR i IN 1..500 LOOP
        INSERT INTO Store (ID_Product, No_Lot, Amount, Expiration_Date, Production_Date)
        VALUES 
        (
            (CASE WHEN i % 3 = 0 THEN 1 WHEN i % 3 = 1 THEN 2 ELSE 3 END), -- Alternar entre los productos
            i,                                                            -- Número de lote
            (SELECT Quant_Prod FROM Production WHERE ID = i),             -- Cantidad producida en Production
            NOW() + (30 || ' days')::INTERVAL,                            -- Fecha de expiración (+30 días)
            (SELECT Date FROM Production WHERE ID = i)                    -- Fecha de producción en Production
        );
    END LOOP;
END $$;

-- SIMULAR PEDIDOS EN LA TABLA Orders (200 pedidos)
-- Pedidos realizados a los proveedores para diferentes recursos
DO $$
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Orders (ID_Resource, Quantity, Date, Delivered)
        VALUES 
        (
            (CASE WHEN i % 4 = 0 THEN 1 WHEN i % 4 = 1 THEN 2 WHEN i % 4 = 2 THEN 3 ELSE 4 END), -- Alternar recursos
            (CASE WHEN i % 5 = 0 THEN 100 ELSE 50 END),                                         -- Cantidad pedida
            NOW() - (i || ' days')::INTERVAL,                                                  -- Fecha simulada
            (CASE WHEN i % 3 = 0 THEN TRUE ELSE FALSE END)                                      -- Alternar entregado o no
        );
    END LOOP;
END $$;

