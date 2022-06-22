DROP DATABASE IF EXISTS PIZZERIA_LARODONA;

CREATE DATABASE PIZZERIA_LARODONA CHARACTER SET utf8mb4;

USE PIZZERIA_LARODONA;


DROP TABLE IF EXISTS provincia;

CREATE TABLE provincia(
    id_provincia INT NOT NULL AUTO_INCREMENT,
    nom_provincia VARCHAR(50),
    PRIMARY KEY (id_provincia)
);

DROP TABLE IF EXISTS localitats;

CREATE TABLE localitats(
    id_localitat INT NOT NULL AUTO_INCREMENT,
    nom_localitat VARCHAR(50),
    id_provincia INT NOT NULL,
    PRIMARY KEY (id_localitat),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);


DROP TABLE IF EXISTS botiga;
CREATE TABLE botiga(
    id_botiga INT(11) NOT NULL AUTO_INCREMENT,
    adreza VARCHAR(60) NOT NULL,
    codi_postal VARCHAR(25) NOT NULL,
    id_localitat INT(11) NOT NULL,
    PRIMARY KEY(id_botiga),
    FOREIGN KEY(id_localitat) REFERENCES localitats (id_localitat)
);

DROP TABLE IF EXISTS clients;

CREATE TABLE clients(
    id_client INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    primer_cognom VARCHAR(50) NOT NULL,
    segon_cognom VARCHAR(50) NOT NULL,
    telefon INT NOT NULL,
    correu_electronic VARCHAR(60),
    data_registre DATE NOT NULL,
    PRIMARY KEY (id_client)
    /* FOREIGN KEY (id_client) REFERENCES adreces(id_client)*/
);
DROP TABLE IF EXISTS empleats;

CREATE TABLE empleats(
    id_empleat INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    primer_cognom VARCHAR(50) NOT NULL,
    segon_cognom VARCHAR(50) NOT NULL,
    NIF VARCHAR(9) NOT NULL,
    telefon INT NOT NULL,
    correu_electronic VARCHAR(60),
    carrec ENUM('cuiner', 'repartidor'),
    id_botiga INT NOT NULL,
    PRIMARY KEY (id_empleat)
);
DROP TABLE IF EXISTS adreces;

CREATE TABLE adreces(
    id_adreza INT NOT NULL AUTO_INCREMENT,
    id_client INT(5),
    id_empleat INT(5),
    carrer VARCHAR(60) NOT NULL,
    numero INT NOT NULL,
    pis VARCHAR(3) NOT NULL,
    porta VARCHAR(3) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    codi_postal INT NOT NULL,
    provincia VARCHAR(50),
    PRIMARY KEY (id_adreza),
    FOREIGN KEY (id_client) REFERENCES clients(id_client),
    FOREIGN KEY (id_empleat) REFERENCES empleats(id_empleat)
);


DROP TABLE IF EXISTS categoria_pizzes;

CREATE TABLE categoria_pizzes(
    id_categoriaPizza INT NOT NULL AUTO_INCREMENT,
    nom_categoria varchar(60) NOT NULL,
    PRIMARY KEY (id_categoriaPizza)
);

DROP TABLE IF EXISTS productes;

CREATE TABLE productes(
    id_producte INT NOT NULL AUTO_INCREMENT,
    tipus_producte ENUM('pizza', 'hamburguessa', 'beguda') NOT NULL,
    id_categoriaPizza INT,
    nom VARCHAR(60) NOT NULL,
    descripcio TEXT NOT NULL,
    preu DECIMAL(4, 2) NOT NULL,
    imgatge VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_producte),
    FOREIGN KEY (id_categoriaPizza) REFERENCES categoria_pizzes(id_categoriaPizza)
);

DROP TABLE IF EXISTS comandes;

CREATE TABLE comandes(
    id_comanda INT NOT NULL AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    comanda_repartiment TINYINT NOT NULL DEFAULT 0,
    id_producte INT,
    id_client INT,
    PRIMARY KEY (id_comanda),
    FOREIGN KEY (id_client) REFERENCES clients(id_client)
);


INSERT INTO clients (id_client, nom, primer_cognom, segon_cognom, telefon, correu_electronic, data_registre)
VALUES
    (1, 'Irene', 'García', 'Fernandez', 933555334, 'irenegf@yahoo.es', '2012-12-29'),
    (2, 'Francesc', 'Romero', 'Gazquez', 936547654, 'francesc@gmail.com', '2015-05-17'),
    (3, 'Jordi', 'Grau', 'Calmell', 932264535, 'jordigc@gmail.com', '2017-09-26');

INSERT INTO empleats(id_empleat, nom, primer_cognom, segon_cognom, NIF, telefon, correu_electronic, carrec, id_botiga)
VALUES
    (1, 'Montse', 'Rodríguez', 'Estévez', '43675456T', 933556753, 'montse@hotmail.com', 'cuiner', 2),
    (2, 'Joaquim', 'Bosch', 'Giner', '24535435P', 935739534, 'joaquim.bosch@gmail.com', 'cuiner', 2),
    (3, 'Olga', 'Gómez', 'Sanjuan', '84734534K', 934654567, 'olga.san@gmail.com', 'repartidor', 2),
    (4, 'Susana', 'Yebra', 'Magaz', '85738544J', 935673422, 'susana@yahoo.com', 'repartidor', 1),
    (5, 'Gerard', 'Vereau', 'Sanz', '45345346T', 935456234, 'gerardvs@gmail.com', 'cuiner', 1),
    (6, 'Roger', 'Mas', 'Picant', '34353423Q', 936533464, 'rogermas@yahoo.es', 'repartidor', 2 );


