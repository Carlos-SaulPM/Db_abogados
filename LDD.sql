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

