-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-12-2024 a las 19:35:51
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
-- Estructura de tabla para la tabla `asignacion_ente`
--

CREATE TABLE `asignacion_ente` (
  `id` int(255) NOT NULL,
  `id_ente` int(255) NOT NULL,
  `monto_total` varchar(255) DEFAULT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_cerrar` int(255) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignacion_ente`
--

INSERT INTO `asignacion_ente` (`id`, `id_ente`, `monto_total`, `id_ejercicio`, `fecha`, `status`, `status_cerrar`) VALUES
(10, 1, '2000', 3, '2024-12-29', '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `table_name` varchar(100) DEFAULT NULL,
  `situation` varchar(255) DEFAULT NULL,
  `affected_rows` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `action_type`, `table_name`, `situation`, `affected_rows`, `user_id`, `timestamp`) VALUES
(1, 'DELETE', 'pl_actividades', 'id = 2', 1, 35, '2024-10-26 23:08:22'),
(2, 'DELETE', 'pl_actividades', 'id = 4', 1, 35, '2024-10-26 23:08:51'),
(3, 'DELETE', 'pl_actividades', 'id = 3', 1, 35, '2024-10-26 23:10:20'),
(4, 'DELETE', 'pl_actividades', 'id = 5', 1, 35, '2024-10-26 23:11:37'),
(5, 'DELETE', 'pl_actividades', 'id = 7', 1, 35, '2024-10-26 23:16:14'),
(6, 'DELETE', 'pl_actividades', 'id = 8', 1, 35, '2024-10-26 23:16:34'),
(7, 'DELETE', 'pl_actividades', 'id = 9', 1, 35, '2024-10-26 23:20:42'),
(8, 'UPDATE', 'pl_actividades', 'id = 10', 1, 35, '2024-10-27 00:28:46'),
(9, 'UPDATE', 'pl_actividades', 'id = 10', 1, 35, '2024-10-27 00:28:54'),
(10, 'DELETE', 'pl_actividades', 'id = \'10\'', 1, 35, '2024-10-28 18:12:18'),
(11, 'UPDATE', 'pl_actividades', 'id = \'11\'', 1, 35, '2024-10-28 18:22:25'),
(12, 'UPDATE', 'pl_actividades', 'id = \'11\'', 1, 35, '2024-10-28 18:22:35'),
(13, 'UPDATE', 'pl_actividades', 'id = \'11\' OR id=\'12\'', 1, 35, '2024-10-28 18:22:56'),
(14, 'UPDATE', 'pl_actividades', 'id = 11', 1, 35, '2024-10-28 19:02:35'),
(15, 'DELETE', 'pl_actividades', 'id= ?', 0, 35, '2024-10-28 19:02:42'),
(16, 'DELETE', 'pl_actividades', 'id= ?', 0, 35, '2024-10-28 19:02:48'),
(17, 'DELETE', 'pl_actividades', 'id= ?', 0, 35, '2024-10-28 19:03:09'),
(18, 'DELETE', 'pl_actividades', 'id', 5, 35, '2024-10-28 19:05:51'),
(19, 'DELETE', 'pl_actividades', 'id', 0, 35, '2024-10-28 19:06:00'),
(20, 'DELETE', 'pl_actividades', 'id', 1, 35, '2024-10-28 19:10:30'),
(21, 'DELETE', 'pl_actividades', 'id', 3, 35, '2024-10-28 19:11:29'),
(22, 'DELETE', 'pl_actividades', 'id= ?', 1, 35, '2024-10-28 19:14:11'),
(23, 'DELETE', 'pl_actividades', 'id= ?', 1, 35, '2024-10-28 19:14:16'),
(24, 'UPDATE', 'pl_actividades', 'id = 23', 1, 35, '2024-10-28 19:14:29'),
(25, 'DELETE', 'pl_actividades', 'id= ?', 1, 35, '2024-10-28 19:14:32'),
(26, 'UPDATE', 'pl_programas', 'id = 38', 1, 35, '2024-10-30 19:32:47'),
(27, 'UPDATE', 'pl_programas', 'id = 38', 1, 35, '2024-10-30 19:37:58'),
(28, 'DELETE', 'pl_programas', 'id= ?', 1, 35, '2024-10-30 19:44:00'),
(29, 'DELETE', 'pl_programas', 'id= ?', 1, 35, '2024-10-30 19:44:04'),
(30, 'DELETE', 'pl_programas', 'id= ?', 1, 35, '2024-10-30 19:44:07'),
(31, 'DELETE', 'pl_sectores', 'id= ?', 1, 35, '2024-10-30 20:00:29'),
(32, 'UPDATE', 'pl_sectores', 'id = 12', 1, 35, '2024-10-30 20:02:16'),
(33, 'DELETE', 'pl_actividades', 'id= ?', 1, 35, '2024-11-05 08:41:27'),
(34, 'DELETE', 'descripcion_programas', 'id= ?', 1, 35, '2024-11-05 08:43:43'),
(35, 'DELETE', 'descripcion_programas', 'id= ?', 1, 35, '2024-11-05 08:44:07'),
(36, 'DELETE', 'descripcion_programas', 'id= ?', 1, 35, '2024-11-05 11:46:30'),
(37, 'DELETE', 'distribucion_presupuestaria', 'id=19', 1, 35, '2024-12-29 14:27:54'),
(38, 'DELETE', 'distribucion_presupuestaria', 'id=20', 1, 35, '2024-12-29 14:27:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `backups`
--

CREATE TABLE `backups` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `tablas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `backups`
--

INSERT INTO `backups` (`id`, `user`, `fecha`, `tablas`) VALUES
(2, 31, '15-07-2024', ''),
(3, 31, '06-08-2024', ''),
(4, 31, '17-08-2024', ''),
(5, 31, '17-08-2024', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compromisos`
--

CREATE TABLE `compromisos` (
  `id` int(255) NOT NULL,
  `correlativo` varchar(255) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `id_registro` int(255) NOT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `tabla_registro` longtext NOT NULL,
  `numero_compromiso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion_programas`
--

CREATE TABLE `descripcion_programas` (
  `id` int(255) NOT NULL,
  `id_sector` int(255) NOT NULL,
  `id_programa` int(255) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descripcion_programas`
--

INSERT INTO `descripcion_programas` (`id`, `id_sector`, `id_programa`, `descripcion`) VALUES
(2, 1, 2, 'La Contraloría del Estado Amazonas,  es el órgano de control, vigilancia y fiscalización de los ingresos, gastos y bienes públicos del Estado y a tal efecto goza de autonomía orgánica y funcional,  de conformidad con lo establecido en el articulo 163 de la Constitución de la República Bolivariana de Venezuela, sin menoscabo de la función de control, seguimiento y evaluación de la Contraloría General de la República. \r\n \r\nLa Contraloría del Estado Amazonas, ahora como órgano integrante del Sistema Nacional de Control Fiscal, el cual es un conjunto de órganos, estructuras, recursos y procesos que integrados bajo la rectoría de la Contraloría General de la República, interactúan coordinadamente a fin de lograr la unidad de dirección de los sistemas y procedimientos de control  que coadyuven al logro de los objetivos generales de los distintos entes y organismos sujetos a control fiscal, así como también al buen funcionamiento de la administración pública; cuyos objetivos son:\r\n \r\n* Fortalecer la capacidad del Estado para ejecutar eficazmente su función de gobierno.\r\n\r\n* Lograr la transparencia y la eficiencia en el manejo de los recursos del sector público   y así contribuir a optimizar la calidad de vida de la ciudadanía.\r\n\r\n* Establecer las responsabilidades por la comisión de irregularidades relacionadas con la gestión  de las entidades públicas.\r\n'),
(3, 1, 3, 'Le corresponde representar y amparar judicial y extrajudicialmente, conforme a las instrucciones emanadas del Ejecutivo Regional o del Consejo Legislativo los intereses del Estado, sus bienes, su patrimonio, rentas y derechos, redactar y suscribir conforme a las instrucciones que le fueren comunicadas por el Ejecutivo Regional, por el Consejo Legislativo, los documentos contentivos de actos, negocio o contratos que conciernan al Estado; además prestar asesoría jurídica a los órganos y dependencia del Estado.\r\n	\r\nAsistir en representación del Estado a las discusiones de los Contratos Colectivos que el Ejecutivo regional, Consejo Legislativo y sus dependencias, órganos auxiliares y conexos tengan a bien suscribir con sus trabajadores.\r\n\r\nLlevar un inventario permanente de los bienes inmuebles del Estado,  velar por el estricto  cumplimiento de las leyes, en el ámbito del estado y pedir por ante los organismos jurisdiccionales competentes la nulidad de leyes, decretos, ordenanzas, acuerdos y resoluciones dictadas en el Estado.\r\n \r\nPresentar proyectos de leyes ante el Consejo Legislativo Regional y solicitar la reforma parcial de las ya existentes, cuando ella sea pertinente a los intereses del Estado y la Nación.\r\n \r\nElaborar su propio Presupuesto de Gastos a fin de ser incluidos en el Presupuesto General de Ingresos y Gastos del Estado, y ordenar traslados de partidas y otros movimientos contables dentro de su propio presupuesto anual de gasto, conforme a lo establecido en la Ley orgánica de Administración del Estado, Ley Orgánica de Presupuesto y la Ley Orgánica de Régimen presupuestario del Estado y demás normativa vigente.\r\n'),
(4, 1, 4, 'El Gobernador del estado como Jefe del Ejecutivo Regional y Agente del Ejecutivo Nacional, tendrá las facultades previstas en la Constitución de la República, la Ley sobre Elección y Remoción de Gobernadores, Ley Orgánica de Descentralización, Delimitación y Transferencia de competencia del poder público, la Constitución del Estado Amazonas y las otras normativas legales vigentes.\r\n \r\n \r\nEl propósito de este programa, es responder en el más alto nivel, el estricto cumplimiento de todas las actividades que sean necesarias para Gobernar el Estado Amazonas y para coordinar acciones administrativas y sociales, en función del desarrollo económico y social sustentable del Estado.\r\n'),
(5, 1, 6, 'Es el órgano directo e inmediato del Gobernador a cuyo cargo esta la supervisión de las actividades administrativas del Ejecutivo del Estado Amazonas, conforme a las directrices que le imparta el Gobernador. El Secretario Ejecutivo Regional, en lo político y administrativo, tanto en el ámbito interno como municipal.\r\n \r\nDentro de las funciones del Secretario Ejecutivo de Coordinación, esta en velar por el estricto cumplimiento de todas las normas que rige la administración y vigilancia del patrimonio del Estado.\r\n \r\nSon atribuciones además, del Secretario Ejecutivo de Coordinación, mantener relaciones institucionales con el Consejo legislativo, las autoridades Municipales, los órganos de la Administración Nacional, el Clero, las Organizaciones Políticas, Sindicales, Gerencia e Empresariales y en General con todo los Sectores representativos de las comunidades que conforman el Estado en representación del Gobierno.\r\n \r\nEs de su competencia, coordinar el trabajo de las secretarías del Ejecutivo, oficinas auxiliares del Despacho de la Gobernación y las actividades de los Comisionados y las Comisiones que el Gobernador designe conforme a la Ley.\r\n \r\nConducir los procesos de ajuste de la estructura organizativa de la Gobernación, en procura de elevar la eficiencia de su gestión.\r\n'),
(6, 1, 6, 'Este programa tiene como atribuciones, la aplicación de las normas y principios que rigen la administración del personal, como elemento fundamental de funcionamiento del Gobierno Estadal.\r\n \r\n \r\nAdministra la Ejecución de los Contratos Colectivos, coordinando las relaciones obreros patronales, en el cumplimiento de las cláusulas y convenios, así como la aplicación de las Leyes y Reglamentos que rigen las normas y procedimientos administrativos en lo concerniente a la materia de recursos humanos.\r\n'),
(7, 1, 7, 'Asistir y asesorar al Gobernador del Estado, en todo lo concerniente a la Planificación y Administración Presupuestaria de la Gestión, e igualmente a las diferentes secretarías y oficinas dependientes del Ejecutivo Regional y demás poderes públicos, cuando estos lo soliciten. \r\n \r\nFormular en coordinación con la estructura del Ejecutivo Regional el proyecto de Ley de Presupuesto. \r\n \r\nEjercer la Secretaría Técnica del Comité de Planificación y Coordinación de Políticas Públicas e integrar las comisiones de trabajo a las cuales sea designado por el Gobernador para la elaboración del Plan Operativo Anual y Plan Estadal de Desarrollo Estadal.  \r\n'),
(8, 1, 8, 'El programa Servicios de Administración, se encarga de ejecutar en el marco de la norma financiera el presupuesto del Estado.\r\n \r\n \r\nCoordinar los servicios de compras de bienes y servicios; el registro del patrimonio de la Gobernación y de reproducción e imprenta.\r\n \r\n \r\nAdelantar la contabilidad fiscal del Ejecutivo Regional, de acuerdo a las pautas establecidas en la Ley.\r\n'),
(9, 1, 9, 'El objeto de este programa, es el registro, control y cancelación de los  compromisos adquiridos por la Gobernación del Estado, a través de sistemas que aseguren el adecuado manejo del Tesoro Público; así como también, el control de valores en custodia, la existencia del Tesoro y la recaudación de los fondos provenientes de la renta de diversas índoles, cumpliendo con lo dispuesto en la ley Orgánica de régimen Presupuestario, Ley General de Venta y  Gastos públicos del Estado, Ley Orgánica de Contraloría General del Estado y demás normativas vigentes de este Estado.\r\n \r\n \r\nRealiza además, todo los pagos ejecutado por Gobernación, a través de las diferentes cuentas habilitadas, Promueve actividades laborales para organizar todas las operaciones de recaudación,  custodia de valores y velar por el fiel cumplimiento de acuerdo a las disposiciones legales vigentes.\r\n'),
(11, 1, 10, 'Elaborar el programa anual de política indigenista, previa consulta con las comunidades, pueblos y grupos étnicos indígenas orientados al mejoramiento de las condiciones de vidas, trabajo y salud, así como su nivel educativo.\r\n \r\nSupervisar  y hacer cumplir las directrices de las políticas indigenistas.\r\n \r\nOrientar a la población indígena, sobre su organización y el establecimiento de cooperativa de producción y consumo.\r\n \r\nDefender y hacer respetar los derechos de los indígenas consagrados en la Constitución Nacional, Constitución Estadal, Leyes Nacionales y en tratados Internacionales ratificados por Venezuela.\r\n \r\nCoordinar los recursos y las acciones dirigidas a promover en las poblaciones indígenas del Estado Amazonas\r\n \r\nEstablecer nexos con los entes públicos, Nacionales  y Regionales, que hacen vida activa en el Estado Amazonas, a fin  de coordinar acciones a favor de las comunidades indígenas, a través de los diferentes Institutos Crediticios Nacionales y Estadales. \r\n\r\nDesarrollar acciones en las comunidades indígenas que contribuyan al desarrollo socio-económico y la autogestión\r\n'),
(12, 1, 13, 'Funciones de la Secretaria Ejecutiva de bienes y servicios:\r\n Dirigir, coordinar y establecer estrategia de recepción, entrega y movilización de bienes muebles adquiridos por la Gobernación para el equipamiento de las unidades administrativas.\r\nRealizar y Ejecutar periódicamente programa de actualización de inventarios de bienes asignados a distintas oficinas, tanto en las unidades administrativas dependientes como en los entes coordinados.\r\nDiseñar, controlar y supervisar, la vigilancia y resguardo de los bienes e instalaciones que son propiedades patrimoniales de la Gobernación.\r\nLlevar registro y control de bienes muebles e inmuebles, así como rendir informe a la administración y tesorería sobre el registro contable para el ajuste periódico a la hacienda pública del estado.\r\nRealizar el control perceptivo, que permita captar la veracidad, exactitud y calidad de obras, bienes y servicios. Para así verificar la sinceridad y correcta realización de las operaciones administrativas, a través de comprobación in situ.\r\n'),
(13, 1, 11, 'Los servicios de Control y Gestión comprenden el plan de organización, las políticas, normas, métodos y procedimientos adaptados dentro de un ente u organismo, sujeto a la Ley del Estatuto de la función pública, para  salvaguardar sus recursos, verificar su exactitud y veracidad de la información financiera y administrativa y promover la eficiencia económica y la calidad en sus operaciones. Estimular la observancia de las políticas, presentar y lograr el cumplimiento de misión, objetivos y metas.\r\n \r\nRealizar actividades de coordinar y dirigir los programas de auditoria a efectuarse en los organismos públicos, centralizados, dependientes financiera y presupuestariamente de la Gobernación del Estado Amazonas.\r\n \r\nEn materia de asuntos legales, el Auditor Interno de acuerdo a los casos presentados y a las situaciones que se origen en el ámbito administrativo y financiero, ordenará las aperturas, investigaciones y averiguaciones administrativas que amerite el caso.\r\n'),
(14, 2, 14, 'En este programa se desarrollan acciones tendentes para el rescate y mejora de la imagen institucional, mediante la ejecución de todas las actividades en lo referente a seguridad, defensa y orden público en primer orden y en otro sentido, en lo que al aspecto administrativo se refiere; cumpliendo eficientemente con la misión encomendada por el Despacho Superior durante todo el año, apoyando el plan de equipamiento general, con el adiestramiento y capacitación de todo el personal policial, técnicos,  administrativos y obreros e igualmente con los recursos logísticos y financieros necesarios para su completa confiabilidad.\r\n'),
(15, 2, 15, 'Esta unidad ejecutora tiene como finalidad la coordinación de programas dirigidos a resguardar la seguridad y orden público, cumplir y hacer cumplir los decretos, ordenanzas, resoluciones y demás disposiciones que la Gobernación imparta de acuerdo a la ley.\r\n \r\nCoordinar con los organismos competentes la implantación de medidas de resguardo de la colectividad afectada por calamidades públicas, el servir de enlace entre el Ejecutivo y las Fuerzas Armadas Policiales y demás organismos de Seguridad del Estado.\r\n \r\nEn otro orden de acción también se dedica  a la administración de asuntos civiles y preparar el personal policial, profesional técnico y obreros para coadyuvar al cumplimiento del orden público.  \r\n'),
(16, 2, 16, 'El objetivo primordial de este programa se puede resumir en tres funciones principales:\r\n \r\n- Actuar cordialmente para reducir al mínimo las  calamidades públicas por causas naturales.\r\n \r\n- Coordinar acciones preventivas y asistenciales.\r\n \r\n- Coordinar operativos en épocas festivas y de asueto para evitar perdida de vida.\r\n'),
(17, 2, 17, 'El Cuerpo de Bomberos del Estado Amazonas, tiene como finalidad prestar sus servicios encaminados a la seguridad en lo referente a la prevención, protección, combate, extinción de incendios y otros siniestros, así como también, la investigación de las causas y su origen, la atención de emergencias pre-hospitalaria, los servicios de rescate y salvamento y la participación en los programas para la atención de emergencias o desastre dirigida a la formación de la comunidad.\r\n \r\nLos Bomberos utilizan métodos para proteger mercancías, objetos y el interior de edificios de los daños que puedan sufrir por fuego y el agua, los objetos se cubren con material impermeable y el agua se evacua con aspiradores de agua, sumideros y bombas portátiles. La mayoría de las unidades de bomberos disponen de equipos de salvaguardia.\r\n'),
(18, 3, 18, 'La Secretaría de turismo, es el órgano ejecutor de la política turística y recreativa del Estado, a través de la cual contribuirá al desarrollo económico y social de la región, proponiendo el uso racional de los atractivos turísticos que existen en el Estado.\r\n \r\nLa riqueza y abundancia de paisajes naturales presentes en el Estado, define una amplia potencialidad turística, recreacional y contemplativa.\r\n \r\nPor lo que corresponden a este sector  la planificación y realización de programas y acciones para  que la actividad turística se convierta en una de las fuentes fundamentales para propiciar  el desarrollo económico, social y cultural del  Estado Amazonas.\r\n \r\nEn tal sentido las acciones concretas a desarrollar serán destinadas a delimitar y promover las áreas de  mayor porvenir turismo, así como la creación y mantenimiento de la infraestructura necesaria para su desarrollo. Además, dentro de estas acciones están comprendidas, velar por el mantenimiento y conservación de las instalaciones ya existentes y coordinar acciones con los organismos responsables de administrar las zonas  ABRAE del Estado con el objetivo de incorporarlas al patrimonio de uso  turístico.\r\n'),
(19, 4, 19, 'Esta Unidad programática tiene como función garantizar el cumplimiento  del proceso educativo, para el logro de la educación Integral de los ciudadanos  del procedo educativo, para el logro de  la Educación Integral de los ciudadanos del Estado.\r\n \r\nPropicia y estimula la modernización de los sistemas administrativos, con el  fin de lograr los objetivos deseados en el sector educativo.\r\n \r\nEstablece convenios con los institutos que hacen vida activa en la región, a fin de implementar procedimientos que permitan capacitar y orientar al docente.\r\n'),
(20, 4, 20, 'Este programa comprende el área de la docencia y el apoyo técnico que imparte  en los centros educacionales urbanos y rurales del Estado. A través del mismo, se mantiene el servicio de educación pre-escolar y básica, además de la coordinación de comedores escolares.\r\n \r\nEn esta unidad programática, se reflejan los beneficios que por Contratación Colectiva reciben los trabajadores de la enseñanza dependiente del Ejecutivo Regional, con la intención de mejorar la calidad de la educación en el Estado Amazonas. También se llevan a cabo programas de asistencia al indígena de alfabetización. También se lleva a cabo programas de asistencia al indígena de alfabetización, asistencia integral a los centros educacionales y de supervisión, igualmente se le brinda apoyo a la Zona Educativa.\r\n'),
(21, 5, 22, 'La Secretaria de Información y Comunicación SICOAMA tiene como objetivo principal lograr que  el pueblo sea el  vocero principal de la gestión de gobierno Pueblo-Gobierno a través de la creación innovadora y permanente de canales de comunicación con énfasis en la retroalimentación que sirvan para la consolidación de una nueva forma de gobierno que rompa los paradigmas de la democracia representativa resolviendo los problemas que le impiden a Amazonas lograr su desarrollo político, económico y social. Entre sus funciones:\r\n \r\nDiseñar la política comunicacional del Gobierno de Amazonas, de acuerdo a los lineamientos establecidos por el Gobernador.\r\nPlanificar y ejecutar las acciones destinadas a consolidar la política comunicacional del Gobierno de Amazonas.\r\nCoordinar la acción conjunta de los medios oficiales para el cumplimiento de los lineamientos comunicacionales previstos por los niveles de gobierno nacional y regional.\r\nDiseñar, ejecutar y hacer seguimiento del Plan Operativo Anual de la Secretaría de Información y Comunicación del estado Amazonas.\r\n'),
(22, 5, 23, 'La  Biblioteca Nacional de Venezuela, ha desarrollado el sistema de Biblioteca pública como parte de una estrategia orientada a brindar a la población, el más amplio acceso a la  información que requiere.\r\n\r\nPartiendo de esta concepción y para optimizar el uso de los recursos disponibles se  ha desarrollo un modelo de redes Estadales cuya estructura medular la constituye la Biblioteca Pública Central.\r\n \r\nLos servicios Bibliotecarios públicos representan los medios eficaces para lograr la atención y satisfacción de las necesidades de información, aprendizaje y recreación de la población. La cobertura de la red en el Estado amazonas cubre todos los municipios, teniendo como objetivo principal:\r\n\r\n- Dotar a la entidad de una infraestructura de servicios bibliotecarios, dirigida a tender necesidades básicas de información, conocimiento y recreación de la comunidad.\r\n\r\n- Formar adecuadamente a los usuarios para que obtengan mejores beneficios de la información.\r\n\r\n- Promover el uso de la lectura y de la información como instrumento para el desarrollo individual y colectivo.\r\n\r\n- Apoyar a la educación en todos sus niveles y en especial, la educación y la investigación. \r\n'),
(23, 5, 24, 'La Secretaría de Cultura y Comunicación, es la encargada de promover, fomentar y conservar los valores culturales de la región. A través de la Dirección y Coordinación de la Cultura de la Gobernación del Estado Amazonas, se formulan y ejecutan acciones de desarrollo cultural orientadas principalmente a la investigación, difusión de actividades autóctonas y rescate  de los valores culturales propios de nuestro Estado.\r\n'),
(24, 5, 25, 'Tiene como objetivo la coordinación de los mecanismos tecnológicos que desarrolle la ciencia a través del uso y aplicación de los medios electrónicos , informáticos y telemáticos para la organización y funcionamiento institucional.\r\n \r\nTambién tiene como fin planificar, promover y aplicar las políticas públicas en materia de las tecnologías de información y comunicación de la Gobernación del Estado Amazonas y organismos adscritos.\r\n'),
(25, 6, 27, 'Coordinar la ejecucion de obras del Fondo de Compensacion Interterritorial, asi como tambien la formulacion y evaluacion de proyectos relacionados con obras dirigidas al bienestar de  la colectividad Amazonense.\r\n'),
(26, 6, 26, 'Tiene como objetivo la coordinacion, mejoramiento fomento, direccion y control de actividades relacionadas con la vivienda, desarrollo urbano y los servicios conexos. de la misma manera, formular proyectos de acondicionamiento de servicios basicos, de mantenimiento de obras y del transporte.\r\n\r\n     Coordinar la ejecucion de obras del Fondo de Compensaci{on Interterritorial, asi como tambien la formulacion y evaluacion de proyectos relacionados con obras dirigidas al bienestar de  la colectividad Amazonense.\r\n'),
(27, 7, 28, 'La implementación de este programa persigue de manera esencial lograr los objetivos de la política sanitaria y asistencial del Estado. En este sentido se lleva a cabo la ejecución de actividades tendentes a mejorar la atención médica, programa de información y orientación ciudadana e igualmente fortalecer las acciones destinadas al funcionamiento y operación de las instalaciones de los servicios de salud.\r\n'),
(28, 8, 29, 'A través de la Secretaría de Desarrollo Social, se velará por la seguridad social en el Estado Amazonas; por ende este programa tiene como objetivo general, promover el desarrollo social en la región, en coordinación con los organismos nacionales estadales públicos y privados, mediante la ejecución de actividad y programas dirigidos al mejoramiento del nivel económico, social y cultura de la comunidades indígenas, rurales y urbanas. Corresponde a la Secretaría, las siguientes funciones:\r\n \r\n- Ejecutar la política social del Gobierno Estadal.\r\n\r\n- Asistencia de las comunidades en situación de emergencia.\r\n\r\n- Apoyar la Creación y organización de cooperativas y demás instituciones destinadas a mejorar la economía popular, así como la protección de las asociaciones, sociedades y comunidades que tenga como objetivo el mejor desarrollo socio económico del Estado.\r\n\r\n- Lo relativo a la asistencia y bienestar social a cargo de la Gobernación.\r\n\r\n- Realizar actividades de promoción, coordinación y supervisión de proyectos y mantenimiento de obras comunales.\r\n'),
(29, 8, 30, 'la Secretaria Ejecutiva de Participaciòn popular, cuyo objetivo es liderar el proceso de fortalecimiento de las organizaciones comunales y sociales y la implementacion de un Sistema de Participaciòn Popular, a los fines del ejercicio del control social y la intervencion de las politicas publicas que permitan la incidencia efectiva de las comunidades en las decisiones, la transformacion de las conciencias en el interior de las masas oprimidas que conlleven a que nuestro pueblo sea constructor de su propio destino, por cuanto desde esta perspectiva, se concibe a la persona como ser social producto de las realaciones sociales, que permite que la actividad social sea un proceso como reflejo de la realidad y resultado de la reflexion consciente de esa realidad\r\n'),
(30, 8, 31, 'Este programa tiene como objetivo incluir a las personas con discapacidad para brindar atención integral a la población con vulnerabilidad para introducirlo en el ámbito laboral, en el cumplimiento de las políticas relacionadas con la discapacidad.                                              \r\n   Esta unidad programática tiene como función:\r\n- Participar en la formulación de lineamientos, políticas, planes, proyectos y estrategias en materia de atención a personas con limitaciones físicas.\r\n- Promover la participación ciudadana en lo social y en lo económico a través de los comités comunitarios, asociaciones, cooperativas, empresas comunitarias y de cogestión y autogestión,en función de la organización de las personas con discapacidad, que conlleve a una mejor articulación e identificación con los organos y entes de la administración pública nacional, estadal y municipal, así como también a las personas naturales y jurídicas    de derecho privado.\r\n- La prestación de servicios asistenciales en materia jurídica, social y cultural a las personas con discapacidad. \r\n- Conocer sobre situaciones de discriminación a las personas con discapacidad y tramitarlas ante las autoridades competentes.\r\n'),
(31, 8, 32, 'A través de atención integral a la mujer, familia e igualdad de genero , se garantizará la igualdad de oportunidades de la mujer, para promover la participación protagónica de la mujer en los ámbitos políticos, económicos y sociales tanto a nivel regional como nacional. Entre sus funciones principales se encuentran:\r\n- Participar, planificar e instrumentar lineamientos, políticas, planes, proyectos y estrategias en materia de atención integral a la mujer, familia e igualdad de genero, dirigido al empoderamiento de las mujeres en materia jurídica, social, cultural, política, económica y recreativa, especialmente de las mujeres indígenas, campesinas, afrodescientes, pescadoras, obreras, con discapacidad, en situaciones de indigencia, desplazadas, las privadas de libertad, las amas de casa, la tercera edad, las niñas y adolescentes para garantizarles el pleno ejercicio de su libertad y el desarrolllo de sus capacidades y destrezas en una sociedad democrática, participativa, protagónica, igualitaria y socialista.\r\n- Atender y orientar a través de programas de rehabilitación a los hombres procesados en materia de violencia de genero, coordinadamente con la fiscalía del Ministerio Público, la unidad de atención a la victima y los tribunales penales en materia de violencia de genero.\r\n- Conocer sobre situaciones de discriminación contra las mujeres y tramitarlas a las autoridades competentes.\r\n'),
(32, 9, 33, 'Este programa tiene entre sus funciones: planificar, coordinar y administrar con objetividad las políticas destinadas a la seguridad social del personal activo de la Gobernación del Estado. De acuerdo a las normativas laborales y otras leyes vigente para tal fin.\r\n'),
(33, 10, 34, 'Controla de manera idónea los créditos presupuestarios asignados a las partidas de Compromisos Pendientes de Ejercicios anteriores, rectificaciones al presupuesto y otras transferencias a entes descentralizados necesarias para el mejor desenvolvimiento de la gestión pública.\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion_entes`
--

CREATE TABLE `distribucion_entes` (
  `id` int(255) NOT NULL,
  `id_ente` int(255) NOT NULL,
  `actividad_id` int(255) DEFAULT NULL,
  `distribucion` longtext NOT NULL,
  `monto_total` varchar(255) DEFAULT NULL,
  `status` int(255) NOT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `comentario` longtext NOT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `id_asignacion` int(255) NOT NULL,
  `status_cerrar` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion_presupuestaria`
--

CREATE TABLE `distribucion_presupuestaria` (
  `id` int(255) NOT NULL,
  `id_partida` int(255) NOT NULL,
  `monto_inicial` varchar(255) DEFAULT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `monto_actual` varchar(255) DEFAULT NULL,
  `id_sector` int(255) NOT NULL,
  `id_programa` int(255) NOT NULL,
  `id_proyecto` int(255) NOT NULL,
  `id_actividad` int(255) NOT NULL,
  `status` int(255) NOT NULL,
  `status_cerrar` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio_fiscal`
--

CREATE TABLE `ejercicio_fiscal` (
  `id` int(255) NOT NULL,
  `ano` varchar(255) DEFAULT NULL,
  `situado` varchar(255) DEFAULT NULL,
  `divisor` varchar(255) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejercicio_fiscal`
--

INSERT INTO `ejercicio_fiscal` (`id`, `ano`, `situado`, `divisor`, `status`) VALUES
(3, '2025', '500000', '12', 1);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entes`
--

CREATE TABLE `entes` (
  `id` int(11) NOT NULL,
  `partida` int(255) NOT NULL,
  `sector` varchar(10) NOT NULL,
  `programa` varchar(10) NOT NULL,
  `proyecto` varchar(10) NOT NULL,
  `actividad` varchar(10) NOT NULL,
  `ente_nombre` longtext NOT NULL,
  `tipo_ente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entes`
--

INSERT INTO `entes` (`id`, `partida`, `sector`, `programa`, `proyecto`, `actividad`, `ente_nombre`, `tipo_ente`) VALUES
(1, 1, '1', '1', '0', '51', 'CONSEJO LEGISLATIVO', 'J'),
(2, 0, '1', '2', '0', '51', 'CONTRALORIA GENERAL DEL ESTADO', 'J'),
(3, 0, '1', '3', '0', '51', 'PROCURADORIA GENERAL', 'J'),
(4, 0, '1', '4', '0', '51', 'SECRETARIA DEL DESPACHO DEL GOBERNADOR YSECRETARIA DE LA GESTION PUBLICA', 'J'),
(5, 0, '1', '5', '0', '51', 'SECRETARIA GENERAL DE GOBIERNO', 'J'),
(6, 0, '1', '6', '0', '51', 'SECRETARIA EJECUTIVA DE GESTION HUMANO', 'J'),
(7, 0, '1', '7', '0', '51', 'SECRETARIA DE PLANIFICACION, PROYECTO Y PRESUPUESTO', 'J'),
(8, 0, '1', '8', '0', '51', 'SERVICIOS DE ADMINISTRACION', 'J'),
(9, 0, '1', '9', '0', '51', 'TESORERIA', 'J'),
(10, 0, '1', '10', '0', '51', 'SECRETARIA EJECUTIVA INDIGENA', 'J'),
(11, 0, '1', '11', '0', '51', 'AUDITORIA INTERNA', 'J'),
(12, 0, '2', '14', '0', '51', 'COORDINACION DE SERVICIOS POLICIALES', 'J'),
(13, 0, '2', '15', '0', '51', 'SECRETARIA DE POLITICA DE ASUNTOS FRONTERIZOS', 'J'),
(14, 0, '2', '16', '0', '51', 'PROTECCION CIVIL', 'J'),
(15, 0, '2', '17', '0', '51', 'PREVENCION Y CONTROL DE SINIESTRO (BOMBEROS)', 'J'),
(16, 0, '3', '18', '0', '51', 'SECREATARIA DE TURISMO', 'J'),
(18, 0, '4', '21', '0', '51', 'SEC. EJEC. PARA LA ATENCION DE  LA JUVENTUD Y ESTUDIANTE UNIVERSITARIO', 'J'),
(19, 0, '5', '22', '0', '51', 'SEC. EJEC.DEL SISTEMA DE INFOR. COM. ( SICOAMA)', 'J'),
(21, 0, '5', '24', '0', '51', 'SECRETARIA DE CULTURA', 'J'),
(22, 0, '6', '26', '0', '51', 'SECRETARIA DE INFRAESTRUCTURA', 'J'),
(23, 0, '7', '28', '0', '51', 'ADMINISTRATIVOS MALARIOLOGIA-GOBERNACION', 'J'),
(24, 0, '8', '29', '0', '51', 'SECRETARIA Y COORDINACION', 'J'),
(25, 0, '8', '32', '0', '51', 'PROTECCION SOCIAL', 'J'),
(26, 0, '9', '33', '0', '51', 'CONTRATACION COLECTIVA DE EMPLEADOS', 'J'),
(28, 0, '1', '13', '0', '51', 'SECREATARIA EJECUTIVA DE BIENES Y SERVICIOS', 'J'),
(29, 0, '10', '34', '0', '51', 'AMAVISION', 'D'),
(30, 0, '10', '34', '0', '51', 'FUNDACION ORQUESTA SINFONICA JUVENIL E INFANTIL DE AMAZONAS', 'D'),
(31, 0, '10', '34', '0', '51', 'FUNDACION CULTURAL ESCUELA ACADEMICA DE ORQUESTAS Y BANDAS DE AMAZONAS', 'D'),
(32, 0, '10', '34', '0', '51', 'ESCUELA INTEGRAL DE DANZAS', 'D'),
(33, 0, '10', '34', '0', '51', 'FUNDAPRODICAM', 'D'),
(34, 0, '10', '34', '0', '51', 'SUPERINTENDENCIA DE ADMINISTRACION TRIBUTARIA DEL ESTADO AMAZONAS (SATEAMAZ)', 'D'),
(35, 0, '10', '34', '0', '51', 'MUSEO ETNOLOGICO', 'D'),
(36, 0, '10', '34', '0', '51', 'INSTITUTO REGIONAL DE DEPORTE AMAZONAS (I.R.D.A)', 'D'),
(37, 0, '10', '34', '0', '51', 'U.N.A', 'D'),
(38, 0, '10', '34', '0', '51', 'BIBLIOTECA PUBLICA SIMON RODRIGUEZ', 'D'),
(39, 0, '10', '34', '0', '51', 'AMAZONAS F.C', 'D'),
(40, 0, '10', '34', '0', '51', 'UNIVERSIDAD EXPERIMENTAL POLITECNICA DE LA FUERZA ARMADA NACIONAL NUCLEO AMAZONAS', 'D'),
(41, 0, '10', '34', '0', '51', 'UPEL', 'D'),
(42, 0, '10', '34', '0', '51', 'FUNDACIONIHIRU', 'D'),
(43, 0, '10', '34', '0', '51', 'FUNDA SALUD', 'D'),
(44, 0, '10', '34', '0', '51', 'HOSPITAL DR. JOSE GREGORIO HERNANDEZ', 'D'),
(45, 0, '10', '34', '0', '51', 'A.C. HERMANAS DE JESUS RESUCITADO CASA HOGAR \"CARMEN MARTINEZ\"', 'D'),
(46, 0, '10', '34', '0', '51', 'SIUMA', 'D'),
(47, 0, '10', '34', '0', '51', 'FUNDACION PARA LA ATENCION INTEGRAL A LA MUJER DE AMAZONAS', 'D'),
(48, 0, '10', '34', '0', '51', 'FUNDACION DE SISTEMA DE ATENCION INTEGRAL PARA LAS PERSONAS CON DISCAPACIDAD (SAIPDIS)', 'D'),
(49, 0, '10', '34', '0', '51', 'FUNDACION CENTRO DE HISTORIA DE LA IDENTIDAD AMAZONENCE', 'D'),
(50, 0, '10', '34', '0', '51', 'INVIOBRAS AMAZONAS', 'D'),
(51, 0, '10', '34', '0', '51', 'FUNDACION PROMO-AMAZONAS', 'D'),
(52, 0, '10', '34', '0', '51', 'INSCATA', 'D'),
(53, 0, '10', '34', '0', '51', 'LUBRICANTES AMAZONAS C.A', 'D'),
(54, 0, '10', '34', '0', '51', 'ALIMENTOS AMAZONAS C.A', 'D'),
(55, 0, '10', '34', '0', '51', 'HIDROAMAZONAS C.A', 'D'),
(56, 0, '10', '34', '0', '51', 'ASFALTO Y PAVIMENTOS AMAZONAS C.A', 'D'),
(57, 0, '10', '34', '0', '51', 'COMBUSTIBLES AMAZONAS C.A', 'D'),
(58, 0, '10', '34', '0', '51', 'SANEAMIENTO AMBIENTAL C.A', 'D'),
(59, 0, '10', '34', '0', '51', 'BLOQUES Y AGREGADOS AMAZONAS C.A', 'D'),
(60, 0, '10', '34', '0', '51', 'TEXTILES AMAZONAS C.A', 'D'),
(61, 0, '10', '34', '0', '51', 'ACUARIOS AMAZONAS', 'D'),
(62, 0, '10', '34', '0', '51', 'EXPORTADORA AMAZONAS C.A', 'D'),
(63, 0, '10', '34', '0', '51', 'GAS COMUNAL AMAZONAS C.A', 'D'),
(64, 0, '10', '34', '0', '51', 'FARMA-AMAZONAS C.A', 'D'),
(65, 0, '10', '34', '0', '51', 'EMPRESA FLUVIALES AMAZONAS C.A', 'D'),
(66, 0, '10', '34', '0', '51', 'EMPRESA PUBLICA DE AMAZONAS C.A', 'D'),
(67, 0, '10', '34', '0', '51', 'EMPRESA DE SERVICIOS Y MANTENIMIENTO GENERALES AMAZONAS C.A (SERVIAMAZONAS)', 'D'),
(68, 0, '10', '34', '0', '51', 'EMPRESA DE TURISMO', 'D'),
(70, 0, '10', '34', '0', '51', 'VICARIATO APOSTOLICO', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entes_dependencias`
--

CREATE TABLE `entes_dependencias` (
  `id` int(255) NOT NULL,
  `partida` int(255) NOT NULL,
  `ue` varchar(10) DEFAULT NULL,
  `sector` varchar(10) DEFAULT NULL,
  `programa` varchar(10) DEFAULT NULL,
  `proyecto` varchar(10) DEFAULT NULL,
  `actividad` varchar(10) DEFAULT NULL,
  `ente_nombre` longtext DEFAULT NULL,
  `tipo_ente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entes_dependencias`
--

INSERT INTO `entes_dependencias` (`id`, `partida`, `ue`, `sector`, `programa`, `proyecto`, `actividad`, `ente_nombre`, `tipo_ente`) VALUES
(5, 1, '4', '1', '4', '0', '52', 'SECRETARIA EJECUTIVA', 'J'),
(6, 0, '4', '1', '4', '0', '53', 'CONTRATACIONES PUBLICAS', 'J'),
(7, 0, '4', '1', '4', '0', '54', 'ASESORIA JURIDICA', 'J'),
(9, 0, '5', '1', '5', '0', '52', 'SERVICIOS DE INFORMACION Y CUSTODIA DE DOCUMENTOS', 'J'),
(10, 0, '5', '1', '5', '0', '53', 'ASESORAMIENTO JURIDICO', 'J'),
(11, 0, '5', '1', '5', '0', '54', 'ASUNTOS POLITICOS', 'J'),
(12, 0, '5', '1', '5', '0', '55', 'OFICINA DEL FONDO DE COMPENSACION INTERRITORIAL', 'J'),
(14, 0, '6', '1', '6', '0', '52', 'RECLUTAMIENTO Y SELECCION Y EVALUACION DE PERSONAL', 'J'),
(15, 0, '6', '1', '6', '0', '53', 'REGISTRO Y CONTROL', 'J'),
(16, 0, '6', '1', '6', '0', '54', 'PREVISION SOCIAL', 'J'),
(17, 0, '6', '1', '6', '0', '55', 'RELACIONES LABORALES', 'J'),
(18, 0, '6', '1', '6', '0', '56', 'AUDITORIA, CONTROL Y FISCALIZACION LABORAL', 'J'),
(19, 0, '6', '1', '6', '0', '57', 'SEGURO SOCIAL', 'J'),
(20, 0, '6', '1', '6', '0', '58', 'ELABORACION PROCESAMIENTO Y GENERACION DE NOMINAS', 'J'),
(22, 0, '7', '1', '7', '0', '52', 'FORMULACION Y EVALUACION PRESUPUESTARIA', 'J'),
(23, 0, '7', '1', '7', '0', '53', 'CONTROL Y EJECUCION PRESUPUESTARIA', 'J'),
(24, 0, '7', '1', '7', '0', '54', 'PLANIFICACION Y EVALUACION DE PROYECTOS', 'J'),
(25, 0, '7', '1', '7', '0', '55', 'INFORMATICA', 'J'),
(27, 0, '8', '1', '8', '0', '52', 'SERVICIOS CONTABLES', 'J'),
(28, 0, '8', '1', '8', '0', '53', 'SERVICIOS DE COMPRAS Y SUMINISTROS', 'J'),
(29, 0, '8', '1', '8', '0', '54', 'OFICINA DE BINES Y SERVICIOS', 'J'),
(31, 0, '9', '1', '9', '0', '52', 'SERVICIOS CONTABLES DEL TESORO', 'J'),
(32, 0, '9', '1', '9', '0', '53', 'UNIDAD DE ORDENAMIENTO DE PAGO', 'J'),
(33, 0, '9', '1', '9', '0', '54', 'SERVICIO DE APOYO FISCAL', 'J'),
(36, 0, '11', '1', '11', '0', '52', 'OFICINA DE CONTROL POSTERIOR', 'J'),
(37, 0, '11', '1', '11', '0', '53', 'OFICINA DE  DETERMINACION DE RESPONSABILIDAD', 'J'),
(39, 0, '28', '1', '13', '0', '52', 'OFICINA DE REGISTRO Y CONTROL DE BIENES MUEBLES E INMUEBLES', 'J'),
(40, 0, '28', '1', '13', '0', '53', 'OFICINA DE CONTABILIDAD', 'J'),
(41, 0, '28', '1', '13', '0', '54', 'OFICINA DE INVENTARIOS', 'J'),
(42, 0, '28', '1', '13', '0', '55', 'SEGURIDAD Y VIGILANCIA', 'J'),
(44, 0, '12', '2', '14', '0', '52', 'CIRMIL', 'J'),
(49, 0, '16', '3', '18', '0', '52', 'OPERADORES TURISTICO Y EMPRENDEDORES', 'J'),
(50, 0, '16', '3', '18', '0', '53', 'PROMOCION Y COMUNICACIÓN', 'J'),
(51, 0, '16', '3', '18', '0', '54', 'INSPECTOR DE TURISMO', 'J'),
(52, 0, '17', '4', '20', '0', '52', 'JUBILADOS Y PENSIONADOS DE EDUCACION', 'J'),
(54, 0, '18', '4', '21', '0', '52', 'ASUNTOS DE LA JUVENTUD', 'J'),
(55, 0, '18', '4', '21', '0', '53', 'JEFATURA DE LOS ESTUDIANTES', 'J'),
(56, 0, '18', '4', '21', '0', '54', 'ORIENTACION Y PREVENCION A LOS ESTUDIANTES', 'J'),
(58, 0, '19', '5', '22', '0', '52', 'JEFATURA DE PRENSA', 'J'),
(59, 0, '19', '5', '22', '0', '53', 'JEFATURA COMUNICACIÓN DIGITAL', 'J'),
(60, 0, '19', '5', '22', '0', '54', 'JEFATURA DE DISEÑO Y PUBLICIDAD', 'J'),
(61, 0, '19', '5', '22', '0', '55', 'OFICINA DE REDES SOCIALES', 'J'),
(64, 0, '21', '5', '24', '0', '57', 'CONTRUCCION Y MEJORAMIENTO DE OBRAS EN BINES PARA EL DESARROLLO CULTURAL (FCI)', 'J'),
(66, 0, '22', '6', '26', '0', '52', 'DIVISION DE SUPERVICION Y EVALUACION DE PROYECTO', 'J'),
(67, 0, '22', '6', '26', '0', '53', 'DIVISION DE INFORMATICA, REGISTRO Y CONTROL', 'J'),
(68, 0, '22', '6', '26', '0', '54', 'ASESORIA LEGAL', 'J'),
(69, 0, '22', '6', '27', '1', '57', 'CONTRUCCION Y MEJORAMIENTO DE OBRAS  (FCI)', 'J'),
(71, 0, '23', '7', '28', '0', '52', 'CONTRATACION COLECTIVA OBREROS DE LA SALUD', 'J'),
(72, 0, '23', '7', '28', '1', '57', 'CONTRUCCION Y MEJORAS DE OBRAS EN BIENES PARA EL FORTALECIMIENTO DE LA SALUD (FCI)', 'J'),
(74, 0, '24', '8', '29', '0', '52', 'JEFATRA DE SOLUCION DE CONFLICTOS', 'J'),
(75, 0, '24', '8', '29', '0', '53', 'GESTION COMUNAL', 'J'),
(76, 0, '24', '8', '29', '0', '54', 'FORMACION Y ASESORIA LEGAL', 'J'),
(78, 0, '25', '8', '32', '0', '52', 'PROGRAMAS SOCIALES', 'J'),
(79, 0, '25', '8', '32', '0', '53', 'ATENCION AL SERVIDOR PUBLICO', 'J'),
(80, 0, '25', '8', '32', '0', '54', 'GESTION INSTITUCIONAL', 'J'),
(82, 0, '26', '9', '33', '0', '52', 'CONTRATACION COLECTIVA DE OBREROS DE INFRAESTRUCTURA', 'J'),
(83, 0, '26', '9', '33', '0', '53', 'PENSIONADOS Y JUBILADOS', 'J'),
(84, 0, '26', '9', '33', '0', '54', 'CONTRATADOS GOBERNACION', 'J'),
(85, 0, '26', '9', '33', '0', '55', 'PERSONAL DIRECTIVO DE ALTO NIVEL Y JEFATURAS', 'J'),
(130, 0, '1', '1', '1', '0', '51', 'CONSEJO LEGISLATIVO', 'J'),
(131, 0, '2', '1', '2', '0', '51', 'CONTRALORIA GENERAL DEL ESTADO', 'J'),
(132, 0, '3', '1', '3', '0', '51', 'PROCURADORIA GENERAL', 'J'),
(133, 0, '4', '1', '4', '0', '51', 'SECRETARIA DEL DESPACHO DEL GOBERNADOR Y SECRETARIA DE LA GESTION PUBLICA', 'J'),
(134, 0, '5', '1', '5', '0', '51', 'SECRETARIA GENERAL DE GOBIERNO', 'J'),
(135, 0, '6', '1', '6', '0', '51', 'SECRETARIA EJECUTIVA DE GESTION HUMANO', 'J'),
(136, 0, '7', '1', '7', '0', '51', 'SECRETARIA DE PLANIFICACION, PROYECTO Y PRESUPUESTO', 'J'),
(137, 0, '8', '1', '8', '0', '51', 'SERVICIOS DE ADMINISTRACION', 'J'),
(138, 0, '9', '1', '9', '0', '51', 'TESORERIA', 'J'),
(139, 0, '10', '1', '10', '0', '51', 'SECRETARIA EJECUTIVA INDIGENA', 'J'),
(140, 0, '11', '1', '11', '0', '51', 'AUDITORIA INTERNA', 'J'),
(141, 0, '12', '2', '14', '0', '51', 'COORDINACION DE SERVICIOS POLICIALES', 'J'),
(142, 0, '13', '2', '15', '0', '51', 'SECRETARIA DE POLITICA DE ASUNTOS FRONTERIZOS', 'J'),
(143, 0, '14', '2', '16', '0', '51', 'PROTECCION CIVIL', 'J'),
(144, 0, '15', '2', '17', '0', '51', 'PREVENCION Y CONTROL DE SINIESTRO (BOMBEROS)', 'J'),
(145, 0, '16', '3', '18', '0', '51', 'SECRETARIA DE TURISMO', 'J'),
(146, 0, '18', '4', '21', '0', '51', 'SEC. EJEC. PARA LA ATENCION DE LA JUVENTUD Y ESTUDIANTE UNIVERSITARIO', 'J'),
(147, 0, '19', '5', '22', '0', '51', 'SEC. EJEC. DEL SISTEMA DE INFOR. COM. (SICOAMA)', 'J'),
(148, 0, '21', '5', '24', '0', '51', 'SECRETARIA DE CULTURA', 'J'),
(149, 0, '22', '6', '26', '0', '51', 'SECRETARIA DE INFRAESTRUCTURA', 'J'),
(150, 0, '23', '7', '28', '0', '51', 'ADMINISTRATIVOS MALARIOLOGIA-GOBERNACION', 'J'),
(151, 0, '24', '8', '29', '0', '51', 'SECRETARIA Y COORDINACION', 'J'),
(152, 0, '25', '8', '32', '0', '51', 'PROTECCION SOCIAL', 'J'),
(153, 0, '26', '9', '33', '0', '51', 'CONTRATACION COLECTIVA DE EMPLEADOS', 'J'),
(154, 0, '28', '1', '13', '0', '51', 'SECRETARIA EJECUTIVA DE BIENES Y SERVICIOS', 'J'),
(155, 0, '29', '10', '34', '0', '51', 'AMAVISION', 'D'),
(156, 0, '30', '10', '34', '0', '51', 'FUNDACION ORQUESTA SINFONICA JUVENIL E INFANTIL DE AMAZONAS', 'D'),
(157, 0, '31', '10', '34', '0', '51', 'FUNDACION CULTURAL ESCUELA ACADEMICA DE ORQUESTAS Y BANDAS DE AMAZONAS', 'D'),
(158, 0, '32', '10', '34', '0', '51', 'ESCUELA INTEGRAL DE DANZAS', 'D'),
(159, 0, '33', '10', '34', '0', '51', 'FUNDAPRODICAM', 'D'),
(160, 0, '34', '10', '34', '0', '51', 'SUPERINTENDENCIA DE ADMINISTRACION TRIBUTARIA DEL ESTADO AMAZONAS (SATEAMAZ)', 'D'),
(161, 0, '35', '10', '34', '0', '51', 'MUSEO ETNOLOGICO', 'D'),
(162, 0, '36', '10', '34', '0', '51', 'INSTITUTO REGIONAL DE DEPORTE AMAZONAS (I.R.D.A)', 'D'),
(163, 0, '37', '10', '34', '0', '51', 'U.N.A', 'D'),
(164, 0, '38', '10', '34', '0', '51', 'BIBLIOTECA PUBLICA SIMON RODRIGUEZ', 'D'),
(165, 0, '39', '10', '34', '0', '51', 'AMAZONAS F.C', 'D'),
(166, 0, '40', '10', '34', '0', '51', 'UNIVERSIDAD EXPERIMENTAL POLITECNICA DE LA FUERZA ARMADA NACIONAL NUCLEO AMAZONAS', 'D'),
(167, 0, '41', '10', '34', '0', '51', 'UPEL', 'D'),
(168, 0, '42', '10', '34', '0', '51', 'FUNDACIONIHIRU', 'D'),
(169, 0, '43', '10', '34', '0', '51', 'FUNDA SALUD', 'D'),
(170, 0, '44', '10', '34', '0', '51', 'HOSPITAL DR. JOSE GREGORIO HERNANDEZ', 'D'),
(171, 0, '45', '10', '34', '0', '51', 'A.C. HERMANAS DE JESUS RESUCITADO CASA HOGAR \"CARMEN MARTINEZ\"', 'D'),
(172, 0, '46', '10', '34', '0', '51', 'SIUMA', 'D'),
(173, 0, '47', '10', '34', '0', '51', 'FUNDACION PARA LA ATENCION INTEGRAL A LA MUJER DE AMAZONAS', 'D'),
(174, 0, '48', '10', '34', '0', '51', 'FUNDACION DE SISTEMA DE ATENCION INTEGRAL PARA LAS PERSONAS CON DISCAPACIDAD (SAIPDIS)', 'D'),
(175, 0, '49', '10', '34', '0', '51', 'FUNDACION CENTRO DE HISTORIA DE LA IDENTIDAD AMAZONENCE', 'D'),
(176, 0, '50', '10', '34', '0', '51', 'INVIOBRAS AMAZONAS', 'D'),
(177, 0, '51', '10', '34', '0', '51', 'FUNDACION PROMO-AMAZONAS', 'D'),
(178, 0, '52', '10', '34', '0', '51', 'INSCATA', 'D'),
(179, 0, '53', '10', '34', '0', '51', 'LUBRICANTES AMAZONAS C.A', 'D'),
(180, 0, '54', '10', '34', '0', '51', 'ALIMENTOS AMAZONAS C.A', 'D'),
(181, 0, '55', '10', '34', '0', '51', 'HIDROAMAZONAS C.A', 'D'),
(182, 0, '56', '10', '34', '0', '51', 'ASFALTO Y PAVIMENTOS AMAZONAS C.A', 'D'),
(183, 0, '57', '10', '34', '0', '51', 'COMBUSTIBLES AMAZONAS C.A', 'D'),
(184, 0, '58', '10', '34', '0', '51', 'SANEAMIENTO AMBIENTAL C.A', 'D'),
(185, 0, '59', '10', '34', '0', '51', 'BLOQUES Y AGREGADOS AMAZONAS C.A', 'D'),
(186, 0, '60', '10', '34', '0', '51', 'TEXTILES AMAZONAS C.A', 'D'),
(187, 0, '61', '10', '34', '0', '51', 'ACUARIOS AMAZONAS', 'D'),
(188, 0, '62', '10', '34', '0', '51', 'EXPORTADORA AMAZONAS C.A', 'D'),
(189, 0, '63', '10', '34', '0', '51', 'GAS COMUNAL AMAZONAS C.A', 'D'),
(190, 0, '64', '10', '34', '0', '51', 'FARMA-AMAZONAS C.A', 'D'),
(191, 0, '65', '10', '34', '0', '51', 'EMPRESA FLUVIALES AMAZONAS C.A', 'D'),
(192, 0, '66', '10', '34', '0', '51', 'EMPRESA PUBLICA DE AMAZONAS C.A', 'D'),
(193, 0, '67', '10', '34', '0', '51', 'EMPRESA DE SERVICIOS Y MANTENIMIENTO GENERALES AMAZONAS C.A (SERVIAMAZONAS)', 'D'),
(194, 0, '68', '10', '34', '0', '51', 'EMPRESA DE TURISMO', 'D'),
(195, 0, '70', '10', '34', '0', '51', 'VICARIATO APOSTOLICO', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `error_log`
--

CREATE TABLE `error_log` (
  `id` int(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `error_log`
--

INSERT INTO `error_log` (`id`, `descripcion`, `fecha`) VALUES
(1, 'Error al actualizar el proyecto de inversión.', '2024-10-15 20:02:13'),
(2, 'Una partida ya está registrada en este ejercicio fiscal: 15.01.00.401.01.01.0000', '2024-10-18 17:15:35'),
(3, 'Una partida ya esta en uso en el mismo sector: 401.01.01.0000', '2024-10-24 11:21:20'),
(4, 'El tipo de ente Descentralizado solo permite una distribución.', '2024-10-24 12:51:44'),
(5, 'La suma de los montos de las distribuciones no es igual al monto total.', '2024-10-24 12:53:07'),
(6, 'La suma de los montos de las distribuciones no es igual al monto total.', '2024-10-24 20:46:06'),
(7, 'El tipo de ente Descentralizado solo permite una distribución.[{\"id_distribucion\":\"13\",\"monto\":500},{\"id_distribucion\":\"14\",\"monto\":500},{\"id_distribucion\":\"15\",\"monto\":500},{\"id_distribucion\":\"16\",\"monto\":500}]', '2024-11-05 08:31:33'),
(8, 'La suma de los montos de las distribuciones es mayor al monto total de la asignacion.', '2024-12-16 08:52:02'),
(9, 'La suma de los montos de las distribuciones es mayor al monto total de la asignacion.', '2024-12-16 08:52:09'),
(10, 'El presupuesto actual es insuficiente para el monto de la partida: 400.00.00.00.0000', '2024-12-17 09:05:32'),
(11, 'La solicitud ya ha sido procesada anteriormente', '2024-12-17 09:15:47'),
(12, 'El presupuesto actual es insuficiente para el monto del gasto en la distribución con ID: 16', '2024-12-18 10:18:39');



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE `gastos` (
  `id` int(255) NOT NULL,
  `id_tipo` int(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `status` int(255) NOT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `beneficiario` longtext NOT NULL,
  `identificador` longtext NOT NULL,
  `distribuciones` longtext NOT NULL,
  `fecha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`id`, `id_tipo`, `descripcion`, `monto`, `status`, `id_ejercicio`, `beneficiario`, `identificador`, `distribuciones`, `fecha`) VALUES
(2, 2, 'fsafsafa', '1000', 1, 2, 'fsafafa', '2425252', '[{\"id_distribucion\":16,\"monto\":1000}]', '2024-12-17'),
(3, 2, 'fsafafa', '1001', 1, 2, 'gwgwgw', '2425252', '[{\"id_distribucion\":17,\"monto\":1001}]', '2024-12-18'),
(4, 2, 'fsafa', '1000', 1, 2, 'fsfw2f2', '2425252', '[{\"id_distribucion\":16,\"monto\":1000}]', '2024-12-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_consejo`
--

CREATE TABLE `informacion_consejo` (
  `id` int(255) NOT NULL,
  `nombre_apellido_presidente` longtext NOT NULL,
  `nombre_apellido_secretario` longtext NOT NULL,
  `domicilio` longtext NOT NULL,
  `telefono` longtext NOT NULL,
  `pagina_web` longtext NOT NULL,
  `email` longtext NOT NULL,
  `consejo_local` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_consejo`
--

INSERT INTO `informacion_consejo` (`id`, `nombre_apellido_presidente`, `nombre_apellido_secretario`, `domicilio`, `telefono`, `pagina_web`, `email`, `consejo_local`) VALUES
(1, 'Lesgiladora: Delkis Bastidas', 'Abg. Lester Mirabal', 'Avenida Aeropuerto Sector \"Simón Bolivar\".', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_contraloria`
--

CREATE TABLE `informacion_contraloria` (
  `id` int(255) NOT NULL,
  `nombre_apellido_contralor` longtext NOT NULL,
  `domicilio` longtext NOT NULL,
  `telefono` longtext NOT NULL,
  `pagina_web` longtext NOT NULL,
  `email` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_contraloria`
--

INSERT INTO `informacion_contraloria` (`id`, `nombre_apellido_contralor`, `domicilio`, `telefono`, `pagina_web`, `email`) VALUES
(1, 'Abog. Guillermo Forti', 'AVENIDA AEROPUERTO SECTOR LOS LIRIOS \"SEDE DE LA  CONTRALORIA\"', '0248-5212759', 'www.contraloriaestadoamazonas.gob.ve', 'contraloria_amazonas@yahoo.es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_gobernacion`
--

CREATE TABLE `informacion_gobernacion` (
  `id` int(255) NOT NULL,
  `identificacion` longtext NOT NULL,
  `domicilio` longtext NOT NULL,
  `telefono` longtext NOT NULL,
  `pagina_web` longtext NOT NULL,
  `fax` longtext NOT NULL,
  `codigo_postal` longtext NOT NULL,
  `nombre_apellido_gobernador` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_gobernacion`
--

INSERT INTO `informacion_gobernacion` (`id`, `identificacion`, `domicilio`, `telefono`, `pagina_web`, `fax`, `codigo_postal`, `nombre_apellido_gobernador`) VALUES
(1, 'GOBERNACIÓN DE AMAZONAS', 'AVENIDA RIO NEGRO. FRENTE A LA PLAZA BOLIVAR.', '0248-5212759', 'www.contraloriaestadoamazonas.gob.ve', '', '7101', 'Ing.MIGUEL RODRIGUEZ');



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_personas`
--

CREATE TABLE `informacion_personas` (
  `id` int(255) NOT NULL,
  `nombres` longtext NOT NULL,
  `cargo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_personas`
--

INSERT INTO `informacion_personas` (`id`, `nombres`, `cargo`) VALUES
(1, 'LEG. DELKIS BASTIDAS ', 'PRESIDENTA'),
(2, 'ABOG. LESTER MIRABAL', 'SECRETARIO DE CÁMARA '),
(3, 'ING. MIGUEL RODRÍGUEZ', 'GOBERNADOR DEL ESTADO AMAZONAS'),
(4, 'ING. ANALI HERRERA', 'SECRETARIA EJECUTIVA DE GOBIERNO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(1) NOT NULL,
  `oficina` varchar(255) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `dir` varchar(255) DEFAULT NULL,
  `icono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `oficina`, `categoria`, `nombre`, `dir`, `icono`) VALUES
(1, 'pl_formulacion', NULL, 'Ejercicio fiscal', 'mod_pl_formulacion/index', 'bx-home'),
(2, 'pl_formulacion', NULL, 'Distribución', 'mod_pl_formulacion/form_distribucion_presupuestaria_vista', 'bx-objects-horizontal-center'),
(3, 'pl_formulacion', NULL, 'Distribución por entes', 'mod_pl_formulacion/form_asignacion_entes_vista', 'bx-sitemap'),
(4, 'pl_formulacion', NULL, 'Plan de inversión', 'mod_pl_formulacion/form_plan_inversion', 'bx-calendar-event'),
(5, 'pl_formulacion', NULL, 'Metas por programa', 'mod_pl_formulacion/form_metas', 'bx-flag'),
(6, 'pl_formulacion', 'Configuracion', 'Nuevas Partidas', 'mod_pl_formulacion/form_partidas_tabla', 'bx-objects-horizontal-right'),
(7, 'pl_formulacion', 'Configuracion', 'Denominación de partidas', 'mod_pl_formulacion/form_partidas_denominaciones', 'bx-objects-horizontal-right'),
(8, 'pl_formulacion', 'Configuracion', 'Nuevas Actividades', 'mod_pl_formulacion/form_actividades', NULL),
(9, 'pl_formulacion', 'Configuracion', 'Nuevas Unidades', 'mod_pl_formulacion/form_unidades', 'bx-buildings'),
(10, 'pl_formulacion', 'Configuracion', 'Nuevos Sectores', 'mod_pl_formulacion/form_sectores', 'bx-objects-horizontal-right'),
(11, 'pl_formulacion', 'Configuracion', 'Nuevos Programas', 'mod_pl_formulacion/form_programas', 'bx-objects-horizontal-right'),
(12, 'pl_formulacion', 'Configuracion', 'Descripcion de programas', 'mod_pl_formulacion/form_descripcionPrograma_tabla', NULL),
(13, 'pl_formulacion', 'Configuracion', 'Nuevos Proyectos', 'mod_pl_formulacion/form_proyecto', 'bx-objects-horizontal-right'),
(14, 'pl_formulacion', 'Teoría y leyes', 'Gobernación', 'mod_pl_formulacion/form_gobernacion_tabla', NULL),
(15, 'pl_formulacion', 'Teoría y leyes', 'Directivos', 'mod_pl_formulacion/form_directivos_tabla', NULL),
(16, 'pl_formulacion', 'Teoría y leyes', 'Contraloría', 'mod_pl_formulacion/form_contraloria_tabla', NULL),
(17, 'pl_formulacion', 'Teoría y leyes', 'Consejo', 'mod_pl_formulacion/form_consejo_tabla', NULL),
(18, 'pl_formulacion', 'Teoría y leyes', 'Personas', 'mod_pl_formulacion/form_persona_tabla', NULL),
(19, 'pl_formulacion', 'Teoría y leyes', 'Articulos', 'mod_pl_formulacion/form_titulo1_tabla', NULL),
(20, 'ejecucion_p', 'Ejecución presupuestaria', 'Solicitudes de dozavo', 'mod_ejecucion_presupuestaria/pre_solicitudes_tabla', 'bx-cog'),
(21, 'ejecucion_p', 'Ejecución presupuestaria', 'Gastos de Funcionamiento', 'mod_ejecucion_presupuestaria/pre_gastos_form', 'bx-cog'),
(22, 'relaciones_laborales', NULL, 'Netos de pago', 'mod_relaciones_laborales/index', 'bx-detail'),
(23, 'registro_control', NULL, 'Pagos de Nómina', 'mod_registro_control/index', 'bx-file'),
(24, 'registro_control', NULL, 'Reintegros', 'mod_registro_control/regcom_reintegros', 'bx-refresh'),
(25, 'nomina', 'Mantenimiento', 'Inicio', 'mod_nomina/index', 'bx-cog'),
(26, 'nomina', 'Mantenimiento', 'Reportes', 'mod_nomina/nom_reportes', 'bx-cog'),
(27, 'nomina', 'Mantenimiento', 'Estatus', 'mod_nomina/nom_errores', 'bx-cog'),
(28, 'nomina', 'Mantenimiento', 'Nuevos campos', 'mod_nomina/nom_columnas', 'bx-cog'),
(29, 'nomina', 'Mantenimiento', 'Asignar valores', 'mod_nomina/nom_valores', 'bx-cog'),
(30, 'nomina', 'Movimientos', 'Gestión de Unidades', 'mod_nomina/nom_dependencias', 'bx-objects-vertical-bottom'),
(31, 'nomina', 'Movimientos', 'Unidades', 'mod_nomina/nom_dependencias_tabla', 'bx-objects-vertical-bottom'),
(32, 'nomina', 'Movimientos', 'Conceptos', 'mod_nomina/nom_conceptos', 'bx-objects-vertical-bottom'),
(33, 'nomina', 'Movimientos', 'Tabuladores', 'mod_nomina/nom_tabulador_tabla', 'bx-objects-vertical-bottom'),
(34, 'nomina', 'Movimientos', 'Empleados', 'mod_nomina/nom_empleados_tabla', 'bx-objects-vertical-bottom'),
(35, 'nomina', 'Movimientos', 'Estatus de empleados', 'mod_nomina/nom_estatus_empleados', 'bx-objects-vertical-bottom'),
(36, 'nomina', 'Movimientos', 'Categorías', 'mod_nomina/nom_categorias_tabla', 'bx-objects-vertical-bottom'),
(37, 'nomina', 'Movimientos', 'Bancos', 'mod_nomina/nom_bancos', 'bx-objects-vertical-bottom'),
(38, 'nomina', 'Nómina', 'Registro de nominas', 'mod_nomina/nom_grupos', 'bx-wallet-alt'),
(39, 'nomina', 'Nómina', 'Pagar nomina', 'mod_nomina/nom_peticiones_form', 'bx-wallet-alt'),
(40, 'pl_formulacion', NULL, 'Reportes', 'mod_pl_formulacion/form_reportes', 'bx-download'),
(42, '', 'usuarios', 'Seguimiento general', 'mod_global/global_user_logs', NULL),
(43, 'entes', NULL, 'Solicitudes dozavos', 'mod_entes/entes_solicitudes_vista', 'bx-envelope');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `id_empleado` int(10) NOT NULL,
  `id_nomina` varchar(255) DEFAULT NULL,
  `fecha_movimiento` datetime NOT NULL DEFAULT current_timestamp(),
  `accion` varchar(50) DEFAULT NULL,
  `tabla` varchar(255) DEFAULT NULL,
  `campo` varchar(255) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `valor_anterior` varchar(255) DEFAULT NULL,
  `valor_nuevo` varchar(255) DEFAULT NULL,
  `usuario_id` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `id_empleado`, `id_nomina`, `fecha_movimiento`, `accion`, `tabla`, `campo`, `descripcion`, `valor_anterior`, `valor_nuevo`, `usuario_id`, `status`) VALUES
(9, 1061, '0', '2024-07-15 19:54:28', 'UPDATE', '', '', 'Se han modificado los campos: hijos: 1. ', '', '', '38', 1),
(10, 1061, '0', '2024-07-15 19:54:52', 'UPDATE', '', '', 'Se han modificado los campos: hijos: 2. ', '', '', '38', 1),
(13, 1061, '[33,34,35]', '2024-08-19 12:30:18', 'UPDATE', 'empleados', 'nombres', 'Se han modificado los campos: nombres:  GAVINI MEDINA CARMEN2. ', ' GAVINI MEDINA CARMEN', ' GAVINI MEDINA CARMEN2', '31', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `user_1` int(11) NOT NULL,
  `user_2` varchar(150) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `guia` longtext DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `visto` int(1) NOT NULL DEFAULT 0,
  `comentario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `user_1`, `user_2`, `tipo`, `guia`, `date`, `visto`, `comentario`) VALUES
(6, 31, '33', 1, 'http://localhost/sigob/front/mod_registro_control/regcon_nomina_comparar', '2024-06-20 21:00:40', 0, 'Inicio el pago de una nomina'),
(7, 33, '31', 9, 'http://localhost/sigob/front/mod_nomina/nom_peticiones_tabla', '2024-08-28 00:47:47', 0, 'Aprobo el pago de nomina'),
(8, 33, '31', 9, 'http://localhost/sigob/front/mod_nomina/nom_peticiones_tabla', '2024-08-28 01:23:17', 0, 'Aprobo el pago de nomina'),
(9, 33, '31', 9, 'http://localhost/sigob/front/mod_nomina/nom_peticiones_tabla', '2024-08-28 23:23:47', 0, 'Aprobo el pago de nomina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidas_presupuestarias`
--

CREATE TABLE `partidas_presupuestarias` (
  `id` int(11) NOT NULL,
  `partida` varchar(255) DEFAULT NULL,
  `nombre` longtext DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `status` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidas_presupuestarias`
--

INSERT INTO `partidas_presupuestarias` (`id`, `partida`, `nombre`, `descripcion`, `status`) VALUES
(724, '400.00.00.00.0000', NULL, 'EGRESOS', 0),
(725, '401.00.00.00.0000', NULL, 'GASTOS DE PERSONAL', 0),
(726, '401.01.00.00.0000', NULL, 'Sueldos, salarios y otras retribuciones', 0),
(727, '401.01.01.00.0000', NULL, 'Sueldos básicos personal fijo a tiempo completo', 0),
(728, '401.01.02.00.0000', NULL, 'Sueldos básicos personal fijo a tiempo parcial', 0),
(729, '401.01.03.00.0000', NULL, 'Suplencias al personal empleado', 0),
(730, '401.01.08.00.0000', NULL, 'Sueldo al personal en trámite de nombramiento', 0),
(731, '401.01.09.00.0000', NULL, 'Remuneraciones al personal en período de disponibilidad', 0),
(732, '401.01.10.00.0000', NULL, 'Salarios al personal obrero en puestos permanentes a tiempo completo', 0),
(733, '401.01.11.00.0000', NULL, 'Salarios al personal obrero en puestos permanentes a tiempo parcial', 0),
(734, '401.01.12.00.0000', NULL, 'Salarios al personal obrero en puestos no permanentes', 0),
(735, '401.01.13.00.0000', NULL, 'Suplencias al personal obrero', 0),
(736, '401.01.18.00.0000', NULL, 'Remuneraciones al personal contratado', 0),
(737, '401.01.18.01.0000', NULL, 'Remuneraciones al personal contratado a tiempo determinado', 0),
(738, '401.01.18.02.0000', NULL, 'Remuneraciones por honorarios profesionales', 0),
(739, '401.01.19.00.0000', NULL, 'Retribuciones por becas - salarios, bolsas de trabajo, pasantías y similares', 0),
(740, '401.01.20.00.0000', NULL, 'Sueldo del personal militar profesional', 0),
(741, '401.01.21.00.0000', NULL, 'Sueldo o ración del personal militar no profesional', 0),
(742, '401.01.22.00.0000', NULL, 'Sueldo del personal militar de reserva', 0),
(743, '401.01.29.00.0000', NULL, 'Dietas', 0),
(744, '401.01.30.00.0000', NULL, 'Retribución al personal de reserva', 0),
(745, '401.01.35.00.0000', NULL, 'Sueldo básico de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(746, '401.01.36.00.0000', NULL, 'Sueldo básico del personal de alto nivel y de dirección', 0),
(747, '401.01.37.00.0000', NULL, 'Dietas de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(748, '401.01.38.00.0000', NULL, 'Dietas del personal de alto nivel y de dirección', 0),
(749, '401.01.99.00.0000', NULL, 'Otras retribuciones', 0),
(750, '401.02.00.00.0000', NULL, 'Compensaciones previstas en las escalas de sueldos y salarios', 0),
(751, '401.02.01.00.0000', NULL, 'Compensaciones previstas en las escalas de sueldos al personal empleado fijo a tiempo completo', 0),
(752, '401.02.02.00.0000', NULL, 'Compensaciones previstas en las escalas de sueldos al personal empleado fijo a tiempo parcial', 0),
(753, '401.02.03.00.0000', NULL, 'Compensaciones previstas en las escalas de salarios al personal obrero fijo a tiempo completo', 0),
(754, '401.02.04.00.0000', NULL, 'Compensaciones previstas en las escalas de salarios al personal obrero fijo a tiempo parcial', 0),
(755, '401.02.05.00.0000', NULL, 'Compensaciones previstas en las escalas de sueldos al personal militar', 0),
(756, '401.02.06.00.0000', NULL, 'Compensaciones previstas en las escalas de sueldos de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(757, '401.02.07.00.0000', NULL, 'Compensaciones previstas en las escalas de sueldos del personal de alto nivel y de dirección', 0),
(758, '401.03.00.00.0000', NULL, 'Primas', 0),
(759, '401.03.01.00.0000', NULL, 'Primas por mérito al personal empleado', 0),
(760, '401.03.02.00.0000', NULL, 'Primas de transporte al personal empleado', 0),
(761, '401.03.03.00.0000', NULL, 'Primas por hogar para la protección y estabilidad familiar del personal empleado.', 0),
(762, '401.03.04.00.0000', NULL, 'Primas por hijos e hijas al personal empleado', 0),
(763, '401.03.05.00.0000', NULL, 'Primas por alquileres al personal empleado', 0),
(764, '401.03.06.00.0000', NULL, 'Primas por residencia al personal empleado', 0),
(765, '401.03.07.00.0000', NULL, 'Primas por categoría de escuelas al personal empleado', 0),
(766, '401.03.08.00.0000', NULL, 'Primas de profesionalización al personal empleado', 0),
(767, '401.03.09.00.0000', NULL, 'Primas por antigüedad al personal empleado', 0),
(768, '401.03.10.00.0000', NULL, 'Primas por jerarquía o responsabilidad en el cargo', 0),
(769, '401.03.11.00.0000', NULL, 'Primas al personal en servicio en el exterior', 0),
(770, '401.03.16.00.0000', NULL, 'Primas por mérito al personal obrero', 0),
(771, '401.03.17.00.0000', NULL, 'Primas de transporte al personal obrero', 0),
(772, '401.03.18.00.0000', NULL, 'Primas por hogar para la protección y estabilidad familiar del personal obrero.', 0),
(773, '401.03.19.00.0000', NULL, 'Primas por hijos e hijas al personal obrero', 0),
(774, '401.03.20.00.0000', NULL, 'Primas por residencia al personal obrero', 0),
(775, '401.03.21.00.0000', NULL, 'Primas por antigüedad al personal obrero', 0),
(776, '401.03.22.00.0000', NULL, 'Primas de profesionalización al personal obrero', 0),
(777, '401.03.26.00.0000', NULL, 'Primas por hijos e hijas al personal militar', 0),
(778, '401.03.27.00.0000', NULL, 'Primas de profesionalización al personal militar', 0),
(779, '401.03.28.00.0000', NULL, 'Primas por antigüedad al personal militar', 0),
(780, '401.03.29.00.0000', NULL, 'Primas por potencial de ascenso al personal militar', 0),
(781, '401.03.30.00.0000', NULL, 'Primas por frontera y sitios inhóspitos al personal militar y de seguridad', 0),
(782, '401.03.31.00.0000', NULL, 'Primas por riesgo al personal militar y de seguridad', 0),
(783, '401.03.37.00.0000', NULL, 'Primas de transporte al personal contratado', 0),
(784, '401.03.38.00.0000', NULL, 'Primas por hogar para la protección y estabilidad familiar del personal contratado', 0),
(785, '401.03.39.00.0000', NULL, 'Primas por hijos e hijas al personal contratado', 0),
(786, '401.03.40.00.0000', NULL, 'Primas de profesionalización al personal contratado', 0),
(787, '401.03.41.00.0000', NULL, 'Primas por antigüedad al personal contratado', 0),
(788, '401.03.42.00.0000', NULL, 'Primas por hijos e hijas de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(789, '401.03.43.00.0000', NULL, 'Primas de profesionalización de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(790, '401.03.44.00.0000', NULL, 'Primas por antigüedad de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(791, '401.03.45.00.0000', NULL, 'Primas por hijos e hijas al personal de alto nivel y de dirección', 0),
(792, '401.03.48.00.0000', NULL, ' Primas de profesionalización al personal de alto nivel y de dirección ', 0),
(793, '401.03.49.00.0000', NULL, 'Primas de antigüedad al personal de alto nivel y de dirección', 0),
(794, '401.03.50.00.0000', NULL, 'Primas por hogar para la protección y estabilidad familiar de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(795, '401.03.51.00.0000', NULL, 'Primas por hogar para la protección y estabilidad familiar al personal de alto nivel y de dirección', 0),
(796, '401.03.94.00.0000', NULL, 'Otras primas a los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(797, '401.03.95.00.0000', NULL, 'Otras primas al personal de alto nivel y de dirección', 0),
(798, '401.03.96.00.0000', NULL, 'Otras primas al personal contratado', 0),
(799, '401.03.97.00.0000', NULL, 'Otras primas al personal empleado', 0),
(800, '401.03.98.00.0000', NULL, 'Otras primas al personal obrero', 0),
(801, '401.03.99.00.0000', NULL, 'Otras primas al personal militar', 0),
(802, '401.04.00.00.0000', NULL, 'Complementos de sueldos y salarios', 0),
(803, '401.04.01.00.0000', NULL, 'Complemento al personal empleado por horas extraordinarias o por sobre tiempo', 0),
(804, '401.04.02.00.0000', NULL, 'Complemento al personal empleado por trabajo nocturno', 0),
(805, '401.04.03.00.0000', NULL, 'Complemento al personal empleado por gastos de alimentación', 0),
(806, '401.04.04.00.0000', NULL, 'Complemento al personal empleado por gastos de transporte', 0),
(807, '401.04.05.00.0000', NULL, 'Complemento al personal empleado por gastos de representación', 0),
(808, '401.04.06.00.0000', NULL, 'Complemento al personal empleado por comisión de servicios', 0),
(809, '401.04.07.00.0000', NULL, 'Bonificación al personal empleado', 0),
(810, '401.04.08.00.0000', NULL, 'Bono compensatorio de alimentación al personal empleado', 0),
(811, '401.04.09.00.0000', NULL, 'Bono compensatorio de transporte al personal empleado', 0),
(812, '401.04.10.00.0000', NULL, 'Complemento al personal empleado por días feriados', 0),
(813, '401.04.14.00.0000', NULL, 'Complemento al personal obrero por horas extraordinarias o por sobre tiempo', 0),
(814, '401.04.15.00.0000', NULL, 'Complemento al personal obrero por trabajo o jornada nocturna', 0),
(815, '401.04.16.00.0000', NULL, 'Complemento al personal obrero por gastos de alimentación', 0),
(816, '401.04.17.00.0000', NULL, 'Complemento al personal obrero por gastos de transporte', 0),
(817, '401.04.18.00.0000', NULL, 'Bono compensatorio de alimentación al personal obrero', 0),
(818, '401.04.19.00.0000', NULL, 'Bono compensatorio de transporte al personal obrero', 0),
(819, '401.04.20.00.0000', NULL, 'Complemento al personal obrero por días feriados', 0),
(820, '401.04.24.00.0000', NULL, 'Complemento al personal contratado por horas extraordinarias o por sobre tiempo', 0),
(821, '401.04.25.00.0000', NULL, 'Complemento al personal contratado por gastos de alimentación', 0),
(822, '401.04.26.00.0000', NULL, 'Bono compensatorio de alimentación al personal contratado', 0),
(823, '401.04.27.00.0000', NULL, 'Bono compensatorio de transporte al personal contratado', 0),
(824, '401.04.28.00.0000', NULL, 'Complemento al personal contratado por días feriados', 0),
(825, '401.04.32.00.0000', NULL, 'Complemento al personal militar por gastos de alimentación', 0),
(826, '401.04.33.00.0000', NULL, 'Complemento al personal militar por gastos de transporte', 0),
(827, '401.04.34.00.0000', NULL, 'Complemento al personal militar en el exterior', 0),
(828, '401.04.35.00.0000', NULL, 'Bono compensatorio de alimentación al personal militar', 0),
(829, '401.04.43.00.0000', NULL, 'Complemento a altos funcionarios y altas funcionarias del poder público y de elección popular por gastos de representación', 0),
(830, '401.04.44.00.0000', NULL, 'Complemento a altos funcionarios y altas funcionarias del poder público y de elección popular por comisión de servicios', 0),
(831, '401.04.45.00.0000', NULL, 'Bonificación a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(832, '401.04.46.00.0000', NULL, 'Bono compensatorio de alimentación a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(833, '401.04.47.00.0000', NULL, 'Bono compensatorio de transporte a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(834, '401.04.48.00.0000', NULL, 'Complemento al personal de alto nivel y de dirección por gastos de representación', 0),
(835, '401.04.49.00.0000', NULL, 'Complemento al personal de alto nivel y de dirección por comisión de servicios', 0),
(836, '401.04.50.00.0000', NULL, 'Bonificación al personal de alto nivel y de dirección', 0),
(837, '401.04.51.00.0000', NULL, 'Bono compensatorio de alimentación al personal de alto nivel y de dirección', 0),
(838, '401.04.52.00.0000', NULL, 'Bono compensatorio de transporte al personal de alto nivel y de dirección', 0),
(839, '401.04.53.00.0000', NULL, 'Complementos a obreros por el uso de su equipo de transporte en el desempeño de su trabajo', 0),
(840, '401.04.54.00.0000', NULL, 'Complemento al personal contratado por trabajo o jornada nocturna ', 0),
(841, '401.04.55.00.0000', NULL, 'Complemento al personal contratado por gastos de transporte', 0),
(842, '401.04.94.00.0000', NULL, 'Otros complementos a altos funcionarios y altas funcionarias del sector público y de elección popular', 0),
(843, '401.04.95.00.0000', NULL, 'Otros complementos al personal de alto nivel y de dirección', 0),
(844, '401.04.96.00.0000', NULL, 'Otros complementos al personal empleado', 0),
(845, '401.04.97.00.0000', NULL, 'Otros complementos al personal obrero', 0),
(846, '401.04.98.00.0000', NULL, 'Otros complementos al personal contratado', 0),
(847, '401.04.99.00.0000', NULL, 'Otros complementos al personal militar', 0),
(848, '401.05.00.00.0000', NULL, 'Aguinaldos, utilidades o bonificación jurídica, y bono vacacional', 0),
(849, '401.05.01.00.0000', NULL, 'Aguinaldos al personal empleado', 0),
(850, '401.05.02.00.0000', NULL, 'Utilidades al personal empleado', 0),
(851, '401.05.03.00.0000', NULL, 'Bono vacacional al personal empleado', 0),
(852, '401.05.04.00.0000', NULL, 'Aguinaldos al personal obrero', 0),
(853, '401.05.05.00.0000', NULL, 'Utilidades al personal obrero', 0),
(854, '401.05.06.00.0000', NULL, 'Bono vacacional al personal obrero', 0),
(855, '401.05.07.00.0000', NULL, 'Aguinaldos al personal contratado', 0),
(856, '401.05.08.00.0000', NULL, 'Bono vacacional al personal contratado', 0),
(857, '401.05.09.00.0000', NULL, 'Aguinaldos al personal militar', 0),
(858, '401.05.10.00.0000', NULL, 'Bono vacacional al personal militar', 0),
(859, '401.05.13.00.0000', NULL, 'Aguinaldos a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(860, '401.05.14.00.0000', NULL, 'Utilidades a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(861, '401.05.15.00.0000', NULL, 'Bono vacacional a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(862, '401.05.16.00.0000', NULL, 'Aguinaldos al personal de alto nivel y de dirección', 0),
(863, '401.05.17.00.0000', NULL, 'Utilidades al personal de alto nivel y de dirección', 0),
(864, '401.05.18.00.0000', NULL, 'Bono vacacional al personal de alto nivel y de dirección', 0),
(865, '401.06.00.00.0000', NULL, 'Aportes patronales', 0),
(866, '401.06.01.00.0000', NULL, 'Aporte patronal al Instituto Venezolano de los Seguros Sociales (I.V.S.S.) al personal empleado', 0),
(867, '401.06.02.00.0000', NULL, 'Aporte patronal al Instituto de Previsión y Asistencia Social para el personal del Ministerio de Educación (IPASME) al personal empleado', 0),
(868, '401.06.03.00.0000', NULL, 'Aporte patronal al Fondo de Jubilaciones al personal empleado', 0),
(869, '401.06.04.00.0000', NULL, 'Aporte patronal al Fondo Contributivo del Régimen Prestacional de Empleo al personal empleado', 0),
(870, '401.06.05.00.0000', NULL, 'Aporte patronal al Fondo de Ahorro Obligatorio para la Vivienda al personal empleado', 0),
(871, '401.06.06.00.0000', NULL, 'Aporte patronal al Instituto Nacional de Capacitación y Educación Socialista (Inces) al personal empleado', 0),
(872, '401.06.10.00.0000', NULL, 'Aporte patronal al Instituto Venezolano de  los Seguros Sociales (I.V.S.S.) al personal obrero', 0),
(873, '401.06.11.00.0000', NULL, 'Aporte patronal al Fondo de Jubilaciones al personal obrero', 0),
(874, '401.06.12.00.0000', NULL, 'Aporte patronal al Fondo Contributivo del Régimen Prestacional de Empleo al personal obrero', 0),
(875, '401.06.13.00.0000', NULL, 'Aporte patronal al Fondo de Ahorro Obligatorio para la Vivienda al personal obrero', 0),
(876, '401.06.14.00.0000', NULL, 'Aporte patronal al Instituto Nacional de Capacitación y Educación Socialista (Inces) al personal obrero', 0),
(877, '401.06.18.00.0000', NULL, 'Aporte patronal a los organismos de seguridad social al personal empleado local, en las representaciones de Venezuela en el exterior', 0),
(878, '401.06.19.00.0000', NULL, 'Aporte patronal al Fondo de Ahorro Obligatorio para la Vivienda por personal militar', 0),
(879, '401.06.25.00.0000', NULL, 'Aporte legal al Instituto Venezolano de los Seguros Sociales (IVSS) por personal contratado', 0),
(880, '401.06.26.00.0000', NULL, 'Aporte patronal al Fondo de Ahorro Obligatorio para la Vivienda por personal contratado', 0),
(881, '401.06.27.00.0000', NULL, 'Aporte patronal al Fondo Contributivo del Régimen Prestacional de Empleo al personal contratado', 0),
(882, '401.06.28.00.0000', NULL, 'Aporte patronal al Fondo de Jubilaciones por personal contratado', 0),
(883, '401.06.29.00.0000', NULL, 'Aporte patronal al Instituto Nacional de Capacitación y Educación Socialista (Inces) por personal contratado', 0),
(884, '401.06.31.00.0000', NULL, 'Aporte patronal al Instituto Venezolano de los Seguros Sociales (IVSS) por altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(885, '401.06.32.00.0000', NULL, 'Aporte patronal al Instituto de Previsión y Asistencia Social para el personal del Ministerio de Educación (Ipasme) por altos funcionarios y altas funcionarias del poder público', 0),
(886, '401.06.33.00.0000', NULL, 'Aporte patronal al Fondo de Jubilaciones por altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(887, '401.06.34.00.0000', NULL, 'Aporte patronal al Fondo de Ahorro Obligatorio para la Vivienda por altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(888, '401.06.35.00.0000', NULL, 'Aporte patronal al Fondo Contributivo del Régimen Prestacional de Empleo por altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(889, '401.06.39.00.0000', NULL, 'Aporte patronal  al Instituto Venezolano de los  Seguros Sociales (IVSS) por personal de alto nivel y de dirección', 0),
(890, '401.06.40.00.0000', NULL, 'Aporte patronal al Instituto de Previsión y Asistencia Social para el personal del Ministerio de Educación (Ipasme) por personal de alto nivel y de dirección', 0),
(891, '401.06.41.00.0000', NULL, 'Aporte patronal al Fondo de Jubilaciones por personal de alto nivel y de dirección', 0),
(892, '401.06.42.00.0000', NULL, 'Aporte patronal al Fondo de Ahorro Obligatorio para la Vivienda por personal de alto nivel y de dirección', 0),
(893, '401.06.43.00.0000', NULL, 'Aporte patronal al Fondo Contributivo del Régimen Prestacional de Empleo por personal de alto nivel y de dirección', 0),
(894, '401.06.44.00.0000', NULL, 'Aporte patronal al Instituto Nacional de Capacitación y Educación Socialista (Inces) por personal de alto nivel y de dirección', 0),
(895, '401.06.93.00.0000', NULL, 'Otros aportes patronales por altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(896, '401.06.94.00.0000', NULL, 'Otros aportes patronales por el personal de alto nivel y de dirección', 0),
(897, '401.06.95.00.0000', NULL, 'Otros aportes patronales por personal contratado', 0),
(898, '401.06.96.00.0000', NULL, 'Otros aportes patronales al personal empleado', 0),
(899, '401.06.97.00.0000', NULL, 'Otros aportes patronales al personal obrero', 0),
(900, '401.06.98.00.0000', NULL, 'Otros aportes patronales por personal militar', 0),
(901, '401.07.00.00.0000', NULL, 'Asistencia socio-económica', 0),
(902, '401.07.01.00.0000', NULL, 'Capacitación y adiestramiento al personal empleado', 0),
(903, '401.07.02.00.0000', NULL, 'Becas al personal empleado', 0),
(904, '401.07.03.00.0000', NULL, 'Ayudas por matrimonio al personal empleado', 0),
(905, '401.07.04.00.0000', NULL, 'Ayudas por nacimiento de hijos e hijas al personal empleado', 0),
(906, '401.07.05.00.0000', NULL, 'Ayudas por defunción al personal empleado', 0),
(907, '401.07.06.00.0000', NULL, 'Ayudas para medicinas, gastos médicos, odontológicos y de hospitalización al personal empleado', 0),
(908, '401.07.07.00.0000', NULL, 'Aporte patronal a cajas de ahorro al personal empleado', 0),
(909, '401.07.08.00.0000', NULL, 'Aporte patronal a los servicios de salud, accidentes personales y gastos funerarios al personal empleado', 0),
(910, '401.07.09.00.0000', NULL, 'Ayudas al personal empleado para adquisición de uniformes y útiles escolares de sus hijos e hijas', 0),
(911, '401.07.10.00.0000', NULL, 'Dotación de uniformes al personal empleado', 0),
(912, '401.07.11.00.0000', NULL, 'Aporte patronal para gastos de guarderías y preescolar para hijos e hijas del personal empleado', 0),
(913, '401.07.12.00.0000', NULL, 'Aportes para la adquisición de juguetes para los hijos e hijas del personal empleado', 0),
(914, '401.07.17.00.0000', NULL, 'Capacitación y adiestramiento al personal obrero', 0),
(915, '401.07.18.00.0000', NULL, 'Becas al personal obrero', 0),
(916, '401.07.19.00.0000', NULL, 'Ayudas por matrimonio al personal obrero', 0),
(917, '401.07.20.00.0000', NULL, 'Ayudas por nacimiento de hijos e hijas al personal obrero', 0),
(918, '401.07.21.00.0000', NULL, 'Ayudas por defunción al personal obrero', 0),
(919, '401.07.22.00.0000', NULL, 'Ayudas para medicinas, gastos médicos, odontológicos y de hospitalización al personal obrero', 0),
(920, '401.07.23.00.0000', NULL, 'Aporte patronal a cajas de ahorro al personal obrero', 0),
(921, '401.07.24.00.0000', NULL, 'Aporte patronal a los servicios de salud, accidentes personales y gastos funerarios al personal obrero', 0),
(922, '401.07.25.00.0000', NULL, 'Ayudas al personal obrero para adquisición de uniformes y útiles escolares de sus hijos e hijas', 0),
(923, '401.07.26.00.0000', NULL, 'Dotación de uniformes al personal obrero', 0),
(924, '401.07.27.00.0000', NULL, 'Aporte patronal para gastos de guarderías y preescolar para hijos e hijas del personal obrero', 0),
(925, '401.07.28.00.0000', NULL, 'Aportes para la adquisición de juguetes para los hijos e hijas del personal obrero', 0),
(926, '401.07.29.00.0000', NULL, 'Ayudas por hijos e hijas con necesidades especiales al personal empleado', 0),
(927, '401.07.30.00.0000', NULL, 'Ayudas por hijos e hijas con necesidades especiales al personal obrero', 0),
(928, '401.07.31.00.0000', NULL, 'Ayudas por hijos e hijas con necesidades especiales al personal contratado', 0),
(929, '401.07.32.00.0000', NULL, 'Ayudas por hijos e hijas con necesidades especiales al personal de alto nivel y de dirección', 0),
(930, '401.07.33.00.0000', NULL, 'Ayudas por hijos e hijas con necesidades especiales al personal militar', 0),
(931, '401.07.34.00.0000', NULL, 'Capacitación y adiestramiento al personal militar', 0),
(932, '401.07.35.00.0000', NULL, 'Becas al personal militar', 0),
(933, '401.07.36.00.0000', NULL, 'Ayudas por matrimonio al personal militar', 0),
(934, '401.07.37.00.0000', NULL, 'Ayudas por nacimiento de hijos e hijas al personal militar', 0),
(935, '401.07.38.00.0000', NULL, 'Ayudas por defunción al personal militar', 0),
(936, '401.07.39.00.0000', NULL, 'Ayudas para medicinas, gastos médicos, odontológicos y de hospitalización al personal militar', 0),
(937, '401.07.40.00.0000', NULL, 'Aporte patronal a caja de ahorro por personal militar', 0),
(938, '401.07.41.00.0000', NULL, 'Aporte patronal a los servicios de salud, accidentes personales y gastos funerarios personal militar', 0),
(939, '401.07.42.00.0000', NULL, 'Ayudas al personal militar para adquisición de uniformes y útiles escolares de sus hijos e hijas', 0),
(940, '401.07.43.00.0000', NULL, 'Aportes para la adquisición de juguetes para los hijos e hijas del personal militar', 0),
(941, '401.07.44.00.0000', NULL, 'Aporte patronal para gastos de guarderías y preescolar para hijos e hijas del personal militar', 0),
(942, '401.07.52.00.0000', NULL, 'Capacitación y adiestramiento a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(943, '401.07.53.00.0000', NULL, 'Ayudas por matrimonio a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(944, '401.07.54.00.0000', NULL, 'Ayudas por nacimiento de hijos e hijas altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(945, '401.07.55.00.0000', NULL, 'Ayudas por defunción a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(946, '401.07.56.00.0000', NULL, 'Ayudas para medicinas, gastos médicos, odontológicos y de hospitalización a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(947, '401.07.57.00.0000', NULL, 'Aporte patronal a cajas de ahorro por altos funcionarios y altas funcionarias del poder público y de elección popular.', 0),
(948, '401.07.58.00.0000', NULL, 'Aporte patronal a los servicios de salud, accidentes personales y gastos funerarios por altos funcionarios y altas funcionarias del poder público y de elección popular.', 0),
(949, '401.07.59.00.0000', NULL, 'Becas a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(950, '401.07.60.00.0000', NULL, 'Ayudas a altos funcionarios y altas funcionarias del poder público y de elección popular para adquisición de uniformes y útiles escolares de sus hijos e hijas', 0),
(951, '401.07.61.00.0000', NULL, 'Aporte patronal para gastos de guarderías y preescolar para hijos e hijas de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(952, '401.07.62.00.0000', NULL, 'Aportes para la adquisición de juguetes para los hijos e hijas de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(953, '401.07.63.00.0000', NULL, 'Capacitación y adiestramiento al personal de alto nivel y de dirección', 0),
(954, '401.07.64.00.0000', NULL, 'Ayudas por matrimonio al personal de alto nivel y de dirección', 0),
(955, '401.07.65.00.0000', NULL, 'Ayudas por nacimiento de hijos e hijas al personal de alto nivel y de dirección', 0),
(956, '401.07.66.00.0000', NULL, 'Ayudas por defunción al personal de alto nivel y de dirección', 0),
(957, '401.07.67.00.0000', NULL, 'Ayudas para medicinas, gastos médicos, odontológicos y de hospitalización al personal de alto nivel y de dirección', 0),
(958, '401.07.68.00.0000', NULL, 'Aporte patronal a cajas de ahorro por personal de alto nivel y de dirección', 0),
(959, '401.07.69.00.0000', NULL, 'Aporte patronal a los servicios de salud, accidentes personales y gastos funerarios por personal de alto nivel y de dirección', 0),
(960, '401.07.70.00.0000', NULL, 'Ayudas al personal de alto nivel y de dirección para adquisición de uniformes y útiles escolares de sus hijos e hijas', 0),
(961, '401.07.71.00.0000', NULL, 'Aportes para la adquisición de juguetes para los hijos e hijas del personal de alto nivel y de dirección.', 0),
(962, '401.07.72.00.0000', NULL, 'Becas al personal de alto nivel y de dirección', 0),
(963, '401.07.73.00.0000', NULL, 'Aporte patronal para gastos de guarderías y preescolar para hijos e hijas del personal de alto nivel y de dirección', 0),
(964, '401.07.74.00.0000', NULL, 'Capacitación y adiestramiento al personal contratado', 0),
(965, '401.07.75.00.0000', NULL, 'Becas al personal contratado', 0),
(966, '401.07.76.00.0000', NULL, 'Ayudas por matrimonio al personal contratado', 0),
(967, '401.07.77.00.0000', NULL, 'Ayudas por nacimiento de hijos e hijas al personal contratado', 0),
(968, '401.07.78.00.0000', NULL, 'Ayudas por defunción al personal contratado', 0),
(969, '401.07.79.00.0000', NULL, 'Ayudas para medicinas, gastos médicos, odontológicos y de hospitalización al personal contratado', 0),
(970, '401.07.80.00.0000', NULL, 'Aporte patronal a cajas de ahorro por personal contratado', 0),
(971, '401.07.81.00.0000', NULL, 'Aporte patronal a los servicios de salud, accidentes personales y gastos funerarios por personal contratado', 0),
(972, '401.07.82.00.0000', NULL, 'Ayudas al personal contratado para adquisición de uniformes y útiles escolares de sus hijos e hijas', 0),
(973, '401.07.83.00.0000', NULL, 'Dotación de uniformes al personal contratado', 0),
(974, '401.07.84.00.0000', NULL, 'Aporte patronal para gastos de guarderías y preescolar para hijos e hijas del personal contratado', 0),
(975, '401.07.85.00.0000', NULL, 'Aportes para la adquisición de juguetes para los hijos e hijas del personal contratado', 0),
(976, '401.07.86.00.0000', NULL, 'Ayudas especiales asignadas al personal empleado', 0),
(977, '401.07.87.00.0000', NULL, 'Ayudas especiales asignadas al personal obrero', 0),
(978, '401.07.89.00.0000', NULL, 'Ayudas especiales asignadas al personal contratado ', 0),
(979, '401.07.90.00.0000', NULL, 'Ayudas especiales asignadas al personal de alto nivel y dirección', 0),
(980, '401.07.91.00.0000', NULL, 'Ayudas especiales asignadas para altos funcionarios y altas funcionarias del poder público y de elección popular.', 0),
(981, '401.07.92.00.0000', NULL, 'Ayudas por hijos e hijas con necesidades especiales para altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(982, '401.07.94.00.0000', NULL, 'Otras subvenciones a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(983, '401.07.95.00.0000', NULL, 'Otras subvenciones al personal de alto nivel y de dirección', 0),
(984, '401.07.96.00.0000', NULL, 'Otras subvenciones al personal empleado', 0),
(985, '401.07.97.00.0000', NULL, 'Otras subvenciones al personal obrero', 0),
(986, '401.07.98.00.0000', NULL, 'Otras subvenciones al personal militar', 0),
(987, '401.07.99.00.0000', NULL, 'Otras subvenciones al personal contratado', 0),
(988, '401.08.00.00.0000', NULL, 'Prestaciones sociales e indemnizaciones', 0),
(989, '401.08.01.00.0000', NULL, 'Prestaciones sociales e indemnizaciones al personal empleado', 0),
(990, '401.08.02.00.0000', NULL, 'Prestaciones sociales e indemnizaciones al personal obrero', 0),
(991, '401.08.03.00.0000', NULL, 'Prestaciones sociales e indemnizaciones al personal contratado', 0),
(992, '401.08.04.00.0000', NULL, 'Prestaciones sociales e indemnizaciones al personal militar', 0),
(993, '401.08.06.00.0000', NULL, 'Prestaciones sociales e indemnizaciones a altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(994, '401.08.07.00.0000', NULL, 'Prestaciones sociales e indemnizaciones al personal de alto nivel y de dirección', 0),
(995, '401.09.00.00.0000', NULL, 'Capacitación y adiestramiento realizado por personal del organismo', 0),
(996, '401.09.01.00.0000', NULL, 'Capacitación y adiestramiento realizado por personal del organismo', 0),
(997, '401.93.00.00.0000', NULL, 'Otros gastos del personal contratado', 0),
(998, '401.93.01.00.0000', NULL, 'Otros gastos del personal contratado', 0),
(999, '401.94.00.00.0000', NULL, 'Otros gastos de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(1000, '401.94.01.00.0000', NULL, 'Otros gastos de los altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(1001, '401.95.00.00.0000', NULL, 'Otros gastos del personal de alto nivel y de dirección', 0),
(1002, '401.95.01.00.0000', NULL, 'Otros gastos del personal de alto nivel y de dirección', 0),
(1003, '401.96.00.00.0000', NULL, 'Otros gastos del personal empleado', 0),
(1004, '401.96.01.00.0000', NULL, 'Otros gastos del personal empleado', 0),
(1005, '401.97.00.00.0000', NULL, 'Otros gastos del personal obrero', 0),
(1006, '401.97.01.00.0000', NULL, 'Otros gastos del personal obrero', 0),
(1007, '401.98.00.00.0000', NULL, 'Otros gastos del personal militar', 0),
(1008, '401.98.01.00.0000', NULL, 'Otros gastos del personal militar', 0),
(1009, '402.00.00.00.0000', NULL, 'MATERIALES, SUMINISTROS Y MERCANCÍAS', 0),
(1010, '402.01.00.00.0000', NULL, 'Productos alimenticios y agropecuarios', 0),
(1011, '402.01.01.00.0000', NULL, 'Alimentos y bebidas para personas', 0),
(1012, '402.01.02.00.0000', NULL, 'Alimentos para animales', 0),
(1013, '402.01.03.00.0000', NULL, 'Productos agrícolas y pecuarios', 0),
(1014, '402.01.04.00.0000', NULL, 'Productos de la caza y pesca', 0),
(1015, '402.01.99.00.0000', NULL, 'Otros productos alimenticios y agropecuarios', 0),
(1016, '402.02.00.00.0000', NULL, 'Productos de minas, canteras y yacimientos', 0),
(1017, '402.02.01.00.0000', NULL, 'Carbón mineral', 0),
(1018, '402.02.02.00.0000', NULL, 'Petróleo crudo y gas natural', 0),
(1019, '402.02.03.00.0000', NULL, 'Mineral de hierro', 0),
(1020, '402.02.04.00.0000', NULL, 'Mineral no ferroso', 0),
(1021, '402.02.05.00.0000', NULL, 'Piedra, arcilla, arena y tierra', 0),
(1022, '402.02.06.00.0000', NULL, 'Mineral para la fabricación de productos químicos', 0),
(1023, '402.02.07.00.0000', NULL, 'Sal para uso industrial', 0),
(1024, '402.02.99.00.0000', NULL, 'Otros productos de minas, canteras y yacimientos', 0),
(1025, '402.03.00.00.0000', NULL, 'Textiles y vestuarios', 0),
(1026, '402.03.01.00.0000', NULL, 'Textiles', 0),
(1027, '402.03.02.00.0000', NULL, 'Prendas de vestir', 0),
(1028, '402.03.03.00.0000', NULL, 'Calzados', 0),
(1029, '402.03.99.00.0000', NULL, 'Otros productos textiles y vestuarios', 0),
(1030, '402.04.00.00.0000', NULL, 'Productos de cuero y caucho', 0),
(1031, '402.04.01.00.0000', NULL, 'Cueros y pieles', 0),
(1032, '402.04.02.00.0000', NULL, 'Productos de cuero y sucedáneos del cuero', 0),
(1033, '402.04.03.00.0000', NULL, 'Cauchos y tripas para vehículos', 0),
(1034, '402.04.99.00.0000', NULL, 'Otros productos de cuero y caucho', 0),
(1035, '402.05.00.00.0000', NULL, 'Productos de papel, cartón e impresos', 0),
(1036, '402.05.01.00.0000', NULL, 'Pulpa de madera, papel y cartón', 0),
(1037, '402.05.02.00.0000', NULL, 'Envases y cajas de papel y cartón', 0),
(1038, '402.05.03.00.0000', NULL, 'Productos de papel y cartón para oficina', 0),
(1039, '402.05.04.00.0000', NULL, 'Libros, revistas y periódicos', 0),
(1040, '402.05.05.00.0000', NULL, 'Material de enseñanza', 0),
(1041, '402.05.06.00.0000', NULL, 'Productos de papel y cartón para computación', 0),
(1042, '402.05.07.00.0000', NULL, 'Productos de papel y cartón para la imprenta y reproducción', 0),
(1043, '402.05.99.00.0000', NULL, 'Otros productos de pulpa, papel y cartón', 0),
(1044, '402.06.00.00.0000', NULL, 'Productos químicos y derivados', 0),
(1045, '402.06.01.00.0000', NULL, 'Sustancias químicas y de uso industrial', 0),
(1046, '402.06.02.00.0000', NULL, 'Abonos, plaguicidas y otros', 0),
(1047, '402.06.03.00.0000', NULL, 'Tintas, pinturas y colorantes', 0),
(1048, '402.06.04.00.0000', NULL, 'Productos farmacéuticos y medicamentos', 0),
(1049, '402.06.05.00.0000', NULL, 'Productos de tocador', 0),
(1050, '402.06.06.00.0000', NULL, 'Combustibles y lubricantes', 0),
(1051, '402.06.07.00.0000', NULL, 'Productos diversos derivados del petróleo y del carbón', 0),
(1052, '402.06.08.00.0000', NULL, 'Productos plásticos', 0),
(1053, '402.06.09.00.0000', NULL, 'Mezclas explosivas', 0),
(1054, '402.06.99.00.0000', NULL, 'Otros productos de la industria química y conexos', 0),
(1055, '402.07.00.00.0000', NULL, 'Productos minerales no metálicos', 0),
(1056, '402.07.01.00.0000', NULL, 'Productos de barro, loza y porcelana', 0),
(1057, '402.07.02.00.0000', NULL, 'Vidrios y productos de vidrio', 0),
(1058, '402.07.03.00.0000', NULL, 'Productos de arcilla para construcción', 0),
(1059, '402.07.04.00.0000', NULL, 'Cemento, cal y yeso', 0),
(1060, '402.07.99.00.0000', NULL, 'Otros productos minerales no metálicos', 0),
(1061, '402.08.00.00.0000', NULL, 'Productos metálicos', 0),
(1062, '402.08.01.00.0000', NULL, 'Productos primarios de hierro y acero', 0),
(1063, '402.08.02.00.0000', NULL, 'Productos de metales no ferrosos', 0),
(1064, '402.08.03.00.0000', NULL, 'Herramientas menores, cuchillería y artículos generales de ferretería', 0),
(1065, '402.08.04.00.0000', NULL, 'Productos metálicos estructurales', 0),
(1066, '402.08.05.00.0000', NULL, 'Materiales de orden público, seguridad y defensa', 0),
(1067, '402.08.07.00.0000', NULL, 'Material de señalamiento', 0),
(1068, '402.08.08.00.0000', NULL, 'Material de educación', 0),
(1069, '402.08.09.00.0000', NULL, 'Repuestos y accesorios para equipos de transporte', 0),
(1070, '402.08.10.00.0000', NULL, 'Repuestos y accesorios para otros equipos', 0),
(1071, '402.08.99.00.0000', NULL, 'Otros productos metálicos', 0),
(1072, '402.09.00.00.0000', NULL, 'Productos de madera', 0),
(1073, '402.09.01.00.0000', NULL, 'Productos primarios de madera', 0),
(1074, '402.09.02.00.0000', NULL, 'Muebles y accesorios de madera para edificaciones', 0),
(1075, '402.09.99.00.0000', NULL, 'Otros productos de madera', 0),
(1076, '402.10.00.00.0000', NULL, 'Productos varios y útiles diversos', 0),
(1077, '402.10.01.00.0000', NULL, 'Artículos de deporte, recreación y juguetes', 0),
(1078, '402.10.02.00.0000', NULL, 'Materiales y útiles de limpieza y aseo', 0),
(1079, '402.10.03.00.0000', NULL, 'Utensilios de cocina y comedor', 0),
(1080, '402.10.04.00.0000', NULL, 'Útiles menores médico - quirúrgicos de laboratorio, dentales y de veterinaria', 0),
(1081, '402.10.05.00.0000', NULL, 'Útiles de escritorio, oficina y materiales de instrucción', 0),
(1082, '402.10.06.00.0000', NULL, 'Condecoraciones, ofrendas y similares', 0),
(1083, '402.10.07.00.0000', NULL, 'Productos de seguridad en el trabajo', 0),
(1084, '402.10.08.00.0000', NULL, 'Materiales para equipos de computación', 0),
(1085, '402.10.09.00.0000', NULL, 'Especies timbradas y valores', 0),
(1086, '402.10.10.00.0000', NULL, 'Útiles religiosos', 0),
(1087, '402.10.11.00.0000', NULL, 'Materiales eléctricos', 0),
(1088, '402.10.12.00.0000', NULL, 'Materiales para instalaciones sanitarias', 0),
(1089, '402.10.13.00.0000', NULL, 'Materiales fotográficos', 0),
(1090, '402.10.99.00.0000', NULL, 'Otros productos y útiles diversos', 0),
(1091, '402.11.00.00.0000', NULL, 'Bienes para la venta', 0),
(1092, '402.11.01.00.0000', NULL, 'Productos y artículos para la venta', 0),
(1093, '402.11.02.00.0000', NULL, 'Maquinarias y equipos para la venta', 0),
(1094, '402.11.03.00.0000', NULL, 'Inmuebles para la venta', 0),
(1095, '402.11.04.00.0000', NULL, 'Tierras y terrenos para la venta', 0),
(1096, '402.11.99.00.0000', NULL, 'Otros bienes para la venta', 0),
(1097, '402.99.00.00.0000', NULL, 'Otros materiales y suministros', 0),
(1098, '402.99.01.00.0000', NULL, 'Otros materiales y suministros', 0),
(1099, '403.00.00.00.0000', NULL, 'SERVICIOS NO PERSONALES', 0),
(1100, '403.01.00.00.0000', NULL, 'Alquileres de inmuebles', 0),
(1101, '403.01.01.00.0000', NULL, 'Alquileres de edificios y locales', 0),
(1102, '403.01.02.00.0000', NULL, 'Alquileres de instalaciones culturales y recreativas', 0),
(1103, '403.01.03.00.0000', NULL, 'Alquileres de tierras y terrenos', 0),
(1104, '403.02.00.00.0000', NULL, 'Alquileres de maquinaria y equipos', 0),
(1105, '403.02.01.00.0000', NULL, 'Alquileres de maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1106, '403.02.02.00.0000', NULL, 'Alquileres de equipos de transporte, tracción y elevación', 0),
(1107, '403.02.03.00.0000', NULL, 'Alquileres de equipos de comunicaciones y de señalamiento', 0),
(1108, '403.02.04.00.0000', NULL, 'Alquileres de equipos médico - quirúrgicos, dentales y de veterinaria', 0),
(1109, '403.02.05.00.0000', NULL, 'Alquileres de equipos científicos, religiosos, de enseñanza y recreación', 0),
(1110, '403.02.06.00.0000', NULL, 'Alquileres de máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1111, '403.02.99.00.0000', NULL, 'Alquileres de otras maquinaria y equipos', 0),
(1112, '403.03.00.00.0000', NULL, 'Derechos sobre bienes intangibles', 0),
(1113, '403.03.01.00.0000', NULL, 'Marcas de fábrica y patentes de invención', 0),
(1114, '403.03.02.00.0000', NULL, 'Derechos de autor', 0),
(1115, '403.03.03.00.0000', NULL, 'Paquetes y programas de computación', 0),
(1116, '403.03.04.00.0000', NULL, 'Concesión de bienes y servicios', 0),
(1117, '403.04.00.00.0000', NULL, 'Servicios básicos', 0),
(1118, '403.04.01.00.0000', NULL, 'Electricidad', 0),
(1119, '403.04.02.00.0000', NULL, 'Gas', 0),
(1120, '403.04.03.00.0000', NULL, 'Agua', 0),
(1121, '403.04.04.00.0000', NULL, 'Teléfonos', 0),
(1122, '403.04.04.01.0000', NULL, 'Servicios de telefonía prestados por organismos públicos', 0),
(1123, '403.04.04.02.0000', NULL, 'Servicios de telefonía prestados por instituciones privadas', 0),
(1124, '403.04.05.00.0000', NULL, 'Servicio de comunicaciones', 0),
(1125, '403.04.06.00.0000', NULL, 'Servicio de aseo urbano y domiciliario', 0),
(1126, '403.04.07.00.0000', NULL, 'Servicio de condominio', 0),
(1127, '403.05.00.00.0000', NULL, 'Servicio de administración, vigilancia y mantenimiento de los servicios básicos', 0),
(1128, '403.05.01.00.0000', NULL, 'Servicio de administración, vigilancia y mantenimiento del servicio de electricidad', 0),
(1129, '403.05.02.00.0000', NULL, 'Servicio de administración, vigilancia y mantenimiento del servicio de gas', 0),
(1130, '403.05.03.00.0000', NULL, 'Servicio de administración, vigilancia y mantenimiento del servicio de agua', 0),
(1131, '403.05.04.00.0000', NULL, 'Servicio de administración, vigilancia y mantenimiento del servicio de teléfonos', 0),
(1132, '403.05.05.00.0000', NULL, 'Servicio de administración, vigilancia y mantenimiento del servicio de comunicaciones', 0),
(1133, '403.05.06.00.0000', NULL, 'Servicio de administración, vigilancia y mantenimiento del servicio de aseo urbano y domiciliario', 0),
(1134, '403.06.00.00.0000', NULL, 'Servicios de transporte y almacenaje', 0),
(1135, '403.06.01.00.0000', NULL, 'Fletes y embalajes', 0),
(1136, '403.06.02.00.0000', NULL, 'Almacenaje', 0),
(1137, '403.06.03.00.0000', NULL, 'Estacionamiento', 0),
(1138, '403.06.04.00.0000', NULL, 'Peaje', 0),
(1139, '403.06.05.00.0000', NULL, 'Servicios de protección en traslado de fondos y de mensajería', 0),
(1140, '403.07.00.00.0000', NULL, 'Servicios de información, impresión y relaciones públicas', 0),
(1141, '403.07.01.00.0000', NULL, 'Publicidad y propaganda', 0),
(1142, '403.07.02.00.0000', NULL, 'Imprenta y reproducción', 0),
(1143, '403.07.03.00.0000', NULL, 'Relaciones sociales', 0),
(1144, '403.07.04.00.0000', NULL, 'Avisos', 0),
(1145, '403.08.00.00.0000', NULL, 'Primas y otros gastos de seguros y comisiones bancarias', 0),
(1146, '403.08.01.00.0000', NULL, 'Primas y gastos de seguros', 0),
(1147, '403.08.02.00.0000', NULL, 'Comisiones y gastos bancarios', 0),
(1148, '403.08.03.00.0000', NULL, 'Comisiones y gastos de adquisición de seguros', 0),
(1149, '403.09.00.00.0000', NULL, 'Viáticos y pasajes', 0),
(1150, '403.09.01.00.0000', NULL, 'Viáticos y pasajes dentro del país', 0),
(1151, '403.09.02.00.0000', NULL, 'Viáticos y pasajes fuera del país', 0),
(1152, '403.09.03.00.0000', NULL, 'Asignación por kilómetros recorridos', 0),
(1153, '403.10.00.00.0000', NULL, 'Servicios profesionales, técnicos y demás oficios y ocupaciones', 0),
(1154, '403.10.01.00.0000', NULL, 'Servicios jurídicos', 0),
(1155, '403.10.02.00.0000', NULL, 'Servicios de contabilidad y auditoría', 0),
(1156, '403.10.03.00.0000', NULL, 'Servicios de procesamiento de datos', 0),
(1157, '403.10.04.00.0000', NULL, 'Servicios de ingeniería y arquitectónicos', 0),
(1158, '403.10.05.00.0000', NULL, 'Servicios médicos, odontológicos y otros servicios de sanidad', 0),
(1159, '403.10.06.00.0000', NULL, 'Servicios de veterinaria', 0),
(1160, '403.10.07.00.0000', NULL, 'Servicios de capacitación y adiestramiento', 0),
(1161, '403.10.08.00.0000', NULL, 'Servicios presupuestarios', 0),
(1162, '403.10.09.00.0000', NULL, 'Servicios de lavandería y tintorería', 0),
(1163, '403.10.10.00.0000', NULL, 'Servicios de vigilancia y seguridad', 0),
(1164, '403.10.11.00.0000', NULL, 'Servicios para la elaboración y suministro de comida', 0),
(1165, '403.10.99.00.0000', NULL, 'Otros servicios profesionales y técnicos', 0),
(1166, '403.11.00.00.0000', NULL, 'Conservación y reparaciones menores de maquinaria y equipos', 0),
(1167, '403.11.01.00.0000', NULL, 'Conservación y reparaciones menores de maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1168, '403.11.02.00.0000', NULL, 'Conservación y reparaciones menores de equipos de transporte, tracción y elevación', 0),
(1169, '403.11.03.00.0000', NULL, 'Conservación y reparaciones menores de equipos de comunicaciones y de señalamiento', 0),
(1170, '403.11.04.00.0000', NULL, 'Conservación y reparaciones menores de equipos médico- quirúrgicos, dentales y de veterinaria', 0),
(1171, '403.11.05.00.0000', NULL, 'Conservación y reparaciones menores de equipos científicos, religiosos, de enseñanza y recreación', 0),
(1172, '403.11.06.00.0000', NULL, 'Conservación y reparaciones menores de equipos y armamentos de orden público, seguridad y defensa nacional', 0),
(1173, '403.11.07.00.0000', NULL, 'Conservación y reparaciones menores de máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1174, '403.11.99.00.0000', NULL, 'Conservación y reparaciones menores de otras maquinaria y equipos', 0),
(1175, '403.12.00.00.0000', NULL, 'Conservación y reparaciones menores de obras', 0),
(1176, '403.12.01.00.0000', NULL, 'Conservación y reparaciones menores de obras en bienes del dominio privado', 0),
(1177, '403.12.02.00.0000', NULL, 'Conservación y reparaciones menores de obras en bienes del dominio público', 0),
(1178, '403.13.00.00.0000', NULL, 'Servicios de construcciones temporales', 0),
(1179, '403.13.01.00.0000', NULL, 'Servicios de construcciones temporales', 0),
(1180, '403.14.00.00.0000', NULL, 'Servicios de construcción de edificaciones para la venta', 0),
(1181, '403.14.01.00.0000', NULL, 'Servicios de construcción de edificaciones para la venta', 0),
(1182, '403.15.00.00.0000', NULL, 'Servicios fiscales', 0),
(1183, '403.15.01.00.0000', NULL, 'Derechos de importación y servicios aduaneros', 0),
(1184, '403.15.02.00.0000', NULL, 'Tasas y otros derechos obligatorios', 0),
(1185, '403.15.03.00.0000', NULL, 'Asignación a agentes de especies fiscales', 0),
(1186, '403.15.99.00.0000', NULL, 'Otros servicios fiscales', 0),
(1187, '403.16.00.00.0000', NULL, 'Servicios de diversión, esparcimiento y culturales', 0),
(1188, '403.16.01.00.0000', NULL, 'Servicios de diversión, esparcimiento y culturales', 0),
(1189, '403.17.00.00.0000', NULL, 'Servicios de gestión administrativa prestados por organismos de asistencia técnica', 0),
(1190, '403.17.01.00.0000', NULL, 'Servicios de gestión administrativa prestados por organismos de asistencia técnica', 0),
(1191, '403.18.00.00.0000', NULL, 'Impuestos indirectos', 0),
(1192, '403.18.01.00.0000', NULL, 'Impuesto al valor agregado', 0),
(1193, '403.18.02.00.0000', NULL, 'Impuesto a las grandes transacciones financieras', 0),
(1194, '403.18.99.00.0000', NULL, 'Otros impuestos indirectos', 0),
(1195, '403.19.00.00.0000', NULL, 'Comisiones por servicios para cumplir con los beneficios sociales', 0),
(1196, '403.19.01.00.0000', NULL, 'Comisiones por servicios para cumplir con los beneficios sociales', 0),
(1197, '403.99.00.00.0000', NULL, 'Otros servicios no personales', 0),
(1198, '403.99.01.00.0000', NULL, 'Otros servicios no personales', 0),
(1199, '404.00.00.00.0000', NULL, 'ACTIVOS REALES', 0),
(1200, '404.01.00.00.0000', NULL, 'Repuestos, reparaciones, mejoras y adiciones mayores', 0),
(1201, '404.01.01.00.0000', NULL, 'Repuestos mayores', 0),
(1202, '404.01.01.01.0000', NULL, 'Repuestos mayores para maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1203, '404.01.01.02.0000', NULL, 'Repuestos mayores para equipos de transporte, tracción y elevación', 0),
(1204, '404.01.01.03.0000', NULL, 'Repuestos mayores para equipos de comunicaciones y de señalamiento', 0),
(1205, '404.01.01.04.0000', NULL, 'Repuestos mayores para equipos médico-quirúrgicos, dentales y de veterinaria', 0),
(1206, '404.01.01.05.0000', NULL, 'Repuestos mayores para equipos científicos, religiosos, de enseñanza y recreación', 0),
(1207, '404.01.01.06.0000', NULL, 'Repuestos mayores para equipos y armamentos de orden público, seguridad y defensa', 0),
(1208, '404.01.01.07.0000', NULL, 'Repuestos mayores para máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1209, '404.01.01.99.0000', NULL, 'Repuestos mayores para otras maquinaria y equipos', 0),
(1210, '404.01.02.00.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de maquinaria y equipos', 0),
(1211, '404.01.02.01.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1212, '404.01.02.02.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de equipos de transporte, tracción y elevación', 0),
(1213, '404.01.02.03.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de equipos de comunicaciones y de señalamiento', 0),
(1214, '404.01.02.04.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de equipos médico - quirúrgicos, dentales y de veterinaria', 0),
(1215, '404.01.02.05.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de equipos científicos, religiosos, de enseñanza y recreación', 0),
(1216, '404.01.02.06.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de equipos y armamentos de orden público, seguridad y defensa nacional', 0),
(1217, '404.01.02.07.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1218, '404.01.02.99.0000', NULL, 'Reparaciones, mejoras y adiciones mayores de otras maquinaria y equipos', 0),
(1219, '404.02.00.00.0000', NULL, 'Conservación, ampliaciones y mejoras mayores de obras', 0),
(1220, '404.02.01.00.0000', NULL, 'Conservación, ampliaciones y mejoras mayores de obras en bienes del dominio privado', 0),
(1221, '404.02.02.00.0000', NULL, 'Conservación, ampliaciones y mejoras mayores de obras en bienes del dominio público', 0),
(1222, '404.03.00.00.0000', NULL, 'Maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1223, '404.03.01.00.0000', NULL, 'Maquinaria y demás equipos de construcción y mantenimiento', 0),
(1224, '404.03.02.00.0000', NULL, 'Maquinaria y equipos para mantenimiento de automotores', 0),
(1225, '404.03.03.00.0000', NULL, 'Maquinaria y equipos agrícolas y pecuarios', 0),
(1226, '404.03.04.00.0000', NULL, 'Maquinaria y equipos de artes gráficas y reproducción', 0),
(1227, '404.03.05.00.0000', NULL, 'Maquinaria y equipos industriales y de taller', 0),
(1228, '404.03.06.00.0000', NULL, 'Maquinaria y equipos de energía', 0),
(1229, '404.03.07.00.0000', NULL, 'Maquinaria y equipos de riego y acueductos', 0),
(1230, '404.03.08.00.0000', NULL, 'Equipos de almacén', 0),
(1231, '404.03.99.00.0000', NULL, 'Otra maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1232, '404.04.00.00.0000', NULL, 'Equipos de transporte, tracción y elevación', 0),
(1233, '404.04.01.00.0000', NULL, 'Vehículos automotores terrestres', 0),
(1234, '404.04.02.00.0000', NULL, 'Equipos ferroviarios y de cables aéreos', 0),
(1235, '404.04.03.00.0000', NULL, 'Equipos marítimos de transporte', 0),
(1236, '404.04.04.00.0000', NULL, 'Equipos aéreos de transporte', 0),
(1237, '404.04.05.00.0000', NULL, 'Vehículos de tracción no motorizados', 0),
(1238, '404.04.06.00.0000', NULL, 'Equipos auxiliares de transporte', 0);
INSERT INTO `partidas_presupuestarias` (`id`, `partida`, `nombre`, `descripcion`, `status`) VALUES
(1239, '404.04.99.00.0000', NULL, 'Otros equipos de transporte, tracción y elevación', 0),
(1240, '404.05.00.00.0000', NULL, 'Equipos de comunicaciones y de señalamiento', 0),
(1241, '404.05.01.00.0000', NULL, 'Equipos de telecomunicaciones', 0),
(1242, '404.05.02.00.0000', NULL, 'Equipos de señalamiento', 0),
(1243, '404.05.03.00.0000', NULL, 'Equipos de control de tráfico aéreo', 0),
(1244, '404.05.04.00.0000', NULL, 'Equipos de correo', 0),
(1245, '404.05.99.00.0000', NULL, 'Otros equipos de comunicaciones y de señalamiento', 0),
(1246, '404.06.00.00.0000', NULL, 'Equipos médico - quirúrgicos, dentales y de veterinaria', 0),
(1247, '404.06.01.00.0000', NULL, 'Equipos médico - quirúrgicos, dentales y de veterinaria', 0),
(1248, '404.06.99.00.0000', NULL, 'Otros equipos médico - quirúrgicos, dentales y de veterinaria', 0),
(1249, '404.07.00.00.0000', NULL, 'Equipos científicos, religiosos, de enseñanza y recreación', 0),
(1250, '404.07.01.00.0000', NULL, 'Equipos científicos y de laboratorio', 0),
(1251, '404.07.02.00.0000', NULL, 'Equipos de enseñanza, deporte y recreación', 0),
(1252, '404.07.03.00.0000', NULL, 'Obras de arte', 0),
(1253, '404.07.04.00.0000', NULL, 'Libros, revistas y otros instrumentos de enseñanzas', 0),
(1254, '404.07.05.00.0000', NULL, 'Equipos religiosos', 0),
(1255, '404.07.06.00.0000', NULL, 'Instrumentos musicales y equipos de audio', 0),
(1256, '404.07.99.00.0000', NULL, 'Otros equipos científicos, religiosos, de enseñanza y recreación', 0),
(1257, '404.08.00.00.0000', NULL, 'Equipos y armamentos de orden público, seguridad y defensa', 0),
(1258, '404.08.01.00.0000', NULL, 'Equipos y armamentos de orden público, seguridad y defensa nacional', 0),
(1259, '404.08.02.00.0000', NULL, 'Equipos y armamentos de seguridad para la custodia y resguardo personal', 0),
(1260, '404.08.99.00.0000', NULL, 'Otros equipos y armamentos de orden público, seguridad y defensa', 0),
(1261, '404.09.00.00.0000', NULL, 'Máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1262, '404.09.01.00.0000', NULL, 'Mobiliario y equipos de oficina', 0),
(1263, '404.09.02.00.0000', NULL, 'Equipos de computación', 0),
(1264, '404.09.03.00.0000', NULL, 'Mobiliario y equipos de alojamiento', 0),
(1265, '404.09.99.00.0000', NULL, 'Otras máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1266, '404.10.00.00.0000', NULL, 'Semovientes', 0),
(1267, '404.10.01.00.0000', NULL, 'Semovientes', 0),
(1268, '404.11.00.00.0000', NULL, 'Inmuebles, maquinaria y equipos usados', 0),
(1269, '404.11.01.00.0000', NULL, 'Adquisición de tierras y terrenos', 0),
(1270, '404.11.02.00.0000', NULL, 'Adquisición de edificios e instalaciones', 0),
(1271, '404.11.03.00.0000', NULL, 'Expropiación de tierras y terrenos', 0),
(1272, '404.11.04.00.0000', NULL, 'Expropiación de edificios e instalaciones', 0),
(1273, '404.11.05.00.0000', NULL, 'Adquisición de maquinaria y equipos usados', 0),
(1274, '404.11.05.01.0000', NULL, 'Maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1275, '404.11.05.02.0000', NULL, 'Equipos de transporte, tracción y elevación', 0),
(1276, '404.11.05.03.0000', NULL, 'Equipos de comunicaciones y de señalamiento', 0),
(1277, '404.11.05.04.0000', NULL, 'Equipos médico - quirúrgicos, dentales y de veterinaria', 0),
(1278, '404.11.05.05.0000', NULL, 'Equipos científicos, religiosos, de enseñanza y recreación', 0),
(1279, '404.11.05.06.0000', NULL, 'Equipos para seguridad pública', 0),
(1280, '404.11.05.07.0000', NULL, 'Máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1281, '404.11.05.99.0000', NULL, 'Otras maquinaria y equipos usados', 0),
(1282, '404.12.00.00.0000', NULL, 'Activos intangibles', 0),
(1283, '404.12.01.00.0000', NULL, 'Marcas de fábrica y patentes de invención', 0),
(1284, '404.12.02.00.0000', NULL, 'Derechos de autor', 0),
(1285, '404.12.03.00.0000', NULL, 'Gastos de organización', 0),
(1286, '404.12.04.00.0000', NULL, 'Paquetes y programas de computación', 0),
(1287, '404.12.05.00.0000', NULL, 'Estudios y proyectos', 0),
(1288, '404.12.99.00.0000', NULL, 'Otros activos intangibles', 0),
(1289, '404.13.00.00.0000', NULL, 'Estudios y proyectos para inversión en activos fijos', 0),
(1290, '404.13.01.00.0000', NULL, 'Estudios y proyectos aplicables a bienes del dominio privado', 0),
(1291, '404.13.02.00.0000', NULL, 'Estudios y proyectos aplicables a bienes del dominio público', 0),
(1292, '404.14.00.00.0000', NULL, 'Contratación de inspección de obras', 0),
(1293, '404.14.01.00.0000', NULL, 'Contratación de inspección de obras de bienes del dominio privado', 0),
(1294, '404.14.02.00.0000', NULL, 'Contratación de inspección de obras de bienes del dominio público', 0),
(1295, '404.15.00.00.0000', NULL, 'Construcciones del dominio privado', 0),
(1296, '404.15.01.00.0000', NULL, 'Construcciones de edificaciones médico-asistenciales', 0),
(1297, '404.15.02.00.0000', NULL, 'Construcciones de edificaciones militares y de seguridad', 0),
(1298, '404.15.03.00.0000', NULL, 'Construcciones de edificaciones educativas, religiosas y recreativas', 0),
(1299, '404.15.04.00.0000', NULL, 'Construcciones de edificaciones culturales y deportivas', 0),
(1300, '404.15.05.00.0000', NULL, 'Construcciones de edificaciones para oficina', 0),
(1301, '404.15.06.00.0000', NULL, 'Construcciones de edificaciones industriales', 0),
(1302, '404.15.07.00.0000', NULL, 'Construcciones de edificaciones habitacionales', 0),
(1303, '404.15.99.00.0000', NULL, 'Otras construcciones del dominio privado', 0),
(1304, '404.16.00.00.0000', NULL, 'Construcciones del dominio público', 0),
(1305, '404.16.01.00.0000', NULL, 'Construcción de vialidad', 0),
(1306, '404.16.02.00.0000', NULL, 'Construcción de plazas, parques y similares', 0),
(1307, '404.16.03.00.0000', NULL, 'Construcciones de instalaciones hidráulicas', 0),
(1308, '404.16.04.00.0000', NULL, 'Construcciones de puertos y aeropuertos', 0),
(1309, '404.16.99.00.0000', NULL, 'Otras construcciones del dominio público', 0),
(1310, '404.99.00.00.0000', NULL, 'Otros activos reales', 0),
(1311, '404.99.01.00.0000', NULL, 'Otros activos reales', 0),
(1312, '405.00.00.00.0000', NULL, 'ACTIVOS FINANCIEROS', 0),
(1313, '405.01.00.00.0000', NULL, 'Aportes en acciones y participaciones de capital', 0),
(1314, '405.01.01.00.0000', NULL, 'Aportes en acciones y participaciones de capital al sector privado', 0),
(1315, '405.01.02.00.0000', NULL, 'Aportes en acciones y participaciones de capital al sector público', 0),
(1316, '405.01.02.01.0000', NULL, 'Aportes en acciones y participaciones de capital a entes descentralizados sin fines empresariales', 0),
(1317, '405.01.02.02.0000', NULL, 'Aportes en acciones y participaciones de capital a instituciones de protección social', 0),
(1318, '405.01.02.03.0000', NULL, 'Aportes en acciones y participaciones de capital a entes descentralizados con fines empresariales petroleros', 0),
(1319, '405.01.02.04.0000', NULL, 'Aportes en acciones y participaciones de capital a entes descentralizados con fines empresariales no petroleros', 0),
(1320, '405.01.02.05.0000', NULL, 'Aportes en acciones y participaciones de capital a entes descentralizados financieros bancarios', 0),
(1321, '405.01.02.06.0000', NULL, 'Aportes en acciones y participaciones de capital a entes descentralizados financieros no bancarios', 0),
(1322, '405.01.02.07.0000', NULL, 'Aportes en acciones y participaciones de capital a organismos del sector público para el pago de su deuda', 0),
(1323, '405.01.03.00.0000', NULL, 'Aportes en acciones y participaciones de capital al sector externo', 0),
(1324, '405.01.03.01.0000', NULL, 'Aportes en acciones y participaciones de capital a organismos internacionales', 0),
(1325, '405.01.03.99.0000', NULL, 'Otros aportes en acciones y participaciones de capital al sector externo', 0),
(1326, '405.02.00.00.0000', NULL, 'Adquisición de títulos y valores que no otorgan propiedad', 0),
(1327, '405.02.01.00.0000', NULL, 'Adquisición de títulos y valores a corto plazo', 0),
(1328, '405.02.01.01.0000', NULL, 'Adquisición de títulos y valores privados', 0),
(1329, '405.02.01.02.0000', NULL, 'Adquisición de títulos y valores públicos', 0),
(1330, '405.02.01.03.0000', NULL, 'Adquisición de títulos y valores externos', 0),
(1331, '405.02.02.00.0000', NULL, 'Adquisición de títulos y valores a largo plazo', 0),
(1332, '405.02.02.01.0000', NULL, 'Adquisición de títulos y valores privados', 0),
(1333, '405.02.02.02.0000', NULL, 'Adquisición de títulos y valores públicos', 0),
(1334, '405.02.02.03.0000', NULL, 'Adquisición de títulos y valores externos', 0),
(1335, '405.03.00.00.0000', NULL, 'Concesión de préstamos a corto plazo', 0),
(1336, '405.03.01.00.0000', NULL, 'Concesión de préstamos al sector privado a corto plazo', 0),
(1337, '405.03.02.00.0000', NULL, 'Concesión de préstamos al sector público a corto plazo', 0),
(1338, '405.03.02.01.0000', NULL, 'Concesión de préstamos a la República', 0),
(1339, '405.03.02.02.0000', NULL, 'Concesión de préstamos a entes descentralizados sin fines empresariales', 0),
(1340, '405.03.02.03.0000', NULL, 'Concesión de préstamos a instituciones de protección social', 0),
(1341, '405.03.02.04.0000', NULL, 'Concesión de préstamos a entes descentralizados con fines empresariales petroleros', 0),
(1342, '405.03.02.05.0000', NULL, 'Concesión de préstamos a entes descentralizados con fines empresariales no petroleros', 0),
(1343, '405.03.02.06.0000', NULL, 'Concesión de préstamos a entes descentralizados financieros bancarios', 0),
(1344, '405.03.02.07.0000', NULL, 'Concesión de préstamos a entes descentralizados financieros no bancarios', 0),
(1345, '405.03.02.08.0000', NULL, 'Concesión de préstamos al Poder Estadal', 0),
(1346, '405.03.02.09.0000', NULL, 'Concesión de préstamos al Poder Municipal', 0),
(1347, '405.03.03.00.0000', NULL, 'Concesión de préstamos al sector externo a corto plazo', 0),
(1348, '405.03.03.01.0000', NULL, 'Concesión de préstamos a instituciones sin fines de lucro', 0),
(1349, '405.03.03.02.0000', NULL, 'Concesión de préstamos a gobiernos extranjeros', 0),
(1350, '405.03.03.03.0000', NULL, 'Concesión de préstamos a organismos internacionales', 0),
(1351, '405.04.00.00.0000', NULL, 'Concesión de préstamos a largo plazo', 0),
(1352, '405.04.01.00.0000', NULL, 'Concesión de préstamos al sector privado a largo plazo', 0),
(1353, '405.04.02.00.0000', NULL, 'Concesión de préstamos al sector público a largo plazo', 0),
(1354, '405.04.02.01.0000', NULL, 'Concesión de préstamos a la República', 0),
(1355, '405.04.02.02.0000', NULL, 'Concesión de préstamos a entes descentralizados sin fines empresariales', 0),
(1356, '405.04.02.03.0000', NULL, 'Concesión de préstamos a instituciones de protección social', 0),
(1357, '405.04.02.04.0000', NULL, 'Concesión de préstamos a entes descentralizados con fines empresariales petroleros', 0),
(1358, '405.04.02.05.0000', NULL, 'Concesión de préstamos a entes descentralizados con fines empresariales no petroleros', 0),
(1359, '405.04.02.06.0000', NULL, 'Concesión de préstamos a entes descentralizados financieros bancarios', 0),
(1360, '405.04.02.07.0000', NULL, 'Concesión de préstamos a entes descentralizados financieros no bancarios', 0),
(1361, '405.04.02.08.0000', NULL, 'Concesión de préstamos al Poder Estadal', 0),
(1362, '405.04.02.09.0000', NULL, 'Concesión de préstamos al Poder Municipal', 0),
(1363, '405.04.03.00.0000', NULL, 'Concesión de préstamos al sector externo a largo plazo', 0),
(1364, '405.04.03.01.0000', NULL, 'Concesión de préstamos a instituciones sin fines de lucro', 0),
(1365, '405.04.03.02.0000', NULL, 'Concesión de préstamos a gobiernos extranjeros', 0),
(1366, '405.04.03.03.0000', NULL, 'Concesión de préstamos a organismos internacionales', 0),
(1367, '405.05.00.00.0000', NULL, 'Incremento de disponibilidades', 0),
(1368, '405.05.01.00.0000', NULL, 'Incremento en caja', 0),
(1369, '405.05.02.00.0000', NULL, 'Incremento en bancos', 0),
(1370, '405.05.02.01.0000', NULL, 'Incremento en bancos públicos', 0),
(1371, '405.05.02.02.0000', NULL, 'Incremento en bancos privados', 0),
(1372, '405.05.02.03.0000', NULL, 'Incremento en bancos del exterior', 0),
(1373, '405.05.03.00.0000', NULL, 'Incremento de inversiones temporales', 0),
(1374, '405.06.00.00.0000', NULL, 'Incremento de cuentas por cobrar a corto plazo', 0),
(1375, '405.06.01.00.0000', NULL, 'Incremento de cuentas comerciales por cobrar a corto plazo', 0),
(1376, '405.06.02.00.0000', NULL, 'Incremento de rentas por recaudar a corto plazo', 0),
(1377, '405.06.03.00.0000', NULL, 'Incremento de deudas por rendir', 0),
(1378, '405.06.03.01.0000', NULL, 'Incremento de deudas por rendir de fondos en avance', 0),
(1379, '405.06.03.02.0000', NULL, 'Incremento de deudas por rendir de fondos en anticipo', 0),
(1380, '405.06.04.00.0000', NULL, 'Incremento de cuentas por cobrar depósitos por enteramiento de fondos públicos', 0),
(1381, '405.06.99.00.0000', NULL, 'Incremento de otras cuentas por cobrar a corto plazo', 0),
(1382, '405.07.00.00.0000', NULL, 'Incremento de efectos por cobrar a corto plazo', 0),
(1383, '405.07.01.00.0000', NULL, 'Incremento de efectos comerciales por cobrar a corto plazo', 0),
(1384, '405.07.99.00.0000', NULL, 'Incremento de otros efectos por cobrar a corto plazo', 0),
(1385, '405.08.00.00.0000', NULL, 'Incremento de cuentas por cobrar a mediano y largo plazo', 0),
(1386, '405.08.01.00.0000', NULL, 'Incremento de cuentas comerciales por cobrar a mediano y largo plazo', 0),
(1387, '405.08.02.00.0000', NULL, 'Incremento de rentas por recaudar a mediano y largo plazo', 0),
(1388, '405.08.99.00.0000', NULL, 'Incremento de otras cuentas por cobrar a mediano y largo plazo', 0),
(1389, '405.09.00.00.0000', NULL, 'Incremento de efectos por cobrar a mediano y largo plazo', 0),
(1390, '405.09.01.00.0000', NULL, 'Incremento de efectos comerciales por cobrar a mediano y largo plazo', 0),
(1391, '405.09.99.00.0000', NULL, 'Incremento de otros efectos por cobrar a mediano y largo plazo', 0),
(1392, '405.10.00.00.0000', NULL, 'Incremento de fondos en avance, en anticipos y en fideicomiso', 0),
(1393, '405.10.01.00.0000', NULL, 'Incremento de fondos en avance', 0),
(1394, '405.10.02.00.0000', NULL, 'Incremento de fondos en anticipos', 0),
(1395, '405.10.03.00.0000', NULL, 'Incremento de fondos en fideicomiso', 0),
(1396, '405.10.04.00.0000', NULL, 'Incremento de anticipos a proveedores', 0),
(1397, '405.10.05.00.0000', NULL, 'Incremento de anticipos a contratistas por contratos de corto plazo', 0),
(1398, '405.10.06.00.0000', NULL, 'Incremento de anticipos a contratistas por contratos de mediano y largo plazo', 0),
(1399, '405.11.00.00.0000', NULL, 'Incremento de activos diferidos a corto plazo', 0),
(1400, '405.11.01.00.0000', NULL, 'Incremento de gastos a corto plazo pagados por anticipado', 0),
(1401, '405.11.01.01.0000', NULL, 'Incremento de intereses de la deuda pública interna a corto plazo pagados por anticipado', 0),
(1402, '405.11.01.02.0000', NULL, 'Incremento de intereses de la deuda pública externa a corto plazo pagados por anticipado', 0),
(1403, '405.11.01.03.0000', NULL, 'Incremento de otros intereses a corto plazo pagados por anticipado', 0),
(1404, '405.11.01.04.0000', NULL, 'Incremento de débitos por apertura de carta de crédito a corto plazo', 0),
(1405, '405.11.01.99.0000', NULL, 'Incremento de otros gastos a corto plazo pagados por anticipado', 0),
(1406, '405.11.02.00.0000', NULL, 'Incremento de depósitos otorgados en garantía a corto plazo', 0),
(1407, '405.11.99.00.0000', NULL, 'Incremento de otros activos diferidos a corto plazo', 0),
(1408, '405.12.00.00.0000', NULL, 'Incremento de activos diferidos a mediano y largo plazo', 0),
(1409, '405.12.01.00.0000', NULL, 'Incremento de gastos a mediano y largo plazo pagados por anticipado', 0),
(1410, '405.12.01.01.0000', NULL, 'Incremento de intereses de la deuda pública interna a largo plazo pagados por anticipado', 0),
(1411, '405.12.01.02.0000', NULL, 'Incremento de intereses de la deuda pública externa a largo plazo pagados por anticipado', 0),
(1412, '405.12.01.08.0000', NULL, 'Incremento de otros intereses a mediano y largo plazo pagados por anticipado', 0),
(1413, '405.12.01.99.0000', NULL, 'Incremento de otros gastos a mediano y largo plazo pagados por anticipado', 0),
(1414, '405.12.02.00.0000', NULL, 'Incremento de depósitos otorgados en garantía a mediano y largo plazo', 0),
(1415, '405.12.99.00.0000', NULL, 'Incremento de otros activos diferidos a mediano y largo plazo', 0),
(1416, '405.13.00.00.0000', NULL, 'Incremento del Fondo de Estabilización Macroeconómica (FEM)', 0),
(1417, '405.13.01.00.0000', NULL, 'Incremento del Fondo de Estabilización Macroeconómica (FEM) de la República', 0),
(1418, '405.13.02.00.0000', NULL, 'Incremento del Fondo de Estabilización Macroeconómica (FEM) del Poder Estadal', 0),
(1419, '405.13.03.00.0000', NULL, 'Incremento del Fondo de Estabilización Macroeconómica (FEM) del Poder Municipal', 0),
(1420, '405.14.00.00.0000', NULL, 'Incremento del Fondo de Ahorro Intergeneracional', 0),
(1421, '405.14.01.00.0000', NULL, 'Incremento del Fondo de Ahorro Intergeneracional', 0),
(1422, '405.16.00.00.0000', NULL, 'Incremento del Fondo de Aportes del Sector Público', 0),
(1423, '405.16.01.00.0000', NULL, 'Incremento del Fondo de Aportes del Sector Público', 0),
(1424, '405.20.00.00.0000', NULL, 'Incremento de otros activos financieros circulantes', 0),
(1425, '405.20.01.00.0000', NULL, 'Incremento de otros activos financieros circulantes', 0),
(1426, '405.20.02.00.0000', NULL, 'Incremento de depósitos por enteramiento de fondos públicos recibidos en custodia', 0),
(1427, '405.21.00.00.0000', NULL, 'Incremento de otros activos financieros no circulantes', 0),
(1428, '405.21.01.00.0000', NULL, 'Incremento de activos en gestión judicial a mediano y largo plazo', 0),
(1429, '405.21.02.00.0000', NULL, 'Incremento de títulos y otros valores de la deuda pública en litigio a largo plazo', 0),
(1430, '405.21.99.00.0000', NULL, 'Incremento de otros activos financieros no circulantes', 0),
(1431, '405.99.00.00.0000', NULL, 'Otros activos financieros', 0),
(1432, '405.99.01.00.0000', NULL, 'Otros activos financieros', 0),
(1433, '406.00.00.00.0000', NULL, 'GASTOS DE DEFENSA Y SEGURIDAD DEL ESTADO', 0),
(1434, '406.01.00.00.0000', NULL, 'Gastos de defensa y seguridad del Estado', 0),
(1435, '406.01.01.00.0000', NULL, 'Gastos de defensa y seguridad del Estado', 0),
(1436, '407.00.00.00.0000', NULL, 'TRANSFERENCIAS Y DONACIONES', 0),
(1437, '407.01.00.00.0000', NULL, 'Transferencias y donaciones corrientes internas', 0),
(1438, '407.01.01.00.0000', NULL, 'Transferencias corrientes internas al sector privado', 0),
(1439, '407.01.01.01.0000', NULL, 'Pensiones del personal empleado, obrero y militar', 0),
(1440, '407.01.01.02.0000', NULL, 'Jubilaciones del personal empleado, obrero y militar', 0),
(1441, '407.01.01.03.0000', NULL, 'Becas escolares', 0),
(1442, '407.01.01.04.0000', NULL, 'Becas universitarias en el país', 0),
(1443, '407.01.01.05.0000', NULL, 'Becas de perfeccionamiento profesional en el país', 0),
(1444, '407.01.01.06.0000', NULL, 'Becas para estudios en el extranjero', 0),
(1445, '407.01.01.07.0000', NULL, 'Otras becas', 0),
(1446, '407.01.01.08.0000', NULL, 'Previsión por accidentes de trabajo', 0),
(1447, '407.01.01.09.0000', NULL, 'Aguinaldos al personal pensionado', 0),
(1448, '407.01.01.10.0000', NULL, 'Aportes a caja de ahorro del personal pensionado', 0),
(1449, '407.01.01.11.0000', NULL, 'Aportes a los servicios de salud, accidentes personales y gastos funerarios al personal pensionado', 0),
(1450, '407.01.01.12.0000', NULL, 'Otras subvenciones socio - económicas del personal pensionado', 0),
(1451, '407.01.01.13.0000', NULL, 'Aguinaldos al personal jubilado', 0),
(1452, '407.01.01.14.0000', NULL, 'Aportes a caja de ahorro del personal jubilado', 0),
(1453, '407.01.01.15.0000', NULL, 'Aportes a los servicios de salud, accidentes personales y gastos funerarios del personal jubilado', 0),
(1454, '407.01.01.16.0000', NULL, 'Otras subvenciones socio - económicas del personal jubilado', 0),
(1455, '407.01.01.30.0000', NULL, 'Incapacidad temporal sin hospitalización', 0),
(1456, '407.01.01.31.0000', NULL, 'Incapacidad temporal con hospitalización', 0),
(1457, '407.01.01.32.0000', NULL, 'Reposo por maternidad', 0),
(1458, '407.01.01.33.0000', NULL, 'Indemnización por Fondo Contributivo del Régimen Prestacional de Empleo', 0),
(1459, '407.01.01.34.0000', NULL, 'Otros tipos de incapacidad temporal', 0),
(1460, '407.01.01.35.0000', NULL, 'Indemnización por comisión por pensiones', 0),
(1461, '407.01.01.36.0000', NULL, 'Indemnización por comisión por cesantía', 0),
(1462, '407.01.01.37.0000', NULL, 'Incapacidad parcial', 0),
(1463, '407.01.01.38.0000', NULL, 'Invalidez', 0),
(1464, '407.01.01.39.0000', NULL, 'Pensiones por vejez, viudez y orfandad', 0),
(1465, '407.01.01.40.0000', NULL, 'Indemnización por cesantía', 0),
(1466, '407.01.01.41.0000', NULL, 'Otras pensiones y demás prestaciones en dinero', 0),
(1467, '407.01.01.42.0000', NULL, 'Incapacidad parcial por accidente común', 0),
(1468, '407.01.01.43.0000', NULL, 'Incapacidad parcial por enfermedades profesionales', 0),
(1469, '407.01.01.44.0000', NULL, 'Incapacidad parcial por accidente de trabajo', 0),
(1470, '407.01.01.45.0000', NULL, 'Indemnización única por invalidez', 0),
(1471, '407.01.01.46.0000', NULL, 'Indemnización única por vejez', 0),
(1472, '407.01.01.47.0000', NULL, 'Sobrevivientes por enfermedad común', 0),
(1473, '407.01.01.48.0000', NULL, 'Sobrevivientes por accidente común', 0),
(1474, '407.01.01.49.0000', NULL, 'Sobrevivientes por enfermedades profesionales', 0),
(1475, '407.01.01.50.0000', NULL, 'Sobrevivientes por accidentes de trabajo', 0),
(1476, '407.01.01.51.0000', NULL, 'Indemnizaciones por conmutación de renta', 0),
(1477, '407.01.01.52.0000', NULL, 'Indemnizaciones por conmutación de pensiones', 0),
(1478, '407.01.01.53.0000', NULL, 'Indemnizaciones por comisión de renta', 0),
(1479, '407.01.01.54.0000', NULL, 'Asignación por nupcias', 0),
(1480, '407.01.01.55.0000', NULL, 'Asignación para gastos funerarios', 0),
(1481, '407.01.01.56.0000', NULL, 'Otras asignaciones', 0),
(1482, '407.01.01.70.0000', NULL, 'Subsidios educacionales al sector privado', 0),
(1483, '407.01.01.71.0000', NULL, 'Subsidios a universidades privadas', 0),
(1484, '407.01.01.72.0000', NULL, 'Subsidios culturales al sector privado', 0),
(1485, '407.01.01.73.0000', NULL, 'Subsidios a instituciones benéficas privadas', 0),
(1486, '407.01.01.74.0000', NULL, 'Subsidios a centros de empleados', 0),
(1487, '407.01.01.75.0000', NULL, 'Subsidios a organismos laborales y gremiales', 0),
(1488, '407.01.01.76.0000', NULL, 'Subsidios a entidades religiosas', 0),
(1489, '407.01.01.77.0000', NULL, 'Subsidios a entidades deportivas y recreativas de carácter privado', 0),
(1490, '407.01.01.78.0000', NULL, 'Subsidios científicos al sector privado', 0),
(1491, '407.01.01.79.0000', NULL, 'Subsidios a cooperativas', 0),
(1492, '407.01.01.80.0000', NULL, 'Subsidios a empresas privadas', 0),
(1493, '407.01.01.99.0000', NULL, 'Otras transferencias corrientes internas al sector privado', 0),
(1494, '407.01.02.00.0000', NULL, 'Donaciones corrientes internas al sector privado', 0),
(1495, '407.01.02.01.0000', NULL, 'Donaciones corrientes a personas', 0),
(1496, '407.01.02.02.0000', NULL, 'Donaciones corrientes a instituciones sin fines de lucro', 0),
(1497, '407.01.03.00.0000', NULL, 'Transferencias corrientes internas al sector público', 0),
(1498, '407.01.03.01.0000', NULL, 'Transferencias corrientes a la República', 0),
(1499, '407.01.03.02.0000', NULL, 'Transferencias corrientes a entes descentralizados sin fines empresariales', 0),
(1500, '407.01.03.03.0000', NULL, 'Transferencias corrientes a entes descentralizados sin fines empresariales para atender beneficios de la seguridad social', 0),
(1501, '407.01.03.04.0000', NULL, 'Transferencias corrientes a instituciones de protección social', 0),
(1502, '407.01.03.05.0000', NULL, 'Transferencias corrientes a instituciones de protección social para atender beneficios de la seguridad social', 0),
(1503, '407.01.03.06.0000', NULL, 'Transferencias corrientes a entes descentralizados con fines empresariales petroleros', 0),
(1504, '407.01.03.07.0000', NULL, 'Transferencias corrientes a entes descentralizados con fines empresariales no petroleros', 0),
(1505, '407.01.03.08.0000', NULL, 'Transferencias corrientes a entes descentralizados financieros bancarios', 0),
(1506, '407.01.03.09.0000', NULL, 'Transferencias corrientes a entes descentralizados financieros no bancarios', 0),
(1507, '407.01.03.10.0000', NULL, 'Transferencias corrientes al Poder Estadal', 0),
(1508, '407.01.03.11.0000', NULL, 'Transferencias corrientes al Poder Municipal', 0),
(1509, '407.01.03.13.0000', NULL, 'Subsidios otorgados por normas externas', 0),
(1510, '407.01.03.14.0000', NULL, 'Incentivos otorgados por normas externas', 0),
(1511, '407.01.03.15.0000', NULL, 'Subsidios otorgados por precios políticos', 0),
(1512, '407.01.03.16.0000', NULL, 'Subsidios de costos sociales por normas externas', 0),
(1513, '407.01.03.99.0000', NULL, 'Otras transferencias corrientes internas al sector público', 0),
(1514, '407.01.04.00.0000', NULL, 'Donaciones corrientes internas al sector público', 0),
(1515, '407.01.04.01.0000', NULL, 'Donaciones corrientes a la República', 0),
(1516, '407.01.04.02.0000', NULL, 'Donaciones corrientes a entes descentralizados sin fines empresariales', 0),
(1517, '407.01.04.03.0000', NULL, 'Donaciones corrientes a instituciones de protección social', 0),
(1518, '407.01.04.04.0000', NULL, 'Donaciones corrientes a entes descentralizados con fines empresariales petroleros', 0),
(1519, '407.01.04.05.0000', NULL, 'Donaciones corrientes a entes descentralizados con fines empresariales no petroleros', 0),
(1520, '407.01.04.06.0000', NULL, 'Donaciones corrientes a entes descentralizados financieros bancarios', 0),
(1521, '407.01.04.07.0000', NULL, 'Donaciones corrientes a entes descentralizados financieros no bancarios', 0),
(1522, '407.01.04.08.0000', NULL, 'Donaciones corrientes al Poder Estadal', 0),
(1523, '407.01.04.09.0000', NULL, 'Donaciones corrientes al Poder Municipal', 0),
(1524, '407.01.05.00.0000', NULL, 'Pensiones de altos funcionarios y altas funcionarias del poder público y de elección popular, del personal de alto nivel y de dirección', 0),
(1525, '407.01.05.01.0000', NULL, 'Pensiones de altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(1526, '407.01.05.02.0000', NULL, 'Pensiones del personal de alto nivel y de dirección', 0),
(1527, '407.01.05.06.0000', NULL, 'Aguinaldos de altos funcionarios y altas funcionarias del poder público y de elección popular pensionados', 0),
(1528, '407.01.05.07.0000', NULL, 'Aguinaldos del personal pensionado de alto nivel y de dirección', 0),
(1529, '407.01.05.11.0000', NULL, 'Aportes a caja de ahorro de altos funcionarios y altas funcionarias del poder público y de elección popular pensionados', 0),
(1530, '407.01.05.12.0000', NULL, 'Aportes a caja de ahorro del personal pensionado de alto nivel y de dirección', 0),
(1531, '407.01.05.16.0000', NULL, 'Aportes a los servicios de salud, accidentes personales y gastos funerarios de altos funcionarios y altas funcionarias del poder público y de elección popular pensionados', 0),
(1532, '407.01.05.17.0000', NULL, 'Aportes a los servicios de salud, accidentes personales y gastos funerarios del personal pensionado de alto nivel y de dirección', 0),
(1533, '407.01.05.98.0000', NULL, 'Otras subvenciones de altos funcionarios y altas funcionarias del poder público y de elección popular pensionados', 0),
(1534, '407.01.05.99.0000', NULL, 'Otras subvenciones del personal pensionado de alto nivel y de dirección', 0),
(1535, '407.01.06.00.0000', NULL, 'Jubilaciones de altos funcionarios y altas funcionarias del poder público y de elección popular, del personal de alto nivel y de dirección', 0),
(1536, '407.01.06.01.0000', NULL, 'Jubilaciones de altos funcionarios y altas funcionarias del poder público y de elección popular', 0),
(1537, '407.01.06.02.0000', NULL, 'Jubilaciones del personal de alto nivel y de dirección', 0),
(1538, '407.01.06.06.0000', NULL, 'Aguinaldos de altos funcionarios y altas funcionarias del poder público y de elección popular jubilados', 0),
(1539, '407.01.06.07.0000', NULL, 'Aguinaldos del personal jubilado de alto nivel y de dirección', 0),
(1540, '407.01.06.11.0000', NULL, 'Aportes a caja de ahorro de altos funcionarios y altas funcionarias del poder público y de elección popular jubilados', 0),
(1541, '407.01.06.12.0000', NULL, 'Aportes a caja de ahorro del personal jubilado de alto nivel y de dirección', 0),
(1542, '407.01.06.16.0000', NULL, 'Aportes a los servicios de salud, accidentes personales y gastos funerarios de altos funcionarios y altas funcionarias del poder público y de elección popular jubilados', 0),
(1543, '407.01.06.17.0000', NULL, 'Aportes a los servicios de salud, accidentes personales y gastos funerarios del personal jubilado de alto nivel y de dirección', 0),
(1544, '407.01.06.98.0000', NULL, 'Otras subvenciones de altos funcionarios y altas funcionarias del poder público y de elección popular jubilados', 0),
(1545, '407.01.06.99.0000', NULL, 'Otras subvenciones del personal jubilado de alto nivel y de dirección', 0),
(1546, '407.02.00.00.0000', NULL, 'Transferencias y donaciones corrientes al exterior', 0),
(1547, '407.02.01.00.0000', NULL, 'Transferencias corrientes al exterior', 0),
(1548, '407.02.01.01.0000', NULL, 'Becas de capacitación e investigación en el exterior', 0),
(1549, '407.02.01.02.0000', NULL, 'Transferencias corrientes a instituciones sin fines de lucro', 0),
(1550, '407.02.01.03.0000', NULL, 'Transferencias corrientes a gobiernos extranjeros', 0),
(1551, '407.02.01.04.0000', NULL, 'Transferencias corrientes a organismos internacionales', 0),
(1552, '407.02.02.00.0000', NULL, 'Donaciones corrientes al exterior', 0),
(1553, '407.02.02.01.0000', NULL, 'Donaciones corrientes a personas', 0),
(1554, '407.02.02.02.0000', NULL, 'Donaciones corrientes a instituciones sin fines de lucro', 0),
(1555, '407.02.02.03.0000', NULL, 'Donaciones corrientes a gobiernos extranjeros', 0),
(1556, '407.02.02.04.0000', NULL, 'Donaciones corrientes a organismos internacionales', 0),
(1557, '407.03.00.00.0000', NULL, 'Transferencias y donaciones de capital internas', 0),
(1558, '407.03.01.00.0000', NULL, 'Transferencias de capital internas al sector privado', 0),
(1559, '407.03.01.01.0000', NULL, 'Transferencias de capital a personas', 0),
(1560, '407.03.01.02.0000', NULL, 'Transferencias de capital a instituciones sin fines de lucro', 0),
(1561, '407.03.01.03.0000', NULL, 'Transferencias de capital a empresas privadas', 0),
(1562, '407.03.02.00.0000', NULL, 'Donaciones de capital internas al sector privado', 0),
(1563, '407.03.02.01.0000', NULL, 'Donaciones de capital a personas', 0),
(1564, '407.03.02.02.0000', NULL, 'Donaciones de capital a instituciones sin fines de lucro', 0),
(1565, '407.03.03.00.0000', NULL, 'Transferencias de capital internas al sector público', 0),
(1566, '407.03.03.01.0000', NULL, 'Transferencias de capital a la República', 0),
(1567, '407.03.03.02.0000', NULL, 'Transferencias de capital a entes descentralizados sin fines empresariales', 0),
(1568, '407.03.03.03.0000', NULL, 'Transferencias de capital a instituciones de protección social', 0),
(1569, '407.03.03.04.0000', NULL, 'Transferencias de capital a entes descentralizados con fines empresariales petroleros', 0),
(1570, '407.03.03.05.0000', NULL, 'Transferencias de capital a entes descentralizados con fines empresariales no petroleros', 0),
(1571, '407.03.03.06.0000', NULL, 'Transferencias de capital a entes descentralizados financieros bancarios', 0),
(1572, '407.03.03.07.0000', NULL, 'Transferencias de capital a entes descentralizados financieros no bancarios', 0),
(1573, '407.03.03.08.0000', NULL, 'Transferencias de capital al Poder Estadal', 0),
(1574, '407.03.03.09.0000', NULL, 'Transferencias de capital al Poder Municipal', 0),
(1575, '407.03.03.99.0000', NULL, 'Otras transferencias de capital internas al sector público', 0),
(1576, '407.03.04.00.0000', NULL, 'Donaciones de capital internas al sector público', 0),
(1577, '407.03.04.01.0000', NULL, 'Donaciones de capital a la República', 0),
(1578, '407.03.04.02.0000', NULL, 'Donaciones de capital a entes descentralizados sin fines empresariales', 0),
(1579, '407.03.04.03.0000', NULL, 'Donaciones de capital a instituciones de protección social', 0),
(1580, '407.03.04.04.0000', NULL, 'Donaciones de capital a entes descentralizados con fines empresariales petroleros', 0),
(1581, '407.03.04.05.0000', NULL, 'Donaciones de capital a entes descentralizados con fines empresariales no petroleros', 0),
(1582, '407.03.04.06.0000', NULL, 'Donaciones de capital a entes descentralizados financieros bancarios', 0),
(1583, '407.03.04.07.0000', NULL, 'Donaciones de capital a entes descentralizados financieros no bancarios', 0),
(1584, '407.03.04.08.0000', NULL, 'Donaciones de capital al Poder Estadal', 0),
(1585, '407.03.04.09.0000', NULL, 'Donaciones de capital al Poder Municipal', 0),
(1586, '407.04.00.00.0000', NULL, 'Transferencias y donaciones de capital al exterior', 0),
(1587, '407.04.01.00.0000', NULL, 'Transferencias de capital al exterior', 0),
(1588, '407.04.01.01.0000', NULL, 'Transferencias de capital a personas', 0),
(1589, '407.04.01.02.0000', NULL, 'Transferencias de capital a instituciones sin fines de lucro', 0),
(1590, '407.04.01.03.0000', NULL, 'Transferencias de capital a gobiernos extranjeros', 0),
(1591, '407.04.01.04.0000', NULL, 'Transferencias de capital a organismos internacionales', 0),
(1592, '407.04.02.00.0000', NULL, 'Donaciones de capital al exterior', 0),
(1593, '407.04.02.01.0000', NULL, 'Donaciones de capital a personas', 0),
(1594, '407.04.02.02.0000', NULL, 'Donaciones de capital a instituciones sin fines de lucro', 0),
(1595, '407.04.02.03.0000', NULL, 'Donaciones de capital a gobiernos extranjeros', 0),
(1596, '407.04.02.04.0000', NULL, 'Donaciones de capital a organismos internacionales', 0),
(1597, '407.05.00.00.0000', NULL, 'Situado', 0),
(1598, '407.05.01.00.0000', NULL, 'Situado Constitucional', 0),
(1599, '407.05.01.01.0000', NULL, 'Situado Estadal', 0),
(1600, '407.05.01.02.0000', NULL, 'Situado Municipal', 0),
(1601, '407.05.02.00.0000', NULL, 'Situado Estadal a Municipal', 0),
(1602, '407.06.00.00.0000', NULL, 'Subsidio de Régimen Especial', 0),
(1603, '407.06.01.00.0000', NULL, 'Subsidio de Régimen Especial', 0),
(1604, '407.07.00.00.0000', NULL, 'Subsidio de capitalidad', 0),
(1605, '407.07.01.00.0000', NULL, 'Subsidio de capitalidad', 0),
(1606, '407.08.00.00.0000', NULL, 'Asignaciones Económicas Especiales (LAEE)', 0),
(1607, '407.08.01.00.0000', NULL, 'Asignaciones Económicas Especiales (LAEE) Estadal', 0),
(1608, '407.08.02.00.0000', NULL, 'Asignaciones Económicas Especiales (LAEE) Estadal a Municipal', 0),
(1609, '407.08.03.00.0000', NULL, 'Asignaciones Económicas Especiales (LAEE) Municipal', 0),
(1610, '407.08.04.00.0000', NULL, 'Asignaciones Económicas Especiales (LAEE) Fondo Nacional de los Consejos Comunales', 0),
(1611, '407.08.05.00.0000', NULL, 'Asignaciones Económicas Especiales (LAEE) Apoyo al Fortalecimiento Institucional', 0),
(1612, '407.09.00.00.0000', NULL, 'Aportes al Poder Estadal y al Poder Municipal por transferencia de servicios', 0),
(1613, '407.09.01.00.0000', NULL, 'Aportes al Poder Estadal por transferencia de servicios', 0),
(1614, '407.09.02.00.0000', NULL, 'Aportes al Poder Municipal por transferencia de servicios', 0),
(1615, '407.10.00.00.0000', NULL, 'Fondo Intergubernamental para la Descentralización (FIDES)', 0),
(1616, '407.10.01.00.0000', NULL, 'Fondo Intergubernamental para la Descentralización (FIDES)', 0),
(1617, '407.11.00.00.0000', NULL, 'Fondo de Compensación Interterritorial', 0),
(1618, '407.11.01.00.0000', NULL, 'Fondo de Compensación Interterritorial Estadal', 0),
(1619, '407.11.02.00.0000', NULL, 'Fondo de Compensación Interterritorial Municipal', 0),
(1620, '407.11.03.00.0000', NULL, 'Fondo de Compensación Interterritorial Poder Popular', 0),
(1621, '407.11.04.00.0000', NULL, 'Fondo de Compensación Interterritorial Fortalecimiento Institucional', 0),
(1622, '407.12.00.00.0000', NULL, 'Transferencias y donaciones de Organismos del Sector Público a Consejos Comunales, Comunas y demás organizaciones de base del poder popular', 0),
(1623, '407.12.01.00.0000', NULL, 'Transferencias y donaciones corrientes de Organismos del Sector Público a Consejos Comunales, Comunas y demás organizaciones de base del poder popular', 0),
(1624, '407.12.01.01.0000', NULL, 'Transferencias corrientes de Organismos del Sector Público a Consejos Comunales, Comunas y demás organizaciones de base del poder popular', 0),
(1625, '407.12.01.02.0000', NULL, 'Donaciones corrientes de Organismos del Sector Público a Consejos Comunales, Comunas y demás organizaciones de base del poder popular', 0),
(1626, '407.12.02.00.0000', NULL, 'Transferencias y donaciones de capital de Organismos del Sector Público a Consejos Comunales, Comunas y demás organizaciones de base del poder popular', 0),
(1627, '407.12.02.01.0000', NULL, 'Transferencias de capital de Organismos del Sector Público a Consejos Comunales, Comunas y demás organizaciones de base del poder popular', 0),
(1628, '407.12.02.02.0000', NULL, 'Donaciones de capital de Organismos del Sector Público a Consejos Comunales, Comunas y demás organizaciones de base del poder popular', 0),
(1629, '408.00.00.00.0000', NULL, 'OTROS GASTOS', 0),
(1630, '408.01.00.00.0000', NULL, 'Depreciación y amortización', 0),
(1631, '408.01.01.00.0000', NULL, 'Depreciación', 0),
(1632, '408.01.01.01.0000', NULL, 'Depreciación de edificios e instalaciones', 0),
(1633, '408.01.01.02.0000', NULL, 'Depreciación de maquinaria y demás equipos de construcción, campo, industria y taller', 0),
(1634, '408.01.01.03.0000', NULL, 'Depreciación de equipos de transporte, tracción y elevación', 0),
(1635, '408.01.01.04.0000', NULL, 'Depreciación de equipos de comunicaciones y de señalamiento', 0),
(1636, '408.01.01.05.0000', NULL, 'Depreciación de equipos médico - quirúrgicos, dentales y de veterinaria', 0),
(1637, '408.01.01.06.0000', NULL, 'Depreciación de equipos científicos, religiosos, de enseñanza y recreación', 0),
(1638, '408.01.01.07.0000', NULL, 'Depreciación de equipos para la seguridad pública', 0),
(1639, '408.01.01.08.0000', NULL, 'Depreciación de máquinas, muebles y demás equipos de oficina y alojamiento', 0),
(1640, '408.01.01.09.0000', NULL, 'Depreciación de semovientes', 0),
(1641, '408.01.01.99.0000', NULL, 'Depreciación de otros bienes de uso', 0),
(1642, '408.01.02.00.0000', NULL, 'Amortización', 0),
(1643, '408.01.02.01.0000', NULL, 'Amortización de marcas de fábrica y patentes de invención', 0),
(1644, '408.01.02.02.0000', NULL, 'Amortización de derechos de autor', 0),
(1645, '408.01.02.03.0000', NULL, 'Amortización de gastos de organización', 0),
(1646, '408.01.02.04.0000', NULL, 'Amortización de paquetes y programas de computación', 0),
(1647, '408.01.02.05.0000', NULL, 'Amortización de estudios y proyectos', 0),
(1648, '408.01.02.99.0000', NULL, 'Amortización de otros activos intangibles', 0),
(1649, '408.02.00.00.0000', NULL, 'Intereses por operaciones financieras', 0),
(1650, '408.02.01.00.0000', NULL, 'Intereses por depósitos internos', 0),
(1651, '408.02.02.00.0000', NULL, 'Intereses por títulos y valores', 0),
(1652, '408.02.03.00.0000', NULL, 'Intereses por otros financiamientos', 0),
(1653, '408.03.00.00.0000', NULL, 'Gastos por operaciones de seguro', 0),
(1654, '408.03.01.00.0000', NULL, 'Gastos de siniestros', 0),
(1655, '408.03.02.00.0000', NULL, 'Gastos de operaciones de reaseguros', 0),
(1656, '408.03.99.00.0000', NULL, 'Otros gastos de operaciones de seguro', 0),
(1657, '408.04.00.00.0000', NULL, 'Pérdida en operaciones de los servicios básicos', 0),
(1658, '408.04.01.00.0000', NULL, 'Pérdidas en el proceso de distribución de los servicios', 0),
(1659, '408.04.99.00.0000', NULL, 'Otras pérdidas en operación', 0),
(1660, '408.05.00.00.0000', NULL, 'Obligaciones en el ejercicio vigente', 0),
(1661, '408.05.01.00.0000', NULL, 'Devoluciones de cobros indebidos', 0),
(1662, '408.05.02.00.0000', NULL, 'Devoluciones y reintegros diversos', 0),
(1663, '408.05.03.00.0000', NULL, 'Indemnizaciones diversas', 0),
(1664, '408.06.00.00.0000', NULL, 'Pérdidas ajenas a la operación', 0),
(1665, '408.06.01.00.0000', NULL, 'Pérdidas en inventarios', 0),
(1666, '408.06.02.00.0000', NULL, 'Pérdidas en operaciones cambiarias', 0),
(1667, '408.06.03.00.0000', NULL, 'Pérdidas en ventas de activos', 0),
(1668, '408.06.04.00.0000', NULL, 'Pérdidas por cuentas incobrables', 0),
(1669, '408.06.05.00.0000', NULL, 'Participación en pérdidas de otras empresas', 0),
(1670, '408.06.06.00.0000', NULL, 'Pérdidas por auto-seguro', 0),
(1671, '408.06.07.00.0000', NULL, 'Impuestos directos', 0),
(1672, '408.06.08.00.0000', NULL, 'Intereses de mora', 0),
(1673, '408.06.09.00.0000', NULL, 'Reservas técnicas', 0),
(1674, '408.07.00.00.0000', NULL, 'Descuentos, bonificaciones y devoluciones', 0),
(1675, '408.07.01.00.0000', NULL, 'Descuentos sobre ventas', 0),
(1676, '408.07.02.00.0000', NULL, 'Bonificaciones por ventas', 0),
(1677, '408.07.03.00.0000', NULL, 'Devoluciones por ventas', 0),
(1678, '408.07.04.00.0000', NULL, 'Devoluciones por primas de seguro', 0),
(1679, '408.08.00.00.0000', NULL, 'Indemnizaciones y sanciones pecuniarias', 0),
(1680, '408.08.01.00.0000', NULL, 'Indemnizaciones por daños y perjuicios', 0),
(1681, '408.08.01.01.0000', NULL, 'Indemnizaciones por daños y perjuicios ocasionados por organismos de la República, del Poder Estadal y del Poder Municipal', 0),
(1682, '408.08.01.02.0000', NULL, 'Indemnizaciones por daños y perjuicios ocasionados por entes descentralizados sin fines empresariales', 0),
(1683, '408.08.01.03.0000', NULL, 'Indemnizaciones por daños y perjuicios ocasionados por entes descentralizados con fines empresariales', 0),
(1684, '408.08.02.00.0000', NULL, 'Sanciones pecuniarias', 0),
(1685, '408.08.02.01.0000', NULL, 'Sanciones pecuniarias impuestas a los organismos de la República, del Poder Estadal y del Poder Municipal', 0),
(1686, '408.08.02.02.0000', NULL, 'Sanciones pecuniarias impuestas a los entes descentralizados sin fines empresariales', 0),
(1687, '408.08.02.03.0000', NULL, 'Sanciones pecuniarias impuestas a los entes descentralizados con fines empresariales', 0),
(1688, '408.99.00.00.0000', NULL, 'Otros gastos', 0),
(1689, '408.99.01.00.0000', NULL, 'Otros gastos', 0),
(1690, '409.00.00.00.0000', NULL, 'ASIGNACIONES NO DISTRIBUIDAS', 0),
(1691, '409.01.00.00.0000', NULL, 'Asignaciones no distribuidas de la Asamblea Nacional', 0),
(1692, '409.01.01.00.0000', NULL, 'Asignaciones no distribuidas de la Asamblea Nacional', 0),
(1693, '409.02.00.00.0000', NULL, 'Asignaciones no distribuidas de la Contraloría General de la República', 0),
(1694, '409.02.01.00.0000', NULL, 'Asignaciones no distribuidas de la Contraloría General de la República', 0),
(1695, '409.03.00.00.0000', NULL, 'Asignaciones no distribuidas del Consejo Nacional Electoral', 0),
(1696, '409.03.01.00.0000', NULL, 'Asignaciones no distribuidas del Consejo Nacional Electoral', 0),
(1697, '409.04.00.00.0000', NULL, 'Asignaciones no distribuidas del Tribunal Supremo de Justicia', 0),
(1698, '409.04.01.00.0000', NULL, 'Asignaciones no distribuidas del Tribunal Supremo de Justicia', 0),
(1699, '409.05.00.00.0000', NULL, 'Asignaciones no distribuidas del Ministerio Público', 0),
(1700, '409.05.01.00.0000', NULL, 'Asignaciones no distribuidas del Ministerio Público', 0),
(1701, '409.06.00.00.0000', NULL, 'Asignaciones no distribuidas de la Defensoría del Pueblo', 0),
(1702, '409.06.01.00.0000', NULL, 'Asignaciones no distribuidas de la Defensoría del Pueblo', 0),
(1703, '409.07.00.00.0000', NULL, 'Asignaciones no distribuidas del Consejo Moral Republicano', 0),
(1704, '409.07.01.00.0000', NULL, 'Asignaciones no distribuidas del Consejo Moral Republicano', 0),
(1705, '409.08.00.00.0000', NULL, 'Reestructuración de organismos del sector público', 0),
(1706, '409.08.01.00.0000', NULL, 'Reestructuración de organismos del sector público', 0),
(1707, '409.09.00.00.0000', NULL, 'Fondo de apoyo al trabajador y su grupo familiar', 0),
(1708, '409.09.01.00.0000', NULL, 'Fondo de apoyo al personal y su grupo familiar de la Administración Pública Nacional', 0),
(1709, '409.09.02.00.0000', NULL, 'Fondo de apoyo al personal y su grupo familiar de los Estados y Municipios', 0),
(1710, '409.10.00.00.0000', NULL, 'Reforma de la seguridad social', 0),
(1711, '409.10.01.00.0000', NULL, 'Reforma de la seguridad social', 0),
(1712, '409.11.00.00.0000', NULL, 'Emergencias en el territorio nacional', 0),
(1713, '409.11.01.00.0000', NULL, 'Emergencias en el territorio nacional', 0),
(1714, '409.12.00.00.0000', NULL, 'Fondo para la cancelación de pasivos laborales', 0),
(1715, '409.12.01.00.0000', NULL, 'Fondo para la cancelación de pasivos laborales', 0),
(1716, '409.13.00.00.0000', NULL, 'Fondo para la cancelación de deuda por servicios de electricidad, teléfono, aseo, agua y condominio', 0),
(1717, '409.13.01.00.0000', NULL, 'Fondo para la cancelación de deuda por servicios de electricidad, teléfono, aseo, agua y condominio, de los organismos de la Administración Central', 0),
(1718, '409.13.02.00.0000', NULL, 'Fondo para la cancelación de deuda por servicios de electricidad, teléfono, aseo, agua y condominio, de los organismos de la Administración Descentralizada Nacional', 0),
(1719, '409.14.00.00.0000', NULL, 'Fondo para remuneraciones, pensiones y jubilaciones y otras retribuciones', 0),
(1720, '409.14.01.00.0000', NULL, 'Fondo para remuneraciones, pensiones y jubilaciones y otras retribuciones', 0),
(1721, '409.15.00.00.0000', NULL, 'Fondo para atender compromisos generados de la Ley Orgánica del Trabajo, los Trabajadores y las Trabajadoras', 0),
(1722, '409.15.01.00.0000', NULL, 'Fondo para atender compromisos generados de la Ley Orgánica del Trabajo, los Trabajadores y las Trabajadoras', 0),
(1723, '409.16.00.00.0000', NULL, 'Asignaciones para cancelar compromisos pendientes de ejercicios económico financieros anteriores', 0),
(1724, '409.16.01.00.0000', NULL, 'Asignaciones para cancelar compromisos pendientes de ejercicios económico financieros anteriores', 0),
(1725, '409.17.00.00.0000', NULL, 'Asignaciones para cancelar la deuda Fogade – Ministerio competente en Materia de Finanzas – Banco Central de Venezuela (BCV)', 0),
(1726, '409.17.01.00.0000', NULL, 'Asignaciones para cancelar la deuda Fogade – Ministerio competente en Materia de Finanzas – Banco Central de Venezuela (BCV)', 0),
(1727, '409.18.00.00.0000', NULL, 'Asignaciones para atender los gastos de la referenda y elecciones', 0),
(1728, '409.18.01.00.0000', NULL, 'Asignaciones para atender los gastos de la referenda y elecciones', 0),
(1729, '409.19.00.00.0000', NULL, 'Asignaciones para atender los gastos por honorarios profesionales de bufetes internacionales, costas y costos judiciales', 0),
(1730, '409.19.01.00.0000', NULL, 'Asignaciones para atender los gastos por honorarios profesionales de bufetes internacionales, costas y costos judiciales', 0),
(1731, '409.20.00.00.0000', NULL, 'Fondo para atender compromisos generados por la contratación colectiva', 0),
(1732, '409.20.01.00.0000', NULL, 'Fondo para atender compromisos  generados por la  contratación colectiva', 0),
(1733, '409.21.00.00.0000', NULL, 'Proyecto social especial', 0),
(1734, '409.21.01.00.0000', NULL, 'Proyecto social especial', 0),
(1735, '409.22.00.00.0000', NULL, 'Asignaciones para programas y proyectos financiados con recursos de organismos multilaterales y/o bilaterales', 0),
(1736, '409.22.01.00.0000', NULL, 'Asignaciones para programas y proyectos financiados con recursos de organismos multilaterales y/o bilaterales', 0),
(1737, '409.23.00.00.0000', NULL, 'Asignación para facilitar la preparación de proyectos', 0),
(1738, '409.23.01.00.0000', NULL, 'Asignación para facilitar la preparación de proyectos', 0),
(1739, '409.24.00.00.0000', NULL, 'Programas de inversión para las entidades estadales, municipalidades y otras instituciones', 0),
(1740, '409.24.01.00.0000', NULL, 'Programas de inversión para las entidades estadales, municipalidades y otras instituciones', 0),
(1741, '409.25.00.00.0000', NULL, 'Cancelación de compromisos', 0),
(1742, '409.25.01.00.0000', NULL, 'Cancelación de compromisos', 0),
(1743, '409.26.00.00.0000', NULL, 'Asignaciones para atender gastos de los organismos del sector público', 0),
(1744, '409.26.01.00.0000', NULL, 'Asignaciones para atender gastos de los organismos del sector público', 0),
(1745, '409.27.00.00.0000', NULL, 'Convenio de Cooperación Especial', 0),
(1746, '409.27.01.00.0000', NULL, 'Convenio de Cooperación Especial', 0),
(1747, '410.00.00.00.0000', NULL, 'SERVICIO DE LA DEUDA PÚBLICA', 0),
(1748, '410.01.00.00.0000', NULL, 'Servicio de la deuda pública interna a corto plazo', 0),
(1749, '410.01.01.00.0000', NULL, 'Servicio de la deuda pública interna a corto plazo de títulos y valores', 0),
(1750, '410.01.01.01.0000', NULL, 'Amortización de la deuda pública interna a corto plazo de títulos y valores', 0),
(1751, '410.01.01.02.0000', NULL, 'Amortización de la deuda pública interna a corto plazo de letras del tesoro', 0),
(1752, '410.01.01.03.0000', NULL, 'Intereses de la deuda pública interna a corto plazo de títulos y valores', 0),
(1753, '410.01.01.04.0000', NULL, 'Intereses por mora y multas de la deuda pública interna a corto plazo de títulos y valores', 0),
(1754, '410.01.01.05.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna a corto plazo de títulos y valores', 0),
(1755, '410.01.01.06.0000', NULL, 'Descuentos en colocación de títulos y valores de la deuda pública interna a corto plazo', 0),
(1756, '410.01.01.07.0000', NULL, 'Descuentos en colocación de letras del tesoro a corto plazo', 0),
(1757, '410.01.02.00.0000', NULL, 'Servicio de la deuda pública interna por préstamos a corto plazo', 0),
(1758, '410.01.02.01.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos del sector privado a corto plazo', 0),
(1759, '410.01.02.02.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de la República a corto plazo', 0),
(1760, '410.01.02.03.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a corto plazo', 0),
(1761, '410.01.02.04.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de instituciones de protección social a corto plazo', 0);
INSERT INTO `partidas_presupuestarias` (`id`, `partida`, `nombre`, `descripcion`, `status`) VALUES
(1762, '410.01.02.05.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a corto plazo', 0),
(1763, '410.01.02.06.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a corto plazo', 0),
(1764, '410.01.02.07.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a corto plazo', 0),
(1765, '410.01.02.08.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a corto plazo', 0),
(1766, '410.01.02.09.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos del Poder Estadal a corto plazo', 0),
(1767, '410.01.02.10.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos del Poder Municipal a corto plazo', 0),
(1768, '410.01.02.11.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos del sector privado a corto plazo', 0),
(1769, '410.01.02.12.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de la República a corto plazo', 0),
(1770, '410.01.02.13.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a corto plazo', 0),
(1771, '410.01.02.14.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de instituciones de protección social a corto plazo', 0),
(1772, '410.01.02.15.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a corto plazo', 0),
(1773, '410.01.02.16.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a corto plazo', 0),
(1774, '410.01.02.17.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a corto plazo', 0),
(1775, '410.01.02.18.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a corto plazo', 0),
(1776, '410.01.02.19.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos del Poder Estadal a corto plazo', 0),
(1777, '410.01.02.20.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos del Poder Municipal a corto plazo', 0),
(1778, '410.01.02.21.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos del sector privado a corto plazo', 0),
(1779, '410.01.02.22.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de la República a corto plazo', 0),
(1780, '410.01.02.23.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a corto plazo', 0),
(1781, '410.01.02.24.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de instituciones de protección social a corto plazo', 0),
(1782, '410.01.02.25.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a corto plazo', 0),
(1783, '410.01.02.26.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a corto plazo', 0),
(1784, '410.01.02.27.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a corto plazo', 0),
(1785, '410.01.02.28.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a corto plazo', 0),
(1786, '410.01.02.29.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos del Poder Estadal a corto plazo', 0),
(1787, '410.01.02.30.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos del Poder Municipal a corto plazo', 0),
(1788, '410.01.02.31.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos del sector privado a corto plazo', 0),
(1789, '410.01.02.32.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de la República a corto plazo', 0),
(1790, '410.01.02.33.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a corto plazo', 0),
(1791, '410.01.02.34.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de instituciones de protección social a corto plazo', 0),
(1792, '410.01.02.35.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a corto plazo', 0),
(1793, '410.01.02.36.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a corto plazo', 0),
(1794, '410.01.02.37.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a corto plazo', 0),
(1795, '410.01.02.38.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a corto plazo', 0),
(1796, '410.01.02.39.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos del Poder Estadal a corto plazo', 0),
(1797, '410.01.02.40.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos del Poder Municipal a corto plazo', 0),
(1798, '410.01.03.00.0000', NULL, 'Servicio de la deuda pública interna indirecta por préstamos a corto plazo', 0),
(1799, '410.01.03.01.0000', NULL, 'Amortización de la deuda pública interna indirecta por préstamos recibidos del sector privado a corto plazo', 0),
(1800, '410.01.03.02.0000', NULL, 'Amortización de la deuda pública interna indirecta por préstamos recibidos del sector público a corto plazo', 0),
(1801, '410.01.03.03.0000', NULL, 'Intereses de la deuda pública interna indirecta por préstamos recibidos del sector privado a corto plazo', 0),
(1802, '410.01.03.04.0000', NULL, 'Intereses de la deuda pública interna indirecta por préstamos recibidos del sector público a corto plazo', 0),
(1803, '410.01.03.05.0000', NULL, 'Intereses por mora y multas de la deuda pública interna indirecta por préstamos recibidos del sector privado a corto plazo', 0),
(1804, '410.01.03.06.0000', NULL, 'Intereses por mora y multas de la deuda pública interna indirecta por préstamos recibidos del sector público a corto plazo', 0),
(1805, '410.01.03.07.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna indirecta por préstamos recibidos del sector privado a corto plazo', 0),
(1806, '410.01.03.08.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna indirecta por préstamos recibidos del sector público a corto plazo', 0),
(1807, '410.02.00.00.0000', NULL, 'Servicio de la deuda pública interna a largo plazo', 0),
(1808, '410.02.01.00.0000', NULL, 'Servicio de la deuda pública interna a largo plazo de títulos y valores', 0),
(1809, '410.02.01.01.0000', NULL, 'Amortización de la deuda pública interna a largo plazo de títulos y valores', 0),
(1810, '410.02.01.02.0000', NULL, 'Amortización de la deuda pública interna a largo plazo de letras del tesoro', 0),
(1811, '410.02.01.03.0000', NULL, 'Intereses de la deuda pública interna a largo plazo de títulos y valores', 0),
(1812, '410.02.01.04.0000', NULL, 'Intereses por mora y multas de la deuda pública interna a largo plazo de títulos y valores', 0),
(1813, '410.02.01.05.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna a largo plazo de títulos y valores', 0),
(1814, '410.02.01.06.0000', NULL, 'Descuentos en colocación de títulos y valores de la deuda pública interna a largo plazo', 0),
(1815, '410.02.01.07.0000', NULL, 'Descuentos en colocación de letras del tesoro a largo plazo', 0),
(1816, '410.02.02.00.0000', NULL, 'Servicio de la deuda pública interna por préstamos a largo plazo', 0),
(1817, '410.02.02.01.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos del sector privado a largo plazo', 0),
(1818, '410.02.02.02.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de la República a largo plazo', 0),
(1819, '410.02.02.03.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a largo plazo', 0),
(1820, '410.02.02.04.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de instituciones de protección social a largo plazo', 0),
(1821, '410.02.02.05.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a largo plazo', 0),
(1822, '410.02.02.06.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a largo plazo', 0),
(1823, '410.02.02.07.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a largo plazo', 0),
(1824, '410.02.02.08.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a largo plazo', 0),
(1825, '410.02.02.09.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos del Poder Estadal a largo plazo', 0),
(1826, '410.02.02.10.0000', NULL, 'Amortización de la deuda pública interna por préstamos recibidos del Poder Municipal a largo plazo', 0),
(1827, '410.02.02.11.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos del sector privado a largo plazo', 0),
(1828, '410.02.02.12.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de la República a largo plazo', 0),
(1829, '410.02.02.13.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a largo plazo', 0),
(1830, '410.02.02.14.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de instituciones de protección social a largo plazo', 0),
(1831, '410.02.02.15.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a largo plazo', 0),
(1832, '410.02.02.16.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a largo plazo', 0),
(1833, '410.02.02.17.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a largo plazo', 0),
(1834, '410.02.02.18.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a largo plazo', 0),
(1835, '410.02.02.19.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos del Poder Estadal a largo plazo', 0),
(1836, '410.02.02.20.0000', NULL, 'Intereses de la deuda pública interna por préstamos recibidos del Poder Municipal a largo plazo', 0),
(1837, '410.02.02.21.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos del sector privado a largo plazo', 0),
(1838, '410.02.02.22.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de la República a largo plazo', 0),
(1839, '410.02.02.23.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a largo plazo', 0),
(1840, '410.02.02.24.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de instituciones de protección social a largo plazo', 0),
(1841, '410.02.02.25.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a largo plazo', 0),
(1842, '410.02.02.26.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a largo plazo', 0),
(1843, '410.02.02.27.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a largo plazo', 0),
(1844, '410.02.02.28.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a largo plazo', 0),
(1845, '410.02.02.29.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos del Poder Estadal a largo plazo', 0),
(1846, '410.02.02.30.0000', NULL, 'Intereses por mora y multas de la deuda pública interna por préstamos recibidos del Poder Municipal a largo plazo', 0),
(1847, '410.02.02.31.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos del sector privado a largo plazo', 0),
(1848, '410.02.02.32.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de la República a largo plazo', 0),
(1849, '410.02.02.33.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados sin fines empresariales a largo plazo', 0),
(1850, '410.02.02.34.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de instituciones de protección social a largo plazo', 0),
(1851, '410.02.02.35.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales petroleros a largo plazo', 0),
(1852, '410.02.02.36.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados con fines empresariales no petroleros a largo plazo', 0),
(1853, '410.02.02.37.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados financieros bancarios a largo plazo', 0),
(1854, '410.02.02.38.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos de entes descentralizados financieros no bancarios a largo plazo', 0),
(1855, '410.02.02.39.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos del Poder Estadal a largo plazo', 0),
(1856, '410.02.02.40.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna por préstamos recibidos del Poder Municipal a largo plazo', 0),
(1857, '410.02.03.00.0000', NULL, 'Servicio de la deuda pública interna indirecta a largo plazo de títulos y valores', 0),
(1858, '410.02.03.01.0000', NULL, 'Amortización de la deuda pública interna indirecta a largo plazo de títulos y valores', 0),
(1859, '410.02.03.02.0000', NULL, 'Intereses de la deuda pública interna indirecta a largo plazo de títulos y valores', 0),
(1860, '410.02.03.03.0000', NULL, 'Intereses por mora y multas de la deuda pública interna indirecta a largo plazo de títulos y valores', 0),
(1861, '410.02.03.04.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna indirecta a largo plazo de títulos y valores', 0),
(1862, '410.02.03.05.0000', NULL, 'Descuentos en colocación de títulos y valores de la deuda pública interna indirecta de largo plazo', 0),
(1863, '410.02.04.00.0000', NULL, 'Servicio de la deuda pública interna indirecta por préstamos a largo plazo', 0),
(1864, '410.02.04.01.0000', NULL, 'Amortización de la deuda pública interna indirecta por préstamos recibidos del sector privado a largo plazo', 0),
(1865, '410.02.04.02.0000', NULL, 'Amortización de la deuda pública interna indirecta por préstamos recibidos del sector público a largo plazo', 0),
(1866, '410.02.04.03.0000', NULL, 'Intereses de la deuda pública interna indirecta por préstamos recibidos del sector privado a largo plazo', 0),
(1867, '410.02.04.04.0000', NULL, 'Intereses de la deuda pública interna indirecta por préstamos recibidos del sector público a largo plazo', 0),
(1868, '410.02.04.05.0000', NULL, 'Intereses por mora y multas de la deuda pública interna indirecta por préstamos recibidos del sector privado a largo plazo', 0),
(1869, '410.02.04.06.0000', NULL, 'Intereses por mora y multas de la deuda pública interna indirecta por préstamos recibidos del sector público a largo plazo', 0),
(1870, '410.02.04.07.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna indirecta por préstamos recibidos del sector privado a largo plazo', 0),
(1871, '410.02.04.08.0000', NULL, 'Comisiones y otros gastos de la deuda pública interna indirecta por préstamos recibidos del sector público a largo plazo', 0),
(1872, '410.03.00.00.0000', NULL, 'Servicio de la deuda pública externa a corto plazo', 0),
(1873, '410.03.01.00.0000', NULL, 'Servicio de la deuda pública externa a corto plazo de títulos y valores', 0),
(1874, '410.03.01.01.0000', NULL, 'Amortización de la deuda pública externa a corto plazo de títulos y valores', 0),
(1875, '410.03.01.02.0000', NULL, 'Intereses de la deuda pública externa a corto plazo de títulos y valores', 0),
(1876, '410.03.01.03.0000', NULL, 'Intereses por mora y multas de la deuda pública externa a corto plazo de títulos y valores', 0),
(1877, '410.03.01.04.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa a corto plazo de títulos y valores', 0),
(1878, '410.03.01.05.0000', NULL, 'Descuentos en colocación de títulos y valores de la deuda pública externa a corto plazo', 0),
(1879, '410.03.02.00.0000', NULL, 'Servicio de la deuda pública externa por préstamos a corto plazo', 0),
(1880, '410.03.02.01.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1881, '410.03.02.02.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de organismos internacionales a corto plazo', 0),
(1882, '410.03.02.03.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1883, '410.03.02.04.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1884, '410.03.02.05.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1885, '410.03.02.06.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de organismos internacionales a corto plazo', 0),
(1886, '410.03.02.07.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1887, '410.03.02.08.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1888, '410.03.02.09.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1889, '410.03.02.10.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos  de organismos internacionales a corto plazo', 0),
(1890, '410.03.02.11.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1891, '410.03.02.12.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1892, '410.03.02.13.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1893, '410.03.02.14.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de organismos internacionales a corto plazo', 0),
(1894, '410.03.02.15.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1895, '410.03.02.16.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1896, '410.03.03.00.0000', NULL, 'Servicio de la deuda pública externa indirecta por préstamos a corto plazo', 0),
(1897, '410.03.03.01.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1898, '410.03.03.02.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a corto plazo', 0),
(1899, '410.03.03.03.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1900, '410.03.03.04.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1901, '410.03.03.05.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1902, '410.03.03.06.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a corto plazo', 0),
(1903, '410.03.03.07.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1904, '410.03.03.08.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1905, '410.03.03.09.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1906, '410.03.03.10.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a corto plazo', 0),
(1907, '410.03.03.11.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1908, '410.03.03.12.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1909, '410.03.03.13.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a corto plazo', 0),
(1910, '410.03.03.14.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a corto plazo', 0),
(1911, '410.03.03.15.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a corto plazo', 0),
(1912, '410.03.03.16.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a corto plazo', 0),
(1913, '410.04.00.00.0000', NULL, 'Servicio de la deuda pública externa a largo plazo', 0),
(1914, '410.04.01.00.0000', NULL, 'Servicio de la deuda pública externa a largo plazo de títulos y valores', 0),
(1915, '410.04.01.01.0000', NULL, 'Amortización de la deuda pública externa a largo plazo de títulos y valores', 0),
(1916, '410.04.01.02.0000', NULL, 'Intereses de la deuda pública externa a largo plazo de títulos y valores', 0),
(1917, '410.04.01.03.0000', NULL, 'Intereses por mora y multas de la deuda pública externa a largo plazo de títulos y valores', 0),
(1918, '410.04.01.04.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa a largo plazo de títulos y valores', 0),
(1919, '410.04.01.05.0000', NULL, 'Descuentos en colocación de títulos y valores de la deuda pública externa a largo plazo', 0),
(1920, '410.04.02.00.0000', NULL, 'Servicio de la deuda pública externa por préstamos a largo plazo', 0),
(1921, '410.04.02.01.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de gobiernos extranjeros a largo plazo', 0),
(1922, '410.04.02.02.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1923, '410.04.02.03.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1924, '410.04.02.04.0000', NULL, 'Amortización de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos  a largo plazo', 0),
(1925, '410.04.02.05.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de gobiernos extranjeros  a largo plazo', 0),
(1926, '410.04.02.06.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1927, '410.04.02.07.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1928, '410.04.02.08.0000', NULL, 'Intereses de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos  a largo plazo', 0),
(1929, '410.04.02.09.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos de gobiernos extranjeros  a largo plazo', 0),
(1930, '410.04.02.10.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1931, '410.04.02.11.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1932, '410.04.02.12.0000', NULL, 'Intereses por mora y multas de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos a largo plazo', 0),
(1933, '410.04.02.13.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de gobiernos extranjeros a largo plazo', 0),
(1934, '410.04.02.14.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1935, '410.04.02.15.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1936, '410.04.02.16.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa por préstamos recibidos de proveedores de bienes y servicios externos a largo plazo', 0),
(1937, '410.04.03.00.0000', NULL, 'Servicio de la deuda pública externa indirecta a largo plazo de títulos y valores', 0),
(1938, '410.04.03.01.0000', NULL, 'Amortización de la deuda pública externa indirecta a largo plazo de títulos y valores', 0),
(1939, '410.04.03.02.0000', NULL, 'Intereses de la deuda pública externa indirecta a largo plazo de títulos y valores', 0),
(1940, '410.04.03.03.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta a largo plazo de títulos y valores', 0),
(1941, '410.04.03.04.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta a largo plazo de títulos y valores', 0),
(1942, '410.04.03.05.0000', NULL, 'Descuentos en colocación de títulos y valores de la deuda pública externa indirecta a largo plazo', 0),
(1943, '410.04.04.00.0000', NULL, 'Servicio de la deuda pública externa indirecta por préstamos a largo plazo', 0),
(1944, '410.04.04.01.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a largo plazo', 0),
(1945, '410.04.04.02.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1946, '410.04.04.03.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1947, '410.04.04.04.0000', NULL, 'Amortización de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a largo plazo', 0),
(1948, '410.04.04.05.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a largo plazo', 0),
(1949, '410.04.04.06.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1950, '410.04.04.07.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1951, '410.04.04.08.0000', NULL, 'Intereses de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a largo plazo', 0),
(1952, '410.04.04.09.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a largo plazo', 0),
(1953, '410.04.04.10.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1954, '410.04.04.11.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1955, '410.04.04.12.0000', NULL, 'Intereses por mora y multas de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a largo plazo', 0),
(1956, '410.04.04.13.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de gobiernos extranjeros a largo plazo', 0),
(1957, '410.04.04.14.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de organismos internacionales a largo plazo', 0),
(1958, '410.04.04.15.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de instituciones financieras externas a largo plazo', 0),
(1959, '410.04.04.16.0000', NULL, 'Comisiones y otros gastos de la deuda pública externa indirecta por préstamos recibidos de proveedores de bienes y servicios externos a largo plazo', 0),
(1960, '410.05.00.00.0000', NULL, 'Reestructuración y/o refinanciamiento de la deuda publica', 0),
(1961, '410.05.01.00.0000', NULL, 'Disminución por reestructuración y/o refinanciamiento de la deuda interna a largo plazo, en a corto plazo', 0),
(1962, '410.05.02.00.0000', NULL, 'Disminución por reestructuración y/o refinanciamiento de la deuda interna a corto plazo, en a largo plazo', 0),
(1963, '410.05.03.00.0000', NULL, 'Disminución por reestructuración y/o refinanciamiento de la deuda externa a largo plazo, en a corto plazo', 0),
(1964, '410.05.04.00.0000', NULL, 'Disminución por reestructuración y/o refinanciamiento de la deuda externa a corto plazo, en a largo plazo', 0),
(1965, '410.05.05.00.0000', NULL, 'Disminución de la deuda pública por distribuir', 0),
(1966, '410.05.05.01.0000', NULL, 'Disminución de la deuda pública interna por distribuir', 0),
(1967, '410.05.05.02.0000', NULL, 'Disminución de la deuda pública externa por distribuir', 0),
(1968, '410.06.00.00.0000', NULL, 'Servicio de la deuda pública por obligaciones de ejercicios económico financieros anteriores', 0),
(1969, '410.06.01.00.0000', NULL, 'Amortización de la deuda pública de obligaciones pendientes de ejercicios económico financieros anteriores', 0),
(1970, '410.06.02.00.0000', NULL, 'Intereses de la deuda pública de obligaciones pendientes de ejercicios económico financieros anteriores', 0),
(1971, '410.06.03.00.0000', NULL, 'Intereses por mora y multas de la deuda pública de obligaciones pendientes de ejercicios económico financieros anteriores', 0),
(1972, '410.06.04.00.0000', NULL, 'Comisiones y otros gastos de la deuda  pública de obligaciones pendientes de ejercicios económico financieros anteriores', 0),
(1973, '411.00.00.00.0000', NULL, 'DISMINUCION DE PASIVOS', 0),
(1974, '411.01.00.00.0000', NULL, 'Disminución de gastos de personal por pagar', 0),
(1975, '411.01.01.00.0000', NULL, 'Disminución de sueldos, salarios y otras remuneraciones por pagar', 0),
(1976, '411.02.00.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar', 0),
(1977, '411.02.01.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar al Instituto Venezolano de los Seguros Sociales (IVSS)', 0),
(1978, '411.02.02.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar al Instituto de Previsión Social del Ministerio de Educación (Ipasme)', 0),
(1979, '411.02.03.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar al Fondo de Jubilaciones', 0),
(1980, '411.02.04.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar al Fondo Contributivo del Régimen Prestacional de Empleo', 0),
(1981, '411.02.05.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar al Fondo de Ahorro Obligatorio para la Vivienda (FAOV)', 0),
(1982, '411.02.06.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar al seguro de vida, accidentes personales, hospitalización, cirugía, maternidad (HCM) y gastos funerarios', 0),
(1983, '411.02.07.00.0000', NULL, 'Disminución de aportes patronales y retenciones laborales por pagar a cajas de ahorro', 0),
(1984, '411.02.08.00.0000', NULL, 'Disminución de aportes patronales por pagar a organismos de seguridad social', 0),
(1985, '411.02.09.00.0000', NULL, 'Disminución de retenciones laborales por pagar al Instituto Nacional de Capacitación y Educación Socialista (Inces)', 0),
(1986, '411.02.10.00.0000', NULL, 'Disminución de retenciones laborales por pagar por pensión alimenticia', 0),
(1987, '411.02.98.00.0000', NULL, 'Disminución de otros aportes legales por pagar', 0),
(1988, '411.02.99.00.0000', NULL, 'Disminución de otras retenciones laborales por pagar', 0),
(1989, '411.03.00.00.0000', NULL, 'Disminución de cuentas y efectos por pagar a proveedores', 0),
(1990, '411.03.01.00.0000', NULL, 'Disminución de cuentas por pagar a proveedores a corto plazo', 0),
(1991, '411.03.02.00.0000', NULL, 'Disminución de efectos por pagar a proveedores a corto plazo', 0),
(1992, '411.03.03.00.0000', NULL, 'Disminución de cuentas por pagar a proveedores a mediano y largo plazo', 0),
(1993, '411.03.04.00.0000', NULL, 'Disminución de efectos por pagar a proveedores a mediano y largo plazo', 0),
(1994, '411.04.00.00.0000', NULL, 'Disminución de cuentas y efectos por pagar a contratistas', 0),
(1995, '411.04.01.00.0000', NULL, 'Disminución de cuentas por pagar a contratistas a corto plazo', 0),
(1996, '411.04.02.00.0000', NULL, 'Disminución de efectos por pagar a contratistas a corto plazo', 0),
(1997, '411.04.03.00.0000', NULL, 'Disminución de cuentas por pagar a contratistas a mediano largo y plazo', 0),
(1998, '411.04.04.00.0000', NULL, 'Disminución de efectos por pagar a contratistas a mediano y plazo', 0),
(1999, '411.05.00.00.0000', NULL, 'Disminución de intereses por pagar', 0),
(2000, '411.05.01.00.0000', NULL, 'Disminución de intereses internos por pagar', 0),
(2001, '411.05.02.00.0000', NULL, 'Disminución de intereses externos por pagar', 0),
(2002, '411.06.00.00.0000', NULL, 'Disminución de otras cuentas y efectos por pagar a corto plazo', 0),
(2003, '411.06.01.00.0000', NULL, 'Disminución de obligaciones de ejercicios económico financieros anteriores', 0),
(2004, '411.06.02.00.0000', NULL, 'Disminución de otras cuentas por pagar a corto plazo', 0),
(2005, '411.06.03.00.0000', NULL, 'Disminución de otros efectos por pagar a corto plazo', 0),
(2006, '411.07.00.00.0000', NULL, 'Disminución de pasivos diferidos', 0),
(2007, '411.07.01.00.0000', NULL, 'Disminución de pasivos diferidos a corto plazo', 0),
(2008, '411.07.01.01.0000', NULL, 'Disminución de rentas diferidas por recaudar a corto plazo', 0),
(2009, '411.07.02.00.0000', NULL, 'Disminución de pasivos diferidos a mediano y largo plazo', 0),
(2010, '411.07.02.01.0000', NULL, 'Disminución del rescate de certificados de reintegro tributario', 0),
(2011, '411.07.02.02.0000', NULL, 'Disminución del rescate de bonos de exportación', 0),
(2012, '411.07.02.03.0000', NULL, 'Disminución del rescate de bonos en dación de pagos', 0),
(2013, '411.08.00.00.0000', NULL, 'Disminución de provisiones y reservas técnicas', 0),
(2014, '411.08.01.00.0000', NULL, 'Disminución de provisiones', 0),
(2015, '411.08.01.01.0000', NULL, 'Disminución de provisiones para cuentas incobrables', 0),
(2016, '411.08.01.02.0000', NULL, 'Disminución de provisiones para despidos', 0),
(2017, '411.08.01.03.0000', NULL, 'Disminución de provisiones para pérdidas en el inventario', 0),
(2018, '411.08.01.04.0000', NULL, 'Disminución de provisiones para beneficios sociales', 0),
(2019, '411.08.01.99.0000', NULL, 'Disminución de otras provisiones', 0),
(2020, '411.08.02.00.0000', NULL, 'Disminución de reservas técnicas', 0),
(2021, '411.09.00.00.0000', NULL, 'Disminución de fondos de terceros', 0),
(2022, '411.09.01.00.0000', NULL, 'Disminución de depósitos recibidos en garantía', 0),
(2023, '411.09.02.00.0000', NULL, 'Disminución de depósitos recibidos por enteramiento de fondos públicos', 0),
(2024, '411.09.99.00.0000', NULL, 'Disminución de otros fondos de terceros', 0),
(2025, '411.10.00.00.0000', NULL, 'Disminución de depósitos de instituciones financieras', 0),
(2026, '411.10.01.00.0000', NULL, 'Disminución de depósitos a la vista', 0),
(2027, '411.10.01.01.0000', NULL, 'Disminución de depósitos de terceros a la vista de organismos del sector público', 0),
(2028, '411.10.01.02.0000', NULL, 'Disminución de depósitos de terceros a la vista de personas naturales y jurídicas del sector privado', 0),
(2029, '411.10.02.00.0000', NULL, 'Disminución de depósitos a plazo fijo', 0),
(2030, '411.10.02.01.0000', NULL, 'Disminución de depósitos a plazo fijo de organismos del sector público', 0),
(2031, '411.10.02.02.0000', NULL, 'Disminución de depósitos a plazo fijo de personas naturales y jurídicas del sector privado', 0),
(2032, '411.11.00.00.0000', NULL, 'Obligaciones de ejercicios económico financieros anteriores', 0),
(2033, '411.11.01.00.0000', NULL, 'Devoluciones de cobros indebidos', 0),
(2034, '411.11.02.00.0000', NULL, 'Devoluciones y reintegros diversos', 0),
(2035, '411.11.03.00.0000', NULL, 'Indemnizaciones diversas', 0),
(2036, '411.11.04.00.0000', NULL, 'Compromisos pendientes de   ejercicios económico financieros anteriores', 0),
(2037, '411.11.05.00.0000', NULL, 'Prestaciones sociales originadas por la aplicación de la Ley Orgánica del Trabajo, los Trabajadores y las Trabajadoras', 0),
(2038, '411.98.00.00.0000', NULL, 'Disminución de otros pasivos a corto plazo', 0),
(2039, '411.98.01.00.0000', NULL, 'Disminución de otros pasivos a corto plazo', 0),
(2040, '411.99.00.00.0000', NULL, 'Disminución de otros pasivos a mediano y largo plazo', 0),
(2041, '411.99.01.00.0000', NULL, 'Disminución de otros pasivos a mediano y largo plazo', 0),
(2042, '412.00.00.00.0000', NULL, 'DISMINUCIÓN DEL PATRIMONIO', 0),
(2043, '412.01.00.00.0000', NULL, 'Disminución del capital', 0),
(2044, '412.01.01.00.0000', NULL, 'Disminución del capital fiscal e institucional', 0),
(2045, '412.01.02.00.0000', NULL, 'Disminución de aportes por capitalizar', 0),
(2046, '412.01.03.00.0000', NULL, 'Disminución de dividendos a distribuir', 0),
(2047, '412.02.00.00.0000', NULL, 'Disminución de reservas', 0),
(2048, '412.02.01.00.0000', NULL, 'Disminución de reservas', 0),
(2049, '412.03.00.00.0000', NULL, 'Ajuste por inflación', 0),
(2050, '412.03.01.00.0000', NULL, 'Ajuste por inflación', 0),
(2051, '412.04.00.00.0000', NULL, 'Disminución de resultados', 0),
(2052, '412.04.01.00.0000', NULL, 'Disminución de resultados acumulados', 0),
(2053, '412.04.02.00.0000', NULL, 'Disminución de resultados del ejercicio económico financiero', 0),
(2054, '498.00.00.00.0000', NULL, 'RECTIFICACIONES AL PRESUPUESTO', 0),
(2055, '498.01.00.00.0000', NULL, 'Rectificaciones al presupuesto', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expires` varchar(255) DEFAULT NULL,
  `attempts` int(11) DEFAULT 0,
  `last_attempt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_directivo`
--

CREATE TABLE `personal_directivo` (
  `id` int(255) NOT NULL,
  `direccion` longtext DEFAULT NULL,
  `nombre_apellido` longtext DEFAULT NULL,
  `email` longtext DEFAULT NULL,
  `telefono` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal_directivo`
--

INSERT INTO `personal_directivo` (`id`, `direccion`, `nombre_apellido`, `email`, `telefono`) VALUES
(1, 'Planificación y/o Presupuesto', 'Lic. JUAN GOMEZ', '', ''),
(2, 'Administración y/o Finanzas', 'Prof. Yenny Romero', '', ''),
(3, 'Recursos Humanos y/o Personal', 'Lic. Maria Rojas', '', ''),
(4, 'Sindico (a) Procurador (a)', 'Abog. Luis Machado', '', ''),
(5, 'Cronista del Municipio:', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_inversion`
--

CREATE TABLE `plan_inversion` (
  `id` int(255) NOT NULL,
  `id_ejercicio` int(255) DEFAULT NULL,
  `monto_total` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_actividades`
--

CREATE TABLE `pl_actividades` (
  `id` int(11) NOT NULL,
  `actividad` varchar(10) DEFAULT NULL,
  `denominacion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_metas`
--

CREATE TABLE `pl_metas` (
  `id` int(255) NOT NULL,
  `programa` int(255) NOT NULL,
  `meta` longtext NOT NULL,
  `unidad_medida` longtext NOT NULL,
  `cantidad` int(255) NOT NULL,
  `costo` varchar(255) NOT NULL,
  `id_ejercicio` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_partidas`
--

CREATE TABLE `pl_partidas` (
  `id` int(11) NOT NULL,
  `partida` varchar(20) DEFAULT NULL,
  `denominacion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pl_partidas`
--

INSERT INTO `pl_partidas` (`id`, `partida`, `denominacion`) VALUES
(1, '401', 'GASTOS DE PERSONAL'),
(2, '402', 'MATERIALES SUMINISTROS Y MERCANCIAS'),
(3, '403', 'SERVICIOS NO PERSONALES \r\n'),
(4, '404', 'ACTIVOS REALES '),
(5, '407', 'TRANSFERENCIAS Y DONACIONES'),
(6, '408', 'OTROS GASTOS'),
(7, '411', 'DISMINUCION DE PASIVOS'),
(8, '498', 'RECTIFICACIONES AL PRESUPUESTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_programas`
--

CREATE TABLE `pl_programas` (
  `id` int(11) NOT NULL,
  `sector` varchar(10) DEFAULT NULL,
  `programa` varchar(10) DEFAULT NULL,
  `denominacion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pl_programas`
--

INSERT INTO `pl_programas` (`id`, `sector`, `programa`, `denominacion`) VALUES
(1, '1', '01', 'LEGISLACION Y SANCION DE INSTRUMENTOS JURIDICOS'),
(2, '1', '02', 'CONTROL DE LA HACIENDA ESTADAL'),
(3, '1', '03', 'REPRESENTACION JURIDICA DEL ESTADO'),
(4, '1', '04', 'DIRECCION, COORDINACION PARA LAS POLITICAS DEL ESTADO'),
(5, '1', '05', 'SECRETARIA DE COORDINACION'),
(6, '1', '06', 'SERVICIOS DE ADMINISTRACION DE RECURSOS HUMANOS'),
(7, '1', '07', 'PLANIFICACION Y ADMINISTRACION PRESUPUESTARIA'),
(8, '1', '08', 'SERVICIOS DE ADMINISTRACION'),
(9, '1', '09', 'SERVICIOS DE ADMINISTRACION DEL TESORO'),
(10, '1', '10', 'SECRETARIA EJECUTIVA INDIGENA'),
(11, '1', '11', 'UNIDAD ESTADAL DE AUDITORIA INTERNA'),
(12, '1', '12', 'AREA DE CONTROL Y SEGUIMIENTO'),
(13, '1', '13', 'SECREATARIA EJECUTIVA DE BIENES Y SERVICIOS'),
(14, '2', '01', 'SERVICIOS SEGURIDAD, DEFENSA Y ORDEN PUBLICO'),
(15, '2', '02', 'ASUNTOS CIVILES Y POLITICOS'),
(16, '2', '03', 'ASUNTOS DE PREVENCION Y CALAMIDADES PUBLICAS'),
(17, '2', '04', 'PREVENCION Y CONTROL DE SINIESTROS'),
(18, '3', '01', 'PROMOCION Y DESARROLLO TURISTICO EN EL ESTADO'),
(19, '4', '01', 'SERVICIOS ADMINISTRATIVOS Y APOYO A LA EDUCACION'),
(20, '4', '02', 'EDUCACION BASICA, PREESCOLAR Y DIVERSIFICADA'),
(21, '4', '03', 'MODERNIZACION Y FORTALECIMIENTO DE LA EDUCACION BASICA'),
(22, '5', '01', 'SERVICIOS DE INFORMACION Y COMUNICACION AMAZONAS'),
(23, '5', '02', 'SERVICIOS DE APOYO BIBLIOTECARIO'),
(24, '5', '03', 'PROMOCION Y DESARROLLO CULTURAL'),
(25, '5', '04', 'TECNOLOGIA DE INFORMACION'),
(26, '6', '01', 'DIRECCION, COORDINACION Y CONTROL DE OBRAS EN EL ESTADO'),
(27, '6', '02', 'CONSTRUCCION, MANTENIMIENTO Y CONSERVACION DE OBRAS DEL ESTADO'),
(28, '7', '01', 'FOMENTO Y RESTITUCION DE LA SALUD'),
(29, '8', '01', 'SERVICIOS DE DESARROLLO SOCIAL'),
(30, '8', '02', 'DESARROLLO SOCIAL Y PODER POPULAR'),
(31, '8', '03', 'SECRETARIA EJEC. INTEGRAL DE LAS PERSONAS CON DISCAPACIDAD'),
(32, '8', '04', 'SECRETRARIA EJECUTIVA ATENCION INTEGRAL A LA MUJER, LA FAMILIA E IGUALDAD DE GENERO'),
(33, '9', '01', 'CREDITOS ADMINISTRATIVOS POR EL PROGRAMA RR.HH'),
(34, '10', '01', 'CREDITOS ADMINISTRADOS POR LA DIRECCION EJECUTIVA ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_proyectos`
--

CREATE TABLE `pl_proyectos` (
  `id` int(11) NOT NULL,
  `proyecto_id` varchar(255) DEFAULT NULL,
  `denominacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_sectores`
--

CREATE TABLE `pl_sectores` (
  `id` int(11) NOT NULL,
  `sector` varchar(11) DEFAULT NULL,
  `denominacion` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pl_sectores`
--

INSERT INTO `pl_sectores` (`id`, `sector`, `denominacion`) VALUES
(1, '01', 'DIRECCIÓN SUPERIOR DEL ESTADO'),
(2, '02', 'SEGURIDAD Y DEFENSA'),
(3, '06', 'TURISMO Y RECREACIÓN'),
(4, '08', 'EDUCACIÓN, CULTURA Y DEPORTES'),
(5, '09', 'CULTURA Y COMUNICACIÓN SOCIAL'),
(6, '11', 'VIVIENDA, DESARROLLO URBANO Y SERVICIOS CONEXOS'),
(7, '12', 'SALUD'),
(8, '13', 'DESARROLLO SOCIAL Y PARTICIPACIÓN'),
(9, '14', 'SEGURIDAD SOCIAL'),
(10, '15', 'GASTOS NO CLASIFICADOS SECTORIALMENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pl_sectores_presupuestarios`
--

CREATE TABLE `pl_sectores_presupuestarios` (
  `id` int(11) NOT NULL,
  `sector` varchar(10) DEFAULT NULL,
  `programa` varchar(10) DEFAULT NULL,
  `proyecto` varchar(10) DEFAULT NULL,
  `nombre` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pl_sectores_presupuestarios`
--

INSERT INTO `pl_sectores_presupuestarios` (`id`, `sector`, `programa`, `proyecto`, `nombre`) VALUES
(1, '01', '01', '00', 'Consejo Legislativo'),
(2, '01', '02', '00', 'Contraloria General del Estado'),
(3, '01', '03', '00', 'Procuraduria General'),
(4, '01', '04', '00', 'Sec. del Despacho del Gobernador y Seg.'),
(5, '01', '05', '00', 'Sec. General de Gobierno'),
(6, '01', '06', '00', 'Sec. Ejec. de Talento Humano'),
(7, '01', '07', '00', 'Sec. de Planificacion, Proyectos y PPTO.'),
(8, '01', '08', '00', 'Sec. de Administracion'),
(9, '01', '09', '00', 'Tesoreria General del Estado'),
(10, '01', '10', '00', 'Sec. Regional de Asuntos Indigenas'),
(11, '01', '11', '00', 'Unidad de Auditoria Interna'),
(12, '01', '13', '00', 'Sec. Ejec. de Bienes y Servicios'),
(13, '02', '01', '00', 'Despacho del Comandante'),
(14, '02', '02', '00', 'Sec. de Asuntos  Civiles y Politicos'),
(15, '02', '03', '00', 'Oficina de Proteccion Civil'),
(16, '02', '04', '00', 'Comandacia de Bomberos del Estado'),
(17, '06', '01', '00', 'Sec. de Turismo'),
(18, '08', '01', '00', 'Sec. promocion cultural'),
(19, '08', '02', '00', 'Sec. de Educacion jubilados penc'),
(20, '08', '03', '00', 'Sec. Ejec. para la Atencion de la Juventud'),
(21, '09', '01', '00', 'Sec. SICOAMA'),
(22, '09', '02', '00', 'Biblioteca adm'),
(23, '09', '03', '00', 'Sec. de Cultura'),
(24, '09', '04', '00', 'Tecnologia de Informacion'),
(25, '11', '01', '00', 'Sec. Ejec. de Infraestructura'),
(26, '11', '02', '00', 'SEC DE MANTENIMIENTO'),
(27, '11', '02', '02', 'Sec. Ejecutiva de Infraestructura F.C.I'),
(28, '12', '01', '02', 'Salud F.C.I'),
(29, '12', '01', '00', 'Salud contra.'),
(30, '13', '02', '00', 'Sec. Ejec. de Participacion Popular'),
(31, '13', '04', '00', 'Sec. Ejec. de Proteccion Social'),
(32, '14', '01', '00', 'Sec. Ejec. gestion humana cont'),
(33, '15', '01', '00', 'Transferencias entes'),
(34, '15', '01', '02', 'Transferencias F.C.I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poa_actividades`
--

CREATE TABLE `poa_actividades` (
  `id` int(255) NOT NULL,
  `actividades` longtext DEFAULT NULL,
  `responsable` longtext DEFAULT NULL,
  `unidad_medida` varchar(255) DEFAULT NULL,
  `distribucion` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `id_ente` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------



--
-- Estructura de tabla para la tabla `solicitud_dozavos`
--

CREATE TABLE `solicitud_dozavos` (
  `id` int(255) NOT NULL,
  `numero_orden` varchar(255) DEFAULT NULL,
  `numero_compromiso` varchar(255) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `partidas` varchar(255) DEFAULT NULL,
  `id_ente` int(255) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `mes` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_bd`
--

CREATE TABLE `system_bd` (
  `id` int(11) NOT NULL,
  `actualizacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `system_bd`
--

INSERT INTO `system_bd` (`id`, `actualizacion`) VALUES
(12, 1),
(11, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_users`
--

CREATE TABLE `system_users` (
  `u_id` int(11) NOT NULL,
  `u_nombre` varchar(255) DEFAULT NULL,
  `u_oficina_id` int(11) DEFAULT NULL,
  `u_oficina` varchar(255) DEFAULT NULL,
  `u_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `u_contrasena` varchar(255) DEFAULT NULL,
  `creado` datetime DEFAULT current_timestamp(),
  `u_nivel` int(11) DEFAULT NULL,
  `u_status` int(11) NOT NULL DEFAULT 1,
  `u_cedula` varchar(255) DEFAULT NULL,
  `id_ente` int(255) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `system_users`
--

INSERT INTO `system_users` (`u_id`, `u_nombre`, `u_oficina_id`, `u_oficina`, `u_email`, `u_contrasena`, `creado`, `u_nivel`, `u_status`, `u_cedula`, `id_ente`) VALUES
(31, 'user Nombre', 1, 'nomina', 'corro@correo.com', '$2y$10$EyP1MOY39kuw4uREdk7ao.UUzQ10YNIZ95IZLM70MUPo5J6YzEBVG', '2024-03-07 11:18:19', 1, 1, '6722697', 1),
(33, 'otro user', 2, 'registro_control', 'correo2@correo.com', '$2y$10$EyP1MOY39kuw4uREdk7ao.UUzQ10YNIZ95IZLM70MUPo5J6YzEBVG', '2024-05-29 16:32:32', 2, 1, '6722697', 1),
(34, 'relaciones_laborales_user\r\n', 3, 'relaciones_laborales', 'corro3@correo.com', '$2y$10$EyP1MOY39kuw4uREdk7ao.UUzQ10YNIZ95IZLM70MUPo5J6YzEBVG', '2024-08-06 18:31:06', 1, 1, '6722697', 1),
(35, 'Ricardo', 4, 'pl_formulacion', 'rr@gmail.com', '$2y$10$azF/dOpnDs9sCTYiLEF7kO8612REFdjpk8Te.bih4BaNDSfhAw9MO', '2024-10-12 11:21:03', 1, 1, '6722697', 1),
(36, 'Otro user', 4, 'pl_formulacion', 'dc@gmail.com', '$2y$10$rkLTvh67l6wU6P3sNrmDoOKE9fYZeEe46nkk7VtYcRB20nM0cgIZ.', '2024-10-12 15:47:50', 2, 1, '6722697', 1),
(37, 'Otro user nomina', 1, 'nomina', 'll@gmail.com', '$2y$10$7rP3s5kmozULLCHQpVCQ9exS28MkvJpV8x4whtmS2Z0EnXD2YbeK.', '2024-10-12 21:15:58', 2, 1, '6722697', 1),
(38, 'YO', 5, 'ejecucion_p', 'AAAac.80014.dc@gmail.com', '$2y$10$azF/dOpnDs9sCTYiLEF7kO8612REFdjpk8Te.bih4BaNDSfhAw9MO', '2024-10-15 21:25:50', 1, 1, '27640176', 1),
(40, 'user ejecucion', 5, 'ejecucion_p', 'eje@correo.com', '$2y$10$EyP1MOY39kuw4uREdk7ao.UUzQ10YNIZ95IZLM70MUPo5J6YzEBVG', '2024-08-06 18:31:06', 1, 1, '67226972', 1),
(41, 'user ente', 6, 'entes', 'ente@correo.com', '$2y$10$EyP1MOY39kuw4uREdk7ao.UUzQ10YNIZ95IZLM70MUPo5J6YzEBVG', '2024-12-20 16:30:38', 1, 1, '67226972', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `system_users_permisos`
--

CREATE TABLE `system_users_permisos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_item_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `system_users_permisos`
--

INSERT INTO `system_users_permisos` (`id`, `id_user`, `id_item_menu`) VALUES
(5, 36, 1),
(6, 36, 2),
(8, 36, 5),
(9, 37, 24),
(10, 37, 25),
(11, 37, 18),
(12, 37, 20),
(13, 38, 1),
(14, 38, 2),
(15, 38, 3),
(16, 40, 20),
(17, 40, 21);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_gastos`
--

CREATE TABLE `tipo_gastos` (
  `id` int(255) NOT NULL,
  `nombre` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_gastos`
--

INSERT INTO `tipo_gastos` (`id`, `nombre`) VALUES
(2, 'AGUINALDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulo_1`
--

CREATE TABLE `titulo_1` (
  `id` int(255) NOT NULL,
  `articulo` longtext NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `titulo_1`
--

INSERT INTO `titulo_1` (`id`, `articulo`, `descripcion`) VALUES
(1, 'ARTÍCULO 2:', 'Se acuerdan los Créditos Presupuestarios, para el Ejercicio Fiscal 2024, asignados a los diferentes sectores, programas, sub-programas, proyectos  y partidas, y  los  acordados a los \"Créditos no Asignables a Programas\" de conformidad con el Título III \"Presupuesto de Gastos\". '),
(2, 'ARTÍCULO 3:', 'La Distribución Institucional del Presupuesto de Gastos para el Ejercicio Fiscal 2024, será aprobada mediante Decreto dictado por el Gobernador del Estado, en el cual precisará su Distribución Institucional condicionada de conformidad con lo dispuesto en el Parágrafo Único de este Artículo y consiste en el detalle de los créditos presupuestarios acordados a las diferentes categorías presupuestarias a nivel de actividades y sub-partidas genéricas y específicas, sub- específicas y otras desagregaciones de menor nivel que solo tendrán carácter informativo para fines administrativos y de control interno, tal como lo establece el artículo 34 de la Ley Orgánica de Administración Financiera del Estado Amazonas, publicada en Gaceta Oficial Año 16 Nº 17 de fecha 02 de Julio del año 2008 extraordinaria. \r\nEl Decreto mencionado en este artículo deberá reflejar fielmente las modificaciones o alteraciones introducidas por el Consejo Legislativo en el curso de la discusión y aprobación de esta Ley. \r\n'),
(3, 'ARTÍCULO 4:', 'La Secretaría de Planificación, Proyectos y Presupuesto deberá implementar un sistema de seguimiento sobre la programación de la ejecución física y financiera del presupuesto, conforme a lo dispuesto en el artículo 46 de la Ley Orgánica de Administración Financiera del Estado Amazonas, publicada en Gaceta Oficial Año 16 Nº 17 de fecha 02 de Julio del año 2008 extraordinaria.'),
(4, 'ARTÍCULO 5', 'Los Créditos Presupuestarios del Presupuesto de Gastos, por Programas, Proyectos y Partidas, constituyen el límite máximo de las autorizaciones disponibles para gastos. '),
(5, 'ARTÍCULO 6:', 'Las modificaciones a los Créditos correspondientes a las categorías presupuestarias que integran el Consejo Legislativo, la Procuraduría Estatal y la Contraloría General del Estado Amazonas, se ejecutarán de acuerdo a lo dispuesto en las Leyes, debiendo comunicar sus decisiones a las Secretaría de Administración y de Planificación Proyectos y Presupuesto de la Gobernación a fin de conservar la unidad de registrar tanto en la Ejecución Presupuestaria como en la elaboración del Balance Consolidado de la Hacienda Pública Estatal. '),
(6, 'ARTICULO 7:', 'Los Presupuestos de los Entes descentralizados aprobados por el Consejo Legislativo deberán ser remitidos a la Secretaría de Planificación, Proyectos y Presupuesto para su revisión y publicación en la Gaceta Oficial del Estado, a fin de que se le puedan otorgar los aportes respectivos por el Ejecutivo Estatal.\r\nLa Secretaría de Administración de la Gobernación Indígena del Estado Amazonas no autorizarán los pagos por conceptos de los aportes aprobados en esta Ley a los organismos referidos en este artículo, hasta tanto los mismos den cumplimiento a las exigencias aquí establecidas. \r\n'),
(7, 'ARTICULO 8:', 'No se podrán ordenar pagos con cargo al Tesoro si no para cancelar obligaciones válidamente adquiridas, con excepción de los avances o adelantos que autorice el Ejecutivo Estatal.'),
(8, 'ARTICULO 9:', 'Los Resultados de la Ejecución Física y Financiera del Presupuesto de Ingresos y Gastos serán informados al Ejecutivo Estatal por medio de la Secretaría de Planificación, Proyectos y Presupuesto, de acuerdo a la periodicidad que se prevea en el Decreto Reglamentario de esta Ley. Dicha Secretaría analizará la información para conocimiento del Gobernador, quien deberá informar trimestralmente de ello al Consejo Legislativo, dentro de los cuarenta y cinco (45) días siguientes al vencimiento del Período de que se trate. \r\nLos funcionarios públicos que no cumplan con la obligación establecida en este artículo, se harán acreedores de las sanciones civiles, penales, administrativas y disciplinarias previstas en el ordenamiento jurídico. \r\n'),
(9, 'ARTICULO 10:', 'Las Fundaciones, Entes descentralizados con fines Empresariales  y Asociaciones Civiles están obligadas a presentar, junto con la solicitud de recursos, un Balance certificado por un contador público y un informe de sus actividades para poder obtener los aportes presupuestarios del Gobierno Estatal. La entrega de los Dozavos que le correspondan se realizará previa la presentación ante la Secretaría de Planificación, Proyectos y Presupuesto de los informes de Ejecución de los programas respectivos. Las Instituciones particulares que reciban Recursos Fiscales deberán enviar a dicha Secretaría un informe trimestral de su gestión física y financiera. La Secretaría de Planificación, Proyectos y Presupuesto hará las evaluaciones correspondientes, cuyo resultado deberá presentar al Gobernador del Estado.  Una copia de esta evaluación será remitida al Consejo Legislativo. \r\nCuando los Entes e Instituciones beneficiarios de las asignaciones no cumplan con las obligaciones establecidas en este artículo,  cuando la evaluación sea insatisfactoria, cuando se detecten irregularidades o falsedades en los documentos entregados, o cuando así lo solicite el Consejo Legislativo o su Comisión Delegada, la Gobernación del Estado suspenderá a los beneficiarios los pagos correspondientes, obligándose en caso de irregularidades a hacer las denuncias ante los organismos competentes del Estado, a fin de fijar las responsabilidades a que hubiere lugar. \r\n'),
(10, 'ARTÍCULO 11:', 'Una vez aprobado el Plan de Inversión en Obras y Servicios, el Consejo Estatal de Planificación y Coordinación de Políticas Públicas del Estado Amazonas, conforme a lo dispuesto en la Ley de los Consejos Estatales de Planificación de Políticas Públicas; El Gobernador del Estado, por si o mediante delegación del Secretario correspondiente lo presentará al Consejo Legislativo para su aprobación dentro de los tres (03) meses siguientes a la publicación de la presente Ley. De incumplirse con este procedimiento legal, toda erogación presupuestaria sobre el particular estará viciada de nulidad absoluta, acarreando las sanciones correspondientes para los funcionarios responsables. '),
(11, 'ARTÍCULO 12:', 'A los fines de la Ejecución presupuestaria. \r\na)	El Ejecutivo Estatal, a través de la Secretaría de Planificación Proyectos y Presupuesto, podrá ordenar Traspasos de Créditos Presupuestarios que modifiquen la Distribución Institucional del Presupuesto de Gastos, dentro de una misma partida. Estos traspasos deberán ser informados al Consejo Legislativo, a la Contraloría Estatal, y a la Oficina Nacional de Presupuesto (ONAPRE), dentro de los siguientes veinte (30) días de haberse producido. Igualmente remitirá copia de ello a la Oficina de Auditoría Interna de la Gobernación y a la Secretaría de Administración, estas modificaciones se harán mediante traslados internos. \r\nb)	El Ejecutivo Estatal, a través de la Secretaría de Planificación, Proyectos y Presupuesto, podrá ordenar traspasos de créditos presupuestarios entre partidas de un mismo programa o de diferentes programas, o entre una misma partida de diferentes programas, dentro de un mismo sector o diferentes sectores hasta un límite del veinte por ciento (20%) de los respectivos créditos originales, en concordancia con el artículo 39  de la Ley Orgánica de Administración Financiera del Estado Amazonas, publicada en Gaceta Oficial Año 16 Nº 17 de fecha 02 de Julio del año 2008 extraordinaria y del artículo 86 del Reglamento Nº 1 de la Ley Orgánica de Administración Financiera del Sector Publico, según decreto Nº 3776, publicado en Gaceta Oficial Nº 5781 Extraordinario de fecha 12 de agosto del 2005. Estos traspasos de créditos deberán ser fundamentados mediante resoluciones publicadas en la Gaceta Oficial del Estado Amazonas; de los mismos se remitirán copias al Consejo Legislativo Regional, Contraloría General del Estado, ONAPRE, dentro de los (30) días siguientes de haberse producido. \r\nc)	El Ejecutivo Estatal podrá disponer del Crédito asignado a la partida\" \"Rectificaciones al Presupuesto\" para atender gastos imprevistos que se presenten en el Transcurso del Ejercicio fiscal o para incrementar los créditos presupuestarios que resultaren insuficientes. Esta modificación presupuestaria se hará mediante Resolución que deberá publicarse en la Gaceta Oficial del Estado Amazonas. Dentro de los diez (10) días siguientes de haberse producido, el Ejecutivo Estatal notificará de estas decisiones al Consejo Legislativo, a la Contraloría Estatal, y a la Oficina Nacional de Presupuesto (ONAPRE). El monto original de la partida \"Rectificaciones al Presupuesto\" no podrá ser menor al 0,5% ni exceder del uno por cierto (1%) del monto de los ingresos ordinarios, ni podrá aumentarse durante el ejercicio fiscal. \r\nd)	Los traspasos de créditos presupuestarios entre partidas de un mismo programa o de diferentes programas, o entre una misma partida de diferentes programas, dentro de un mismo sector o de diferentes sectores superiores al veinte por ciento (20%) deberán ser remitidos debidamente fundamentados al Consejo Legislativo para su aprobación. Después de haber sido aprobados se remitirán al Ejecutivo Estatal a través de la Secretaría de Planificación Proyectos y Presupuesto para ser publicados mediante Resolución en la Gaceta Oficial del Estado, enviándose una copia de las mismas a todos los organismos involucrados en el proceso. \r\ne)	El Ejecutivo Estatal podrá decretar Créditos Adicionales al Presupuesto de Gastos, previa aprobación del Consejo Legislativo, para cubrir gastos necesarios, pero no previstos en esta Ley, o crédito presupuestario insuficiente y solo se exigirá como anexo para su aprobación, la distribución presupuestaria del crédito y copia de la gaceta oficial donde se aprobó dicho crédito adicional para el Estado. Los créditos adicionales podrán ser financiados con: \r\na)	Existencias no comprometidas del Tesoro. \r\nb)	Economías de Cargos vacantes, las cuales deberán acordarse insubsistentes previamente, o con anulaciones de créditos adicionales, mediante Decreto publicado en la Gaceta oficial del Estado. \r\nc)	Otras fuentes de financiamiento aprobadas por la Asamblea Nacional. \r\nd)	Aportes o donaciones de otros organismos públicos o privados. \r\ne)	Ingresos extraordinarios del Estado.\r\nf)	Cuando se utilice el crédito presupuestario de la partida \"Rectificaciones al Presupuesto\" y cuando se decreten Créditos Adicionales, se deberán señalar las categorías presupuestarias, partida, unidad administrativa y cualquier otro concepto que sea necesario para identificar el destino de la modificación, así como el efecto sobre las metas programadas; estas últimas deberán establecerse en cualquier modificación presupuestaria. \r\ng)	Salvo para casos de emergencia el monto de las modificaciones presupuestarias, no podrá destinarse para cubrir gastos cuyas asignaciones en el presupuesto de Gastos hayan sido previamente disminuidas en el mismo ejercicio presupuestario, mediante otras operaciones de traspaso de créditos, declaraciones de insubsistencia o creación de nuevas partidas. \r\nh)	Los montos de los Créditos Presupuestarios de las sub-partidas (4.01.01.01.00) “Sueldos básicos personal fijo a tiempo completo\"; (4.01.01.29.00) \"Dietas\"; (4.01.01.10.00) \"Salarios a Obreros en puestos permanentes, y ( 4.01.02.01.00) \"Compensaciones previstas en las escalas de sueldos al personal fijo a tiempo completo\", no podrán ser modificadas sin la previa autorización del Consejo Legislativo, excepto en el último trimestre del ejercicio fiscal de que se trate, cuando ya se hayan cubierto y estimado en su totalidad el monto correspondiente para la cancelación de tales obligaciones, en concordancia con el artículo 39  de la Ley Orgánica de Administración Financiera del Estado Amazonas, publicada en Gaceta Oficial Año 16 Nº 17 de fecha 02 de Julio del año 2008 extraordinaria. \r\n'),
(12, 'ARTICULO 13:', 'El Gobernador podrá delegar en él o la Secretaría de Planificación, Proyectos y Presupuesto, mediante decreto que será publicado en la Gaceta Oficial del Estado, la atribución de tramitar las modificaciones presupuestarias en el proceso de Ejecución Presupuestaria del Ejercicio Fiscal 2024. '),
(13, 'ARTICULO 14:', 'La Gobernación del Estado Amazonas dará estricto cumplimiento a lo establecido en la Ley de Presupuesto de Ingresos y Gastos para el Ejercicio fiscal 2024, sancionada y promulgada por el Poder Nacional, en todo lo relativo a la administración de los créditos que le son transferidos en dicha Ley, a través del Ministerio de Infraestructura, con el fin de alcanzar las metas y objetivos dispuestos en los artículos 8 y 14 de la ley de Política Habitacional. '),
(14, 'ARTÍCULO 15:', 'Para que los Institutos Autónomos, Entes Descentralizados con fines empresariales y Fundaciones del Estado puedan llevar a cabo modificaciones en la ejecución de sus Presupuestos, deberán solicitar la aprobación previa de la Secretaría de Planificación, Proyectos y Presupuestos del Ejecutivo Estatal; dependencia que de inmediato las comunicará al Consejo Legislativo y a la Contraloría General del Estado. Estas modificaciones estarán sometidas a las siguientes consideraciones: \r\n\r\nLos traspasos de Créditos Presupuestarios entre partidas de un mismo programa o de distintos programas superiores al veinte por ciento (20%) de los respectivos créditos originales. Los traspasos inferiores a ese porcentaje serán aprobados por el Directorio del Organismo, debiendo ser informados a la Secretaría de Planificación, Proyectos y Presupuesto. \r\nLos incrementos de Créditos Presupuestarios que surjan como productos de nuevas fuentes de financiamiento y que repercutan favorablemente, aumentando el monto total del presupuesto vigente. \r\nLa disminución de los ingresos propios, corrientes o de capital, que superen el veinte por ciento (20%) de la estimación inicial, o en aquellos casos en los que no se concrete la percepción de otros ingresos. La Secretaría de Planificación, Proyectos y presupuesto actuará en cada caso, según la normativa establecida en esta Ley. \r\n'),
(15, 'ARTÍCULO 16:', 'El Gobernador del Estado, mediante Decreto que prevea las normas y procedimientos al respecto, podrá delegar a cada organismo sus funciones como ordenador de compromisos y pagos de la Hacienda Pública Estatal; debiendo identificar plenamente en el mismo a los funcionarios y funcionarias que tendrán autorización para comprometer con cargo al Tesorero Estatal. Así mismo, en dicho Decreto se determinarán las partidas de cada programa que serán controladas y ejecutadas por la Administración Central del Estado. El Gobernador está obligado a remitir al Consejo Legislativo una copia de la Gaceta Oficial, dentro de los cinco (5) días siguientes a la publicación de dicho Decreto. '),
(16, 'ARTÍCULO 17:', 'Los Créditos Presupuestarios que se encuentran sujetos a convenios, no podrán ser objeto de modificaciones, sin la correspondiente acta que justifique el acuerdo entre las partes firmantes del mismo. '),
(17, 'ARTÍCULO 18:', 'Los Créditos asignados para los Planes Coordinados de inversión a que se refiere la Ley Orgánica de Descentralización, Delimitación y Transferencias de Competencias del Poder Público que no fueron comprometidos al finalizar el Ejercicio Fiscal 2019, deberán incorporarse al Presupuesto por la vía del Crédito Adicional, para ser utilizados en los programas señalados en el Artículo 17 de dicha Ley. '),
(18, 'ARTÍCULO 19:', 'El Ejecutivo del Estado Amazonas no podrá proceder a la contratación de obra alguna en los sectores de Salud, Educación, Desarrollo Urbano y Servicios Conexos, sin la aprobación previa del respectivo Plan de Obras por el Consejo Legislativo. Dicho Plan deberá contener al menos la siguiente información: Discriminación de las partidas afectadas, formación de capital, conservación y mantenimiento, identificación geográfica, control, fiscalización y cronograma de ejecución. '),
(19, 'ARTÍCULO 20:', 'En los registros contables que serán llevados por la Secretaría de Planificación, Proyectos y Presupuesto no se podrán imputar gastos que no correspondan a un determinado programa sin que se notifique previamente al responsable de la ejecución del mismo, a fin de obtener su autorización. '),
(20, 'ARTÍCULO  21:', 'Los gastos causados y no pagados al treinta y uno (31) de diciembre de cada año se pagarán durante el año siguiente, con cargo a las disponibilidades en caja y banco existentes a la fecha señalada. \r\nLos gastos comprometidos y no causados al treinta y uno (31) de diciembre de cada año se imputarán automáticamente al ejercicio siguiente, afectando los mismos a los créditos disponibles para ese ejercicio. Terminado este periodo, los compromisos no pagados deberán pagarse con cargo a una partida del presupuesto que se preverá para cada ejercicio.\r\nLos compromisos originados en sentencia judicial firme con autoridad de cosa juzgada o reconocidos administrativamente de conformidad con los procedimientos establecidos en la Ley Orgánica de la Procuraduría General de la República, se pagarán con cargo al crédito presupuestario que, a tal efecto, se incluirá en el respectivo presupuesto de gastos. \r\nEl Reglamento de esta Ley establecerá los plazos y los mecanismos para la aplicación de estas disposiciones. \r\n'),
(21, 'ARTÍCULO 22:', 'El Gobernador del Estado, a través de las Secretarías de Administración y de Planificación, Proyectos y Presupuesto dictará mediante resolución las medidas para incrementar las existencias del tesoro, con el monto de los créditos no comprometidos al 31 de diciembre del Ejercicio Fiscal fenecido. '),
(22, 'ARTICULO 23:', 'El incumplimiento de los deberes contemplados en esta Ley por parte de los funcionarios o terceros responsables de los mismos dará lugar a la apertura de la averiguación correspondiente a fin de determinar la responsabilidad disciplinaria o administrativa a que hubiere lugar, sin perjuicio de la que adelante el Ministerio Público en lo que le concierne al ámbito civil y penal. '),
(23, 'ARTÍCULO 24:', 'Para todo lo no previsto en estas Disposiciones Generales en materia de Ejecución y Control Presupuestario, regirá la normativa contenida en la Ley de Administración Financiera del Estado Amazonas, en cuanto sea aplicable.'),
(24, 'ARTICULO 27:', 'Esta Ley entrará en vigencia a partir de su publicación en Gaceta Oficial del Estado Amazonas y/o en la Gaceta Oficial del Consejo Legislativo del Estado Amazonas. \r\n\r\nDada, firmada, sellada y refrendada en el salón de sesiones del Consejo Legislativo del Estado Amazonas. En Puerto Ayacucho a los 28 días del mes de diciembre del 2019. Año 209 de la Independencia y 160 de la Federación.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traspasos`
--

CREATE TABLE `traspasos` (
  `id` int(255) NOT NULL,
  `id_partida_t` int(255) NOT NULL,
  `id_partida_r` int(255) NOT NULL,
  `id_ejercicio` int(255) NOT NULL,
  `monto` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `monto_anterior` varchar(255) DEFAULT NULL,
  `monto_actual` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_ente`
--
ALTER TABLE `asignacion_ente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `backups`
--
ALTER TABLE `backups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compromisos`
--
ALTER TABLE `compromisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descripcion_programas`
--
ALTER TABLE `descripcion_programas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distribucion_entes`
--
ALTER TABLE `distribucion_entes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distribucion_presupuestaria`
--
ALTER TABLE `distribucion_presupuestaria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ejercicio_fiscal`
--
ALTER TABLE `ejercicio_fiscal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entes`
--
ALTER TABLE `entes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entes_dependencias`
--
ALTER TABLE `entes_dependencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `error_log`
--
ALTER TABLE `error_log`
  ADD PRIMARY KEY (`id`);


--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `informacion_consejo`
--
ALTER TABLE `informacion_consejo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `informacion_contraloria`
--
ALTER TABLE `informacion_contraloria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `informacion_gobernacion`
--
ALTER TABLE `informacion_gobernacion`
  ADD PRIMARY KEY (`id`);


--
-- Indices de la tabla `informacion_personas`
--
ALTER TABLE `informacion_personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partidas_presupuestarias`
--
ALTER TABLE `partidas_presupuestarias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_directivo`
--
ALTER TABLE `personal_directivo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plan_inversion`
--
ALTER TABLE `plan_inversion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pl_actividades`
--
ALTER TABLE `pl_actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pl_metas`
--
ALTER TABLE `pl_metas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pl_partidas`
--
ALTER TABLE `pl_partidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pl_programas`
--
ALTER TABLE `pl_programas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pl_proyectos`
--
ALTER TABLE `pl_proyectos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pl_sectores`
--
ALTER TABLE `pl_sectores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pl_sectores_presupuestarios`
--
ALTER TABLE `pl_sectores_presupuestarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `poa_actividades`
--
ALTER TABLE `poa_actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitud_dozavos`
--
ALTER TABLE `solicitud_dozavos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `system_bd`
--
ALTER TABLE `system_bd`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `actualizacion` (`actualizacion`);

--
-- Indices de la tabla `system_users`
--
ALTER TABLE `system_users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `usuario` (`u_email`);

--
-- Indices de la tabla `system_users_permisos`
--
ALTER TABLE `system_users_permisos`
  ADD PRIMARY KEY (`id`);


--
-- Indices de la tabla `tipo_gastos`
--
ALTER TABLE `tipo_gastos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `titulo_1`
--
ALTER TABLE `titulo_1`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `traspasos`
--
ALTER TABLE `traspasos`
  ADD PRIMARY KEY (`id`);
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

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion_ente`
--
ALTER TABLE `asignacion_ente`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `backups`
--
ALTER TABLE `backups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compromisos`
--
ALTER TABLE `compromisos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `descripcion_programas`
--
ALTER TABLE `descripcion_programas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `distribucion_entes`
--
ALTER TABLE `distribucion_entes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `distribucion_presupuestaria`
--
ALTER TABLE `distribucion_presupuestaria`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `ejercicio_fiscal`
--
ALTER TABLE `ejercicio_fiscal`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


--
-- AUTO_INCREMENT de la tabla `entes`
--
ALTER TABLE `entes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `entes_dependencias`
--
ALTER TABLE `entes_dependencias`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT de la tabla `error_log`
--
ALTER TABLE `error_log`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `informacion_consejo`
--
ALTER TABLE `informacion_consejo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `informacion_contraloria`
--
ALTER TABLE `informacion_contraloria`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `informacion_gobernacion`
--
ALTER TABLE `informacion_gobernacion`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


--
-- AUTO_INCREMENT de la tabla `informacion_personas`
--
ALTER TABLE `informacion_personas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `partidas_presupuestarias`
--
ALTER TABLE `partidas_presupuestarias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2057;

--
-- AUTO_INCREMENT de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_directivo`
--
ALTER TABLE `personal_directivo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `plan_inversion`
--
ALTER TABLE `plan_inversion`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pl_actividades`
--
ALTER TABLE `pl_actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `pl_metas`
--
ALTER TABLE `pl_metas`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pl_partidas`
--
ALTER TABLE `pl_partidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pl_programas`
--
ALTER TABLE `pl_programas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `pl_proyectos`
--
ALTER TABLE `pl_proyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pl_sectores`
--
ALTER TABLE `pl_sectores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pl_sectores_presupuestarios`
--
ALTER TABLE `pl_sectores_presupuestarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `poa_actividades`
--
ALTER TABLE `poa_actividades`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitud_dozavos`
--
ALTER TABLE `solicitud_dozavos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `system_bd`
--
ALTER TABLE `system_bd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `system_users`
--
ALTER TABLE `system_users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `system_users_permisos`
--
ALTER TABLE `system_users_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;


--
-- AUTO_INCREMENT de la tabla `tipo_gastos`
--
ALTER TABLE `tipo_gastos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `titulo_1`
--
ALTER TABLE `titulo_1`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `traspasos`
--
ALTER TABLE `traspasos`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
