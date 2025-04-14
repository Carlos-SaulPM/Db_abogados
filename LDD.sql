SET NAMES 'UTF8MB4';
DROP DATABASE IF EXISTS dbAbogados;
CREATE DATABASE IF NOT EXISTS dbAbogados DEFAULT CHARACTER SET UTF8MB4;
USE dbAbogados;

CREATE TABLE tipo_caso(
id_tco    INT NOT NULL AUTO_INCREMENT,
tipo      VARCHAR(20) NOT NULL,
PRIMARY KEY(id_tco)
);

CREATE TABLE estado(
id_eto    INT NOT NULL AUTO_INCREMENT,
nombre    VARCHAR(20) NOT NULL,
PRIMARY KEY(id_eto)
);

CREATE TABLE estado_civil(
id_ecl    INT NOT NULL AUTO_INCREMENT,
nombre    VARCHAR(20) NOT NULL,
PRIMARY KEY(id_ecl)
);

CREATE TABLE contacto(
id_cto    INT NOT NULL AUTO_INCREMENT,
telefono  VARCHAR(12) NOT NULL UNIQUE,
correo    VARCHAR(40) NOT NULL UNIQUE,
celular   VARCHAR(10) NOT NULL UNIQUE,
PRIMARY KEY(id_cto)
);

CREATE TABLE especialidad(
id_epd        INT NOT NULL AUTO_INCREMENT,
especialidad  VARCHAR(30) NOT NULL,
cedula        VARCHAR(15) NOT NULL,
PRIMARY KEY(id_epd)
);

CREATE TABLE codigo_postal(
codigo_postal     VARCHAR(10) NOT NULL,
asentamiento      VARCHAR(30) NOT NULL,
tipo_asentamiento VARCHAR(30) NOT NULL,
municipio         VARCHAR(30) NOT NULL,
estado            VARCHAR(30) NOT NULL,
ciudad            VARCHAR(30) NOT NULL,
pais              VARCHAR(30) NOT NULL,
PRIMARY KEY(codigo_postal)
);

CREATE TABLE direccion(
id_drn            INT NOT NULL AUTO_INCREMENT,
codigo_postal     VARCHAR(10) NOT NULL,
calle             VARCHAR(70) NOT NULL,
numero_exterior   VARCHAR(10) NOT NULL,
numero_interior   VARCHAR(10),
observacion       VARCHAR(40),
PRIMARY KEY(id_drn),
CONSTRAINT fk_direccion_codigo_postal FOREIGN KEY(codigo_postal) REFERENCES codigo_postal(codigo_postal)
);

CREATE TABLE abogado(
id_abo            INT NOT NULL AUTO_INCREMENT,
nombre            VARCHAR(25) NOT NULL,
apellido_paterno  VARCHAR(25) NOT NULL,
apellido_materno  VARCHAR(25) NOT NULL,
id_drn            INT NOT NULL,
id_epd            INT NOT NULL,
id_cto            INT NOT NULL,
PRIMARY KEY(id_abo, id_drn, id_cto),
CONSTRAINT fk_abogado_especialidad FOREIGN KEY(id_epd) REFERENCES especialidad(id_epd),
CONSTRAINT fk_abogado_direccion FOREIGN KEY(id_drn) REFERENCES direccion(id_drn),
CONSTRAINT fk_abogado_cto FOREIGN KEY(id_cto) REFERENCES contacto(id_cto)
); 

CREATE TABLE procurador(
id_pcr            INT NOT NULL AUTO_INCREMENT,
nombre            VARCHAR(25) NOT NULL,
apellido_paterno  VARCHAR(25) NOT NULL,
apellido_materno  VARCHAR(25) NOT NULL,
id_drn            INT NOT NULL,
id_epd            INT NOT NULL,
id_cto            INT NOT NULL,
PRIMARY KEY(id_pcr, id_drn, id_cto),
CONSTRAINT fk_procurador_especialidad FOREIGN KEY(id_epd) REFERENCES especialidad(id_epd),
CONSTRAINT fk_procurador_direccion FOREIGN KEY(id_drn) REFERENCES direccion(id_drn),
CONSTRAINT fk_procurador_cto FOREIGN KEY(id_cto) REFERENCES contacto(id_cto)
); 

