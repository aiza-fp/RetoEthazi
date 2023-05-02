-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2023 a las 08:41:07
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bidaiagentzia`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `bezero_lista` ()   begin
select b.*, v.Puntuak
from bezeroa b, vip v
where b.NAN=v.NAN;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bezeroa`
--

CREATE TABLE `bezeroa` (
  `NAN` varchar(9) NOT NULL,
  `Izena` varchar(30) DEFAULT NULL,
  `Abizena1` varchar(30) DEFAULT NULL,
  `Abizena2` varchar(30) DEFAULT NULL,
  `Jaiotze_Data` date DEFAULT NULL,
  `Telefonoa` varchar(9) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `mota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bezeroa`
--

INSERT INTO `bezeroa` (`NAN`, `Izena`, `Abizena1`, `Abizena2`, `Jaiotze_Data`, `Telefonoa`, `Email`, `mota`) VALUES
('11111111A', 'Aitor', 'Leon', 'Salazar', '2004-03-17', '584735206', 'AiLe@gmail.com', 'Ohikoa'),
('22222222B', 'Kaiet', 'Barayazarra', 'Apraiz', '2002-07-24', '459874126', 'KaBa@gmail.com', 'Ohikoa'),
('33333333C', 'Iker', 'Elorrieta', 'Rodriguez', '2000-10-18', '895641237', 'IkEl@gmail.com', 'VIP'),
('44444444D', 'Aimar', 'Fernandez', 'Galan', '1996-11-04', '845216742', 'AiFe@gmail.com', 'VIP'),
('55555555E', 'Unai', 'Alvarez', 'Gaitan', '1994-05-31', '845658214', 'UnAl@gmail.com', 'VIP'),
('66666666Y', 'Ander', 'Roldan', 'Rodriguez', '1962-09-14', '985321674', 'AnRo@gmail.com', 'Ohikoa');

--
-- Disparadores `bezeroa`
--
DELIMITER $$
CREATE TRIGGER `Ezabatu_bezero` BEFORE DELETE ON `bezeroa` FOR EACH ROW BEGIN
insert into Bezeroa_old values(old.nan, old.izena, old.abizena1, old.abizena2, old.Jaiotze_Data, old.Telefonoa, old.Email, old.mota);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `berridatzi_bezero` BEFORE UPDATE ON `bezeroa` FOR EACH ROW BEGIN
insert into Bezeroa_old values(old.nan, old.izena, old.abizena1, old.abizena2, old.Jaiotze_Data, old.Telefonoa, old.Email, old.mota);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bezeroa_old`
--

CREATE TABLE `bezeroa_old` (
  `nan` varchar(9) DEFAULT NULL,
  `Izena` varchar(30) DEFAULT NULL,
  `Abizena1` varchar(30) DEFAULT NULL,
  `Abizena2` varchar(30) DEFAULT NULL,
  `Jaiotze_Data` date DEFAULT NULL,
  `Telefonoa` varchar(9) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `mota` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estantzia`
--

CREATE TABLE `estantzia` (
  `id_Estantzia` int(5) NOT NULL,
  `NAN` varchar(9) DEFAULT NULL,
  `Izena` varchar(30) DEFAULT NULL,
  `Kapazitatea` int(6) DEFAULT NULL,
  `Mota` varchar(40) DEFAULT NULL,
  `Balorazioa` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estantzia`
--

INSERT INTO `estantzia` (`id_Estantzia`, `NAN`, `Izena`, `Kapazitatea`, `Mota`, `Balorazioa`) VALUES
(1, '11111111A', 'BLESS', 2000, 'Hotela', 4),
(2, '22222222B', 'Amáre', 300, 'Motela', 3),
(3, '33333333C', 'Abba', 5, 'Apartamendua', 5),
(4, '44444444D', 'Lola Suite Motel', 250, 'Motela', 4),
(5, '55555555E', 'Plaza Nueva Apartamenduak', 3, 'Apartamendua', 2),
(6, '66666666Y', 'La Casa de los Mercaderes', 5000, 'Hotela', 5),
(16, NULL, 'Catalonia Sagrada Familia', 200, 'Hotela', 4),
(17, NULL, 'Suites Marina', 150, 'Motela', 3),
(18, NULL, 'Midtown Apartments', 8, 'Apartemendua', 5),
(19, NULL, 'Barceló Bilbao Nervión', 400, 'Hotela', 5),
(20, NULL, 'Zubia Urban Rooms', 100, 'Motela', 3),
(21, NULL, 'Catalonia Gran Via Bilbao', 4, 'Apartamendua', 4),
(22, NULL, 'Silken Al-Andalus Palace ', 150, 'Hotela', 3),
(23, NULL, 'NH Sevilla Plaza de Armas', 50, 'Motela', 2),
(24, NULL, 'Casa Palacio La Casa Blanca', 5, 'apartamendua', 3),
(25, NULL, 'Ibis budget Berlin Potsdamer P', 400, 'Hotela', 3),
(26, NULL, 'Meliá Berlin', 150, 'Motela', 4),
(27, NULL, 'BENSIMON apartments Mitte/Wedd', 4, 'Apartamendua', 3),
(28, NULL, 'HotelF1 Paris Saint Ouen March', 300, 'Hotela', 5),
(29, NULL, 'Meliá París Champs Elysées', 100, 'Motela', 4),
(30, NULL, 'Villa M', 6, 'Apartamendua', 2),
(31, NULL, '\r\nNH Collection Buenos Aires C', 700, 'Hotela', 4),
(32, NULL, '\r\nEsplendor by Wyndham Buenos ', 200, 'Motela', 3),
(33, NULL, 'UPOINT Flats ', 8, 'Apartamento', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `helmuga`
--

CREATE TABLE `helmuga` (
  `id_Helmuga` int(5) NOT NULL,
  `id_Estantzia` int(5) DEFAULT NULL,
  `Izena` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `helmuga`
--

INSERT INTO `helmuga` (`id_Helmuga`, `id_Estantzia`, `Izena`) VALUES
(1, 1, 'Bartzelona'),
(2, 2, 'Bilbao'),
(3, 3, 'Sevilla'),
(4, 4, 'Berlin'),
(5, 5, 'Paris'),
(6, 6, 'Buenos Aires');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jarduera`
--

CREATE TABLE `jarduera` (
  `id_Jarduera` int(5) NOT NULL,
  `id_Helmuga` int(5) DEFAULT NULL,
  `Izena` varchar(30) DEFAULT NULL,
  `Mota` varchar(30) DEFAULT NULL,
  `Balorazioa` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jarduera`
--

INSERT INTO `jarduera` (`id_Jarduera`, `id_Helmuga`, `Izena`, `Mota`, `Balorazioa`) VALUES
(5, 1, 'Sagrada Familiaren Bisita Gida', 'Kultura', 4),
(6, 2, 'Sopelanako Parapenteak', 'Arrisku Kirola', 3),
(7, 3, 'Flamenku Ikuskisuna Sevillako ', 'Sarrera Tiketa', 5),
(8, 4, 'Sachsenhausen Konzentrazio Zen', 'Kultura', 4),
(9, 5, 'Sennatik Kruzero Ibilbidea', 'Jarduera Akuatikoa', 4),
(10, 6, 'Tango Ikuskisuna Kasku Zaharre', 'Sarrera Tiketa', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ohikoa`
--

CREATE TABLE `ohikoa` (
  `NAN` varchar(9) NOT NULL,
  `GonbidatuKop` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ohikoa`
--

INSERT INTO `ohikoa` (`NAN`, `GonbidatuKop`) VALUES
('11111111A', 3),
('22222222B', 6),
('66666666Y', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiketa`
--

CREATE TABLE `tiketa` (
  `id_Tiket` int(5) NOT NULL,
  `NAN` varchar(9) DEFAULT NULL,
  `Prezioa` int(4) DEFAULT NULL,
  `Jesarlekua` varchar(10) DEFAULT NULL,
  `Wifi` tinyint(1) DEFAULT NULL,
  `Jesarleku_Mota` varchar(30) DEFAULT NULL,
  `TV` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiketa`
--

INSERT INTO `tiketa` (`id_Tiket`, `NAN`, `Prezioa`, `Jesarlekua`, `Wifi`, `Jesarleku_Mota`, `TV`) VALUES
(1, '11111111A', 250, '34D', 0, 'Turista', 0),
(2, '22222222B', 350, '69E', 0, 'Business', 0),
(3, '33333333C', 500, '134f', 0, 'Lehen Klasea', 0),
(4, '44444444D', 150, '150B', 0, 'Turista', 0),
(5, '55555555E', 350, '1A', 0, 'Business', 0),
(6, '66666666Y', 650, '1F', 0, 'Lehen Klasea', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vip`
--

CREATE TABLE `vip` (
  `NAN` varchar(9) NOT NULL,
  `Puntuak` int(5) DEFAULT NULL,
  `Beherapenak` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vip`
--

INSERT INTO `vip` (`NAN`, `Puntuak`, `Beherapenak`) VALUES
('33333333C', 23, 40),
('44444444D', 10, 15),
('55555555E', 23, 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bezeroa`
--
ALTER TABLE `bezeroa`
  ADD PRIMARY KEY (`NAN`);

--
-- Indices de la tabla `estantzia`
--
ALTER TABLE `estantzia`
  ADD PRIMARY KEY (`id_Estantzia`),
  ADD KEY `NAN` (`NAN`);

--
-- Indices de la tabla `helmuga`
--
ALTER TABLE `helmuga`
  ADD PRIMARY KEY (`id_Helmuga`),
  ADD KEY `id_Estantzia` (`id_Estantzia`);

--
-- Indices de la tabla `jarduera`
--
ALTER TABLE `jarduera`
  ADD PRIMARY KEY (`id_Jarduera`),
  ADD KEY `id_Helmuga` (`id_Helmuga`);

--
-- Indices de la tabla `ohikoa`
--
ALTER TABLE `ohikoa`
  ADD PRIMARY KEY (`NAN`);

--
-- Indices de la tabla `tiketa`
--
ALTER TABLE `tiketa`
  ADD PRIMARY KEY (`id_Tiket`),
  ADD KEY `NAN` (`NAN`);

--
-- Indices de la tabla `vip`
--
ALTER TABLE `vip`
  ADD PRIMARY KEY (`NAN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estantzia`
--
ALTER TABLE `estantzia`
  MODIFY `id_Estantzia` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `helmuga`
--
ALTER TABLE `helmuga`
  MODIFY `id_Helmuga` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `jarduera`
--
ALTER TABLE `jarduera`
  MODIFY `id_Jarduera` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tiketa`
--
ALTER TABLE `tiketa`
  MODIFY `id_Tiket` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estantzia`
--
ALTER TABLE `estantzia`
  ADD CONSTRAINT `estantzia_ibfk_1` FOREIGN KEY (`NAN`) REFERENCES `bezeroa` (`NAN`);

--
-- Filtros para la tabla `helmuga`
--
ALTER TABLE `helmuga`
  ADD CONSTRAINT `helmuga_ibfk_1` FOREIGN KEY (`id_Estantzia`) REFERENCES `estantzia` (`id_Estantzia`);

--
-- Filtros para la tabla `jarduera`
--
ALTER TABLE `jarduera`
  ADD CONSTRAINT `jarduera_ibfk_1` FOREIGN KEY (`id_Helmuga`) REFERENCES `helmuga` (`id_Helmuga`);

--
-- Filtros para la tabla `ohikoa`
--
ALTER TABLE `ohikoa`
  ADD CONSTRAINT `ohikoa_ibfk_1` FOREIGN KEY (`NAN`) REFERENCES `bezeroa` (`NAN`);

--
-- Filtros para la tabla `tiketa`
--
ALTER TABLE `tiketa`
  ADD CONSTRAINT `tiketa_ibfk_1` FOREIGN KEY (`NAN`) REFERENCES `bezeroa` (`NAN`);

--
-- Filtros para la tabla `vip`
--
ALTER TABLE `vip`
  ADD CONSTRAINT `vip_ibfk_1` FOREIGN KEY (`NAN`) REFERENCES `bezeroa` (`NAN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
