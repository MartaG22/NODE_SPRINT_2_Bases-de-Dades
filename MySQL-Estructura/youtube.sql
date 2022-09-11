DROP DATABASE IF EXISTS YOUTUBE;

CREATE DATABASE YOUTUBE CHARACTER
SET
  utf8mb4;

USE YOUTUBE;

CREATE TABLE
  Usuaris (
    id_usuari INT NOT NULL AUTO_INCREMENT,
    correu VARCHAR(50) NOT NULL,
    contrasenya VARCHAR(20) NOT NULL,
    naixement DATE,
    sexe ENUM ('masculí', 'femení', 'altres'),
    codi_postal INT NOT NULL,
    pais VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_usuari)
  );

CREATE TABLE
  Videos (
    id_video INT NOT NULL AUTO_INCREMENT,
    estat_video ENUM ('públic', 'ocult', 'privat') NOT NULL,
    titol_video VARCHAR (60) NOT NULL,
    descripcio_video TEXT NOT NULL,
    data_hora_creacio DATETIME NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id_video),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari)
  );

CREATE TABLE
  Etiquetes (
    id_etiqueta INT NOT NULL AUTO_INCREMENT,
    nom_etiqueta VARCHAR(60),
    id_video INT NOT NULL,
    PRIMARY KEY (id_etiqueta),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video)
  );

CREATE TABLE
  Canals (
    id_canal INT NOT NULL AUTO_INCREMENT,
    nom_canal VARCHAR (60) NOT NULL,
    descripcio_canal TEXT NOT NULL,
    data_creacio DATE NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id_canal),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari)
  );

CREATE TABLE
  Playlists (
    id_playlist INT NOT NULL AUTO_INCREMENT,
    nom_playlist VARCHAR(60),
    data_creacio DATE NOT NULL,
    estat_playlist ENUM ('públic', 'privat') NOT NULL,
    id_video INT NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id_playlist),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari)
  );

CREATE TABLE
  Comentaris (
    id_comentari INT NOT NULL AUTO_INCREMENT,
    comentari TEXT NOT NULL,
    data_hora_comentari DATETIME,
    id_video INT NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id_comentari),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari)
  );

CREATE TABLE
  Subscripcions (
    id_subscripcio INT NOT NULL AUTO_INCREMENT,
    id_canal INT NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id_subscripcio),
    FOREIGN KEY (id_canal) REFERENCES Canals(id_canal),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari)
  );

CREATE TABLE 
  like_dislike_comentaris (
    id_like_dislike_comentari INT NOT NULL AUTO_INCREMENT,
    like_or_dislike_comentari ENUM ('like', 'dislike'),
    data_like_dislike_comentari DATE NOT NULL,
    id_comentari INT NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id_like_dislike_comentari),
    FOREIGN KEY (id_comentari) REFERENCES Comentaris(id_comentari),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris(id_usuari)

  );

CREATE TABLE 
  like_dislike_videos (
    id_like_dislike_video INT NOT NULL AUTO_INCREMENT,
    like_or_dislike_video ENUM ('like', 'dislike'),
    data_like_dislike_video DATE NOT NULL,
    id_video INT NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id_like_dislike_video),
    FOREIGN KEY (id_video) REFERENCES Videos(id_video),
    FOREIGN KEY (id_usuari) REFERENCES Usuaris (id_usuari)

  );

INSERT INTO
  Usuaris (id_usuari, correu, contrasenya, naixement, sexe, codi_postal, pais)
VALUES
  (1, 'pepito@yahoo.com', 'yoPepito', '2000-10-15', 'masculí', 25087, 'Espanya'),
  (2, 'mariadelao@hotmail.com', 'odeOviedo', '1995-08-15', 'femení', 10593, 'Espanya'),
  (3, 'lucca@gmail.com', 'galloClaudio', '1999-03-27', 'altres', 00017, 'Itàlia'),
  (4, 'fulanito@yahoo.com', 'laMontañaMasAlta', '1973-07-09', 'masculí', 35006, 'Alemanya');


INSERT INTO
  Videos (id_video, estat_video, titol_video, descripcio_video, data_hora_creacio, id_usuari)
VALUES
  (1, 'públic', "L'Antàrtida", "El descobriment de l'Antàrtida", '2019-11-14', 1),
  (2, 'public', 'Figures fàcils amb Origami', "Comencem a fer figures fàcils d'origami, perquè vegis que és més secill d'el que sembla", '2020-03-14', 3),
  (3, 'privat', "Vídeos de l'estiu", 'Vídeos de les vacances i de la festa del poble', '2022-08-15', 1);


INSERT INTO
  Etiquetes (id_etiqueta, nom_etiqueta, id_video)
VALUES
  (1, 'Descobriments', 1),
  (2, 'Manualitats', 2),
  (3, 'Coses meves', 3);


INSERT INTO
  Canals (id_canal, nom_canal, descripcio_canal, data_creacio, id_usuari)
VALUES
  (1, 'Tutorials Javascript', 'Tutorials de Javascript, nivell bàsic', '2019-12-29', 1),
  (2, 'Manualitats & Handmade', 'Diferents tipus de manualitats, de diferents nivells', '2020-10-30', 1);


INSERT INTO Playlists (id_playlist, nom_playlist, data_creacio, estat_playlist, id_video, id_usuari)
VALUES
  (1, 'Vieos per veure més tard', '2020-10-10', 'públic', 1, 1),
  (2, "Vieos que m'agraden", '2020-10-10', 'privat', 1, 2);


INSERT INTO Comentaris (id_comentari, comentari, data_hora_comentari, id_video, id_usuari)
VALUES
  (1, 'Molt interessant', '2021-05-07', 1, 3),
  (2, "No m'agrada. No té res de fàcil", '2021-10-20', 2, 4),
  (3, "M'agrada molt com ho explica", '2022-01-10', 2, 2);


INSERT INTO Subscripcions (id_subscripcio, id_canal, id_usuari)
VALUES (1, 1, 2), (2, 2, 4);

INSERT INTO like_dislike_comentaris (id_like_dislike_comentari, like_or_dislike_comentari, data_like_dislike_comentari, id_comentari, id_usuari)
VALUES
  (1, 'like', '2021-10-14', 1, 2),
  (2, 'dislike', '2021-10-14', 2, 3);

INSERT INTO like_dislike_videos (id_like_dislike_video, like_or_dislike_video, data_like_dislike_video, id_video, id_usuari)
VALUES
  (1, 'dislike', '2022-01-10', 2, 4),
  (2, 'like', '2021-10-20', 2, 2);
