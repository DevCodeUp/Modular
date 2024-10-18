-- Tabla de usuarios extendida con más información y modularidad
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    rol VARCHAR(20) CHECK (rol IN ('empleado', 'administrador', 'supervisor')), -- Añadimos un rol adicional para supervisores
    estado BOOLEAN DEFAULT TRUE, -- Activo o inactivo, para permitir deshabilitar usuarios sin eliminarlos
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ultima_conexion TIMESTAMP -- Campo para registrar la última conexión del usuario
);

-- Crear la tabla producto
CREATE TABLE producto (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT
);


-- Tabla para control de calidad mejorada, ahora con una relación directa a la tabla de productos
CREATE TABLE calidad (
    id SERIAL PRIMARY KEY,
    id_producto INT REFERENCES producto(id), -- Relacionado directamente con los productos de inventario
    estado VARCHAR(20) CHECK (estado IN ('bueno', 'malo', 'pendiente')), -- Añadimos un estado adicional 'pendiente' para casos en proceso
    fecha_control TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT REFERENCES usuarios(id), -- Relacionado con el empleado que realiza el control
    comentarios TEXT -- Campo adicional para notas o detalles del control
);

-- Tabla para el procesamiento de imágenes por IA, ahora con categorías y resultados detallados
CREATE TABLE imagenes_ia (
    id SERIAL PRIMARY KEY,
    ruta_imagen VARCHAR(255),
    resultado_ia VARCHAR(100),
    categoria VARCHAR(50), -- Añadir categoría para clasificar imágenes (ej. defectos, calidad, etc.)
    fecha_procesado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT REFERENCES usuarios(id), -- Vinculado al usuario que procesó la imagen
    estado VARCHAR(20) CHECK (estado IN ('procesado', 'pendiente', 'fallido')), -- Estado del procesamiento
    detalles TEXT -- Detalles adicionales sobre el resultado o el proceso de IA
);

-- Tabla de historial del administrador mejorada para auditoría más detallada
CREATE TABLE historial_administrador (
    id SERIAL PRIMARY KEY,
    accion VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_admin INT REFERENCES usuarios(id),
    detalles TEXT -- Información adicional sobre los cambios realizados (antes y después)
);

-- Tabla de productos actualizada para integrarse con control de calidad y otras funciones
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio NUMERIC(10,2),
    stock_disponible INT,
    stock_minimo INT,
    categoria VARCHAR(50),
    id_calidad INT REFERENCES calidad(id) -- Relacionado con los controles de calidad asociados
);


