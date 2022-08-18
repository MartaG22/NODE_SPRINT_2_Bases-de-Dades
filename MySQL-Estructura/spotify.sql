DROP DATABASE IF EXISTS SPOTIFY;
CREATE DATABASE SPOTIFY CHARACTER SET utf8mb4;
USE SPOTIFY;
CREATE TABLE Usuaris (
    id_usuari INT NOT NULL AUTO_INCREMENT,
    tipus_usuari ENUM ('free', 'prèmium'),
    correu VARCHAR(50) NOT NULL,
    contrasenya VARCHAR(10) NOT NULL,
    nom_usuari VARCHAR(50) NOT NULL,
    naixement DATE NOT NULL,
    sexe ENUM ('masculí', 'femení', 'altres'),
    codi_postal INT NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_usuari)
);
CREATE Table Premium_Subscripcions (
    data_inici_subscripcio DATE NOT NULL,
    data_renovacio DATE NOT NULL,
    forma_pagament ENUM ('targeta', 'PayPal') NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (data_inici_subscripcio),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari)
);
CREATE TABLE Targetes_credit (
    num_targeta_credit CHAR(16) NOT NULL,
    data_caducitat DATE NOT NULL,
    codi_seguretat CHAR(3),
    -- id_usuari INT NOT NULL,
    PRIMARY KEY (num_targeta_credit)
);
CREATE TABLE PayPal (
    nom_usuari_paypal VARCHAR(50) NOT NULL,
)