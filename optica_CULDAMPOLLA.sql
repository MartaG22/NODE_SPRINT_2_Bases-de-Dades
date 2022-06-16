--  cassidy williams

-- CODEPEN

DROP DATABASE IF EXISTS CULDAMPOLLA;

CREATE DATABASE CULDAMPOLLA CHARACTER SET utf8mb4;

USE CULDAMPOLLA;

DROP TABLE IF EXISTS empleats;

CREATE TABLE empleats(
    id_empleat INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    primer_cognom VARCHAR(50) NOT NULL,
    segon_cognom VARCHAR(50) NOT NULL,
    NIF VARCHAR(9) NOT NULL,
    /* adreza_empleat INT NOT NULL, */
    telefon INT NOT NULL,
    correu_electronic VARCHAR(60),
    PRIMARY KEY (id_empleat) -- FOREIGN KEY (adreza_empleat) REFERENCES adreces(id_adreza)
);

DROP TABLE IF EXISTS proveidors;

CREATE TABLE proveidors (
    id_proveidor INT NOT NULL AUTO_INCREMENT,
    nom_proveidor VARCHAR(60) NOT NULL,
    /* adreza_proveidor INT NOT NULL, */
    telefon INT NOT NULL,
    fax INT NOT NULL,
    NIF VARCHAR(9) NOT NULL,
    PRIMARY KEY (id_proveidor) -- FOREIGN KEY (adreza_proveidor) REFERENCES adreces(id_adreza)
);

DROP TABLE IF EXISTS marques;

CREATE TABLE marques(
    id_marca SMALLINT NOT NULL,
    nom_marca VARCHAR(50) NOT NULL,
    id_proveidor INT NOT NULL,
    PRIMARY KEY (id_marca),
    FOREIGN KEY (id_proveidor) REFERENCES proveidors(id_proveidor)
);

DROP TABLE IF EXISTS ulleres;

CREATE TABLE ulleres (
    id_ullera INT NOT NULL,
    id_marca SMALLINT NOT NULL,
    /* marca VARCHAR(50) NOT NULL, */
    model VARCHAR(50) NOT NULL,
    graduacio_esq DECIMAL(3, 2) NOT NULL,
    graduacio_der DECIMAL(3, 2) NOT NULL,
    tipus_montura ENUM('flotant', 'pasta', 'metàl·lica') NOT NULL,
    color_montura VARCHAR(40) NOT NULL,
    color_vidres VARCHAR(40) NOT NULL,
    preu DECIMAL(5, 2) NOT NULL,
    PRIMARY KEY (id_ullera),
    FOREIGN KEY (id_marca) REFERENCES marques(id_marca)
);

DROP TABLE IF EXISTS clients;

CREATE TABLE clients (
    id_client INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    primer_cognom VARCHAR(50) NOT NULL,
    segon_cognom VARCHAR(50) NOT NULL,
    /* adreza_client INT NOT NULL, */
    telefon INT NOT NULL,
    correu_electronic VARCHAR(60),
    data_registre DATE NOT NULL,
    recomanacio INT,
    PRIMARY KEY (id_client),
    -- FOREIGN KEY (adreza_client) REFERENCES adreces(id_adreza),
    FOREIGN KEY (recomanacio) REFERENCES clients(id_client)
);

DROP TABLE IF EXISTS adreces;

CREATE TABLE adreces(
    id_adreza INT NOT NULL AUTO_INCREMENT,
    id_empleat INT(5),
    id_proveidor INT(5),
    id_client INT(5),
    carrer VARCHAR(60) NOT NULL,
    numero INT NOT NULL,
    pis VARCHAR(3) NOT NULL,
    porta VARCHAR(3) NOT NULL,
    ciutat VARCHAR(50) NOT NULL,
    codi_postal INT NOT NULL,
    pais VARCHAR(50),
    PRIMARY KEY (id_adreza),
    FOREIGN KEY (id_empleat) REFERENCES empleats(id_empleat),
    FOREIGN KEY (id_proveidor) REFERENCES proveidors(id_proveidor),
    FOREIGN KEY (id_client) REFERENCES clients(id_client)
);

DROP TABLE IF EXISTS vendes;

CREATE TABLE vendes(
    id_venda INT NOT NULL AUTO_INCREMENT,
    num_factura VARCHAR(10),
    ullera INT NOT NULL,
    empleat INT NOT NULL,
    client INT NOT NULL,
    data_venda DATE,
    PRIMARY KEY (id_venda),
    FOREIGN KEY (ullera) REFERENCES ulleres(id_ullera),
    FOREIGN KEY (empleat) REFERENCES empleats(id_empleat),
    FOREIGN KEY (client) REFERENCES clients(id_client)
);

INSERT INTO
    proveidors(
        id_proveidor,
        nom_proveidor,
        /* adreza_proveidor, */
        telefon,
        fax,
        NIF
    )
