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