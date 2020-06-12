-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2020 a las 00:03:57
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `eva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `id_actividad` bigint(20) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`id_actividad`, `descripcion`) VALUES
(1, 'Serigrafia'),
(2, 'Imprenta'),
(3, 'Programacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad_id` bigint(20) DEFAULT NULL,
  `evento_id` bigint(20) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `totalhoras` int(11) DEFAULT NULL,
  `cupolimite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`id`, `titulo`, `actividad_id`, `evento_id`, `costo`, `totalhoras`, `cupolimite`) VALUES
(1, 'Programacion en PHP', 3, NULL, 50, 15, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idc` bigint(20) NOT NULL,
  `descripcionc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idc`, `descripcionc`) VALUES
(1, 'Diseño'),
(2, 'Programacion'),
(3, 'Redes y Servidores'),
(4, 'Robotica'),
(5, 'Seguidor de linea'),
(6, 'Gamer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` bigint(20) NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `fechainicio` datetime DEFAULT NULL,
  `fechafin` datetime DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `logotipo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eslogan` text COLLATE utf8mb4_unicode_ci,
  `lugar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` bigint(20) DEFAULT NULL,
  `inicioregistro` datetime DEFAULT NULL,
  `cierreregistro` datetime DEFAULT NULL,
  `organizador_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `titulo`, `descripcion`, `fechainicio`, `fechafin`, `observaciones`, `logotipo`, `eslogan`, `lugar`, `categoria_id`, `inicioregistro`, `cierreregistro`, `organizador_id`) VALUES
(1, 'Fiesta', 'Fiesta conmemorativa', '2020-06-04 12:45:15', '2020-06-02 00:00:00', 'ninguna', NULL, 'ver para creer', 'ITVO', 1, '2020-06-16 05:25:09', '2020-06-25 05:25:09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` bigint(20) NOT NULL,
  `catalogo_id` bigint(20) DEFAULT NULL,
  `ponente_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `catalogo_id`, `ponente_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horariodetalle`
--

CREATE TABLE `horariodetalle` (
  `id` bigint(20) NOT NULL,
  `horario_id` bigint(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `horarioincio` time DEFAULT NULL,
  `horafin` time DEFAULT NULL,
  `lugar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horariodetalle`
--

INSERT INTO `horariodetalle` (`id`, `horario_id`, `fecha`, `horarioincio`, `horafin`, `lugar`) VALUES
(1, 1, NULL, '17:58:00', '14:01:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizador`
--

CREATE TABLE `organizador` (
  `id` bigint(20) NOT NULL,
  `nombreorazonsocial` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rfc` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contacto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organizador`
--

INSERT INTO `organizador` (`id`, `nombreorazonsocial`, `rfc`, `contacto`, `url`, `correo`, `telefono`, `direccion`) VALUES
(1, 'David Alejandro Hernandez', '121235', 'Ramms', 'www.wololo.com', 'ramms@hotmail.com', '9512311', 'Desconocida'),
(2, 'Codigo Facilito', '12123', 'codigo', 'www.cf.com', 'cf56@hotmail.com', '951231', 'Xoxo'),
(3, 'ITVO', 'ITVO121212HO', 'Director del ITVO', NULL, 'direccionitvo@voaxaca.tecnm.mx', '00000000000000', 'NAzareno Xoxocotlán Oaxaca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id` bigint(20) NOT NULL,
  `fechapago` date DEFAULT NULL,
  `participante_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id`, `fechapago`, `participante_id`) VALUES
(1, '2020-06-19', 1),
(2, '2020-06-03', 1),
(3, '2020-06-03', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagodetalle`
--

CREATE TABLE `pagodetalle` (
  `id` bigint(20) NOT NULL,
  `pago_id` bigint(20) DEFAULT NULL,
  `catalogo_id` bigint(20) DEFAULT NULL,
  `importe` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagodetalle`
--

INSERT INTO `pagodetalle` (`id`, `pago_id`, `catalogo_id`, `importe`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participante`
--

CREATE TABLE `participante` (
  `id` bigint(20) NOT NULL,
  `nombrecompleto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curp` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intitucionprocedencia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuenta` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `participante`
--

INSERT INTO `participante` (`id`, `nombrecompleto`, `curp`, `intitucionprocedencia`, `cuenta`, `password`) VALUES
(1, 'Ramiro Hernandez Ruiz', 'Herna', 'ITVO', 'Ramms', '123'),
(3, 'maria perez', 'mapahcuy893939', 'la salle', 'ma-iaper09', 'sdsfat44t'),
(4, 'juana garcia', 'jugahdre8893', 'unsis', 'juga-9201', 'sdsf546');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participantehorario`
--

CREATE TABLE `participantehorario` (
  `id` bigint(20) NOT NULL,
  `participante_id` bigint(20) DEFAULT NULL,
  `horario_id` bigint(20) DEFAULT NULL,
  `fecharegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `participantehorario`
--

INSERT INTO `participantehorario` (`id`, `participante_id`, `horario_id`, `fecharegistro`) VALUES
(1, 1, 1, '2020-06-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ponente`
--

CREATE TABLE `ponente` (
  `id` bigint(20) NOT NULL,
  `nombrecompleto` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nivelacademico` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuenta` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ponente`
--

INSERT INTO `ponente` (`id`, `nombrecompleto`, `sexo`, `foto`, `cv`, `nivelacademico`, `cuenta`, `password`, `correo`) VALUES
(1, 'Ramms', 'F', '123', '11232', '31', 'ERT', '123', 'rammstein_ml@hotmail.com'),
(2, 'alejandro hernandez', 'M', '562482_nelson_mandela.jpg', 'BD2.pdf', 'doctorado', 'al-heg', 'hjh9uooio', 'ale-her@gmail.com'),
(3, 'carlos perez', 'M', 'images (2).jpg', 'lab_ssh.pdf', 'maestria', 'car-los67', 'asawe23345', 'car-los-90@gmail.com'),
(4, 'Ambrosio', 'M', 'logoitvo.png', 'grafica3D.png', 'Maestria', 'cardoso', '1234567890', '123456780'),
(5, 'Ambrosio Cardoso', 'M', 'candidatos.png', NULL, 'Maestria', 'cardoso', '1234567890', 'cardosojmz@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`id_actividad`);

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkactividad_catalogo` (`actividad_id`),
  ADD KEY `fkevento_catalogo` (`evento_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idc`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkcategoria_evento` (`categoria_id`),
  ADD KEY `fkorganizador_evento` (`organizador_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkcatalogo_horario` (`catalogo_id`),
  ADD KEY `fkponente_horario` (`ponente_id`);

--
-- Indices de la tabla `horariodetalle`
--
ALTER TABLE `horariodetalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkhorario_horariodetalle` (`horario_id`);

--
-- Indices de la tabla `organizador`
--
ALTER TABLE `organizador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkparticipante_pago` (`participante_id`);

--
-- Indices de la tabla `pagodetalle`
--
ALTER TABLE `pagodetalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkpago_pd` (`pago_id`),
  ADD KEY `fkcatalogo_pago` (`catalogo_id`);

--
-- Indices de la tabla `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ukCurp` (`curp`);

--
-- Indices de la tabla `participantehorario`
--
ALTER TABLE `participantehorario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkparticipante_ph` (`participante_id`),
  ADD KEY `fkhorario_ph` (`horario_id`);

--
-- Indices de la tabla `ponente`
--
ALTER TABLE `ponente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `id_actividad` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idc` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `horariodetalle`
--
ALTER TABLE `horariodetalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `organizador`
--
ALTER TABLE `organizador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagodetalle`
--
ALTER TABLE `pagodetalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `participante`
--
ALTER TABLE `participante`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `participantehorario`
--
ALTER TABLE `participantehorario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ponente`
--
ALTER TABLE `ponente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD CONSTRAINT `fkactividad_catalogo` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`id_actividad`),
  ADD CONSTRAINT `fkevento_catalogo` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`id`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fkcategoria_evento` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`idc`),
  ADD CONSTRAINT `fkorganizador_evento` FOREIGN KEY (`organizador_id`) REFERENCES `organizador` (`id`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fkcatalogo_horario` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogo` (`id`),
  ADD CONSTRAINT `fkponente_horario` FOREIGN KEY (`ponente_id`) REFERENCES `ponente` (`id`);

--
-- Filtros para la tabla `horariodetalle`
--
ALTER TABLE `horariodetalle`
  ADD CONSTRAINT `fkhorario_horariodetalle` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fkparticipante_pago` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`);

--
-- Filtros para la tabla `pagodetalle`
--
ALTER TABLE `pagodetalle`
  ADD CONSTRAINT `fkcatalogo_pago` FOREIGN KEY (`catalogo_id`) REFERENCES `catalogo` (`id`),
  ADD CONSTRAINT `fkpago_pd` FOREIGN KEY (`pago_id`) REFERENCES `pago` (`id`);

--
-- Filtros para la tabla `participantehorario`
--
ALTER TABLE `participantehorario`
  ADD CONSTRAINT `fkhorario_ph` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`),
  ADD CONSTRAINT `fkparticipante_ph` FOREIGN KEY (`participante_id`) REFERENCES `participante` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