INSERT INTO adreces(id_adreza, id_client, id_empleat, carrer, numero, pis, porta, localitat, codi_postal, provincia)
VALUES
    (1, 1, NULL, 'Carrer Còrsega', 458, '3', '3', 'Barcelona', 08025, 'Barcelona'),
    (2, 2, NULL, 'Carrer de Brujas', 106, '1', 'A', 'Sabadell', 08202, 'Barcelona'),
    (3, NULL, 1, 'Carrer Major', 30, '1', '1', 'Sant Andreu de la Barca', 08740, 'Barcelona'),
    (4, NULL, 2, 'Carrer Sicília', 215, 'Bx.', '1', 'Barcelona', 08013, 'Barcelona'),
    (5, 3, NULL, 'Carrer Alacant', 58, '1', '4', 'Terrassa', 08224, 'Barcelona'),
    (6, NULL, 3, 'Carrer Comerç', 10, 'Bx.', '-', 'Vallirana', 08759, 'Barcelona'),
    (7, NULL, 4, 'Carrer Cinca', 35, '3', '5', 'Barcelona', 08030, 'Barcelona'),
    (8, NULL, 5, 'Carrer Sòcrates', 24, '1', '1', 'Barcelona', 08030, 'Barcelona'),
    (9, NULL, 6, 'Carrer Subirats', 87, '3', '1', 'Vilanova', 08800, 'Barcelona');


INSERT INTO categoria_pizzes(id_categoriaPizza, nom_categoria)
VALUES
    (1, 'vegana'),
    (2, 'light'),
    (3, 'extra formatge'),
    (4, 'massa gruixuda'),
    (5, 'massa fina');

INSERT INTO productes(id_producte, tipus_producte, id_categoriaPizza, nom, descripcio, preu, imatge)   
    (1, 'pizza', 5, 'pizza hawaiana', 'Massa fina amb trocets de pinya i pernil dolç, formatge', 9,75,'sfsf');
INSERT INTO provincia (nom) VALUES (1,'Barcelona'), (2, 'Tarragona'), (3, 'Lleida'), (4, 'Girona');
    /*INSERT INTO botiga (adreça, codi_postal, id_localitat) VALUES ('Carrer de Valencia, 187', '08022', 1);*/


INSERT INTO localitats (id_localitat, nom_localitat, id_provincia)
VALUES 
    (1, 'Barcelona', 1)
    (2, 'Santa Coloma', 1),
    (3, 'Badalona', 1);

/*INSERT INTO productes (tipus_producte, nom, descripcio, preu) VALUES ('hamburguesa', 'Clàssica de vedella, formatge i bacó', 'Dins dels ingredients d`aquesta delícia trobem: Pa de motlle, Carn de vedella, Herbes provençals, Mostassa de Dijon, Pebre negre mòlt i oli d`oliva verge.', 9.99);
INSERT INTO productes (tipus_producte, nom, descripcio, preu) VALUES ('beguda', 'Aigua', 'ampolla d`aigua de mig llitre', 1.50);
INSERT INTO productes (tipus_producte, nom, descripcio, preu, id_categoria_pizzes) VALUES ('pizza', 'Quatre formatges', 'El formatge fontina, originari de la Vall d`Aosta; el formatge gorgonzola, natural de Milà; el formatge parmesà, originari de la ciutat de Parma; i el formatge mozzarella, nascut a Campània.', 12.99, 1);



CREATE TABLE comandes(
    id_comanda INT(11) NOT NULL AUTO_INCREMENT,
    data_i_hora DATETIME,
    tipus_comanda ENUM('domicili', 'botiga') NOT NULL,
    preu DECIMAL(6,2) NOT NULL,
    id_client INT(11) NOT NULL,
    id_domicili INT(11),
    id_botiga INT(11) NOT NULL,
    id_empleat INT(11) NOT NULL,
    PRIMARY KEY(id_comanda),
    FOREIGN KEY(id_client) REFERENCES clients (id_client),
    FOREIGN KEY(id_domicili) REFERENCES comanda_domicili (id_domicili),
    FOREIGN KEY(id_botiga) REFERENCES botiga (id_botiga),
    FOREIGN KEY(id_empleat) REFERENCES empleats (id_empleat)
);

CREATE TABLE producte_demanat(
    id_producte_demanat INT(11) NOT NULL AUTO_INCREMENT,
    id_producte INT(11) NOT NULL,
    quantitat INT(11) NOT NULL,
    id_comanda INT(11) NOT NULL,
    PRIMARY KEY(id_producte_demanat),
    FOREIGN KEY(id_producte) REFERENCES productes (id_producte),
    FOREIGN KEY(id_comanda) REFERENCES comandes (id_comanda)
);
