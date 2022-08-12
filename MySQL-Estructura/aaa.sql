DROP DATABASE IF EXISTS PIZZERIA_LARODONA;

CREATE DATABASE PIZZERIA_LARODONA CHARACTER SET utf8mb4;

USE PIZZERIA_LARODONA;


-- DROP TABLE IF EXISTS provincia;

CREATE TABLE provincia(
    id_provincia INT NOT NULL AUTO_INCREMENT,
    nom_provincia VARCHAR(50),
    PRIMARY KEY (id_provincia)
);

-- DROP TABLE IF EXISTS localitats;

CREATE TABLE localitats(
    id_localitat INT NOT NULL AUTO_INCREMENT,
    nom_localitat VARCHAR(50),
    id_provincia INT NOT NULL,
    PRIMARY KEY (id_localitat),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia)
);


-- DROP TABLE IF EXISTS botigues;
CREATE TABLE botigues(
    id_botiga INT(11) NOT NULL AUTO_INCREMENT,
    adreza VARCHAR(60) NOT NULL,
    codi_postal VARCHAR(25) NOT NULL,
    id_localitat INT(11) NOT NULL,
    PRIMARY KEY(id_botiga),
    FOREIGN KEY(id_localitat) REFERENCES localitats (id_localitat)
);

-- DROP TABLE IF EXISTS clients;

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
-- DROP TABLE IF EXISTS empleats;

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
    PRIMARY KEY (id_empleat),
    FOREIGN KEY (id_botiga) REFERENCES botigues(id_botiga)
);
-- DROP TABLE IF EXISTS adreces;

CREATE TABLE adreces(
    id_adreza INT NOT NULL AUTO_INCREMENT,
    id_botiga INT(5),
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
    FOREIGN KEY (id_botiga) REFERENCES botigues(id_botiga),
    FOREIGN KEY (id_client) REFERENCES clients(id_client),
    FOREIGN KEY (id_empleat) REFERENCES empleats(id_empleat)
);


-- DROP TABLE IF EXISTS categoria_pizzes;

CREATE TABLE categoria_pizzes(
    id_categoriaPizza INT NOT NULL AUTO_INCREMENT,
    nom_categoria varchar(60) NOT NULL,
    PRIMARY KEY (id_categoriaPizza)
);

-- DROP TABLE IF EXISTS productes;

CREATE TABLE productes(
    id_producte INT NOT NULL AUTO_INCREMENT,
    tipus_producte ENUM('pizza', 'hamburguesa', 'beguda') NOT NULL,
    id_categoriaPizza INT,
    nom VARCHAR(60) NOT NULL,
    descripcio TEXT NOT NULL,
    preu DECIMAL(4, 2) NOT NULL,
    -- imgatge VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_producte),
    FOREIGN KEY (id_categoriaPizza) REFERENCES categoria_pizzes(id_categoriaPizza)
);

-- DROP TABLE IF EXISTS comandes;

CREATE TABLE comandes(
    id_comanda INT NOT NULL,
    id_producte INT NOT NULL,
    data_hora DATETIME NOT NULL,
    tipus_comanda ENUM('repartiment', 'botiga') NOT NULL,
    -- id_producte INT,
    id_client INT,
    id_botiga INT,
    id_empleat int,
    PRIMARY KEY (id_comanda),
    FOREIGN KEY (id_producte) REFERENCES productes(id_producte),
    FOREIGN KEY (id_client) REFERENCES clients(id_client),
    FOREIGN KEY (id_botiga) REFERENCES botigues(id_botiga),
    FOREIGN KEY (id_empleat) REFERENCES empleats(id_empleat)
);


-- DROP TABLE IF EXISTS entrega_comanda;

CREATE TABLE entrega_comanda(
    id_entrega INT,
    id_client INT,
    id_botiga INT,
    id_empleat_repartidor INT,
    id_domicili INT,
    data_hora_entrega DATETIME NOT NULL,
    PRIMARY KEY (id_entrega),
    FOREIGN KEY (id_entrega) REFERENCES comandes(id_comanda),
    FOREIGN KEY (id_client) REFERENCES clients(id_client),
    FOREIGN KEY (id_botiga) REFERENCES botigues(id_botiga),  
    FOREIGN KEY (id_empleat_repartidor) REFERENCES empleats(id_empleat),
    FOREIGN KEY (id_domicili) REFERENCES adreces(id_client)
);