CREATE TABLE cliente(
id_cte            INT NOT NULL AUTO_INCREMENT,
dni               VARCHAR(20) NOT NULL UNIQUE,
nombre            VARCHAR(25) NOT NULL,
apellido_paterno  VARCHAR(25) NOT NULL,
apellido_materno  VARCHAR(25) NOT NULL,
fecha_nacimiento  DATE NOT NULL,
sexo              BOOLEAN NOT NULL,
id_drn            INT NOT NULL,
id_ecl            INT NOT NULL,
id_cto            INT NOT NULL,
PRIMARY KEY(id_cte, id_drn, id_cto),
CONSTRAINT fk_cliente_direccion FOREIGN KEY(id_drn) REFERENCES direccion(id_drn),
CONSTRAINT fk_cliente_estado_civil FOREIGN KEY(id_ecl) REFERENCES estado_civil(id_ecl),
CONSTRAINT fk_cliente_contacto FOREIGN KEY(id_cto) REFERENCES contacto(id_cto)
);

CREATE TABLE expediente(
id_epe                        INT NOT NULL AUTO_INCREMENT,
asunto                        VARCHAR(30) NOT NULL,
tipo_participacion_cliente    VARCHAR(15) NOT NULL,
fecha_inicio                  DATETIME NOT NULL,
fecha_fin                     DATETIME NOT NULL,
id_cte                        INT NOT NULL,
id_tco                        INT NOT NULL,
PRIMARY KEY(id_epe),
CONSTRAINT fk_expediente_cliente FOREIGN KEY(id_cte) REFERENCES cliente(id_cte),
CONSTRAINT fk_expediente_tipo_caso FOREIGN KEY(id_tco) REFERENCES tipo_caso(id_tco)
);

CREATE TABLE expediente_estado(
id_epe      INT NOT NULL,
id_eto      INT NOT NULL,
fecha       DATE NOT NULL,
hora        TIME NOT NULL,
observacion VARCHAR(35),
PRIMARY KEY(id_epe, id_eto),
CONSTRAINT fk_expediente_estado_expediente FOREIGN KEY(id_epe) REFERENCES expediente(id_epe),
CONSTRAINT fk_expediente_estado_estado FOREIGN KEY(id_eto) REFERENCES estado(id_eto)
);

CREATE TABLE abogado_expediente(
id_aee            INT NOT NULL AUTO_INCREMENT,
id_epe            INT NOT NULL,
id_abo            INT NOT NULL,
fecha_asignacion  DATE NOT NULL,
hora_asignacion   TIME NOT NULL,
fecha_termino     DATE NOT NULL,
hora_termino      TIME NOT NULL,
observaciones     VARCHAR(30) NOT NULL,
PRIMARY KEY(id_aee, id_epe, id_abo),
CONSTRAINT fk_abogado_expediente_expediente FOREIGN KEY(id_epe) REFERENCES expediente(id_epe),
CONSTRAINT fk_abogado_expediente_abogado FOREIGN KEY(id_abo) REFERENCES abogado(id_abo)
);

CREATE TABLE procurador_expediente(
id_pee            INT NOT NULL AUTO_INCREMENT,
id_epe            INT NOT NULL,
id_pcr            INT NOT NULL,
fecha_asignacion  DATE NOT NULL,
hora_asignacion   TIME NOT NULL,
fecha_termino     DATE NOT NULL,
hora_termino      TIME NOT NULL,
observaciones     VARCHAR(30) NOT NULL,
PRIMARY KEY(id_pee, id_epe, id_pcr),
CONSTRAINT fk_procurador_expediente_expediente FOREIGN KEY(id_epe) REFERENCES expediente(id_epe),
CONSTRAINT fk_procurador_expediente_procurador FOREIGN KEY(id_pcr) REFERENCES procurador(id_pcr)
);