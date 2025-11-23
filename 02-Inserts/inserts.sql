USE clinica_dental;

-- ------------------------------
-- INSERTS: Pacientes (clientes)
-- ------------------------------
INSERT INTO pacientes (nombres, apellidos, dni, telefono, correo, fecha_registro) VALUES
('María', 'González', '10458723', '978123456', 'maria.gonzalez@example.com', '2025-10-05 10:15:00'),
('Carlos', 'Ramírez', '10654321', '987654321', 'carlos.ramirez@example.com', '2025-09-20 14:30:00'),
('Lucía', 'Flores', '10011223', '959000111', 'lucia.flores@example.com', '2025-11-01 09:00:00'),
('Javier', 'Pérez', '10566778', '944556677', 'javier.perez@example.com', '2025-07-12 16:45:00'),
('Ana', 'Quispe', '10788990', '951223344', 'ana.quispe@example.com', '2025-08-22 11:20:00');

-- -----------------------------
-- INSERTS: Tratamientos
-- -----------------------------
INSERT INTO tratamientos (nombre, costo) VALUES
('Limpieza dental', 80.00),
('Obturación (empaste)', 120.00),
('Exodoncia simple', 200.00),
('Blanqueamiento dental', 350.00);

-- ---------------------------------------------------------------
-- INSERTS: Usuarios (internos del sistema)
-- Nota: uso SHA2 para ejemplo de hashing; en la app usa bcrypt.
-- ---------------------------------------------------------------
INSERT INTO usuarios (nombre, usuario, clave, rol) VALUES
('Admin Principal', 'admin', SHA2('AdminPass123',256), 'admin'),
('Dra. Elena Ruiz', 'eruiz', SHA2('DoctorPass123',256), 'doctor'),
('Luis Recepción', 'lrecep', SHA2('RecepPass123',256), 'recepcionista');

-- ---------------------------------------------------------
-- INSERTS: Citas (referenciando pacientes y tratamientos)
-- ---------------------------------------------------------
-- Necesitamos conocer los ids generados. Asumo auto-increment desde 1 en orden de inserts anteriores.
-- pacientes: (1) María, (2) Carlos, (3) Lucía, (4) Javier, (5) Ana
-- tratamientos: (1) Limpieza, (2) Obturación, (3) Exodoncia, (4) Blanqueamiento

INSERT INTO citas (id_paciente, id_tratamiento, fecha_cita, estado) VALUES
(1, 1, '2025-11-10 09:00:00', 'realizado'),
(2, 2, '2025-11-15 11:30:00', 'pendiente'),
(3, 4, '2025-11-20 15:00:00', 'pendiente'),
(4, 3, '2025-10-01 08:00:00', 'realizado'),
(1, 2, '2025-09-25 13:00:00', 'realizado'),
(5, 1, '2025-11-05 10:00:00', 'cancelado');

-- -----------------------------
-- INSERTS: Pagos
-- -----------------------------
INSERT INTO pagos (id_paciente, monto, fecha_pago, metodo) VALUES
(1, 80.00, '2025-11-10 10:20:00', 'efectivo'),    -- María pago limpieza
(2, 60.00, '2025-10-01 12:00:00', 'tarjeta'),     -- parcial (ejemplo)
(4, 200.00, '2025-10-01 09:30:00', 'yape'),       -- Javier pagó exodoncia
(1, 120.00, '2025-09-25 14:30:00', 'plin'),       -- María pagó obturación previa
(5, 80.00, '2025-11-05 10:55:00', 'efectivo');    -- Ana cita cancelada pero pago ejemplo

-- -----------------------------------
-- INSERTS: Historial de tratamientos
-- -----------------------------------
INSERT INTO historial_tratamientos (id_paciente, id_tratamiento, fecha, observacion) VALUES
(1, 1, '2025-11-10 09:45:00', 'Limpieza sin complicaciones. Recomendado hilo dental.'),
(1, 2, '2025-09-25 13:45:00', 'Empaste realizado en pieza 16. Control en 6 meses.'),
(4, 3, '2025-10-01 08:30:00', 'Exodoncia simple, se indicó analgesia.'),
(2, 2, '2025-08-20 10:15:00', 'Empaste parcial, pendiente revisión.'),
(3, 4, '2025-11-20 15:40:00', 'Blanqueamiento programado — sesión 1 completada.'),
(5, 1, '2025-11-05 10:10:00', 'Limpieza programada - paciente canceló.');