VALUES
    (
        1,
        'les_millors_ulleres',
        /* 1, */
        973823422,
        973563456,
        'G34678954'
    ),
    (
        2,
        'ulleres_molones',
        /* 2, */
        923459644,
        923459648,
        'H14485394'
    ),
    (
        3,
        'best_glasses',
        /* 3, */
        954778565,
        953886748,
        'M74835456'
    ),
    (
        4,
        'safag',
        971854872,
        971482454,
        'U23492324'
    );

INSERT INTO
    clients (
        id_client,
        nom,
        primer_cognom,
        segon_cognom,
        /* adreza_client, */
        telefon,
        correu_electronic,
        data_registre,
        recomanacio
    )
VALUES
    (
        1,
        'Irene',
        'García',
        'Fernandez',
        /* 4, */
        933555334,
        'irenegf@yahoo.es',
        '2012-12-29',
        NULL
    ),
    (
        2,
        'Francesc',
        'Romero',
        'Gazquez',
        /* 5, */
        936547654,
        'francesc@gmail.com',
        '2015-05-17',
        NULL
    ),
    (
        3,
        'Jordi',
        'Grau',
        'Calmell',
        /* 6, */
        932264535,
        'jordigc@gmail.com',
        '2017-09-26',
        2
    );

INSERT INTO
    empleats (
        id_empleat,
        nom,
        primer_cognom,
        segon_cognom,
        NIF,
        /* adreza_empleat, */
        telefon,
        correu_electronic
    )
VALUES(
        1,
        'Montse',
        'Rodríguez',
        'Estévez',
        '43675456T',
        /* 7, */
        933556753,
        'montse@hotmail.com'
    ),
    (
        2,
        'Joaquim',
        'Bosch',
        'Giner',
        '24535435P',
        /* 8, */
        935739534,
        'joaquim.bosch@gmail.com'
    ),
    (
        3,
        'Olga',
        'Gómez',
        'Sanjuan',
        '84734534K',
        /* 9, */
        934654567,
        'olga.san@gmail.com'
    );

INSERT INTO
    adreces(
        /* id_adreza, */
        id_empleat,
        id_proveidor,
        id_client,
        carrer,
        numero,
        pis,
        porta,
        ciutat,
        codi_postal,
        pais
    )
VALUES(
        NULL,
        1,
        NULL,
        'Carrer Còrsega',
        458,
        '3',
        '3',
        'Barcelona',
        08025,
        'Espanya'
    ),
    (
        NULL,
        2,
        NULL,
        'Carrer de Brujas',
        106,
        '1',
        'A',
        'Sabadell',
        08202,
        'Espanya'
    ),
    (
        NULL,
        3,
        NULL,
        'Dumbarton Road',
        308,
        '4',
        '1',
        'Glasgow',
        55555,
        'United Kingdom'
    ),
    (
        NULL,
        NULL,
        1,
        'Carrer Major',
        30,
        '1',
        '1',
        'Sant Celoni',
        08740,
        'Espanya'
    ),
    (
        NULL,
        NULL,
        2,
        "Carrer d'Àngel Guimerà",
        41,
        '-',
        '-',
        'Vallirana',
        08759,
        'Espanya'
    ),
    (
        NULL,
        NULL,
        3,
        'Carrer Sicília',
        215,
        'Bx.',
        '1',
        'Barcelona',
        08013,
        'Espanya'
    ),
    (
        1,
        NULL,
        NULL,
        'Carrer Reina Amalia',
        31,
        'Bx.',
        '2',
        'Barcelona',
        08013,
        'Espanya'
    ),
    (
        2,
        NULL,
        NULL,
        'Carrer Argenteria',
        25,
        '2',
        '1',
        'Barcelona',
        08003,
        'Espanya'
    ),
    (
        3,
        NULL,
        NULL,
        'Carrer Sant Miquel',
        95,
        '3',
        '2',
        'Masnou',
        08320,
        'Espanya'
    ),
    (
        NULL,
        4,
        NULL,
        'Carrer de Sant Josep',
        10,
        'Bx.',
        '2',
        'Maó',
        07703,
        'Espanya'
    );
INSERT INTO
    marques(id_marca, nom_marca, id_proveidor)
VALUES
    (543, 'Ray Ban', 1),
    (345, 'Hugo Boss', 1),
    (743, 'Prada', 2),
    (342, 'Tous', 2),
    (234, 'Etnia Barcelona', 2),
    (323, 'Carolina Herrera', 3),
    (235, 'Timberland', 3),
    (877, 'Ralph Lauren', 3);
INSERT INTO
    ulleres (
        id_ullera,
        id_marca,
        /* marca, */
        model,
        graduacio_esq,
        graduacio_der,
        tipus_montura,
        color_montura,
        color_vidres,
        preu
    )
