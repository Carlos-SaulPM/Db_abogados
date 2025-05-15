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


CREATE TABLE codigo_postal(
  codigo_postal     VARCHAR(10) NOT NULL,
  asentamiento      VARCHAR(50) NOT NULL,
  tipo_asentamiento VARCHAR(50) NOT NULL,
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
  nombre            VARCHAR(20) NOT NULL,
  apellido_paterno  VARCHAR(20) NOT NULL,
  apellido_materno  VARCHAR(20) NOT NULL,
  telefono          VARCHAR(12) NOT NULL UNIQUE,
  correo            VARCHAR(30) NOT NULL UNIQUE,
  id_drn            INT NOT NULL,
  PRIMARY KEY(id_abo, id_drn),
  CONSTRAINT fk_abogado_direccion FOREIGN KEY(id_drn) REFERENCES direccion(id_drn)
); 

CREATE TABLE procurador(
  id_pcr            INT NOT NULL AUTO_INCREMENT,
  nombre            VARCHAR(20) NOT NULL,
  apellido_paterno  VARCHAR(20) NOT NULL,
  apellido_materno  VARCHAR(20) NOT NULL,
  id_drn            INT NOT NULL,
  PRIMARY KEY(id_pcr, id_drn),
  CONSTRAINT fk_procurador_direccion FOREIGN KEY(id_drn) REFERENCES direccion(id_drn)
); 

CREATE TABLE cliente(
  id_cte            INT NOT NULL AUTO_INCREMENT,
  dni               VARCHAR(20) NOT NULL UNIQUE,
  nombre            VARCHAR(20) NOT NULL,
  apellido_paterno  VARCHAR(20) NOT NULL,
  apellido_materno  VARCHAR(20) NOT NULL,
  fecha_nacimiento  DATE NOT NULL,
  sexo              BOOLEAN NOT NULL,
  telefono          VARCHAR(12) NOT NULL UNIQUE,
  correo            VARCHAR(30) NOT NULL UNIQUE,
  id_drn            INT NOT NULL,
  PRIMARY KEY(id_cte, id_drn),
  CONSTRAINT fk_cliente_direccion FOREIGN KEY(id_drn) REFERENCES direccion(id_drn)
);

CREATE TABLE expediente(
  id_epe                        INT NOT NULL AUTO_INCREMENT,
  asunto                        VARCHAR(35) NOT NULL,
  tipo_participacion_cliente    VARCHAR(15) NOT NULL,
  fecha_inicio                  DATETIME NOT NULL,
  fecha_fin                     DATETIME,
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
  observacion VARCHAR(50),
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
  fecha_termino     DATE,
  hora_termino      TIME,
  observaciones     VARCHAR(30),
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
  fecha_termino     DATE,
  hora_termino      TIME,
  observaciones     VARCHAR(30),
  PRIMARY KEY(id_pee, id_epe, id_pcr),
  CONSTRAINT fk_procurador_expediente_expediente FOREIGN KEY(id_epe) REFERENCES expediente(id_epe),
  CONSTRAINT fk_procurador_expediente_procurador FOREIGN KEY(id_pcr) REFERENCES procurador(id_pcr)
);