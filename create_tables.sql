-- ------------------------------------------
-- CREAR Y USAR BASE DE DATOS clinica_dental
-- ------------------------------------------
CREATE DATABASE clinica_dental;
USE clinica_dental;

-- -----------------------------------
-- CREAR TABLA pacientes
-- -----------------------------------
CREATE TABLE pacientes (
  id_paciente INT AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(100) NOT NULL,
  apellidos VARCHAR(100) NOT NULL,
  dni CHAR(8) UNIQUE,
  telefono VARCHAR(9),
  correo VARCHAR(150),
  fecha_registro DATETIME DEFAULT NOW()
);

-- -----------------------------------
-- CREAR TABLA tratamientos
-- -----------------------------------
CREATE TABLE tratamientos (
  id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  costo DECIMAL(10,2) NOT NULL
);

-- -----------------------------------
-- CREAR TABLA usuarios
-- -----------------------------------
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  usuario VARCHAR(50) NOT NULL UNIQUE,
  clave VARCHAR(255) NOT NULL,
  rol ENUM('admin','doctor','recepcionista') NOT NULL
);

-- -----------------------------------
-- CREAR TABLA citas
-- -----------------------------------
CREATE TABLE citas (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  id_paciente INT,
  id_tratamiento INT,
  fecha_cita DATETIME NOT NULL,
  estado ENUM('pendiente','realizado','cancelado'),
  FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
  FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento)
);

-- -----------------------------------
-- CREAR TABLA pagos
-- -----------------------------------
CREATE TABLE pagos (
  id_pago INT AUTO_INCREMENT PRIMARY KEY,
  id_paciente INT,
  monto DECIMAL(10,2) NOT NULL,
  fecha_pago DATETIME DEFAULT NOW(),
  metodo ENUM('efectivo','tarjeta','yape','plin'),
  FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
);

-- -----------------------------------
-- CREAR TABLA historial_tratamientos
-- -----------------------------------
CREATE TABLE historial_tratamientos (
  id_historial INT AUTO_INCREMENT PRIMARY KEY,
  id_paciente INT,
  id_tratamiento INT,
  fecha DATETIME DEFAULT NOW(),
  observacion TEXT,
  FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
  FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento)
);



