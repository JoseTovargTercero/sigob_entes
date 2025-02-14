-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-02-2025 a las 15:16:07
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sigobnet_sigob_entes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_operativo`
--

CREATE TABLE `plan_operativo` (
  `id` int(255) NOT NULL,
  `id_ente` int(255) NOT NULL,
  `objetivo_general` longtext NOT NULL,
  `objetivos_especificos` longtext NOT NULL,
  `estrategias` longtext NOT NULL,
  `acciones` longtext NOT NULL,
  `dimensiones` longtext NOT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `status` int(255) NOT NULL,
  `metas_actividades` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `plan_operativo`
--
ALTER TABLE `plan_operativo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `plan_operativo`
--
ALTER TABLE `plan_operativo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