VALUES
    (
        '1122334455',
        543,
        /* 'Ray Ban', */
        '0RB3447',
        1.25,
        1.50,
        'metàl·lica',
        'daurat',
        'verd',
        101.95
    ),
    (
        '1234567890',
        345,
        /* 'Hugo Boss', */
        'BOSS0680/N',
        0.75,
        1.00,
        'pasta',
        'negre',
        'transparent',
        145.00
    ),
    (
        '1566778844',
        743,
        /* 'Prada', */
        'PR-06YS-09Q5S0',
        2.00,
        1.75,
        'pasta',
        'negre',
        'negre fumat',
        218.95
    ),
    (
        '1453467565',
        234,
        /* 'Etnia Barcelona', */
        'QUINN-SUN/HVBL',
        0.75,
        1.25,
        'pasta',
        'color pasta',
        'groc',
        150.50
    ),
    (
        '1353345534',
        342,
        /* 'Tous', */
        'STOA04 0GGD',
        0.00,
        1.00,
        'metàl·lica',
        'coure',
        'verd',
        180.25
    ),
    (
        '1246464675',
        323,
        'CH-6455.67',
        2.50,
        1.50,
        'flotant',
        'negre',
        'transparents',
        220.85
    ),
    (
        '1454556464',
        877,
        'RL9033/938',
        1.25,
        1.25,
        'metàl·lica',
        'negre',
        'transparents',
        130.50
    ),
    (
        '1576455754',
        235,
        'T-9033.938',
        1.00,
        2.00,
        'flotant',
        'platejat',
        'transparents',
        180.25
    ),
    (
        '1456587988',
        234,
        /* 'Etnia Barcelona', */
        'SUN/HVBL-YEL',
        0.75,
        1.00,
        'pasta',
        'groc amb ratlles',
        'groc',
        190.50
    ),
    (
        '1209876547',
        345,
        /* 'Hugo Boss', */
        'BOSN0500J/B',
        0.75,
        2.00,
        'pasta',
        'negre',
        'transparent',
        85.00
    );
INSERT INTO
    vendes(
        id_venda,
        num_factura,
        ullera,
        empleat,
        client,
        data_venda
    )
VALUES
    (1, 'F20-345', '1122334455', 2, 2, '2019-05-09'),
    (2, 'F20-346', '1234567890', 1, 3, '2017-12-18'),
    (3, 'F20-347', '1566778844', 3, 2, '2016-09-21'),
    (4, 'F10-587', '1453467565', 2, 1, '2021-06-26'),
    (5, 'F10-535', '1353345534', 2, 2, '2019-02-25'),
    (6, 'F14-234', '1246464675', 3, 1, '2022-01-16'),
    (7, 'F15-354', '1454556464', 3, 2, '2018-03-11'),
    (8, 'F15-857', '1576455754', 2, 1, '2015-12-29'),
    (9, 'F10-544', '1456587988', 1, 1, '2014-11-15'),
    (10, 'F20-239', '1209876547', 2, 3, '2020-09-23');
-- Q  U  E  R  I  E  S --
    --  Dades dels proveidors de cada una de les ulleres:
    /* SELECT
                                                                                                                                                                                                id_ullera,
                                                                                                                                                                                                ulleres.id_marca,
                                                                                                                                                                                                marques.nom_marca,
                                                                                                                                                                                                adreces.*
                                                                                                                                                                                            FROM
                                                                                                                                                                                                (
                                                                                                                                                                                                    (
                                                                                                                                                                                                        (
                                                                                                                                                                                                            ulleres
                                                                                                                                                                                                            INNER JOIN marques ON ulleres.id_marca = marques.id_marca
                                                                                                                                                                                                        )
                                                                                                                                                                                                        INNER JOIN proveidors ON proveidors.id_proveidor = marques.id_proveidor
                                                                                                                                                                                                    )
                                                                                                                                                                                                    INNER JOIN adreces ON proveidors.id_proveidor = adreces.id_proveidor
                                                                                                                                                                                                );
                                                                                                                                                                                            -- Dades de tots els proveidors
                                                                                                                                                                                            SELECT
                                                                                                                                                                                                *
                                                                                                                                                                                            FROM
                                                                                                                                                                                                proveidors
                                                                                                                                                                                                INNER JOIN adreces ON proveidors.id_proveidor = adreces.id_proveidor; */
    /* SELECT Orders.OrderID, Customers.CustomerName
                                                                                                                                                                                                                FROM Orders
                                                                                                                                                                                                                INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID; */
    /* 1. Llista el total de factures d 'un client/a en un període determinat.*/
SELECT
    client,
    nom,
    primer_cognom,
    segon_cognom,
    vendes.num_factura
FROM
    vendes
    INNER JOIN clients ON vendes.client = clients.id_client;

/*Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.*/

SELECT
    vendes.*
FROM
    vendes
    INNER JOIN empleats ON empleats.id_empleat = vendes.empleat;

/* Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica. */

SELECT
    proveidors.*
FROM
    (
        (
            (
                (
                    (
                        proveidors
                        INNER JOIN marques ON marques.id_proveidor = proveidors.id_proveidor
                    )
                    inner JOIN marques on marques.id_proveidor = ulleres.id_ullera
                )
            )
            INNER JOIN ulleres ON ulleres.id_ullera = vendes.ullera
        )
        INNER JOIN vendes ON vendes.ullera = ullera.id_ullera
    );