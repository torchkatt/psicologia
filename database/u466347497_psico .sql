-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2018 a las 03:58:54
-- Versión del servidor: 10.2.17-MariaDB
-- Versión de PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u466347497_psico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acciones`
--

CREATE TABLE `acciones` (
  `id_accion` int(11) NOT NULL,
  `nombre_accion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_area`, `nombre`) VALUES
(1, 'Organizacional'),
(2, 'Clínica'),
(3, 'Educativa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditorias`
--

CREATE TABLE `auditorias` (
  `id_auditoria` int(11) NOT NULL COMMENT 'Identificador unico asociado al registro de auditoria y llave primaria.',
  `fecha` datetime NOT NULL COMMENT 'Fecha en que se efectuo el registro.',
  `descripcion` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'La acción describe el suceso que se ejecuto en la base de datos, para una tabla especifica. Las posibles acciones registradas para esta tabla son: Inserts, Updates, Deletes de información.',
  `tabla_afectada` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Este campo describe el nombre de la tabla que esta siendo afectada.',
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `usuarios_id_usuario` int(11) NOT NULL,
  `acciones_id_accion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL COMMENT 'Número identificador unico y llave primaria(autoincrementable)',
  `nombre_documento` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del documento requerido para esa etapa',
  `desc_documento` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Descripción general del documento asociado a una etapa',
  `estado_documento` int(11) NOT NULL COMMENT 'Los posibles estados de un documento pueden ser: 1- Aprobado, 0- Rechazado',
  `estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado de la tabla, true como activa y false como inactiva',
  `url_archivo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/docs',
  `etapas_id_etapa` int(11) NOT NULL,
  `tipos_documentos_id_tipo_documento` int(11) NOT NULL,
  `usuarios_id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL COMMENT 'Número identificador unico del registro empresa. ',
  `nombre_empresa` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de la empresa',
  `nit` bigint(30) NOT NULL COMMENT 'Número de identificación tributaria de la empresa',
  `nombre_gerente` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombres completos del gerente o representante legal de la empresa',
  `telefono` bigint(30) NOT NULL COMMENT 'Número  de contacto de la empresa',
  `correo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Correo electronico de la empresa',
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dirección de la empresa',
  `web` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Dirección web o sitio web de la empresa',
  `estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado en que se encuentra la empresa(1- activo, 0- Inacticvo o deshabilitado)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapas`
--

CREATE TABLE `etapas` (
  `id_etapa` int(11) NOT NULL COMMENT 'Número de identificación unico asociado a la etapa (autoincrementable)',
  `num_etapa` int(11) NOT NULL COMMENT 'Número de la etapa en que se encuentra el proceso de solicitud de practicas',
  `desc_etapa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Descripción de la etapa en que se encuentra el usuario',
  `estado_etapa` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado en que se encuentra la etapa(0- En progreso, 1- Aprobado)',
  `observacion` varchar(225) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Observaciones generales de la etapa, o de los requesitos necesarios para aprobarla'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `etapas`
--

INSERT INTO `etapas` (`id_etapa`, `num_etapa`, `desc_etapa`, `estado_etapa`, `observacion`) VALUES
(1, 1, 'Subida de primeros documentos', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos`
--

CREATE TABLE `procesos` (
  `id_proceso` int(11) NOT NULL,
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `observacion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `areas_id_area` int(11) NOT NULL,
  `estados_id_estado` int(11) NOT NULL,
  `empresas_id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL COMMENT 'Número identificador del rol del usuario.',
  `nombre_rol` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre o descripción del rol del usuario',
  `estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado del rol, true para activa y false para inactiva\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `estado`) VALUES
(0, 'Super Administrador', 1),
(1, 'Estudiante', 1),
(2, 'Moderador', 1),
(3, 'Asesor Académico', 1),
(4, 'Administrador', 1),
(5, 'Jefe Institucional', 1),
(20, 'Invitado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id_sede` int(11) NOT NULL,
  `nombre_sede` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ciudad_sede` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion_sede` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telefono_sede` bigint(30) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id_sede`, `nombre_sede`, `ciudad_sede`, `direccion_sede`, `telefono_sede`, `estado`) VALUES
(1, 'Universidad Cooperativa de Colombia', 'Bucaramanga', 'Carrera 33', 376854500, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documentos`
--

CREATE TABLE `tipos_documentos` (
  `id_tipo_documento` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1,
  `nombre_documento` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_identificaciones`
--

CREATE TABLE `tipos_identificaciones` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipos_identificaciones`
--

INSERT INTO `tipos_identificaciones` (`id_tipo`, `nombre`) VALUES
(1, 'Cédula de Ciudadanía'),
(2, 'Cédula Extranjera'),
(3, 'Tarjeta de Identidad'),
(4, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL COMMENT 'Número identificador unico del usuario y clave primaria.',
  `nombres` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombres del usuario en formato ingles( nombre 1 y nombre 2)',
  `apellidos` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Apellidos del usuario en formato ingles( apellido 1 y apellido 2)',
  `tipos_identificaciones_id_tipo` int(11) NOT NULL,
  `identificacion` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Número identificador asignado por la registraduria (Número de la cedula del usuario)',
  `sexo` int(11) NOT NULL,
  `correo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Correo electronico del usuario.',
  `telefono` bigint(30) NOT NULL COMMENT 'Número de contacto del cliente.',
  `direccion` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Dirección de residencia del usuario',
  `fecha_nacimiento` date NOT NULL COMMENT 'Edad del usuario',
  `clave` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Contraseña de ingreso a la plataforma',
  `eps` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `solicitud` int(10) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado del usuario, true para activa y false para inactiva',
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Captura la fecha de registro del usuario.',
  `roles_id_rol` int(11) NOT NULL,
  `sedes_id_sede` int(11) DEFAULT NULL,
  `etapas_id_etapa` int(11) DEFAULT NULL,
  `empresas_id_empresa` int(11) DEFAULT NULL,
  `fecha_modificacion` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Captura la fecha de registro del usuario.',
  `areas_id_area` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acciones`
--
ALTER TABLE `acciones`
  ADD PRIMARY KEY (`id_accion`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD PRIMARY KEY (`id_auditoria`),
  ADD KEY `fk_auditorias_usuarios1_idx` (`usuarios_id_usuario`),
  ADD KEY `fk_auditorias_acciones1_idx` (`acciones_id_accion`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `fk_documentos_etapas1_idx` (`etapas_id_etapa`),
  ADD KEY `fk_documentos_tipos_documentos1_idx` (`tipos_documentos_id_tipo_documento`),
  ADD KEY `fk_documentos_usuarios1_idx` (`usuarios_id_usuario`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`),
  ADD UNIQUE KEY `nit_UNIQUE` (`nit`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `etapas`
--
ALTER TABLE `etapas`
  ADD PRIMARY KEY (`id_etapa`);

--
-- Indices de la tabla `procesos`
--
ALTER TABLE `procesos`
  ADD PRIMARY KEY (`id_proceso`),
  ADD KEY `fk_procesos_areas1_idx` (`areas_id_area`),
  ADD KEY `fk_procesos_estados1_idx` (`estados_id_estado`),
  ADD KEY `fk_procesos_empresas1_idx` (`empresas_id_empresa`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `tipos_documentos`
--
ALTER TABLE `tipos_documentos`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tipos_identificaciones`
--
ALTER TABLE `tipos_identificaciones`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `identificacion_UNIQUE` (`identificacion`),
  ADD UNIQUE KEY `correo_UNIQUE` (`correo`),
  ADD KEY `fk_usuarios_tipos_identificaciones1_idx` (`tipos_identificaciones_id_tipo`),
  ADD KEY `fk_usuarios_roles1_idx` (`roles_id_rol`),
  ADD KEY `fk_usuarios_sedes1_idx` (`sedes_id_sede`),
  ADD KEY `fk_usuarios_etapas1_idx` (`etapas_id_etapa`),
  ADD KEY `fk_usuarios_empresas1_idx` (`empresas_id_empresa`),
  ADD KEY `fk_usuarios_areas1_idx` (`areas_id_area`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acciones`
--
ALTER TABLE `acciones`
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auditorias`
--
ALTER TABLE `auditorias`
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico asociado al registro de auditoria y llave primaria.';

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número identificador unico y llave primaria(autoincrementable)';

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número identificador unico del registro empresa. ';

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etapas`
--
ALTER TABLE `etapas`
  MODIFY `id_etapa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número de identificación unico asociado a la etapa (autoincrementable)', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `procesos`
--
ALTER TABLE `procesos`
  MODIFY `id_proceso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número identificador del rol del usuario.', AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `sedes`
--
ALTER TABLE `sedes`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipos_documentos`
--
ALTER TABLE `tipos_documentos`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_identificaciones`
--
ALTER TABLE `tipos_identificaciones`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número identificador unico del usuario y clave primaria.', AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditorias`
--
ALTER TABLE `auditorias`
  ADD CONSTRAINT `fk_auditorias_acciones1` FOREIGN KEY (`acciones_id_accion`) REFERENCES `acciones` (`id_accion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_auditorias_usuarios1` FOREIGN KEY (`usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `fk_documentos_etapas1` FOREIGN KEY (`etapas_id_etapa`) REFERENCES `etapas` (`id_etapa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_documentos_tipos_documentos1` FOREIGN KEY (`tipos_documentos_id_tipo_documento`) REFERENCES `tipos_documentos` (`id_tipo_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_documentos_usuarios1` FOREIGN KEY (`usuarios_id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `procesos`
--
ALTER TABLE `procesos`
  ADD CONSTRAINT `fk_procesos_areas1` FOREIGN KEY (`areas_id_area`) REFERENCES `areas` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_procesos_empresas1` FOREIGN KEY (`empresas_id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_procesos_estados1` FOREIGN KEY (`estados_id_estado`) REFERENCES `estados` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_areas1` FOREIGN KEY (`areas_id_area`) REFERENCES `areas` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_empresas1` FOREIGN KEY (`empresas_id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_etapas1` FOREIGN KEY (`etapas_id_etapa`) REFERENCES `etapas` (`id_etapa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`roles_id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_sedes1` FOREIGN KEY (`sedes_id_sede`) REFERENCES `sedes` (`id_sede`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_tipos_identificaciones1` FOREIGN KEY (`tipos_identificaciones_id_tipo`) REFERENCES `tipos_identificaciones` (`id_tipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
