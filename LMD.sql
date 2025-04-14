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


INSERT INTO estado_civil(nombre)
VALUES 
('Soltero/a'), 
('Casado/a'), 
('Union Libre'), 
('Separado/a'), 
('Divorciado/a'), 
('Viudo/a');


INSERT INTO contacto(telefono, correo, celular)
VALUES
('5578946512', 'klasi@example.com', '5587965434'),
('5578946712', 'klaset@example.com', '5687965234'),
('5578946312', 'klasie@example.com', '5787965234'),
('5578946762', 'klasis@example.com', '5687965244'),
('5578956712', 'klaoie@example.com', '5687955234'),
('5558946712', 'klaaie@example.com', '5687965284'),
('5558946713', 'contacto1@ex.com', '5687965285'),
('5558946714', 'contacto2@ex.com', '5687965286'),
('5558946715', 'contacto3@ex.com', '5687965287'),
('5558946716', 'contacto4@ex.com', '5687965288'),
('5558946717', 'contacto5@ex.com', '5687965289'),
('5558946718', 'contacto6@ex.com', '5687965290'),
('5558946719', 'contacto7@ex.com', '5687965291'),
('5558946720', 'contacto8@ex.com', '5687965292'),
('5558946721', 'contacto9@ex.com', '5687965293'),
('5558946722', 'contact10@ex.com', '5687965294'),
('5558946723', 'contact11@ex.com', '5687965295'),
('5558946724', 'contact12@ex.com', '5687965296'),
('5558946725', 'contact13@ex.com', '5687965297'),
('5558946726', 'contact14@ex.com', '5687965298'),
('5558946727', 'contact15@ex.com', '5687965299'),
('5558946728', 'contact16@ex.com', '5687965300'),
('5558946729', 'contact17@ex.com', '5687965301'),
('5558946730', 'contact18@ex.com', '5687965302'),
('5558946731', 'contact19@ex.com', '5687965303'),
('5558946732', 'contact20@ex.com', '5687965304');


INSERT INTO especialidad(especialidad, cedula)
VALUES
('Derecho Constitucional', '012345678910112'),
('Derecho Penal', '112345678910112'),
('Derecho Civil', '212345678910112'),
('Derecho Familiar', '312345678910112'),
('Derecho Laboral', '412345678910112'),
('Derecho Mercantil', '512345678910112'),
('Derecho Fiscal', '612345678910112'),
('Derecho Administrativo', '712345678910112'),
('Derecho Corporativo', '812345678910112'),
('Derecho Internacional', '912345678910112'),
('Derecho Ambiental', '022345678910112');


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


INSERT INTO abogado(nombre, apellido_paterno, apellido_materno, id_drn, id_epd, id_cto)
VALUES
('Juan', 'Pérez', 'Gómez', 1, 1, 1),
('María', 'López', 'García', 2, 2, 2),
('Carlos', 'Martínez', 'Sánchez', 3, 3, 3),
('Ana', 'González', 'Hernández', 4, 4, 4),
('Luis', 'Rodríguez', 'Martínez', 5, 5, 5),
('Patricia', 'Torres', 'Vázquez', 6, 6, 6),
('Ricardo', 'Gutiérrez', 'Jiménez', 7, 7, 7),
('Isabel', 'Ruiz', 'Fernández', 8, 8, 8),
('Francisco', 'Cruz', 'Martínez', 9, 9, 9),
('Verónica', 'Ramírez', 'Lopez', 10, 10, 10);

INSERT INTO procurador(nombre, apellido_paterno, apellido_materno, id_drn, id_epd, id_cto)
VALUES
('Eduardo', 'González', 'Hernández', 11, 1, 11),
('Verónica', 'Martínez', 'Ruiz', 12, 2, 12),
('Carlos', 'Rodríguez', 'Gómez', 13, 3, 13),
('Raúl', 'Sánchez', 'González', 14, 4, 14),
('Laura', 'Pérez', 'Torres', 15, 5, 15),
('Ricardo', 'Fernández', 'López', 16, 6, 16),
('Ángel', 'Ramírez', 'Serrano', 17, 7, 17),
('Carla', 'Ruiz', 'López', 18, 8, 18),
('Manuel', 'Cruz', 'Martínez', 19, 9, 19),
('José', 'Gutiérrez', 'Rodríguez', 20, 10, 20);


INSERT INTO cliente(dni, nombre, apellido_paterno, apellido_materno, fecha_nacimiento, sexo, id_drn, id_ecl, id_cto)
VALUES
('12345678A', 'Pedro', 'Jiménez', 'López', '1990-01-01', TRUE, 1, 1, 1),
('23456789B', 'José', 'Hernández', 'Pérez', '1985-02-14', FALSE, 2, 2, 2),
('34567890C', 'Lorena', 'Sánchez', 'Martínez', '1992-05-30', FALSE, 3, 3, 3),
('45678901D', 'Marta', 'González', 'López', '1988-09-15', FALSE, 4, 4, 4),
('56789012E', 'Carlos', 'Mendoza', 'Torres', '1980-11-25', TRUE, 5, 5, 5),
('67890123F', 'Sandra', 'Jiménez', 'Gómez', '1995-07-10', FALSE, 6, 6, 6),
('78901234G', 'Ricardo', 'Serrano', 'Pérez', '1991-03-20', TRUE, 7, 1, 7),
('89012345H', 'Luis', 'Ramírez', 'Torres', '1987-06-05', TRUE, 8, 2, 8),
('90123456I', 'Raúl', 'Pérez', 'Sánchez', '1993-12-12', TRUE, 9, 3, 9),
('01234567J', 'Gabriela', 'González', 'Fernández', '1984-10-18', FALSE, 10, 4, 10);

