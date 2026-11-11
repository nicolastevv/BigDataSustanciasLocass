-- ==========================================
-- INSERTS (Poblamiento de la base de datos)
-- ==========================================

INSERT INTO tbl_fabricas (id_fabrica, nombre, ubicacion, latitud, longitud) VALUES 
('A', 'Fábrica A - Químicos', 'Zona Industrial Norte', -0.180700, -78.467800),
('B', 'Fábrica B - Químicos', 'Zona Industrial Sur', -0.190500, -78.480100),
('C', 'Fábrica C - Químicos', 'Zona Industrial Este', -0.175200, -78.450200);

INSERT INTO tbl_clasificacion_ppm (id_clasificacion, limite_inferior, limite_superior, nombre_clasificacion, impacto_salud) VALUES 
(1, 0.00, 0.50, 'Exposición leve y sin consecuencias', 'Exposición generalmente segura.'),
(2, 0.51, 1.00, 'Exposición permitida (leve)', 'Riesgo acumulativo reducido.'),
(3, 1.01, 10.00, 'Moderada toxicidad', 'Riesgo de anemia, mareos leves.'),
(4, 10.01, 50.00, 'Peligroso', 'Mareos, somnolencia, náuseas.'),
(5, 50.01, 500.00, 'Altamente peligroso', 'Desorientación, convulsiones.'),
(6, 500.01, 9999.00, 'Peligro extremo (letal)', 'Colapso inmediato, fallo respiratorio.');

INSERT INTO tbl_linea_produccion (id_linea, id_fabrica, descripcion) VALUES 
('A1', 'A', 'Línea de producción 1 de la Fábrica A'),
('A2', 'A', 'Línea de producción 2 de la Fábrica A'),
('B1', 'B', 'Línea de producción 1 de la Fábrica B');

INSERT INTO tbl_turnos (id_turno, hora_inicio, hora_fin) VALUES 
(1, '08:00:00', '16:00:00'),
(2, '16:00:00', '00:00:00'),
(3, '00:00:00', '08:00:00');

INSERT INTO tbl_empleados (id_empleado, nombre, cedula, cargo) VALUES 
(101, 'Juan Pérez', '1712345678', 'Operador de Planta'),
(102, 'María Gómez', '1798765432', 'Supervisor de Turno'),
(103, 'Carlos Ruiz', '1755554444', 'Técnico de Mantenimiento');

INSERT INTO tbl_productos (id_producto, nombre_producto, tipo_quimico) VALUES 
(1, 'Benceno', 'Hidrocarburo aromático'),
(2, 'Tolueno', 'Hidrocarburo aromático'),
(3, 'Xileno', 'Hidrocarburo aromático');

INSERT INTO tbl_tipos_filtros (id_filtro, nombre_filtro, costo_usd, vida_util_dias) VALUES 
(1, 'Filtro Carbón Activado Estándar', 150.00, 7),
(2, 'Filtro Carbón Activado Alta Eficiencia', 300.00, 15),
(3, 'Filtro HEPA Industrial', 450.00, 30);

INSERT INTO tbl_empleado_turno (id_empleado, id_turno, fecha, es_supervisor) VALUES 
(101, 1, '2026-11-04', FALSE),
(102, 1, '2026-11-04', TRUE),
(103, 2, '2026-11-04', FALSE);

INSERT INTO tbl_lecturas (id_lectura, fecha, hora, id_sensor, id_linea_produccion, id_fabrica, latitud, longitud, ppm, fecha_hora, estado_alarma) VALUES 
(1, '2026-11-04', '14:35:20', 'A1S01', 'A1', 'A', -0.180700, -78.467800, 0.40, '2026-11-04 14:35:20', 'Exposición leve y sin consecuencias'),
(2, '2026-11-04', '14:35:30', 'A1S01', 'A1', 'A', -0.180700, -78.467800, 0.80, '2026-11-04 14:35:30', 'Exposición permitida (leve)'),
(3, '2026-11-04', '14:35:40', 'B1S01', 'B1', 'B', -0.190500, -78.480100, 15.50, '2026-11-04 14:35:40', 'Peligroso');



select * from tbl_lecturas;