INSERT INTO categoria_pizzes(id_categoriaPizza, nom_categoria)
VALUES
    (1, 'vegana'),
    (2, 'light'),
    (3, 'extra formatge'),
    (4, 'massa gruixuda'),
    (5, 'massa fina');

INSERT INTO productes(id_producte, tipus_producte, id_categoriaPizza, nom, descripcio, preu)
VALUES
    (1, 'pizza', 5, 'Pizza Hawaiana', 'Massa fina amb trocets de pinya i pernil dolç, formatge', 9.75),
    (2, 'beguda', NULL, 'Aigua', "Ampolla d'aigua de 50 ml. ", 1.20),
    (3, 'pizza', 5, 'Pizza Margarita', "Tomàquet, mozzarella, oli d'oliva i orenga", 8.10),
    (4, 'pizza', 4, 'Pizza Carbonara', 'Massa gruixuda amb base de tomàquet, amb bacon, ceba, formatge emmental i salsa carbonara, amb orenga', 9.50),
    (5, 'beguda', NULL, 'Coca-cola', 'Llauna de coca-cola, de 33 ml.', 1.60),
    (6, 'beguda', NULL, 'Aquarius', 'Llauna de Aquairius de 33 ml.', 1.60),
    (7, 'hamburguesa', NULL, 'Hamburguesa clàssica', 'Hamburguesa de vedella, enciam, tomàquet i ceba caramelitzada', 7.15),
    (8, 'hamburguesa', NULL, 'Hamburguesa completa',  'Hamburguesa de vedella, enciam, tomàquet, cogombre, ceba caramelitzada, ou fregit, salsa maionesa', 8.80);


INSERT INTO provincia (id_provincia, nom_provincia) VALUES (1,'Barcelona'), (2, 'Tarragona'), (3, 'Lleida'), (4, 'Girona');

INSERT INTO localitats (id_localitat, nom_localitat, id_provincia)
VALUES 
    (1, 'Barcelona', 1),
    (2, 'Santa Coloma', 1),
    (3, 'Badalona', 1),
    (4, 'Montgat',1),
    (5, 'Cardedeu', 1),
    (6, 'Portbou', 4),
    (7, 'Cadaqués',4),
    (8, 'Figueres', 4),
    (9, 'Llançà', 4),
    (10, 'Cunit', 2),
    (11, 'Comarruga', 2),
    (12, 'Calafell', 2),
    (13, 'Agramunt', 3),
    (14, 'Montsonís',3),
    (15, 'Penelles', 3);

INSERT INTO botigues (id_botiga, adreza, codi_postal, id_localitat)
VALUES
    (1, 'Carrer Indústria, 145, bx.', 08025, 1),
    (2, 'Carrer dels Arcs 34', 43880, 11),
    (3, 'Carrer de Pere III, 7', 17600, 8),
    (4, 'Passatge del Mig, 16', 25737, 14);


INSERT INTO clients (id_client, nom, primer_cognom, segon_cognom, telefon, correu_electronic, data_registre)
VALUES
    (1, 'Irene', 'García', 'Fernandez', 933555334, 'irenegf@yahoo.es', '2012-12-29'),
    (2, 'Francesc', 'Romero', 'Gazquez', 936547654, 'francesc@gmail.com', '2015-05-17'),
    (3, 'Jordi', 'Grau', 'Calmell', 932264535, 'jordigc@gmail.com', '2017-09-26'),
    (4, 'María', 'López', 'García', 972785676, 'maria@yahoo.es', '2018-11-15');

