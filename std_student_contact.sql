-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 23, 2022 at 01:02 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `std_student_contact`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `url`) VALUES
(1, 'L4-Drag and Drop', '/upload/L4-Drag and Drop.pdf'),
(2, 'SQLite Database', '/upload/Lec6- SQLite Database.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `community_questions`
--

DROP TABLE IF EXISTS `community_questions`;
CREATE TABLE IF NOT EXISTS `community_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_common` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `community_questions`
--

INSERT INTO `community_questions` (`id`, `student_id`, `question`, `department_id`, `created_at`, `is_common`) VALUES
(7, 21, 'question to community', 1, '2022-04-09 11:58:10', 1),
(6, 21, 'nnn', 1, '2022-04-09 10:14:51', 1),
(8, 26, 'هل مادة شبكات صعبة؟!', 5, '2022-04-18 20:38:16', 1),
(9, 26, 'هل مادة شبكات صعبة؟!', 5, '2022-04-18 20:39:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `community_replies`
--

DROP TABLE IF EXISTS `community_replies`;
CREATE TABLE IF NOT EXISTS `community_replies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `reply` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(24, 4, 'url', 'file', 'Url', 1, 1, 1, 1, 1, 1, '{}', 3),
(25, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(26, 5, 'student_id', 'text', 'Student Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(27, 5, 'question', 'text', 'Question', 0, 1, 1, 1, 1, 1, '{}', 3),
(28, 5, 'department_id', 'text', 'Department Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(29, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 5),
(30, 5, 'is_common', 'text', 'Is Common', 0, 1, 1, 1, 1, 1, '{}', 6),
(31, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(32, 6, 'student_id', 'text', 'Student Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(33, 6, 'question_id', 'text', 'Question Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(34, 6, 'reply', 'text', 'Reply', 0, 1, 1, 1, 1, 1, '{}', 4),
(35, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(36, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(37, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(38, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(39, 8, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(40, 8, 'honor_id', 'text', 'Honor Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(41, 8, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 4),
(42, 8, 'content', 'text', 'Content', 0, 1, 1, 1, 1, 1, '{}', 5),
(43, 8, 'answer', 'text', 'Answer', 0, 1, 1, 1, 1, 1, '{}', 6),
(44, 8, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 7),
(45, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(46, 9, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(47, 9, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
(48, 9, 'password', 'password', 'Password', 0, 0, 1, 1, 1, 1, '{}', 4),
(49, 9, 'department_id', 'text', 'Department Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(50, 9, 'specialization', 'text', 'Specialization', 0, 1, 1, 1, 1, 1, '{}', 6),
(51, 9, 'start_free_time', 'text', 'Start Free Time', 0, 1, 1, 1, 1, 1, '{}', 7),
(52, 9, 'end_free_time', 'text', 'End Free Time', 0, 1, 1, 1, 1, 1, '{}', 8),
(53, 9, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 9),
(54, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(55, 10, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(56, 10, 'email', 'text', 'Email', 0, 0, 1, 1, 1, 1, '{}', 3),
(57, 10, 'password', 'password', 'Password', 0, 0, 1, 1, 1, 1, '{}', 4),
(58, 10, 'type', 'text', 'Type', 1, 1, 1, 1, 1, 1, '{}', 5),
(59, 10, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 6),
(60, 5, 'community_question_belongsto_student_relationship', 'relationship', 'Student', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"student_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(61, 5, 'community_question_belongsto_department_relationship', 'relationship', 'Department', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(62, 6, 'community_reply_belongsto_student_relationship', 'relationship', 'Student', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"student_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(63, 6, 'community_reply_belongsto_community_question_relationship', 'relationship', 'Question', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\CommunityQuestion\",\"table\":\"community_questions\",\"type\":\"belongsTo\",\"column\":\"question_id\",\"key\":\"id\",\"label\":\"question\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(64, 8, 'honors_question_belongsto_student_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(65, 8, 'honors_question_belongsto_student_relationship_1', 'relationship', 'Honor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"honor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(66, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 11, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(68, 11, 'professor_id', 'text', 'Professor Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(69, 11, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 4),
(70, 11, 'content', 'text', 'Content', 0, 1, 1, 1, 1, 1, '{}', 5),
(71, 11, 'answer', 'text', 'Answer', 0, 1, 1, 1, 1, 1, '{}', 6),
(72, 11, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 1, 0, 1, '{}', 7),
(73, 11, 'professor_question_belongsto_student_relationship', 'relationship', 'Student', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(75, 11, 'professor_question_belongsto_professor_relationship_1', 'relationship', 'Professor', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Professor\",\"table\":\"professors\",\"type\":\"belongsTo\",\"column\":\"professor_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(76, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(77, 12, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(78, 12, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{}', 3),
(79, 12, 'content', 'text_area', 'Content', 0, 1, 1, 1, 1, 1, '{}', 4),
(81, 12, 'report_belongsto_user_relationship_1', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"books\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(4, 'books', 'books', 'Book', 'Books', 'voyager-bag', 'App\\Models\\Book', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 14:20:39', '2022-04-18 14:21:57'),
(5, 'community_questions', 'community-questions', 'Community Question', 'Community Questions', 'voyager-bag', 'App\\Models\\CommunityQuestion', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 14:20:46', '2022-04-18 14:22:52'),
(6, 'community_replies', 'community-replies', 'Community Reply', 'Community Replies', 'voyager-bag', 'App\\Models\\CommunityReply', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 14:20:50', '2022-04-18 14:24:23'),
(7, 'departments', 'departments', 'Department', 'Departments', 'voyager-bag', 'App\\Models\\Department', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-04-18 14:20:56', '2022-04-18 14:20:56'),
(8, 'honors_questions', 'honors-questions', 'Honors Question', 'Honors Questions', 'voyager-bag', 'App\\Models\\HonorsQuestion', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 14:21:01', '2022-04-18 14:25:37'),
(9, 'professors', 'professors', 'Professor', 'Professors', 'voyager-bag', 'App\\Models\\Professor', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 14:21:06', '2022-04-18 14:28:24'),
(10, 'students', 'students', 'Student', 'Students', 'voyager-bag', 'App\\Models\\Student', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 14:21:11', '2022-04-18 14:32:58'),
(11, 'professor_questions', 'professor-questions', 'Professor Question', 'Professor Questions', 'voyager-bag', 'App\\Models\\ProfessorQuestion', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-04-18 14:25:54', '2022-04-18 14:26:51'),
(12, 'reports', 'reports', 'Report', 'Reports', 'voyager-receipt', 'App\\Models\\Report', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-05-23 09:00:30', '2022-05-23 09:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(1, 'chemistry'),
(2, 'physics'),
(3, 'Biology'),
(4, 'mathematics'),
(5, 'computer');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `honors_questions`
--

DROP TABLE IF EXISTS `honors_questions`;
CREATE TABLE IF NOT EXISTS `honors_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `honor_id` int DEFAULT NULL,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `honors_questions`
--

INSERT INTO `honors_questions` (`id`, `user_id`, `honor_id`, `title`, `content`, `answer`, `created_at`) VALUES
(6, 21, 24, 'new question', 'question to fatmah ?', NULL, '2022-04-09 11:57:43'),
(4, 21, 22, 'nn', 'nn', 'mmm', '2022-04-08 23:00:35'),
(5, 22, 22, 'mm', 'mm', 'mmm', '2022-04-09 10:32:59'),
(7, 21, 23, 'nnn', 'nn', NULL, '2022-04-09 12:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-04-17 11:05:23', '2022-04-17 11:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-04-17 11:05:23', '2022-04-17 11:05:23', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2022-04-17 11:05:23', '2022-04-18 14:21:29', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2022-04-17 11:05:23', '2022-04-17 11:05:23', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2022-04-17 11:05:23', '2022-04-17 11:05:23', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 5, '2022-04-17 11:05:23', '2022-04-18 14:21:29', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2022-04-17 11:05:23', '2022-04-18 14:21:29', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2022-04-17 11:05:23', '2022-04-18 14:21:29', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2022-04-17 11:05:23', '2022-04-18 14:21:29', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2022-04-17 11:05:23', '2022-04-18 14:21:29', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 6, '2022-04-17 11:05:23', '2022-04-18 14:21:29', 'voyager.settings.index', NULL),
(11, 1, 'Books', '', '_self', 'voyager-bag', NULL, NULL, 14, '2022-04-18 14:20:39', '2022-04-18 14:27:54', 'voyager.books.index', NULL),
(12, 1, 'Community Questions', '', '_self', 'voyager-bag', NULL, NULL, 11, '2022-04-18 14:20:46', '2022-04-18 14:28:04', 'voyager.community-questions.index', NULL),
(13, 1, 'Community Replies', '', '_self', 'voyager-bag', NULL, NULL, 12, '2022-04-18 14:20:50', '2022-04-18 14:28:04', 'voyager.community-replies.index', NULL),
(14, 1, 'Departments', '', '_self', 'voyager-bag', NULL, NULL, 13, '2022-04-18 14:20:56', '2022-04-18 14:27:54', 'voyager.departments.index', NULL),
(15, 1, 'Honors Questions', '', '_self', 'voyager-bag', NULL, NULL, 10, '2022-04-18 14:21:01', '2022-04-18 14:28:06', 'voyager.honors-questions.index', NULL),
(16, 1, 'Professors', '', '_self', 'voyager-bag', NULL, NULL, 8, '2022-04-18 14:21:06', '2022-04-18 14:28:06', 'voyager.professors.index', NULL),
(17, 1, 'Students', '', '_self', 'voyager-bag', NULL, NULL, 7, '2022-04-18 14:21:12', '2022-04-18 14:21:29', 'voyager.students.index', NULL),
(18, 1, 'Professor Questions', '', '_self', 'voyager-bag', NULL, NULL, 9, '2022-04-18 14:25:54', '2022-04-18 14:28:06', 'voyager.professor-questions.index', NULL),
(19, 1, 'Reports', '', '_self', 'voyager-receipt', NULL, NULL, 15, '2022-05-23 09:00:30', '2022-05-23 09:00:30', 'voyager.reports.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(2, 'browse_bread', NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(3, 'browse_database', NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(4, 'browse_media', NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(5, 'browse_compass', NULL, '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(6, 'browse_menus', 'menus', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(7, 'read_menus', 'menus', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(8, 'edit_menus', 'menus', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(9, 'add_menus', 'menus', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(10, 'delete_menus', 'menus', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(11, 'browse_roles', 'roles', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(12, 'read_roles', 'roles', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(13, 'edit_roles', 'roles', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(14, 'add_roles', 'roles', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(15, 'delete_roles', 'roles', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(16, 'browse_users', 'users', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(17, 'read_users', 'users', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(18, 'edit_users', 'users', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(19, 'add_users', 'users', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(20, 'delete_users', 'users', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(21, 'browse_settings', 'settings', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(22, 'read_settings', 'settings', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(23, 'edit_settings', 'settings', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(24, 'add_settings', 'settings', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(25, 'delete_settings', 'settings', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(26, 'browse_books', 'books', '2022-04-18 14:20:39', '2022-04-18 14:20:39'),
(27, 'read_books', 'books', '2022-04-18 14:20:39', '2022-04-18 14:20:39'),
(28, 'edit_books', 'books', '2022-04-18 14:20:39', '2022-04-18 14:20:39'),
(29, 'add_books', 'books', '2022-04-18 14:20:39', '2022-04-18 14:20:39'),
(30, 'delete_books', 'books', '2022-04-18 14:20:39', '2022-04-18 14:20:39'),
(31, 'browse_community_questions', 'community_questions', '2022-04-18 14:20:46', '2022-04-18 14:20:46'),
(32, 'read_community_questions', 'community_questions', '2022-04-18 14:20:46', '2022-04-18 14:20:46'),
(33, 'edit_community_questions', 'community_questions', '2022-04-18 14:20:46', '2022-04-18 14:20:46'),
(34, 'add_community_questions', 'community_questions', '2022-04-18 14:20:46', '2022-04-18 14:20:46'),
(35, 'delete_community_questions', 'community_questions', '2022-04-18 14:20:46', '2022-04-18 14:20:46'),
(36, 'browse_community_replies', 'community_replies', '2022-04-18 14:20:50', '2022-04-18 14:20:50'),
(37, 'read_community_replies', 'community_replies', '2022-04-18 14:20:50', '2022-04-18 14:20:50'),
(38, 'edit_community_replies', 'community_replies', '2022-04-18 14:20:50', '2022-04-18 14:20:50'),
(39, 'add_community_replies', 'community_replies', '2022-04-18 14:20:50', '2022-04-18 14:20:50'),
(40, 'delete_community_replies', 'community_replies', '2022-04-18 14:20:50', '2022-04-18 14:20:50'),
(41, 'browse_departments', 'departments', '2022-04-18 14:20:56', '2022-04-18 14:20:56'),
(42, 'read_departments', 'departments', '2022-04-18 14:20:56', '2022-04-18 14:20:56'),
(43, 'edit_departments', 'departments', '2022-04-18 14:20:56', '2022-04-18 14:20:56'),
(44, 'add_departments', 'departments', '2022-04-18 14:20:56', '2022-04-18 14:20:56'),
(45, 'delete_departments', 'departments', '2022-04-18 14:20:56', '2022-04-18 14:20:56'),
(46, 'browse_honors_questions', 'honors_questions', '2022-04-18 14:21:01', '2022-04-18 14:21:01'),
(47, 'read_honors_questions', 'honors_questions', '2022-04-18 14:21:01', '2022-04-18 14:21:01'),
(48, 'edit_honors_questions', 'honors_questions', '2022-04-18 14:21:01', '2022-04-18 14:21:01'),
(49, 'add_honors_questions', 'honors_questions', '2022-04-18 14:21:01', '2022-04-18 14:21:01'),
(50, 'delete_honors_questions', 'honors_questions', '2022-04-18 14:21:01', '2022-04-18 14:21:01'),
(51, 'browse_professors', 'professors', '2022-04-18 14:21:06', '2022-04-18 14:21:06'),
(52, 'read_professors', 'professors', '2022-04-18 14:21:06', '2022-04-18 14:21:06'),
(53, 'edit_professors', 'professors', '2022-04-18 14:21:06', '2022-04-18 14:21:06'),
(54, 'add_professors', 'professors', '2022-04-18 14:21:06', '2022-04-18 14:21:06'),
(55, 'delete_professors', 'professors', '2022-04-18 14:21:06', '2022-04-18 14:21:06'),
(56, 'browse_students', 'students', '2022-04-18 14:21:11', '2022-04-18 14:21:11'),
(57, 'read_students', 'students', '2022-04-18 14:21:11', '2022-04-18 14:21:11'),
(58, 'edit_students', 'students', '2022-04-18 14:21:11', '2022-04-18 14:21:11'),
(59, 'add_students', 'students', '2022-04-18 14:21:11', '2022-04-18 14:21:11'),
(60, 'delete_students', 'students', '2022-04-18 14:21:11', '2022-04-18 14:21:11'),
(61, 'browse_professor_questions', 'professor_questions', '2022-04-18 14:25:54', '2022-04-18 14:25:54'),
(62, 'read_professor_questions', 'professor_questions', '2022-04-18 14:25:54', '2022-04-18 14:25:54'),
(63, 'edit_professor_questions', 'professor_questions', '2022-04-18 14:25:54', '2022-04-18 14:25:54'),
(64, 'add_professor_questions', 'professor_questions', '2022-04-18 14:25:54', '2022-04-18 14:25:54'),
(65, 'delete_professor_questions', 'professor_questions', '2022-04-18 14:25:54', '2022-04-18 14:25:54'),
(66, 'browse_reports', 'reports', '2022-05-23 09:00:30', '2022-05-23 09:00:30'),
(67, 'read_reports', 'reports', '2022-05-23 09:00:30', '2022-05-23 09:00:30'),
(68, 'edit_reports', 'reports', '2022-05-23 09:00:30', '2022-05-23 09:00:30'),
(69, 'add_reports', 'reports', '2022-05-23 09:00:30', '2022-05-23 09:00:30'),
(70, 'delete_reports', 'reports', '2022-05-23 09:00:30', '2022-05-23 09:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
CREATE TABLE IF NOT EXISTS `professors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `specialization` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_free_time` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_free_time` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`id`, `name`, `email`, `password`, `department_id`, `specialization`, `start_free_time`, `end_free_time`, `status`) VALUES
(1, 'New', 'oo@su.edu.sa', '$2y$10$8sfAf6h/ZkurGIOHcJujkeGwbwWUkaQOOKFDxsUriJuD3hciGDc8e', 1, 'new', '02:00PM', '04:00PM', NULL),
(2, 'New', 'oo@su.edu.sa', '$2y$10$SKGhdZqwqWEzM7dx8a7UXOCsi7nc0UyGRJyFSyJxzZQQrr7rj.VTy', 1, 'new', NULL, NULL, NULL),
(3, 'New', 'oo@su.edu.sa', '$2y$10$psfK.PvH2BeEj0KWqGDggOtE45uV1ggQJ9Wqv5KoRO7AAP5a/x24u', 1, 'new', NULL, NULL, NULL),
(4, 'New', 'oo@su.edu.sa', '$2y$10$GXwkt.fH7IS8VwnV6VrYmeL7rmhSI58EWsnXYksTMARA2l1fyB/26', 1, 'new', NULL, NULL, NULL),
(5, 'nnn', 'oo@gmail.com', '$2y$10$7i/vjVtsYwNar0eWDx3hcu.O2/XJesqHoxc..iR.neS3alcDV/He6', 1, 'nnn', NULL, NULL, NULL),
(6, 'Nnn', 'oo@su.edu.sa', '$2y$10$VhDvZfDpyVtMxg3zqfwIpuatgmCElLWQvt9jAy6BXynmTz3.BF7X.', 1, 'mmm', NULL, NULL, NULL),
(7, 'nnn', 'oo@gmail.com', '$2y$10$uhhCiNCnkxmMT4P7bxZTh.Ez3RI.pAQxIHcRA3Xf0BRH4cVJzc8qO', 1, 'nnn', NULL, NULL, NULL),
(8, 'New Prof', 'p@su.edu.sa', '$2y$10$hMIHDM7OfigzsGQ1Yg53SONAsuE2Asjc.pD9vlMEkEMKFJper69zy', 1, 'new', '09:00', '11:00', NULL),
(9, 'M', 'red1234hat@gmail.com', '$2y$10$BUrkqNbi41IA2JQLZ5oNE.JXiVHNJFyrjwFbx5I.XpmtZw.DaVF8W', 1, 'm', NULL, NULL, 1),
(10, 'M', 'wesyrian88@gmail.com', '$2y$10$JOFabREIxVPu0.K6vCm6mOZljJtdfOu4WNll.jvpgtdxyU/SRpFaW', 1, 'm', NULL, NULL, 166672),
(11, 'M', 'oday.97.krayem@gmail.com', '$2y$10$1mzCaikhsx7dS2m67y5TyOOhvxvXf6HaLPsLi4CZUW78jyBilXorK', 1, 'm', NULL, NULL, 1),
(12, 'nnn', 'new@gmail.com', '$2y$10$PwXSMlVUWIZX3XLGEqJLxO/ICsgDMKdGorcsT3jKJSXCMga6uajgW', 1, 'nnn', NULL, NULL, 161982),
(13, 'nnn', 'saadfattoh98@gmail.com', '$2y$10$FjZjoUIKPfYWN/woW/CPguSN5F3oB9Yl1wziR0hjFQZuHzgfBwMOW', 1, 'nnn', NULL, NULL, 1),
(14, 'mmm', 'red1234hat@gmail.com', '$2y$10$Zve0GhD6tanEuwclou4yFuSCDhpESBTD8nVaKc9GoOJF0QL2OZhGm', 1, 'nnn', NULL, NULL, 336641),
(15, 'Saa', 'saadfattoh22@gmail.com', '$2y$10$jB/mE5a9AfZ/J0CnbOkoJ.nu5h/WRUchvhu2DOlRs7awp70gYhn3K', 1, 'android', NULL, NULL, 260550),
(16, 'Saa', 'oday.97.krayem@gmail.com', '$2y$10$GZgdGi2IHOYnytWAav/x9.i.OhD51nzLqEfJ8ddL5/LHBSWvsbKTa', 1, 'android', NULL, NULL, 201676),
(17, 'Mm', 'm@gmail.com', '$2y$10$dHQNi1Pwy.wVmClQ9DqaJuwXUPQE.jcnl9PbwEkGneb5T6ZtZKXGW', 1, 'mm', NULL, NULL, 410342);

-- --------------------------------------------------------

--
-- Table structure for table `professor_questions`
--

DROP TABLE IF EXISTS `professor_questions`;
CREATE TABLE IF NOT EXISTS `professor_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `professor_id` int DEFAULT NULL,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `professor_questions`
--

INSERT INTO `professor_questions` (`id`, `user_id`, `professor_id`, `title`, `content`, `answer`, `created_at`) VALUES
(17, 21, 1, 'mm', 'mm', NULL, '2022-04-08 23:16:38'),
(16, 22, 17, 'mm', 'from honor', 'mm', '2022-04-08 23:12:37'),
(15, 21, 17, 'hi', 'hi', 'mm', '2022-04-08 23:00:13');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `user_id`, `title`, `content`) VALUES
(1, 2, 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-04-17 11:05:23', '2022-04-17 11:05:23'),
(2, 'manager', 'Manager', '2022-04-17 11:05:23', '2022-04-18 14:18:13');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `details` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Contacts', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Contacts', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\April2022\\7hjVNi4x93eWzocVj0Vy.jpeg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Contacts', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Contacts Admin Panel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1',
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `password`, `type`, `status`) VALUES
(25, 'Jori', 'S439664678@std.su.edu.sa', '$2y$10$FZpHYMbdTSJ0.D9ElXba1uRSFrKSyAKCX/AydGHj9xSG2raMJ//OC', 0, 342605),
(24, 'Fatmh Mohammed', 'fatmhalfwzan@gmail.com', '$2y$10$N8Lq0oo4kQYiD0/ayRpu.uL1HsfUvQCrs3mO4g136SBmTlTWmvrxy', 1, 283386),
(23, 'Fatmah Mohammed', 'fatmahalfwzan@gmail.com', '$2y$10$HaRxKt5QmHUrM3Fk9UC61.398DrPt8rws47pa4e2p6DKx29SKKovO', 1, 790240),
(22, 'Mm', 'okh@gmail.com', '$2y$10$lF4vwB78pfYVbTc3B/WvROCj510FJEzM8df9TBjvJ1hqdEeYKinLm', 1, 340874),
(21, 'Mm', 'ok@gmail.com', '$2y$10$yP3bUb5u6k32jnT5cSdi6u7byiYmwFJHi4cl.N2uQXT5.QCNXosLq', 0, 317560),
(20, 'oday', 'oday.krayem.97@gmail.com', '$2y$10$SYODQdgtT7Aw0wFcIBrqjuxlmpEbAbufovwQ9ih4i68XuCJKCqvku', 0, 191568),
(19, 'oday', 'oday.krayem.997@gmail.com', '$2y$10$ah34hHidA4PFfyZs6Zw5Z.mSNqXdiFa.C3jeiErmSYaVljeMVJaZC', 0, 330785),
(18, 'New', '0day.krayem0@gmail.com', '$2y$10$9OTXmTYmCSEEVN6zaiHxmOmMQyZPU2a/3JVoytV.Kbzcaf74vT.hG', 0, 1),
(26, 'Jori', 'S439662453@std.su.edu.sa', '$2y$10$5M2qOL79AgLMJZ.PMaA1aexq2MxA.FFhsOO0a4jQYdvwyb9dnmtmO', 0, 874090);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin@demo.com', 'users/default.png', NULL, '$2y$10$y.j.enwe8T/sBCECFU2EheueqfdZDZCsWeMe4nEjXj6lroralWJl.', NULL, NULL, NULL, NULL),
(2, 2, 'Manager', 'man@demo.com', 'users/default.png', NULL, '$2y$10$zRLHj2NU86OUvxz3Vo984.hogQlWK.lrxp6FDAEwAjdWGSb8PWapq', NULL, '{\"locale\":\"en\"}', '2022-04-18 14:31:59', '2022-04-18 14:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
