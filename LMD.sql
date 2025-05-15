USE dbAbogados;
INSERT INTO tipo_caso(tipo)
VALUES 
('Civil'), 
('Penal'), 
('Mercantil'), 
('Familiar'), 
('Laboral'), 
('Administrativo'), 
('Amparo'), 
('Fiscal'), 
('Corporativo');


INSERT INTO estado(nombre)
VALUES 
('Archivado'), 
('En Tramite'), 
('Cerrado'), 
('En Apelacion'), 
('Suspendido'), 
('En Ejecucion');


INSERT INTO codigo_postal(codigo_postal, asentamiento, tipo_asentamiento, municipio, estado, ciudad, pais) 
VALUES
('01000', 'San Ángel', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01010', 'Los Alpes', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01020', 'Guadalupe Inn', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01030', 'Axotla', 'Pueblo', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01040', 'Campestre', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01049', 'Tlacopac', 'Pueblo', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01050', 'Ex-Hacienda de Guadalupe Chimalistac', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01060', 'Altavista', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01070', 'Chimalistac', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico'),
('01080', 'Progreso Tizapan', 'Colonia', 'Álvaro Obregón', 'Ciudad de México', 'Ciudad de México', 'Mexico');


INSERT INTO direccion(codigo_postal, calle, numero_exterior, numero_interior, observacion) 
VALUES
('01000', 'Calle Benito Juárez', '15', NULL, 'Cerca de la Plaza de los Licenciados'),
('01000', 'Calle Reforma', '87', 'A', 'Frente al parque del reloj'),
('01000', 'Callejón del Abrevadero', '22', NULL, 'Entrada empedrada'),
('01010', 'Calle Alpes', '200', 'B', 'Frente al parque'),
('01010', 'Avenida Insurgentes Sur', '3515', NULL, 'Junto a estación de metrobus'),
('01010', 'Calle Santa Lucía', '45', '2', 'Casa blanca con reja verde'),
('01020', 'Calle Sagredo', '45', NULL, 'Edificio rojo'),
('01020', 'Calle Manuel M. Ponce', '12', '3B', 'Cerca del teatro'),
('01020', 'Avenida Revolución', '1350', NULL, 'Frente a banco'),
('01030', 'Avenida Universidad', '300', '1A', 'Junto a la farmacia'),
('01030', 'Calle Comercio', '18', NULL, 'Casa antigua'),
('01030', 'Privada de Axotla', '5', NULL, 'Final de la calle'),
('01040', 'Calle Campestre', '120', NULL, 'Casa con portón azul'),
('01040', 'Callejón Jardín', '32', NULL, 'Esquina con Bugambilias'),
('01040', 'Calle Eucalipto', '50', 'B', 'Departamento en primer piso'),
('01049', 'Calle José de Teresa', '50', '2B', 'Cerca de la iglesia'),
('01049', 'Calle La Otra Banda', '102', NULL, 'Zona residencial'),
('01049', 'Callejón del Silencio', '9', NULL, 'Sin salida'),
('01050', 'Callejón de La Escondida', '10', NULL, 'Entrada estrecha'),
('01050', 'Calle Francisco Sosa', '215', 'A', 'Frente al puente de piedra'),
('01050', 'Calle Hidalgo', '66', NULL, 'Junto al convento'),
('01060', 'Avenida Altavista', '250', '3C', 'Frente al centro comercial'),
('01060', 'Calle Diego Rivera', '300', NULL, 'Museo cercano'),
('01060', 'Calle Altavista Sur', '110', NULL, 'Casa con jardín'),
('01070', 'Calle Del Carmen', '75', NULL, 'Esquina con callejón'),
('01070', 'Calle Jesús del Monte', '34', NULL, 'Frente a parque pequeño'),
('01070', 'Privada de Chimalistac', '11', NULL, 'Acceso restringido'),
('01080', 'Calle Yucatán', '154', NULL, 'Zona comercial'),
('01080', 'Calle San Jerónimo', '60', 'C', 'Enfrente de supermercado'),
('01080', 'Calle Chihuahua', '78', NULL, 'Frente a clínica');


INSERT INTO abogado(nombre, apellido_paterno, apellido_materno, id_drn, telefono, correo)
VALUES
('Juan', 'Pérez', 'Gómez', 1,'5578946512', 'abogado1@gmail.com' ),
('María', 'López', 'García', 2,'5578946712', 'abogado2@gmail.com'),
('Carlos', 'Martínez', 'Sánchez', 3,'5578946312', 'abogado3@gmail.com'),
('Ana', 'González', 'Hernández', 4, '5578946762', 'abogado4@gmail.com'),
('Luis', 'Rodríguez', 'Martínez', 5, '5578956712', 'abogado5@gmail.com'),
('Patricia', 'Torres', 'Vázquez', 6, '5558946712', 'abogado6@gmail.com'),
('Ricardo', 'Gutiérrez', 'Jiménez', 7, '5558946713', 'abogado7@gmail.com'),
('Isabel', 'Ruiz', 'Fernández', 8, '5558946714', 'abogado8@gmail.com'),
('Francisco', 'Cruz', 'Martínez', 9, '5558946715', 'abogado9@gmail.com'),
('Verónica', 'Ramírez', 'Lopez', 10, '5558946716', 'abogado10@gmail.com');

INSERT INTO procurador(nombre, apellido_paterno, apellido_materno, id_drn)
VALUES
('Eduardo', 'González', 'Hernández', 11),
('Verónica', 'Martínez', 'Ruiz', 12),
('Carlos', 'Rodríguez', 'Gómez', 13),
('Raúl', 'Sánchez', 'González', 14),
('Laura', 'Pérez', 'Torres', 15),
('Ricardo', 'Fernández', 'López', 16),
('Ángel', 'Ramírez', 'Serrano', 17),
('Carla', 'Ruiz', 'López', 18),
('Manuel', 'Cruz', 'Martínez', 19),
('José', 'Gutiérrez', 'Rodríguez', 20);


INSERT INTO cliente(dni, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, sexo, id_drn, telefono, correo)
VALUES
('12345678A', 'Pedro', 'Jiménez', 'López', '1990-01-01', TRUE, 21,'5558946727', 'cliente1@gmail.com' ),
('23456789B', 'José', 'Hernández', 'Pérez', '1985-02-14', TRUE, 22,'5558946728', 'cliente2@gmail.com' ),
('34567890C', 'Lorena', 'Sánchez', 'Martínez', '1992-05-30', FALSE, 23,'5558946729', 'cliente3@gmail.com'),
('45678901D', 'Marta', 'González', 'López', '1988-09-15', FALSE, 24,'5558946730', 'cliente4@gmail.com'),
('56789012E', 'Carlos', 'Mendoza', 'Torres', '1980-11-25', TRUE, 25,'5558946731', 'cliente5@gmail.com'),
('67890123F', 'Sandra', 'Jiménez', 'Gómez', '1995-07-10', FALSE, 26,'5558946732', 'cliente6@gmail.com'),
('78901234G', 'Ricardo', 'Serrano', 'Pérez', '1991-03-20', TRUE, 27,'5558946733', 'cliente7@gmail.com'),
('89012345H', 'Luis', 'Ramírez', 'Torres', '1987-06-05', TRUE, 28,'5558946734', 'cliente8@gmail.com'),
('90123456I', 'Raúl', 'Pérez', 'Sánchez', '1993-12-12', TRUE, 29,'5558946735', 'cliente9@gmail.com'),
('01234567J', 'Gabriela', 'González', 'Fernández', '1984-10-18', FALSE, 30,'5558946736', 'cliente10@gmail.com');

INSERT INTO expediente(asunto, tipo_participacion_cliente, fecha_inicio, fecha_fin, id_cte, id_tco)
VALUES
('Divorcio de mutuo acuerdo', 'Demandante', '2025-01-15', '2025-03-20', 1, 4),
('Demanda por despido injustificado', 'Demandante', '2025-02-05', NULL, 2, 5),
('Juicio de arrendamiento', 'Demandado', '2025-03-10', '2025-04-12', 3, 3),
('Asesoría en constitución de empresa', 'Solicitante', '2025-04-01', NULL, 4, 9),
('Demanda de pensión alimenticia', 'Demandante', '2025-02-20', '2025-05-05', 5, 4),
('Defensa en proceso penal', 'Defensor', '2025-01-25', NULL, 6, 2),
('Revisión de multa administrativa', 'Solicitante', '2025-03-15', '2025-04-30', 7, 6),
('Amparo indirecto', 'Quejoso', '2025-02-28', NULL, 8, 7),
('Asesoría fiscal empresarial', 'Solicitante', '2025-03-20', '2025-04-25', 9, 8),
('Demanda civil por daños', 'Demandante', '2025-04-05', NULL, 10, 1);

INSERT INTO expediente_estado(id_epe, id_eto, fecha, hora, observacion)
VALUES
(1, 2, '2025-01-16', '10:30:00', 'Demanda admitida'),
(1, 3, '2025-03-21', '14:45:00', 'Expediente cerrado exitosamente'),
(2, 2, '2025-02-06', '09:15:00', NULL),
(3, 2, '2025-03-11', '11:00:00', 'Defensa presentada'),
(3, 1, '2025-04-15', '12:00:00', 'Archivado por falta de pruebas'),
(4, 2, '2025-04-02', '16:20:00', NULL),
(5, 2, '2025-02-21', '13:50:00', 'Demanda contestada'),
(5, 4, '2025-05-06', '15:00:00', 'Caso en apelación'),
(6, 2, '2025-04-10', '08:30:00', NULL),
(6, 5, '2025-05-01', '09:40:00', 'Proceso suspendido por falta de documentos'),
(7, 2, '2025-05-03', '11:15:00', NULL),
(8, 2, '2025-05-05', '12:30:00', 'Asesoría en proceso de revisión'),
(9, 2, '2025-02-22', '10:10:00', NULL),
(10, 2, '2025-03-15', '14:00:00', 'Ejecución en trámite');

INSERT INTO abogado_expediente(id_epe, id_abo, fecha_asignacion, hora_asignacion, fecha_termino, hora_termino, observaciones)
VALUES
(1, 1, '2025-01-15', '09:00:00', '2025-03-20', '13:00:00', 'Caso cerrado exitosamente'),
(2, 4, '2025-02-05', '10:00:00', NULL, NULL, 'En espera de audiencia'),
(3, 9, '2025-03-10', '11:30:00', '2025-04-12', '15:00:00', NULL),
(4, 5, '2025-04-01', '08:45:00', NULL, NULL, 'Asesoría'),
(5, 1, '2025-02-20', '09:20:00', '2025-05-05', '16:00:00', NULL),
(6, 2, '2025-03-01', '12:00:00', NULL, NULL, 'Defensa en curso'),
(7, 6, '2025-04-05', '14:30:00', '2025-04-25', '11:30:00', 'Sanción anulada'),
(8, 7, '2025-04-10', '13:15:00', NULL, NULL, 'Amparo interpuesto'),
(9, 8, '2025-03-20', '10:10:00', NULL, NULL, NULL),
(10, 3,'2025-04-05', '09:45:00', '2025-04-20', '12:00:00', 'Caso resuelto');


INSERT INTO procurador_expediente(id_epe, id_pcr, fecha_asignacion, hora_asignacion, fecha_termino, hora_termino, observaciones)
VALUES
(1, 1, '2025-01-16', '09:00:00', '2025-03-18', '14:00:00', 'Sin novedades'),
(2, 4, '2025-02-06', '10:30:00', NULL, NULL, 'Seguimiento continuo'),
(3, 3, '2025-03-11', '11:15:00', '2025-04-10', '15:00:00', 'Cierre exitoso'),
(4, 5, '2025-04-02', '12:00:00', NULL, NULL, 'Pendiente firma'),
(5, 1, '2025-02-21', '09:30:00', '2025-05-03', '13:00:00', 'Trámite ágil'),
(6, 2, '2025-01-26', '10:00:00', NULL, NULL, 'Revisión de pruebas'),
(7, 6, '2025-03-16', '08:45:00', '2025-04-29', '16:00:00', 'Apelación presentada'),
(8, 7, '2025-03-01', '09:00:00', NULL, NULL, 'En revisión de amparo'),
(9, 8, '2025-03-21', '10:45:00', '2025-04-24', '12:30:00', 'Informe entregado'),
(10, 3, '2025-04-06', '11:00:00', NULL, NULL, 'Peritaje solicitado');
