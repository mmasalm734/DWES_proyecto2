DROP DATABASE IF EXISTS proyecto_2_torneos_online;
CREATE DATABASE proyecto_2_torneos_online;
USE proyecto_2_torneos_online;

-- Tabla jugador
CREATE TABLE jugador (
    id INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(60) NOT NULL,
    nivel_exp INT(5),
    CONSTRAINT pk_jugador PRIMARY KEY (id)
);

-- Tabla torneos
CREATE TABLE torneos (
    id INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    modo_juego VARCHAR(50),
    max_jugadores INT(3),
    id_creador INT NOT NULL,
    CONSTRAINT pk_torneos PRIMARY KEY (id),
    CONSTRAINT fk_torneos_creador FOREIGN KEY (id_creador) REFERENCES jugador(id)
);

-- Tabla partidas
CREATE TABLE partidas (
    id INT AUTO_INCREMENT NOT NULL,
    id_torneo INT NOT NULL,
    fecha_hora DATETIME,
    duracion INT(3),
    id_creador INT NOT NULL,
    ganador INT,
    CONSTRAINT pk_partidas PRIMARY KEY (id),
    CONSTRAINT fk_partidas_torneo FOREIGN KEY (id_torneo) REFERENCES torneos(id),
    CONSTRAINT fk_partidas_creador FOREIGN KEY (id_creador) REFERENCES jugador(id),
    CONSTRAINT fk_partidas_ganador FOREIGN KEY (ganador) REFERENCES jugador(id)
);

-- Tabla intermedia jugador_torneos
CREATE TABLE jugador_torneos (
    id INT AUTO_INCREMENT NOT NULL,
    id_jugador INT NOT NULL,
    id_torneo INT NOT NULL,
    CONSTRAINT pk_jugador_torneos PRIMARY KEY (id),
    CONSTRAINT fk_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id),
    CONSTRAINT fk_torneos FOREIGN KEY (id_torneo) REFERENCES torneos(id)
);

-- Tabla intermedia jugador_partidas
CREATE TABLE jugador_partidas (
    id INT AUTO_INCREMENT NOT NULL,
    id_jugador INT NOT NULL,
    id_partida INT NOT NULL,
    fecha_participacion DATETIME,
    CONSTRAINT pk_jugador_partidas PRIMARY KEY (id),
    CONSTRAINT fk_jugador_partidas_jugador FOREIGN KEY (id_jugador) REFERENCES jugador(id),
    CONSTRAINT fk_jugador_partidas_partida FOREIGN KEY (id_partida) REFERENCES partidas(id)
);

-- Pon aquí debajo tus INSERT INTO necesarias

-- Insertar jugadores
INSERT INTO jugador (username, password, nivel_exp) VALUES ('Fulanito', 'hashed_password_123', 17780);
INSERT INTO jugador (username, password, nivel_exp) VALUES ('Menganito', 'hashed_password_456', 7200);
INSERT INTO jugador (username, password, nivel_exp) VALUES ('Cetanito', 'hashed_password_789', 65300);

-- Insertar torneos
INSERT INTO torneos (nombre, modo_juego, max_jugadores, id_creador) VALUES ('Grieta del Invocador', 'Ranked Game', 100, 1);
INSERT INTO torneos (nombre, modo_juego, max_jugadores, id_creador) VALUES ('Clash', 'Por equipos', 500, 2);
INSERT INTO torneos (nombre, modo_juego, max_jugadores, id_creador) VALUES ('TFT', 'Autobattler', 200, 3);

-- Insertar partidas
INSERT INTO partidas (id_torneo, fecha_hora, duracion, id_creador) VALUES (1, '2021-10-10 10:00:00', 30, 1);
INSERT INTO partidas (id_torneo, fecha_hora, duracion, id_creador) VALUES (2, '2021-10-11 10:00:00', 60, 2);
INSERT INTO partidas (id_torneo, fecha_hora, duracion, id_creador) VALUES (3, '2021-10-12 10:00:00', 45, 3);

-- Inscribir jugadores en torneos
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (1, 2);
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (2, 1); 
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (3, 3); 
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (1, 3); 
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (2, 2); 
INSERT INTO jugador_torneos (id_jugador, id_torneo) VALUES (3, 1);

-- Inscribir jugadores en partidas
INSERT INTO jugador_partidas (id_jugador, id_partida, fecha_participacion) VALUES (1, 1, '2021-10-10 10:30:00');
INSERT INTO jugador_partidas (id_jugador, id_partida, fecha_participacion) VALUES (2, 1, '2021-10-10 10:30:00');
INSERT INTO jugador_partidas (id_jugador, id_partida, fecha_participacion) VALUES (3, 2, '2021-10-11 10:15:00');