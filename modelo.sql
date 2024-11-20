-- Script de creación de bases de datos para MySQL/MariaDB con ejemplos

DROP DATABASE IF EXISTS proyecto_2_torneos_online;
CREATE DATABASE proyecto_2_torneos_online;
USE proyecto_2_torneos_online;

-- Pon aquí debajo tus CREATE TABLE y restricciones necesarias

CREATE TABLE jugador(
    id int AUTO_INCREMENT NOT NULL,
    username varchar(50),
    password varchar(16),
    nivel_exp int(5),
    CONSTRAINT pk_jugador PRIMARY KEY (id)
);

CREATE TABLE torneos(
    id int AUTO_INCREMENT NOT NULL,
    nombre varchar(50),
    modo_juego varchar(50),
    max_jugadores int(3),
    CONSTRAINT pk_torneos PRIMARY KEY (id)
);

CREATE TABLE partidas(
    id int AUTO_INCREMENT NOT NULL,
    id_torneo int,
    fecha_hora datetime,
    duracion int(3),
    ganador int,
    CONSTRAINT pk_partidas PRIMARY KEY (id),
    CONSTRAINT fk_torneo FOREIGN KEY (id_torneo) REFERENCES torneos(id),
    CONSTRAINT fk_ganador FOREIGN KEY (ganador) REFERENCES jugador(id)
);

CREATE TABLE jugador_torneos(
    id_jugador_torneos int AUTO_INCREMENT NOT NULL,
    id_jugador int, 
    id_torneo int,
    CONSTRAINT pk_jugador_torneos PRIMARY KEY (id_jugador_torneos),
    CONSTRAINT fk_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id),
    CONSTRAINT fk_torneos FOREIGN KEY (id_torneo) REFERENCES torneos(id)
);

-- Pon aquí debajo tus INSERT INTO necesarias

INSERT INTO jugador (username, password, nivel_exp) VALUES ('Fulanito', 'pass123', 17780);
INSERT INTO jugador (username, password, nivel_exp) VALUES ('Menganito', 'pass456', 7200);
INSERT INTO jugador (username, password, nivel_exp) VALUES ('Cetanito', 'pass789', 65300);

INSERT INTO torneos (nombre, modo_juego, max_jugadores) VALUES ('Grieta del Invocador', 'Ranked Game', 100);
INSERT INTO torneos (nombre, modo_juego, max_jugadores) VALUES ('Clash', 'Por equipos', 500);
INSERT INTO torneos (nombre, modo_juego, max_jugadores) VALUES ('TFT', 'Autobattler', 200);

INSERT INTO partidas (id_torneo, fecha_hora, duracion) VALUES (1, '2021-10-10 10:00:00', 30);
INSERT INTO partidas (id_torneo, fecha_hora, duracion) VALUES (2, '2021-10-11 10:00:00', 60);
INSERT INTO partidas (id_torneo, fecha_hora, duracion) VALUES (3, '2021-10-12 10:00:00', 45);

INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (1, 2);
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (2, 1);
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (3, 3);
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (1, 3);
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (2, 2);
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (3, 1);