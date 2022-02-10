-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-02-2022 a las 21:14:47
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebas_laravel`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarDatos` ()  NO SQL
SELECT date(created_at) as fech, ROUND(sum(peso),2)  as total FROM tb_ingreso_informacion GROUP by date(created_at)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_10_31_001327_create_sessions_table', 1),
(7, '2021_12_16_093008_create_tb_tipo_desechos', 1),
(8, '2021_12_16_093153_create_tb_clasificacion_desechos', 1),
(9, '2021_12_16_093217_create_tb_clasificacion_desechos_descripcion', 1),
(10, '2021_12_17_154920_create_tb_ingreso_informacion', 2),
(11, '2021_12_17_154759_create_tb_departamentos', 3),
(12, '2021_12_17_154859_create_tb_responsable', 4),
(13, '2022_01_05_195043_create_perfil', 5),
(14, '2022_01_05_195912_create_usuario_por_perfil', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'ADMINISTRADOR', NULL, NULL),
(2, 'USUARIO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ugJMMYjKQ0zITMHTH1BfeAUl8pN7M8iKgWbOd80U', 1, '192.168.8.73', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 Edg/97.0.1072.76', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiN0t0UmFUT2U5cHRYMWdNbXdlTjJrajdpZE81WW05TXVVRW9QZjY1dCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjExNDoiaHR0cDovLzE5Mi4xNjguOC43Mzo5OC9tb2R1bG9zL2FkbWlzaW9uL3BhY2llbnRlL2dlbmVyYWNpb25FeGNlbD9xPW1vZHVsb3MlMkZhZG1pc2lvbiUyRnBhY2llbnRlJTJGZ2VuZXJhY2lvbkV4Y2VsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDRRRjlkUFN3RE1tbnNDRzhUNGlSTy5ndnNnYXNWUXplZkQ2Zm9vY0xrMi5Tc1pZL25YZ0xPIjt9', 1644005262),
('YywPDb9wVlx1vp90cnNZnGPaRMlKd4yPw7ScD8VA', 1, '192.168.8.73', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 Edg/97.0.1072.76', 'YTo2OntzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoxMTQ6Imh0dHA6Ly8xOTIuMTY4LjguNzM6OTgvbW9kdWxvcy9hZG1pc2lvbi9wYWNpZW50ZS9nZW5lcmFjaW9uRXhjZWw/cT1tb2R1bG9zJTJGYWRtaXNpb24lMkZwYWNpZW50ZSUyRmdlbmVyYWNpb25FeGNlbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiI4V3drQ3Q3bERodzRIYlY5clJUUG01SGVVZk9HeXpwemc4MEd5WTUyIjtzOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDRRRjlkUFN3RE1tbnNDRzhUNGlSTy5ndnNnYXNWUXplZkQ2Zm9vY0xrMi5Tc1pZL25YZ0xPIjt9', 1643998419);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cargos`
--

CREATE TABLE `tb_cargos` (
  `id` bigint(11) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_cargos`
--

INSERT INTO `tb_cargos` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'ADMINISTRADORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'ASISTENTE DE SISTEMAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'AUXILIAR DE ENFERMERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'AYUDANTE DE ENFERMERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'AYUDANTE DE PROVEEDURIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'COORDINADOR DE LA CENTRAL QUIRUGICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'COORDINADOR MEDICO DE MISIONES', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'GUARDIAN RESIDENTE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'JEFE (A) SISTEMAS ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'JEFE DE CIRUGIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'JEFE DE PROVEEDURIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'LICENCIADO(A) EN ENFERMERIA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'MEDICO ANESTESIOLOGO (A)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'MEDICO CIRUGIA PEDIATRICA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'OFICINISTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'ASISTENTE DE GESTION AMBIENTAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'PERSONAL DOCENTE ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'AUXILIAR DE MANTENIMIENTO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'RECEPCIONISTA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_clasificacion_desechos`
--

CREATE TABLE `tb_clasificacion_desechos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tipo_desechos` int(11) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tb_clasificacion_desechos`
--

INSERT INTO `tb_clasificacion_desechos` (`id`, `tipo_desechos`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Biológico Infeccioso', '2021-12-17 15:01:11', '2021-12-17 15:11:52'),
(2, 1, 'Cortopunzante', '2021-12-17 15:01:23', '2021-12-29 16:00:05'),
(3, 1, 'Anatomopatológico', '2021-12-17 15:23:00', '2021-12-29 16:00:54'),
(4, 1, 'Químico-peligroso', '2021-12-17 16:42:34', '2021-12-29 16:01:07'),
(5, 1, 'Desecho de dispositivo médico con mercurio', '2021-12-22 20:18:01', '2021-12-29 16:01:34'),
(6, 1, 'Farmacéutico peligroso', '2021-12-29 16:02:25', '2021-12-29 16:02:25'),
(7, 2, 'Demás desechos peligrosos', '2021-12-29 16:04:14', '2021-12-29 16:05:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_clasificacion_desechos_descripcion`
--

CREATE TABLE `tb_clasificacion_desechos_descripcion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_tipo_desechos` int(11) NOT NULL,
  `id_clasificacion` int(11) NOT NULL,
  `descripcion` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tb_clasificacion_desechos_descripcion`
--

INSERT INTO `tb_clasificacion_desechos_descripcion` (`id`, `id_tipo_desechos`, `id_clasificacion`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Q.86.01 ---Cultivos de agentes infecciosos y desechos de producción biológica, vacunas vencidas o inutilizadas, cajas de petri, placas de frotis y todos los instrumentos usados para manipular, mezclar o inocular microorganismos.', '2021-12-17 18:25:17', '2022-01-28 16:15:26'),
(2, 1, 1, 'Q.86.07 Material e insumos que han sido utilizados para procedimientos médicos y que han estado en contacto con fluidos corporales', '2021-12-29 16:08:36', '2021-12-29 16:08:36'),
(3, 1, 2, 'Q.86.05 Objetos cortopunzantes que han sido utilizados en la atención de seres humanos o animales; en la investigación, en laboratorios y administración de fármacos.', '2021-12-29 16:09:03', '2021-12-29 16:09:03'),
(4, 1, 3, 'Q.86.02 Desechos anatomo-patológicos: órganos, tejidos, partes corporales que han sido extraídos mediante cirugía, necropsia u otro procedimiento médico', '2021-12-29 16:09:19', '2021-12-29 16:09:19'),
(5, 1, 3, 'Q.86.03 Sangre, sus derivados e insumos usados para procedimientos de análisis y administración de los mismos.', '2021-12-29 16:09:35', '2021-12-29 16:09:35'),
(6, 1, 3, 'Q.86.04 Fluidos Corporales', '2021-12-29 16:09:48', '2021-12-29 16:09:48'),
(7, 1, 3, 'No descripción', '2021-12-29 16:10:57', '2021-12-29 16:10:57'),
(8, 1, 4, 'Q.86.09 Desechos químicos de laboratorio, químicos caducados o fuera de especificaciones', '2021-12-29 16:11:14', '2021-12-29 16:11:14'),
(9, 1, 4, 'No descripción', '2021-12-29 16:11:30', '2021-12-29 16:11:30'),
(10, 1, 5, 'No descripción', '2021-12-29 16:11:49', '2021-12-29 16:11:49'),
(11, 1, 6, 'Q.86.08 Fármacos caducados o fuera de especificaciones', '2021-12-29 16:12:29', '2021-12-29 16:12:29'),
(12, 2, 7, 'No descripción', '2021-12-29 16:12:51', '2021-12-29 16:12:51'),
(13, 2, 7, 'No descripción', '2021-12-29 16:13:06', '2021-12-29 16:13:06'),
(14, 2, 7, 'NE-01 Aceites dieléctricos usados que no contengan bifenilopoliclorados (PBC), terfenilopoliclorados (PCT) o bifenilopolibromados (PBB)', '2021-12-29 16:13:22', '2021-12-29 16:13:22'),
(15, 2, 7, 'NE-02 Aceites dieléctricos usados u otros aceites minerales que contengan bifenilopoliclorados (PBC) mayor o igual a 50 ppm o mg/l', '2021-12-29 16:13:39', '2021-12-29 16:13:39'),
(16, 2, 7, 'NE-07 Baterías usadas plomo-ácido', '2021-12-29 16:13:54', '2021-12-29 16:13:54'),
(17, 2, 7, 'NE-08 Baterías usadas que contengan Hg, Ni, Cd u otros materiales peligrosos y que exhiban características de peligrosidad.', '2021-12-29 16:14:05', '2021-12-29 16:14:05'),
(18, 2, 7, 'NE-27 Envases contaminados con materiales peligrosos', '2021-12-29 16:14:16', '2021-12-29 16:14:16'),
(19, 2, 7, 'NE-32 Filtros usados de aceite mineral', '2021-12-29 16:14:29', '2021-12-29 16:14:29'),
(20, 2, 7, 'NE-40 Luminarias, lámparas, tubos fluorescentes, focos ahorradores usados que contengan mercurio', '2021-12-29 16:14:38', '2021-12-29 16:14:38'),
(21, 2, 7, 'NE-42 Material adsorbente contaminado con hidrocarburos: waipes, paños, trapos, aserrín, barreras adsorbentes y otros materiales sólidos adsorbentes', '2021-12-29 16:14:47', '2021-12-29 16:14:47'),
(22, 2, 7, 'NE-53 Cartuchos de impresión de tinta o tóner usados', '2021-12-29 16:15:06', '2021-12-29 16:15:06'),
(23, 2, 7, 'No descripción', '2021-12-29 16:15:19', '2021-12-29 16:15:19'),
(24, 2, 7, 'Productos químicos caducados o fuera de especificaciones', '2021-12-29 16:15:30', '2021-12-29 16:15:30'),
(25, 2, 7, 'Cartuchos de impresión de tinta o toner usados', '2021-12-29 16:16:49', '2021-12-29 16:16:49'),
(26, 2, 7, 'Aceites vegetales usados generados en procesos de fritura de alimentos', '2021-12-29 16:16:57', '2021-12-29 16:16:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_departamentos`
--

CREATE TABLE `tb_departamentos` (
  `id` int(255) UNSIGNED NOT NULL,
  `descripcion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tb_departamentos`
--

INSERT INTO `tb_departamentos` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'SISTEMAS', '2022-02-01 15:35:28', '2022-02-01 15:35:40'),
(2, 'CIRUGIA', '2022-02-01 15:35:28', '2022-02-01 15:35:40'),
(3, 'GESTION AMBIENTAL', '2022-02-01 15:35:28', '2022-02-01 15:35:40'),
(4, 'MANTENIMIENTO', '2022-02-01 15:35:28', '2022-02-01 15:35:40'),
(5, 'SERVICIOS VARIOS', '2022-02-01 15:35:28', '2022-02-01 15:35:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ingreso_informacion`
--

CREATE TABLE `tb_ingreso_informacion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_tipo_desechos` int(11) NOT NULL,
  `id_clasificacion` int(11) NOT NULL,
  `id_clasificacion_descripcion` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `peso` double(15,8) NOT NULL,
  `descripcion` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tb_ingreso_informacion`
--

INSERT INTO `tb_ingreso_informacion` (`id`, `id_tipo_desechos`, `id_clasificacion`, `id_clasificacion_descripcion`, `id_departamento`, `id_responsable`, `peso`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, 5.00000000, NULL, '2022-01-10 16:12:40', '2022-01-11 16:12:40'),
(2, 2, 7, 13, 13, 4, 10.00000000, NULL, '2022-01-11 16:13:48', '2022-01-11 16:13:48'),
(3, 1, 2, 3, 3, 1, 5.30000000, NULL, '2022-01-12 19:52:28', '2022-01-12 19:52:28'),
(4, 1, 2, 3, 3, 2, 23.30000000, NULL, '2022-01-25 17:37:40', '2022-01-25 17:37:40'),
(5, 2, 7, 14, 14, 2, 40.00000000, NULL, '2022-01-25 20:27:11', '2022-01-25 20:27:11'),
(6, 2, 7, 14, 14, 4, 5.00000000, NULL, '2022-01-25 20:27:35', '2022-01-25 20:27:35'),
(7, 2, 7, 14, 14, 1, 3.00000000, NULL, '2022-02-02 14:55:25', '2022-02-02 14:55:25'),
(8, 2, 7, 14, 14, 2, 45.00000000, NULL, '2022-02-02 14:56:17', '2022-02-02 14:56:17'),
(9, 2, 7, 12, 12, 1, 23.00000000, NULL, '2022-02-02 15:55:46', '2022-02-02 15:55:46'),
(10, 1, 2, 3, 2, 6, 25.00000000, NULL, '2022-02-02 15:58:13', '2022-02-02 15:58:13'),
(11, 2, 7, 14, 2, 10, 33.00000000, NULL, '2022-02-02 17:22:36', '2022-02-02 17:22:36'),
(12, 2, 7, 14, 3, 39, 12.00000000, NULL, '2022-02-02 17:23:17', '2022-02-02 17:23:17'),
(13, 1, 2, 3, 1, 2, 2.00000000, NULL, '2022-02-02 17:30:14', '2022-02-02 17:30:14'),
(14, 2, 7, 16, 4, 61, 34.00000000, NULL, '2022-02-02 17:31:20', '2022-02-02 17:31:20'),
(15, 2, 7, 16, 3, 39, 23.00000000, NULL, '2022-02-02 17:45:21', '2022-02-02 17:45:21'),
(16, 1, 1, 1, 2, 8, 5.00000000, NULL, '2022-02-03 13:22:58', '2022-02-03 13:22:58'),
(17, 2, 7, 13, 2, 8, 15.50000000, NULL, '2022-02-03 15:29:00', '2022-02-03 15:29:00'),
(18, 2, 7, 13, 3, 39, 5.88000000, NULL, '2022-02-03 15:29:31', '2022-02-03 15:29:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_responsable`
--

CREATE TABLE `tb_responsable` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cedula` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `apellidos` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `correo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profesion` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `cargo` int(100) NOT NULL,
  `Departamento` int(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tb_responsable`
--

INSERT INTO `tb_responsable` (`id`, `cedula`, `nombres`, `apellidos`, `correo`, `profesion`, `cargo`, `Departamento`, `created_at`, `updated_at`) VALUES
(1, '0', 'RAFAEL ABRAHAM ', 'ALVAREZ CHANCAY', 'rafa_alvarez_94@hotmail.com', '0', 9, 1, '2022-01-25 15:36:25', '2022-01-25 15:36:25'),
(2, '0', 'DAVID MIGUEL', 'GONZALEZ FRANCO', 'dgf.digital@gmail.com', '0', 2, 1, '2022-01-26 15:36:25', '2022-01-26 15:36:25'),
(3, '0', 'CARLOS ENRIQUE', 'RAMIREZ VICTOR', 'carlosrami1989@gmail.com', '0', 2, 1, '2022-01-27 15:36:25', '2022-01-27 15:36:25'),
(4, '0', 'GLORIA ANTONIETA', 'PLAZA BERRUZ', 'glanplaz@hotmail.com', '0', 2, 1, '2022-01-28 15:36:25', '2022-01-28 15:36:25'),
(5, '0', 'KEVIN ALEJANDRO', 'GUAMANQUISPE PLAZA', 'kevinguamanquispe22@gmail.com', '0', 2, 1, '2022-01-29 15:36:25', '2022-01-29 15:36:25'),
(6, '0', 'CYNTHIA ELIZABETH ', 'AVILES ZAMORA', 'cinthiaavileszamora@gmail.com', '0', 1, 2, '2022-01-30 15:36:25', '2022-01-30 15:36:25'),
(7, '0', 'GLENDI ELIZABETH ', 'SALDAÑA CHAU?AY', 'glendi2013@outlook.es', '0', 3, 2, '2022-01-31 15:36:25', '2022-01-31 15:36:25'),
(8, '0', 'KAREN ALEXANDRA', 'SANTAMARIA QUI?ONEZ', 'karlexi2015@gmail.com', '0', 3, 2, '2022-02-01 15:36:25', '2022-02-01 15:36:25'),
(9, '0', 'SILVIA MARIA', 'MERINO MARTINEZ', 'silviamerino1969@outlook.com', '0', 3, 2, '2022-02-02 15:36:25', '2022-02-02 15:36:25'),
(10, '0', 'MARLON WALDEMAR', 'SANTOS MENDEZ', 'monica_73_monita@hotmail.com', '0', 3, 2, '2022-02-03 15:36:25', '2022-02-03 15:36:25'),
(11, '0', 'LAURA JANINA', 'TERAN MORALES', 'genesisveela.2@gmail.com', '0', 3, 2, '2022-02-04 15:36:25', '2022-02-04 15:36:25'),
(12, '0', 'FRANCISCA ARGENTINA', 'LEON I?IGUEZ', 'fransisca.argenleon@gmail.com', '0', 3, 2, '2022-02-05 15:36:25', '2022-02-05 15:36:25'),
(13, '0', 'GABRIEL RODRIGO', 'CHIRIBOGA JURADO', 'garochi29@hotmail.com', '0', 3, 2, '2022-02-06 15:36:25', '2022-02-06 15:36:25'),
(14, '0', 'EVELYN ALEXANDRA', 'BONILLA CORONEL', 'abonilla2908@gmail.com', '0', 3, 2, '2022-02-07 15:36:25', '2022-02-07 15:36:25'),
(15, '0', 'ISRAEL JONATHAN', 'BAQUE BEDOYA', 'israel.baque1992@gmail.com', '0', 3, 2, '2022-02-08 15:36:25', '2022-02-08 15:36:25'),
(16, '0', 'KARLA VIVIANA ', 'BAILON ORDO?EZ ', 'vivianabailon1527@gmail.com', '0', 3, 2, '2022-02-09 15:36:25', '2022-02-09 15:36:25'),
(17, '0', 'ISRRAEL SEBASTIAN', 'MORRILLO MENDOZA', 'genesisveela2@gmail.com', '0', 3, 2, '2022-02-10 15:36:25', '2022-02-10 15:36:25'),
(18, '0', 'ANDRES KEVIN', 'VILLAMAR ARIAS', 'andre.villamar6@gmaill.com', '0', 5, 2, '2022-02-11 15:36:25', '2022-02-11 15:36:25'),
(19, '0', 'RAFAEL HUMBERTO', 'MARISCAL RAMOS', 'rafaelo20ad9@hotmail.com', '0', 5, 2, '2022-02-12 15:36:25', '2022-02-12 15:36:25'),
(20, '0', 'JEAN CARLOS ', 'SEMPERTEGUI CEDE?O', 'jcsemperteguic@outlook.es', '0', 5, 2, '2022-02-13 15:36:25', '2022-02-13 15:36:25'),
(21, '0', 'PEDRO LOYNAZ', 'CASTILLO ROVIRA', 'loynaz.castillo@gmail.com', '0', 6, 2, '2022-02-14 15:36:25', '2022-02-14 15:36:25'),
(22, '0', 'FREDDY MARCELO', 'GRIJALVA PINO', 'fremar15@hotmail.com', '0', 7, 2, '2022-02-15 15:36:25', '2022-02-15 15:36:25'),
(23, '0', 'MERCEDES ', 'ALVARADO MORAN ', 'ninguno3@hotmail.com', '0', 8, 2, '2022-02-16 15:36:25', '2022-02-16 15:36:25'),
(24, '0', 'LEONOR ORFELINA', 'SEGURA YANEZ', 'oad_00@hotmail.com', '0', 8, 2, '2022-02-17 15:36:25', '2022-02-17 15:36:25'),
(25, '0', 'SEGUNDO GREGORIO', 'PAJA CHUQUE', 'wendypaja@hotmail.com', '0', 8, 2, '2022-02-18 15:36:25', '2022-02-18 15:36:25'),
(26, '0', 'ROBERTO', 'COZZARELLI CONTRERAS', 'dr_rcozzarelli@hotmail.com', '0', 10, 2, '2022-02-19 15:36:25', '2022-02-19 15:36:25'),
(27, '0', 'JOHN FERNANDO', 'VILLAMAR ARIAS', 'jfvillamarias@gmail.com', '0', 11, 2, '2022-02-20 15:36:25', '2022-02-20 15:36:25'),
(28, '0', 'VILMA ELISA', 'JACOME GALEAS', 'vilmajacome1979@hotmail.com', '0', 12, 2, '2022-02-21 15:36:25', '2022-02-21 15:36:25'),
(29, '0', 'CARLOS EULOGIO', 'MOLINA REZABALA', 'carmoli130965@yahoo.com', '0', 12, 2, '2022-02-22 15:36:25', '2022-02-22 15:36:25'),
(30, '0', 'RENE JAVIER ', 'SOLARI SALAMANCA ', 'rj.salamanca77@gmail.com', '0', 13, 2, '2022-02-23 15:36:25', '2022-02-23 15:36:25'),
(31, '0', 'BETZABETH CAROLINA', 'SALAZAR HAMANA ', 'betza_s@hotmail.com', '0', 13, 2, '2022-02-24 15:36:25', '2022-02-24 15:36:25'),
(32, '0', 'ANUNCIATA BLANCA ', 'LEDESMA GUILCAPI', 'anunciataledesma@hotmail.com', '0', 13, 2, '2022-02-25 15:36:25', '2022-02-25 15:36:25'),
(33, '0', 'GABRIELA NATHALY', 'LEON MALDONADO', 'nathleonm@gmail.com', '0', 13, 2, '2022-02-26 15:36:25', '2022-02-26 15:36:25'),
(34, '0', 'VICTOR', 'CABO RODRIGUEZ', 'anabelviti74@gmail.com', '0', 14, 2, '2022-02-27 15:36:25', '2022-02-27 15:36:25'),
(35, '0', 'JOHNNY ARTURO', 'LOPEZ DRAY', 'jl-1965_@hotmail.com', '0', 15, 2, '2022-02-28 15:36:25', '2022-02-28 15:36:25'),
(36, '0', 'MARIA JAHAIRA ', 'SABANDO MOREIRA', 'marysabando@hotmail.com', '0', 15, 2, '2022-03-01 15:36:25', '2022-03-01 15:36:25'),
(37, '0', 'ALEXANDRA ESTEFANIA', 'PLUAS SANTANA', 'alexandrapluas2@gmail.com', '0', 15, 2, '2022-03-02 15:36:25', '2022-03-02 15:36:25'),
(38, '0', 'JUAN JOSE', 'SABANDO CARDENAS', 'juanjosesabando@gmail.com', '0', 16, 3, '2022-03-03 15:36:25', '2022-03-03 15:36:25'),
(39, '0', 'MICHELLE STEFANY', 'GARCIA SALAZAR ', 'mgs.stefany@gmail.com', '0', 16, 3, '2022-03-04 15:36:25', '2022-03-04 15:36:25'),
(40, '0', 'MARGARITA BOLIVIA', 'ALCIVAR RAMIREZ', 'mayi_alci@hotmail.com', '0', 17, 3, '2022-03-05 15:36:25', '2022-03-05 15:36:25'),
(41, '0', 'JULIANA DEL ROCIO', 'MARIDUE?A HONORES', 'julianamh27@hotmail.com', '0', 17, 3, '2022-03-06 15:36:25', '2022-03-06 15:36:25'),
(42, '0', 'JENNY ALEXANDRA', 'TEJADA PE?AFIEL', 'jems3573@hotmail.es', '0', 17, 3, '2022-03-07 15:36:25', '2022-03-07 15:36:25'),
(43, '0', 'ZACAR?AS ABRAHAN', 'BERRUZ MITE ', 'zacamite1006@gmail.com', '0', 17, 3, '2022-03-08 15:36:25', '2022-03-08 15:36:25'),
(44, '0', 'KEVIN DAVID', 'RUIZ DAKER', 'kevin.ruiz.daker@gmail.com', '0', 17, 3, '2022-03-09 15:36:25', '2022-03-09 15:36:25'),
(45, '0', 'ANDERSON JOEL', 'TIGUA DE LA TORRE', 'anderson_ti98@hotmail.com', '0', 17, 3, '2022-03-10 15:36:25', '2022-03-10 15:36:25'),
(46, '0', 'RICARDO XAVIER', 'CONSUEGRA BOSQUEZ', 'ricardoconsuegra4@gmail.com', '0', 17, 3, '2022-03-11 15:36:25', '2022-03-11 15:36:25'),
(47, '0', 'JOHAN FRANK', 'TIGUA DE LA TORRE', 'johant@hotmail.es', '0', 17, 3, '2022-03-12 15:36:25', '2022-03-12 15:36:25'),
(48, '0', 'KARINA ANABELL', 'ZAMORA V?LOZ', 'karykary-89@hotmail.com', '0', 17, 3, '2022-03-13 15:36:25', '2022-03-13 15:36:25'),
(49, '0', 'MINERBA LUCIA', 'VELEZ MOSQUERA', 'minervav72@outlook.com', '0', 17, 3, '2022-03-14 15:36:25', '2022-03-14 15:36:25'),
(50, '0', 'GINA MERCEDES', 'RUIZ CEREZO', 'gina.ruiz2010@hotmail.com', '0', 17, 3, '2022-03-15 15:36:25', '2022-03-15 15:36:25'),
(51, '0', 'LUCIANA DEL ROSARIO', 'MEDINA VALAREZO', 'Lucianamedina56@outlook.es', '0', 17, 3, '2022-03-16 15:36:25', '2022-03-16 15:36:25'),
(52, '0', 'IRMA', 'ROSALES ROSALES', 'pingomatias123@hotmail.com', '0', 17, 3, '2022-03-17 15:36:25', '2022-03-17 15:36:25'),
(53, '0', 'TANYA ANNABELL', 'VASQUEZ PIZARRO', 'annabell_19_25@hotmail.com', '0', 17, 3, '2022-03-18 15:36:25', '2022-03-18 15:36:25'),
(54, '0', 'GILDA PAOLA', 'TOALA YAGUAL', 'gildapao86@outlook.es', '0', 17, 3, '2022-03-19 15:36:25', '2022-03-19 15:36:25'),
(55, '0', 'JORGE IVAN', 'RIOS CARDENAS', 'ivan_rios53@hotmail.com', '0', 17, 3, '2022-03-20 15:36:25', '2022-03-20 15:36:25'),
(56, '0', 'GINA YOLANDA', 'BAILON PORTILLA', 'ginab@hotmail.com', '0', 17, 3, '2022-03-21 15:36:25', '2022-03-21 15:36:25'),
(57, '0', 'ROSA AMADA', 'ARIZAGA HAZ', 'rosy5827@hotmail.com', '0', 17, 3, '2022-03-22 15:36:25', '2022-03-22 15:36:25'),
(58, '0', 'CELESTE MARIETA', 'SANDOYA MEDINA', 'sandoyaceleste8@gmail.com', '0', 17, 3, '2022-03-23 15:36:25', '2022-03-23 15:36:25'),
(59, '0', 'BELLA ?NGELA', 'CATUTO SAN LUCAS', 'bellacatuto@hotmail.com', '0', 17, 3, '2022-03-24 15:36:25', '2022-03-24 15:36:25'),
(60, '0', 'MARIA CRISTINA', 'LOPEZ MACIAS', 'estudianteingles36@hotmail.com', '0', 17, 3, '2022-03-25 15:36:25', '2022-03-25 15:36:25'),
(61, '0', 'RICHAR SEGUNDO', 'VALAREZO ESPEJO', 'richar.valarezo@gmail.com', '0', 18, 4, '2022-03-26 15:36:25', '2022-03-26 15:36:25'),
(62, '0', 'VILMA AGUSTINA', 'ACOSTA SANCHEZ', 'ismael_n9@hotmail.com', '0', 19, 5, '2022-03-27 15:36:25', '2022-03-27 15:36:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_desechos`
--

CREATE TABLE `tb_tipo_desechos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tb_tipo_desechos`
--

INSERT INTO `tb_tipo_desechos` (`id`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'PELIGROSO', '2021-12-16 20:30:22', '2021-12-29 15:56:38'),
(2, 'ESPECIAL', '2021-12-16 20:32:02', '2021-12-29 15:52:34'),
(3, 'NO PELIGRO', '2021-12-17 14:58:17', '2021-12-29 15:57:12'),
(4, 'PRUE444', '2021-12-22 20:17:21', '2022-02-04 19:56:37'),
(5, 'PRUEBA4', '2022-01-25 17:20:28', '2022-01-25 17:20:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Carlos Ramirez', 'carlosrami1989@gmail.com', NULL, '$2y$10$4QF9dPSwDMmnsCG8T4iRO.gvsgasVQzefD6foocLk2.SsZY/nXgLO', NULL, NULL, NULL, 1, NULL, '2021-06-08 08:02:16', '2021-06-08 08:02:17'),
(2, 'ee', 'azul_ramirezv@hotmail.com', NULL, '$2y$10$VJhARyFPwMlvc0irHW4aqusylDIZEdbIeBZE6rGVmZpwANENr/t4.', NULL, NULL, NULL, NULL, NULL, '2022-01-06 00:23:25', '2022-01-06 00:23:25'),
(3, 'JUAN JOSE SABANDO CARDENAS', 'juanjosesabando@gmail.com', NULL, '$2y$10$fgtDB5CKnrW7YtOJLWUV5uWwmjI5T.qylOBDUvCnjd77Ye.0BeZum', NULL, NULL, NULL, NULL, NULL, '2022-02-03 15:34:50', '2022-02-03 15:34:50'),
(4, 'MICHELLE STEFANY GARCIA SALAZAR', 'mgs.stefany@gmail.com', NULL, '$2y$10$VwagVW2mwKKCkAySxar6QO8VmpXD4t3JVWt4EX/gpewCIQCHW4ovK', NULL, NULL, NULL, NULL, NULL, '2022-02-03 15:36:12', '2022-02-03 15:36:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_por_perfil`
--

CREATE TABLE `usuario_por_perfil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario_por_perfil`
--

INSERT INTO `usuario_por_perfil` (`id`, `id_usuario`, `id_perfil`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-01-07 19:58:15', '2022-01-07 19:58:15'),
(2, 2, 2, '2022-01-07 19:58:15', '2022-01-07 19:58:15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tb_cargos`
--
ALTER TABLE `tb_cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_clasificacion_desechos`
--
ALTER TABLE `tb_clasificacion_desechos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_clasificacion_desechos_descripcion`
--
ALTER TABLE `tb_clasificacion_desechos_descripcion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_departamentos`
--
ALTER TABLE `tb_departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_ingreso_informacion`
--
ALTER TABLE `tb_ingreso_informacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_responsable`
--
ALTER TABLE `tb_responsable`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_tipo_desechos`
--
ALTER TABLE `tb_tipo_desechos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `usuario_por_perfil`
--
ALTER TABLE `usuario_por_perfil`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_cargos`
--
ALTER TABLE `tb_cargos`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tb_clasificacion_desechos`
--
ALTER TABLE `tb_clasificacion_desechos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_clasificacion_desechos_descripcion`
--
ALTER TABLE `tb_clasificacion_desechos_descripcion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tb_departamentos`
--
ALTER TABLE `tb_departamentos`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_ingreso_informacion`
--
ALTER TABLE `tb_ingreso_informacion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tb_responsable`
--
ALTER TABLE `tb_responsable`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `tb_tipo_desechos`
--
ALTER TABLE `tb_tipo_desechos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario_por_perfil`
--
ALTER TABLE `usuario_por_perfil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
