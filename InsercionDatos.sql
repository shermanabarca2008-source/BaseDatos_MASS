INSERT INTO Usuario
(cedula, nombre1, nombre2, apellido_paterno,
 apellido_materno, direccion, fecha_nacimiento, contrasena)
VALUES
('1100000001', 'Carlos', 'Andres', 'Mendoza',
 'Lopez', 'Loja', '1985-03-12', 'hash_demo_01'),

('1100000002', 'Maria', 'Fernanda', 'Torres',
 'Jimenez', 'Catamayo', '1990-07-25', 'hash_demo_02'),

('1100000003', 'Juan', 'Pablo', 'Ramirez',
 'Vega', 'Vilcabamba', '1978-11-08', 'hash_demo_03'),

('1100000004', 'Ana', 'Lucia', 'Castillo',
 'Mora', 'Loja', '1995-02-14', 'hash_demo_04'),

('1100000005', 'Pedro', 'Luis', 'Gonzalez',
 'Rojas', 'Saraguro', '1982-09-30', 'hash_demo_05'),

('1100000006', 'Sofia', 'Isabel', 'Herrera',
 'Diaz', 'Malacatos', '2001-05-19', 'hash_demo_06'),

('1100000007', 'Luis', 'Alberto', 'Cueva',
 'Paredes', 'Loja', '1998-12-03', 'hash_demo_07'),

('1100000008', 'Daniela', 'Paola', 'Ortega',
 'Ruiz', 'Catamayo', '2000-06-21', 'hash_demo_08');


INSERT INTO Telefono_Usuario
(cedula, telefono)
VALUES
('1100000001', '0991000001'),
('1100000002', '0991000002'),
('1100000003', '0991000003'),
('1100000004', '0991000004'),
('1100000005', '0991000005'),
('1100000006', '0991000006'),
('1100000007', '0991000007'),
('1100000008', '0991000008');


INSERT INTO Administrador
(ID_admin, cedula)
VALUES
(1, '1100000001'),
(2, '1100000002'),
(3, '1100000003'),
(4, '1100000004'),
(5, '1100000005'),
(6, '1100000006'),
(7, '1100000007'),
(8, '1100000008');


INSERT INTO Medico
(ID_medico, cedula, especialidad)
VALUES
(1, '1100000001', 'Medicina General'),
(2, '1100000002', 'Pediatria'),
(3, '1100000003', 'Cardiologia'),
(4, '1100000004', 'Dermatologia'),
(5, '1100000005', 'Traumatologia'),
(6, '1100000006', 'Neurologia'),
(7, '1100000007', 'Ginecologia'),
(8, '1100000008', 'Oftalmologia');


INSERT INTO Cliente
(id_cliente, cedula)
VALUES
(1, '1100000001'),
(2, '1100000002'),
(3, '1100000003'),
(4, '1100000004'),
(5, '1100000005'),
(6, '1100000006'),
(7, '1100000007'),
(8, '1100000008');


INSERT INTO HorarioMedico
(id_horario, fecha, hora, ID_admin, ID_medico)
VALUES
(1, '2026-11-16', '08:00:00', 1, 2),
(2, '2026-11-16', '09:00:00', 2, 3),
(3, '2026-11-17', '10:00:00', 3, 4),
(4, '2026-11-17', '11:00:00', 4, 5),
(5, '2026-11-18', '08:30:00', 5, 6),
(6, '2026-11-18', '09:30:00', 6, 7),
(7, '2026-11-19', '14:00:00', 7, 8),
(8, '2026-11-20', '15:00:00', 8, 1);


INSERT INTO Cita
(id_cita, estado, id_cliente, id_horario)
VALUES
(1, 'pendiente', 1, 1),
(2, 'confirmada', 2, 2),
(3, 'completada', 3, 3),
(4, 'completada', 4, 4),
(5, 'completada', 5, 5),
(6, 'cancelada', 6, 6),
(7, 'confirmada', 7, 7),
(8, 'completada', 8, 8);


INSERT INTO Receta
(id_receta, medicamentos, indicaciones, id_cita)
VALUES
(1, 'Paracetamol 500 mg',
 'Seguir indicaciones del medico.', 1),

(2, 'Loratadina 10 mg',
 'Administrar segun prescripcion.', 2),

(3, 'Ibuprofeno 400 mg',
 'Tomar segun indicacion medica.', 3),

(4, 'Amoxicilina 500 mg',
 'Utilizar solamente bajo prescripcion.', 4),

(5, 'Omeprazol 20 mg',
 'Seguir tratamiento indicado.', 5),

(6, 'Solucion salina nasal',
 'Aplicar segun indicaciones.', 6),

(7, 'Crema hidratante',
 'Aplicar en la zona indicada.', 7),

(8, 'Suero fisiologico',
 'Utilizar segun indicaciones.', 8);