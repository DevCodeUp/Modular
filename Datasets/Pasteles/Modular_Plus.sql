-- Tabla de usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    rol VARCHAR(20) CHECK (rol IN ('empleado', 'administrador')),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de control de calidad
CREATE TABLE control_calidad (
    id SERIAL PRIMARY KEY,
    producto_nombre VARCHAR(100),
    estado VARCHAR(20) CHECK (estado IN ('bueno', 'malo')),
    fecha_control TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT REFERENCES usuarios(id)
);

-- Tabla para imágenes procesadas por IA
CREATE TABLE imagenes_ia (
    id SERIAL PRIMARY KEY,
    ruta_imagen VARCHAR(255),
    resultado_ia VARCHAR(100),
    fecha_procesado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_empleado INT REFERENCES usuarios(id)
);

-- Tabla para historial de cambios por el administrador
CREATE TABLE historial_administrador (
    id SERIAL PRIMARY KEY,
    accion VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_admin INT REFERENCES usuarios(id)
);
