-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.46 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.21.0.7344
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para aventuras_sur
CREATE DATABASE IF NOT EXISTS `aventuras_sur` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aventuras_sur`;

-- Volcando estructura para tabla aventuras_sur.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.auth_group: ~0 rows (aproximadamente)

-- Volcando estructura para tabla aventuras_sur.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.auth_group_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla aventuras_sur.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.auth_permission: ~40 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add perfil', 7, 'add_perfil'),
	(26, 'Can change perfil', 7, 'change_perfil'),
	(27, 'Can delete perfil', 7, 'delete_perfil'),
	(28, 'Can view perfil', 7, 'view_perfil'),
	(29, 'Can add experiencia', 8, 'add_experiencia'),
	(30, 'Can change experiencia', 8, 'change_experiencia'),
	(31, 'Can delete experiencia', 8, 'delete_experiencia'),
	(32, 'Can view experiencia', 8, 'view_experiencia'),
	(33, 'Can add inscripcion', 9, 'add_inscripcion'),
	(34, 'Can change inscripcion', 9, 'change_inscripcion'),
	(35, 'Can delete inscripcion', 9, 'delete_inscripcion'),
	(36, 'Can view inscripcion', 9, 'view_inscripcion'),
	(37, 'Can add categoria', 10, 'add_categoria'),
	(38, 'Can change categoria', 10, 'change_categoria'),
	(39, 'Can delete categoria', 10, 'delete_categoria'),
	(40, 'Can view categoria', 10, 'view_categoria');

-- Volcando estructura para tabla aventuras_sur.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.auth_user: ~0 rows (aproximadamente)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$1000000$04dpsS4rxBWJhhpJDbVb65$VUukBPwPLmMtj8zx7hDe2DdtqiPyyCT98D80KMSp8sA=', '2026-11-15 23:30:50.890501', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2026-11-15 21:53:56.408290'),
	(2, 'pbkdf2_sha256$1000000$SnSIEzPXV0D08Jo0s5SZwG$Z9HHGw3YR+wYlrVpH+dq6h8Ch+2L8uumZ6egDkFQOV4=', '2026-11-15 23:06:05.130817', 0, 'guia0.1', '', '', '', 0, 1, '2026-11-15 22:58:43.776646'),
	(3, 'pbkdf2_sha256$1000000$9kZAMTACJf72EiGNr4JGFt$/ryPrPlE1t0BEEUt5was/KKbDR/C3h7/14KUr3gDPAs=', '2026-11-15 23:02:47.924010', 0, 'guia0.2', '', '', '', 0, 1, '2026-11-15 22:59:15.860438'),
	(4, 'pbkdf2_sha256$1000000$wjjFWqIuWktaH2bC83OVNN$8RLsW2jQjxG/sqkw9z1dM7tJoQWUXKD5BvbGBc53zPI=', '2026-11-15 23:33:04.046474', 0, 'primer_turista', '', '', '', 0, 1, '2026-11-15 23:00:52.127380'),
	(5, 'pbkdf2_sha256$1000000$jIDqQIhea2mMLwqFFN8BTT$jb6ZMc60mCr3Uv3gkX0v1e0stSx/8Z3ZpDvLqvC4qC0=', '2026-11-15 23:15:52.061894', 0, 'segundo_turista', '', '', '', 0, 1, '2026-11-15 23:01:06.648365');

-- Volcando estructura para tabla aventuras_sur.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.auth_user_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla aventuras_sur.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.auth_user_user_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla aventuras_sur.cuentas_perfil
CREATE TABLE IF NOT EXISTS `cuentas_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `cuentas_perfil_usuario_id_06f8a1e5_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.cuentas_perfil: ~0 rows (aproximadamente)
INSERT INTO `cuentas_perfil` (`id`, `rol`, `usuario_id`) VALUES
	(1, 'admin', 1),
	(2, 'guia', 2),
	(3, 'guia', 3),
	(4, 'turista', 4),
	(5, 'turista', 5);

-- Volcando estructura para tabla aventuras_sur.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.django_admin_log: ~0 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2026-11-15 22:04:16.899008', '1', 'admin', 1, '[{"added": {}}]', 7, 1),
	(2, '2026-11-15 22:58:44.071466', '2', 'guia0.1', 1, '[{"added": {}}]', 4, 1),
	(3, '2026-11-15 22:59:16.155431', '3', 'guia0.2', 1, '[{"added": {}}]', 4, 1),
	(4, '2026-11-15 22:59:44.285331', '2', 'guia0.1', 1, '[{"added": {}}]', 7, 1),
	(5, '2026-11-15 22:59:49.092525', '3', 'guia0.2', 1, '[{"added": {}}]', 7, 1),
	(6, '2026-11-15 23:00:52.416255', '4', 'primer_turista', 1, '[{"added": {}}]', 4, 1),
	(7, '2026-11-15 23:01:06.953200', '5', 'segundo_turista', 1, '[{"added": {}}]', 4, 1),
	(8, '2026-11-15 23:01:17.884521', '4', 'primer_turista', 1, '[{"added": {}}]', 7, 1),
	(9, '2026-11-15 23:01:23.629342', '5', 'segundo_turista', 1, '[{"added": {}}]', 7, 1);

-- Volcando estructura para tabla aventuras_sur.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.django_content_type: ~10 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(2, 'auth', 'permission'),
	(3, 'auth', 'group'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'cuentas', 'perfil'),
	(8, 'experiencias', 'experiencia'),
	(9, 'experiencias', 'inscripcion'),
	(10, 'experiencias', 'categoria');

-- Volcando estructura para tabla aventuras_sur.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.django_migrations: ~20 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2026-11-15 21:49:20.363087'),
	(2, 'auth', '0001_initial', '2026-11-15 21:49:20.946446'),
	(3, 'admin', '0001_initial', '2026-11-15 21:49:21.085025'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2026-11-15 21:49:21.091701'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-11-15 21:49:21.098459'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2026-11-15 21:49:21.263717'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2026-11-15 21:49:21.325154'),
	(8, 'auth', '0003_alter_user_email_max_length', '2026-11-15 21:49:21.349764'),
	(9, 'auth', '0004_alter_user_username_opts', '2026-11-15 21:49:21.357140'),
	(10, 'auth', '0005_alter_user_last_login_null', '2026-11-15 21:49:21.425370'),
	(11, 'auth', '0006_require_contenttypes_0002', '2026-11-15 21:49:21.428850'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2026-11-15 21:49:21.438584'),
	(13, 'auth', '0008_alter_user_username_max_length', '2026-11-15 21:49:21.507744'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2026-11-15 21:49:21.568408'),
	(15, 'auth', '0010_alter_group_name_max_length', '2026-11-15 21:49:21.585620'),
	(16, 'auth', '0011_update_proxy_permissions', '2026-11-15 21:49:21.594279'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2026-11-15 21:49:21.654874'),
	(18, 'sessions', '0001_initial', '2026-11-15 21:49:21.689953'),
	(19, 'cuentas', '0001_initial', '2026-11-15 21:50:28.243290'),
	(20, 'experiencias', '0001_initial', '2026-11-15 21:50:28.513346');

-- Volcando estructura para tabla aventuras_sur.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.django_session: ~0 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('k9bwk0b7wajy6azaad75zd3takwxqlyq', '.eJxVjMsOwiAQAP9lz4YALY_t0bvfQJYFpGpoUtqT8d9Nkx70OjOZNwTatxr2ntcwJ5hghMsvi8TP3A6RHtTui-ClbescxZGI03ZxW1J-Xc_2b1CpV5jAx6RRKclDRi7FFOcoSx5YFa2TNBGNRDJkvc-ETtpRsy3EWFh6pTR8vvKoOAM:1xSjia:n_DDKsjsDa5KA31FCkp03ag9XCwWaRdAE-7aXYF_jLY', '2026-11-29 23:33:04.049558');

-- Volcando estructura para tabla aventuras_sur.experiencias_categoria
CREATE TABLE IF NOT EXISTS `experiencias_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.experiencias_categoria: ~0 rows (aproximadamente)
INSERT INTO `experiencias_categoria` (`id`, `nombre`, `descripcion`, `estado`) VALUES
	(1, 'Trekking', 'Recorridos y caminatas por senderos naturales', 1),
	(3, 'Canopy', 'Recorridos aéreos mediante cables', 1),
	(4, 'Kayak', 'Actividades acuáticas en kayak', 1),
	(5, 'Arriendo de equipos', 'Alquiler de equipos para actividades al aire libre', 1);

