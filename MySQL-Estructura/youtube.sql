DROP DATABASE IF EXISTS YOUTUBE;

CREATE DATABASE YOUTUBE CHARACTER SET utf8mb4;

USE YOUTUBE;

CREATE TABLE usuaris(
    id_usuari INT(8) NOT NULL AUTO_INCREMENT,
    email VARCHAR(60),
    contrasenya VARCHAR(10),
    nom VARCHAR(50) NOT NULL,
    data_naixement DATE,
    sexe ENUM('masculi', 'femeni'),
    codi_postal INT(5),
    pais VARCHAR(45),
    PRIMARY KEY (id_usuari)
);

CREATE TABLE videos(
    id_video INT(8) NOT NULL AUTO_INCREMENT,
    estat_video ENUM('públic', 'ocult', 'privat'),

)

