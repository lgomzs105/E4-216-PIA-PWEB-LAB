-- Inserts para tabla restaurante
INSERT INTO restaurante (nombre, direccion, ciudad, estado, codigo_postal) VALUES
('Restaurante FIME', 'Av. Universidad S/N', 'Monterrey', 'Nuevo León', '66455'),
('Café Campus', 'Av. Ingeniería 123', 'Monterrey', 'Nuevo León', '66456');

-- Inserts para tabla rol
INSERT INTO rol (descripcion) VALUES
('Gerente'),
('Mesero'),
('Cocinero');

-- Inserts para tabla empleado
INSERT INTO empleado (nombre, apellidos, correo, telefono, contrasena, id_rol, id_restaurante) VALUES
('Ana', 'Martínez López', 'ana.martinez@fime.mx', '8123456789', 'contrasena123', 1, 1),
('Luis', 'García Ramírez', 'luis.garcia@fime.mx', '8112345678', 'contrasena456', 2, 1),
('Carla', 'Sánchez Pérez', 'carla.sanchez@campus.mx', '8134567890', 'contrasena789', 3, 2);

-- Inserts para tabla estado_reserva
INSERT INTO estado_reserva (descripcion) VALUES
('Pendiente'),
('Confirmada'),
('Cancelada');

-- Inserts para tabla reserva
INSERT INTO reserva (cantidad_personas, fecha, hora_inicio, hora_fin, nombre, apellido, telefono, ocasion, id_estado, id_restaurante) VALUES
(4, '2025-05-30', '18:00', '20:00', 'Carlos', 'Hernández', '8188888888', 'Cumpleaños', 1, 1),
(2, '2025-05-31', '13:00', '14:30', 'María', 'Lopez', '8199999999', NULL, 2, 2);

-- Inserts para tabla horario_restaurante
INSERT INTO horario_restaurante (dia, abierto, hora_apertura, hora_cierre, capacidad, id_restaurante) VALUES
('Lunes', TRUE, '08:00', '22:00', 50, 1),
('Martes', TRUE, '08:00', '22:00', 50, 1),
('Miércoles', TRUE, '09:00', '21:00', 40, 2);

-- Inserts para tabla menu
INSERT INTO menu (archivo, id_restaurante) VALUES
('desayuno_fime.pdf', 1),
('comida_campus.pdf', 2);