-- Volcando estructura para tabla aventuras_sur.experiencias_experiencia
CREATE TABLE IF NOT EXISTS `experiencias_experiencia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cupo_maximo` int unsigned NOT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria_id` bigint NOT NULL,
  `creador_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_experie_categoria_id_b03f452f_fk_experienc` (`categoria_id`),
  KEY `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` (`creador_id`),
  CONSTRAINT `experiencias_experie_categoria_id_b03f452f_fk_experienc` FOREIGN KEY (`categoria_id`) REFERENCES `experiencias_categoria` (`id`),
  CONSTRAINT `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` FOREIGN KEY (`creador_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `experiencias_experiencia_chk_1` CHECK ((`cupo_maximo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.experiencias_experiencia: ~0 rows (aproximadamente)
INSERT INTO `experiencias_experiencia` (`id`, `titulo`, `descripcion`, `precio`, `cupo_maximo`, `fecha_hora`, `estado`, `categoria_id`, `creador_id`) VALUES
	(1, 'Trekking por senderos naturales', 'Recorrido guiado por senderos naturales del parque', 8.00, 15, '2026-11-16 19:51:00.000000', 'activa', 1, 1),
	(2, 'Aventura en kayak', 'asdasd', 12.00, 4, '2026-11-17 19:54:00.000000', 'activa', 4, 1),
	(3, 'Canopy extremo', 'dsadasd', 15.00, 1, '2026-11-19 19:55:00.000000', 'activa', 3, 1),
	(4, 'canopy', 'pruebaaa', 10000.00, 1, '2026-11-20 20:02:00.000000', 'activa', 3, 2),
	(5, 'kayak', 'muy wena', 1.00, 1, '2026-11-18 20:02:00.000000', 'activa', 4, 3),
	(6, 'trekkin', 'mlisima', 15000.00, 3, '2026-11-21 20:04:00.000000', 'activa', 1, 3),
	(7, 'canopy', 'dislaik', 10000.00, 1, '2026-11-17 20:05:00.000000', 'activa', 3, 3),
	(8, 'arriendo de equipos', 'wenisima', 20000.00, 1, '2026-11-15 20:05:00.000000', 'activa', 5, 3),
	(9, 'trek', 'muy wena', 10000.00, 1, '2026-11-21 20:06:00.000000', 'activa', 1, 2),
	(10, 'arriendo', 'muy wena', 8000.00, 1, '2026-11-16 20:07:00.000000', 'activa', 5, 2),
	(11, 'kayak', 'muy wena', 10000.00, 1, '2026-11-17 20:07:00.000000', 'activa', 4, 2);

-- Volcando estructura para tabla aventuras_sur.experiencias_inscripcion
CREATE TABLE IF NOT EXISTS `experiencias_inscripcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `estado_pago` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experiencia_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_inscrip_experiencia_id_2fbecc6b_fk_experienc` (`experiencia_id`),
  KEY `experiencias_inscripcion_usuario_id_9d6f5da2_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `experiencias_inscrip_experiencia_id_2fbecc6b_fk_experienc` FOREIGN KEY (`experiencia_id`) REFERENCES `experiencias_experiencia` (`id`),
  CONSTRAINT `experiencias_inscripcion_usuario_id_9d6f5da2_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla aventuras_sur.experiencias_inscripcion: ~0 rows (aproximadamente)
INSERT INTO `experiencias_inscripcion` (`id`, `fecha_inscripcion`, `estado_pago`, `experiencia_id`, `usuario_id`) VALUES
	(1, '2026-11-15 23:15:21.428737', 'confirmado', 1, 4),
	(2, '2026-11-15 23:15:29.260566', 'pendiente', 2, 4),
	(3, '2026-11-15 23:15:32.404385', 'pendiente', 3, 4),
	(4, '2026-11-15 23:15:53.955959', 'pendiente', 5, 5),
	(5, '2026-11-15 23:15:56.499261', 'pendiente', 6, 5),
	(6, '2026-11-15 23:15:58.636597', 'pendiente', 8, 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