INSERT INTO empleats(id_empleat, nom, primer_cognom, segon_cognom, NIF, telefon, correu_electronic, carrec, id_botiga)
VALUES
    (1, 'Montse', 'Rodríguez', 'Estévez', '43675456T', 933556753, 'montse@hotmail.com', 'cuiner', 2),
    (2, 'Joaquim', 'Bosch', 'Giner', '24535435P', 935739534, 'joaquim.bosch@gmail.com', 'cuiner', 4),
    (3, 'Olga', 'Gómez', 'Sanjuan', '84734534K', 934654567, 'olga.san@gmail.com', 'repartidor', 2),
    (4, 'Susana', 'Yebra', 'Magaz', '85738544J', 935673422, 'susana@yahoo.com', 'repartidor', 4),
    (5, 'Gerard', 'Vereau', 'Sanz', '45345346T', 935456234, 'gerardvs@gmail.com', 'cuiner', 1),
    (6, 'Roger', 'Mas', 'Pou', '34353423Q', 936533464, 'rogermas@yahoo.es', 'repartidor', 1 ),
    (7, 'Joan', 'Ballester', 'Biosca', '34563443V', 972385332, 'joanbb@gmail.com', 'cuiner', 3),
    (8, 'Jaume', 'Ortega', 'Coma', '67234534S', 972456423, 'jaumeortega@gmail.com', 'repartidor', 3 );


INSERT INTO adreces(id_adreza, id_botiga ,id_client, id_empleat, carrer, numero, pis, porta, localitat, codi_postal, provincia)
VALUES
    (1, NULL, 1, NULL, 'Carrer Còrsega', 458, '3', '3', 'Barcelona', 08025, 'Barcelona'),
    (2, NULL, 2, NULL, 'Carrer de Brujas', 106, '1', 'A', 'Sabadell', 08202, 'Barcelona'),
    (3, NULL, NULL, 1, 'Carrer Major', 30, '1', '1', 'Sant Andreu de la Barca', 08740, 'Barcelona'),
    (4, NULL, NULL, 2, 'Carrer Sicília', 215, 'Bx.', '1', 'Barcelona', 08013, 'Barcelona'),
    (5, NULL, 3, NULL, 'Carrer Alacant', 58, '1', '4', 'Terrassa', 08224, 'Barcelona'),
    (6, NULL, NULL, 3, 'Carrer Comerç', 10, 'Bx.', '-', 'Vallirana', 08759, 'Barcelona'),
    (7, NULL, NULL, 4, 'Carrer Cinca', 35, '3', '5', 'Barcelona', 08030, 'Barcelona'),
    (8, NULL, NULL, 5, 'Carrer Sòcrates', 24, '1', '1', 'Barcelona', 08030, 'Barcelona'),
    (9, NULL, NULL, 6, 'Carrer Subirats', 87, '3', '1', 'Vilanova', 08800, 'Barcelona'),
    (10, NULL, 4, NULL, 'Carrer Gran', 4, '2', '2', 'Figueres', 17600, 'Girona'),
    (11, NULL, NULL, 7, 'Passeig Central', 65, '3', 'B', 'Portbou', 17497, 'Girona'),
    (12, NULL, NULL, 8, 'Carrer del Mar', 15, 'Bx.', '-', 'Colera', 17496, 'Girona');

INSERT INTO comandes(id_comanda, id_producte, data_hora, tipus_comanda, id_client, id_botiga, id_empleat)
VALUES
    (1, 2, '2022-05-24 21:00:00', 'repartiment', 1, 2, 3),
    (2, 3, '2021-12-29 21:45:00', 'repartiment', 2, 1, 2),
    (3, 4, '2021-09-21 14:40:00', 'botiga', 3, 3, 3),
    (4, 5, '2022-01-16 15:30:00', 'repartiment', 4, 4, 4),
    (5, 6, '2021-07-05 20:50:00', 'botiga', 3, 2, 2);


INSERT INTO entrega_comanda(id_entrega, id_client, id_botiga, id_empleat_repartidor, id_domicili, data_hora_entrega)
VALUES
    (1, 1, 2, 6, 1, '2022-05-24 21:35:00'),
    (2, 2, 1, 3, 2, '2021-12-29 22:25:00'),
    (4, 4, 4, 4, 4, '2022-01-16 15:30:00');

-- Q U E R I E S --

-- 1- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat
SELECT COUNT(tipus_producte) FROM (comandes INNER JOIN botigues ON botigues.id_botiga = comandes.id_botiga) INNER JOIN productes WHERE productes.tipus_producte = 'beguda' AND id_localitat = 1;


-- 2 - Llista quantes comandes ha efectuat un determinat empleat */
SELECT id_empleat, COUNT(comandes.id_comanda) FROM comandes WHERE id_empleat = 4;
