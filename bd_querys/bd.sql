CREATE TABLE restaurante (
    id_restaurante SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(20) NOT NULL
);

CREATE TABLE rol (
    id_rol SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    id_restaurante INT NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON DELETE CASCADE,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante) ON DELETE CASCADE
);

CREATE TABLE estado_reserva (
    id_estado SERIAL PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE reserva (
    id_reserva SERIAL PRIMARY KEY,
    fecha_hora TIMESTAMP NOT NULL,
    cantidad_personas INT NOT NULL CHECK (cantidad_personas > 0),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    ocasion VARCHAR(255),
    id_estado INT NOT NULL,
    id_restaurante INT NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado_reserva(id_estado) ON DELETE CASCADE,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante) ON DELETE CASCADE
);

CREATE TABLE horario_restaurante (
    id_horario_restaurante SERIAL PRIMARY KEY,
    dia VARCHAR(15) NOT NULL CHECK (dia IN ('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo')),
    abierto BOOLEAN NOT NULL,
    hora_apertura TIME,
    hora_cierre TIME,
    capacidad INT NOT NULL CHECK (capacidad >= 0),
    id_restaurante INT NOT NULL,
    FOREIGN KEY (id_restaurante) REFERENCES restaurante(id_restaurante) ON DELETE CASCADE
);

CREATE TABLE horario_reserva (
    id_horario_reserva SERIAL PRIMARY KEY,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    disponible BOOLEAN DEFAULT TRUE NOT NULL
);
  
CREATE TABLE menu (
    id_menu SERIAL PRIMARY KEY,
    archivo FILE
);

INSERT INTO restaurante (nombre, direccion, ciudad, estado, codigo_postal)
VALUES ('BigFish', 'Dalea 821, El Sabino Cerrada Residencial',
        'Monterrey', 'Nuevo León', '64984');

SELECT * FROM restaurante;