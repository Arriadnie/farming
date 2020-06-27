-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Чрв 27 2020 р., 21:07
-- Версія сервера: 10.3.13-MariaDB
-- Версія PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `farming`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(3, NULL, 1, 'Новости предприятия', 'doradnictvo', '2020-03-22 12:23:57', '2020-06-20 14:23:59');

-- --------------------------------------------------------

--
-- Структура таблиці `charts`
--

CREATE TABLE `charts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_number` double DEFAULT NULL,
  `max_number` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data_json` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `charts`
--

INSERT INTO `charts` (`id`, `name`, `slug`, `type_id`, `title`, `sub_title`, `min_number`, `max_number`, `created_at`, `updated_at`, `data_json`) VALUES
(1, 'Статистика (головна)', 'statistika-golovna', 1, 'Статистика', 'Статистика удоя молока Крым-Фарминг', 32, 40, '2020-06-21 18:11:41', '2020-06-27 09:57:56', '{\"labels\":[\"Январь\",\"Февраль\",\"Март\",\"Апрель\",\"Июнь\",\"Июль\"],\"datasets\":[{\"label\":\"Литров молока на корову в сутки 2019\",\"data\":[\"33.3\",\"33.6\",\"33\",\"34.5\",\"34\",\"40\"],\"backgroundColor\":[\"rgba(75, 192, 192, 0.2)\",\"rgba(255, 99, 132, 0.2)\",\"rgba(54, 162, 235, 0.2)\",\"rgba(255, 206, 86, 0.2)\",\"rgba(153, 102, 255, 0.2)\",\"rgba(255, 159, 64, 0.2)\"],\"borderColor\":[\"rgba(75, 192, 192, 1)\",\"rgba(255, 99, 132, 1)\",\"rgba(54, 162, 235, 1)\",\"rgba(255, 206, 86, 1)\",\"rgba(153, 102, 255, 1)\",\"rgba(255, 159, 64, 1)\"],\"borderWidth\":1},{\"label\":\"Литров молока на корову в сутки 2020\",\"data\":[\"32.6\",\"33.2\",\"33.4\",\"34\",\"33.4\",\"33.3\"],\"backgroundColor\":[\"rgba(75, 192, 192, 0.2)\",\"rgba(255, 99, 132, 0.2)\",\"rgba(54, 162, 235, 0.2)\",\"rgba(255, 206, 86, 0.2)\",\"rgba(153, 102, 255, 0.2)\",\"rgba(255, 159, 64, 0.2)\"],\"borderColor\":[\"rgba(75, 192, 192, 1)\",\"rgba(255, 99, 132, 1)\",\"rgba(54, 162, 235, 1)\",\"rgba(255, 206, 86, 1)\",\"rgba(153, 102, 255, 1)\",\"rgba(255, 159, 64, 1)\"],\"borderWidth\":1}]}');

-- --------------------------------------------------------

--
-- Структура таблиці `chart_types`
--

CREATE TABLE `chart_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `js_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `chart_types`
--

INSERT INTO `chart_types` (`id`, `name`, `js_type`) VALUES
(1, 'Линейный', 'line'),
(2, 'Гистограмма', 'bar'),
(3, 'Круговая', 'pie');

-- --------------------------------------------------------

--
-- Структура таблиці `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_rows`
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
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
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
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(100, 10, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(101, 10, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(102, 10, 'blade_path', 'text', 'Шлях до файлу', 1, 1, 1, 1, 1, 0, '{}', 3),
(103, 10, 'public', 'checkbox', 'Public', 1, 1, 1, 1, 1, 0, '{}', 4),
(104, 10, 'with_items', 'checkbox', 'With Items', 1, 1, 1, 1, 1, 0, '{}', 5),
(105, 10, 'with_item_parent', 'checkbox', 'With Item Parent', 1, 0, 1, 1, 1, 0, '{}', 6),
(106, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 7),
(107, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 8),
(108, 11, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(109, 11, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 3),
(110, 11, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:infoblocks,slug\"}}', 4),
(111, 11, 'type_id', 'select_dropdown', 'Type Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(112, 11, 'title', 'text', 'Заголовок', 0, 0, 1, 1, 1, 0, '{}', 5),
(113, 11, 'sub_title', 'text', 'Підзаголовок', 0, 0, 1, 1, 1, 0, '{}', 6),
(114, 11, 'body', 'rich_text_box', 'Текст', 0, 0, 1, 1, 1, 0, '{}', 7),
(115, 11, 'button_title', 'text', 'Заголовок кнопки', 0, 0, 1, 1, 1, 0, '{}', 8),
(116, 11, 'button_link', 'text', 'Посилання кнопки', 0, 0, 1, 1, 1, 0, '{}', 9),
(117, 11, 'image', 'image', 'Картинка', 0, 1, 1, 1, 1, 0, '{}', 10),
(118, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 11),
(119, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 12),
(120, 11, 'infoblock_belongsto_infoblock_type_relationship', 'relationship', 'Тип', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockType\",\"table\":\"infoblock_types\",\"type\":\"belongsTo\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(121, 11, 'infoblock_hasmany_infoblock_item_relationship', 'relationship', 'Елементи', 0, 1, 1, 1, 1, 1, '{\"isItems\":true,\"dataTypeSlug\":\"infoblock-items\",\"itemsProperty\":\"items\",\"itemsVisibleMethod\":\"typeWithItems\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockItem\",\"table\":\"infoblock_items\",\"type\":\"hasMany\",\"column\":\"infoblock_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(122, 12, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(123, 12, 'infoblock_id', 'select_dropdown', 'Infoblock Id', 1, 0, 1, 1, 1, 1, '{}', 2),
(124, 12, 'parent_id', 'select_dropdown', 'Parent Id', 0, 0, 1, 0, 1, 1, '{}', 3),
(125, 12, 'title', 'text', 'Заголовок', 0, 1, 1, 1, 1, 0, '{}', 4),
(126, 12, 'sub_title', 'text', 'Підзаголовок', 0, 0, 1, 1, 1, 0, '{}', 5),
(127, 12, 'image', 'file', 'Картинка', 0, 1, 1, 1, 1, 1, '{}', 6),
(128, 12, 'button_title', 'text', 'Заголовок кнопки', 0, 0, 1, 1, 1, 0, '{}', 8),
(129, 12, 'button_link', 'text', 'Посилання кнопки', 0, 0, 1, 1, 1, 0, '{}', 9),
(130, 12, 'body', 'text_area', 'Інформація', 0, 0, 1, 1, 1, 0, '{}', 10),
(131, 12, 'order', 'number', 'Порядковий номер', 1, 0, 0, 0, 0, 0, '{}', 11),
(132, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 12),
(133, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 13),
(134, 12, 'infoblock_item_belongsto_infoblock_relationship', 'relationship', 'Інфоблок', 0, 1, 1, 1, 1, 1, '{\"isItemsParent\":true,\"parentDataTypeSlug\":\"infoblocks\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\Infoblock\",\"table\":\"infoblocks\",\"type\":\"belongsTo\",\"column\":\"infoblock_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(135, 12, 'infoblock_item_hasmany_infoblock_item_relationship', 'relationship', 'Дочірні елементи', 0, 1, 1, 1, 1, 1, '{\"isChildItems\":true,\"childItemsProperty\":\"children\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockItem\",\"table\":\"infoblock_items\",\"type\":\"hasMany\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(136, 13, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(137, 13, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(138, 13, 'svg', 'file', 'Svg', 1, 1, 1, 1, 1, 0, '{}', 3),
(139, 13, 'link', 'text', 'Посилання', 1, 1, 1, 1, 1, 0, '{}', 4),
(140, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 5),
(141, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 6),
(142, 14, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(143, 14, 'name', 'text', 'Назва', 1, 1, 1, 1, 1, 1, '{}', 2),
(144, 14, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:galleries,slug\"}}', 3),
(145, 14, 'title', 'text', 'Заголовок', 0, 0, 1, 1, 1, 0, '{}', 4),
(146, 14, 'sub_title', 'text', 'Підзаголовок', 0, 0, 1, 1, 1, 0, '{}', 5),
(147, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 6),
(148, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 7),
(149, 14, 'gallery_hasmany_gallery_image_relationship', 'relationship', 'Фото', 0, 0, 1, 1, 1, 1, '{\"isItems\":true,\"dataTypeSlug\":\"gallery-images\",\"itemsProperty\":\"images\",\"model\":\"App\\\\Models\\\\Galleries\\\\GalleryImage\",\"table\":\"gallery_images\",\"type\":\"hasMany\",\"column\":\"gallery_id\",\"key\":\"id\",\"label\":\"caption\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(150, 15, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(151, 15, 'gallery_id', 'number', 'Gallery Id', 1, 0, 1, 1, 1, 1, '{}', 2),
(152, 15, 'image', 'image', 'Фото', 0, 1, 1, 1, 1, 1, '{}', 3),
(153, 15, 'caption', 'text', 'Заголовок', 0, 1, 1, 1, 1, 1, '{}', 5),
(154, 15, 'order', 'number', 'Порядковый номер', 1, 0, 0, 0, 0, 0, '{}', 6),
(155, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 7),
(156, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 8),
(157, 15, 'gallery_image_belongsto_gallery_relationship', 'relationship', 'Галерея', 0, 1, 1, 1, 1, 1, '{\"isItemsParent\":true,\"parentDataTypeSlug\":\"galleries\",\"model\":\"App\\\\Models\\\\Galleries\\\\Gallery\",\"table\":\"galleries\",\"type\":\"belongsTo\",\"column\":\"gallery_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(158, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(159, 16, 'name', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 3),
(160, 16, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"},\"validation\":{\"rule\":\"unique:charts,slug\"}}', 4),
(161, 16, 'type_id', 'text', 'Type Id', 0, 0, 1, 1, 1, 1, '{}', 2),
(162, 16, 'title', 'text', 'Заголовок', 0, 0, 1, 1, 1, 1, '{}', 6),
(163, 16, 'sub_title', 'text_area', 'Подзаголовок', 0, 0, 1, 1, 1, 1, '{}', 7),
(164, 16, 'min_number', 'number', 'Минимальный показатель', 0, 0, 1, 1, 1, 1, '{}', 8),
(165, 16, 'max_number', 'number', 'Максимальный показатель', 0, 0, 1, 1, 1, 1, '{}', 9),
(166, 16, 'created_at', 'timestamp', 'Создан', 0, 0, 1, 0, 0, 1, '{}', 10),
(167, 16, 'updated_at', 'timestamp', 'Изменен', 0, 0, 1, 0, 0, 0, '{}', 11),
(168, 16, 'chart_belongsto_chart_type_relationship', 'relationship', 'Тип', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Charts\\\\ChartType\",\"table\":\"chart_types\",\"type\":\"belongsTo\",\"column\":\"type_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(169, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(170, 17, 'name', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(171, 17, 'js_type', 'text', 'Тип Js', 1, 1, 1, 1, 1, 1, '{}', 3),
(172, 16, 'data_json', 'text', 'Data Json', 0, 0, 1, 1, 1, 0, '{}', 11),
(173, 15, 'video', 'file', 'Видео', 0, 0, 1, 1, 1, 1, '{}', 4),
(174, 12, 'video', 'file', 'Видео', 0, 0, 1, 1, 1, 1, '{}', 7);

-- --------------------------------------------------------

--
-- Структура таблиці `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-03-10 17:24:10', '2020-03-10 17:24:10'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-03-10 17:24:10', '2020-03-10 17:24:10'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-03-10 17:24:10', '2020-03-10 17:24:10'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'App\\Models\\Posts\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-03-10 17:24:27', '2020-03-22 12:22:15'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(10, 'infoblock_types', 'infoblock-types', 'Тип інфоблоків', 'Типи інфоблоків', 'voyager-categories', 'App\\Models\\Infoblocks\\InfoblockType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-15 19:00:13', '2020-03-15 19:25:52'),
(11, 'infoblocks', 'infoblocks', 'Інфоблок', 'Інфоблоки', 'voyager-photos', 'App\\Models\\Infoblocks\\Infoblock', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-15 19:05:35', '2020-03-15 19:27:43'),
(12, 'infoblock_items', 'infoblock-items', 'Елемент інфоблоку', 'Елементи інфоблоків', 'voyager-photo', 'App\\Models\\Infoblocks\\InfoblockItem', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-15 19:15:20', '2020-06-27 14:23:06'),
(13, 'social_networks', 'social-networks', 'Соцільна мережа', 'Соціальні мережі', 'voyager-facebook', 'App\\Models\\SocialNetwork', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-03-16 18:39:44', '2020-03-16 18:39:44'),
(14, 'galleries', 'galleries', 'Галерея', 'Галереї', 'voyager-photos', 'App\\Models\\Galleries\\Gallery', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-19 19:29:21', '2020-03-19 19:31:19'),
(15, 'gallery_images', 'gallery-images', 'Фото галереї', 'Фото галереї', 'voyager-photo', 'App\\Models\\Galleries\\GalleryImage', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"caption\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-19 19:34:03', '2020-06-27 14:22:30'),
(16, 'charts', 'charts', 'График', 'Графики', 'voyager-bar-chart', 'App\\Models\\Charts\\Chart', NULL, 'App\\Http\\Controllers\\Charts\\ChartController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-21 15:05:03', '2020-06-23 17:14:59'),
(17, 'chart_types', 'chart-types', 'Тип графика', 'Типы графиков', 'voyager-bar-chart', 'App\\Models\\Charts\\ChartType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-21 18:10:06', '2020-06-21 18:10:06');

-- --------------------------------------------------------

--
-- Структура таблиці `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `slug`, `title`, `sub_title`, `created_at`, `updated_at`) VALUES
(1, 'Alta genetics', 'alta-genetics', 'Фото события', '', '2020-06-20 14:08:46', '2020-06-20 14:16:58'),
(2, 'О нас', 'o-nas', 'Наша галерея', '', '2020-06-20 15:27:21', '2020-06-20 15:27:21'),
(3, 'Заготовка кормов', 'zagotovka-kormov', '', '', '2020-06-20 18:03:26', '2020-06-20 18:03:26'),
(4, 'Основное стадо', 'osnovnoe-stado', '', '', '2020-06-20 18:18:20', '2020-06-20 18:18:20'),
(5, 'Доение коров', 'doenie-korov', '', '', '2020-06-20 18:31:52', '2020-06-20 18:31:52'),
(6, 'Выращивание', 'vyrashivanie', '', '', '2020-06-20 18:39:19', '2020-06-20 18:39:19');

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gallery_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `gallery_id`, `image`, `caption`, `order`, `created_at`, `updated_at`, `video`) VALUES
(1, 1, 'gallery-images\\June2020\\wm0C4iHHLUn4v3ppqSQs.jpg', '1', 3, '2020-06-20 14:11:30', '2020-06-20 17:06:53', NULL),
(2, 1, 'gallery-images\\June2020\\FUOIvhRFhXW6MURTEa1Z.jpg', '2', 2, '2020-06-20 14:11:47', '2020-06-20 14:16:28', NULL),
(3, 1, 'gallery-images\\June2020\\OkKZEnWVWBYcm3eOGbKS.jpg', '3', 1, '2020-06-20 14:12:07', '2020-06-20 14:16:28', NULL),
(4, 1, 'gallery-images\\June2020\\xNs73pxjgkIQhdbHxFGG.jpg', '4', 4, '2020-06-20 14:15:49', '2020-06-20 17:06:53', NULL),
(5, 2, 'gallery-images\\June2020\\gr7yGwWK696ltdRGQZd8.jpg', '1', 2, '2020-06-20 15:27:32', '2020-06-21 08:33:43', NULL),
(6, 2, 'gallery-images\\June2020\\YsMSj21Vbm92Csm7GrrW.jpg', '2', 3, '2020-06-20 15:27:47', '2020-06-21 08:33:43', NULL),
(7, 2, 'gallery-images\\June2020\\Heo5urIGXNjcW1j4e7Yd.png', '3', 4, '2020-06-20 15:28:20', '2020-06-21 08:33:43', NULL),
(8, 2, 'gallery-images\\June2020\\CtpKAZ6qsibbEyp0b77b.JPG', '4', 5, '2020-06-20 15:28:52', '2020-06-21 08:33:43', NULL),
(9, 3, 'gallery-images\\June2020\\VkGo011qporIEs35jnRW.jpg', '1', 1, '2020-06-20 18:03:34', '2020-06-27 14:27:14', NULL),
(10, 3, 'gallery-images\\June2020\\ApiMwKqfzb6A0TtlpbJZ.jpg', '2', 2, '2020-06-20 18:03:45', '2020-06-27 14:27:14', NULL),
(11, 3, 'gallery-images\\June2020\\BZbjUyi7sUKp0tSmCC75.jpg', '3', 4, '2020-06-20 18:04:02', '2020-06-27 14:27:14', NULL),
(12, 3, 'gallery-images\\June2020\\SR5E7Vf35PngWBOBmOJu.jpg', '4', 5, '2020-06-20 18:04:21', '2020-06-27 14:27:14', NULL),
(13, 4, 'gallery-images\\June2020\\KBta2R0y6UK20DZpl86Y.JPG', '1', 13, '2020-06-20 18:18:28', '2020-06-20 18:18:46', NULL),
(14, 4, 'gallery-images\\June2020\\UQWBQibKwZDDo57L65S5.JPG', '2', 14, '2020-06-20 18:18:50', '2020-06-20 18:19:04', NULL),
(15, 4, 'gallery-images\\June2020\\ZGo46ZB8JmSzcc9AVY1r.JPG', '3', 15, '2020-06-20 18:19:08', '2020-06-20 18:19:21', NULL),
(16, 4, 'gallery-images\\June2020\\d5AmDCn69uGgFyXtvGJ8.JPG', '4', 16, '2020-06-20 18:19:25', '2020-06-20 18:20:27', NULL),
(17, 4, 'gallery-images\\June2020\\2Z9yYhyfUCldPDOsJrqA.JPG', '5', 17, '2020-06-20 18:20:31', '2020-06-20 18:21:29', NULL),
(18, 5, 'gallery-images\\June2020\\FIXyQTZDEeQ0T5CIUqeL.jpg', '1', 1, '2020-06-20 18:32:04', '2020-06-20 18:36:04', NULL),
(19, 5, 'gallery-images\\June2020\\MX3tRUp09duzCtbZdMvs.jpg', '2', 2, '2020-06-20 18:33:47', '2020-06-20 18:36:04', NULL),
(20, 5, 'gallery-images\\June2020\\sTq8KVYZkaXfEdkYCWaR.jpg', '3', 4, '2020-06-20 18:34:00', '2020-06-20 18:36:04', NULL),
(21, 5, 'gallery-images\\June2020\\bEbSSOyPyGjHFdZjDOc0.jpg', '4', 3, '2020-06-20 18:34:18', '2020-06-20 18:36:04', NULL),
(22, 6, 'gallery-images\\June2020\\myGS31xYdnxOTGDJX0Lz.JPG', '1', 18, '2020-06-20 18:39:26', '2020-06-20 18:40:02', NULL),
(23, 6, NULL, '2', 19, '2020-06-20 18:40:06', '2020-06-20 18:40:06', NULL),
(24, 2, 'gallery-images\\June2020\\naD80uCoNeqo1ytmJZaL.JPG', '5', 1, '2020-06-21 08:32:53', '2020-06-21 08:33:43', NULL),
(25, 3, 'gallery-images\\June2020\\YI41QIcYJB5MAyF80ZeY.jpg', '5 Видео', 3, '2020-06-27 14:24:09', '2020-06-27 14:27:14', '[{\"download_link\":\"gallery-images\\\\June2020\\\\YjwrhDwjSZcDESge6TTX.mp4\",\"original_name\":\"1.mp4\"}]');

-- --------------------------------------------------------

--
-- Структура таблиці `infoblocks`
--

CREATE TABLE `infoblocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `infoblocks`
--

INSERT INTO `infoblocks` (`id`, `name`, `slug`, `type_id`, `title`, `sub_title`, `body`, `button_title`, `button_link`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Опис (головна)', 'opis-golovna', 1, '\"Крым-Фарминг\" ', '', '<p><span style=\"color: #3d3d3d; font-family: OpenSans, Arial, sans-serif;\">- первое в Республике Крым предприятие по производству молока в промышленных масштабах. Примечательно, что в активную фазу проект вошел после присоединения Крыма к России. В 2015 году предприятие получило субсидию в 1,928 миллиона рублей за обработку 2188 гектаров земли.</span></p>', 'Узнать больше', 'o-nas', NULL, '2020-03-15 19:52:26', '2020-06-20 15:44:02'),
(2, 'Слайдер (головна)', 'slajder-golovna', 2, '', '', '', '', NULL, NULL, '2020-03-21 09:40:12', '2020-03-21 09:40:12'),
(3, 'Сервіси (головна)', 'servisi-golovna', 3, '', '', '', '', NULL, NULL, '2020-03-21 10:19:00', '2020-03-21 10:19:00'),
(4, 'Корисні посилання (головна)', 'korisni-posilannya-golovna', 4, 'Корисні посилання', '', '', '', NULL, NULL, '2020-03-21 10:56:55', '2020-03-21 10:56:55'),
(5, 'Наші партнери (головна)', 'nashi-partneri-golovna', 5, 'Наши партнеры', '', '', '', NULL, NULL, '2020-03-21 11:10:09', '2020-06-20 13:28:49'),
(7, 'О нас с картинкой', 'o-nas-s-kartinkoj', 7, 'О нас', '', '<p>Крым-Фарминг - это молочная ферма нового поколения. На ферме содержатся около 5000 коров отборной Голштинско Фризской породы, завезенной из Нидерландов. Предприятие укомплектовано самым современным оборудованием от ведущего мирового производителя - фирмы ДеЛаваль.</p>', '', NULL, 'infoblocks\\June2020\\4HT8L3RjXlxJPjCongU4.jpg', '2020-06-20 14:51:52', '2020-06-20 15:12:16'),
(8, 'Технологии', 'tehnologii', 8, 'Наши технологии', 'Комплекс использует новейшие технологии', '', '', NULL, NULL, '2020-06-20 16:26:49', '2020-06-20 16:26:49');

-- --------------------------------------------------------

--
-- Структура таблиці `infoblock_items`
--

CREATE TABLE `infoblock_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `infoblock_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `infoblock_items`
--

INSERT INTO `infoblock_items` (`id`, `infoblock_id`, `parent_id`, `title`, `sub_title`, `image`, `button_title`, `button_link`, `body`, `order`, `created_at`, `updated_at`, `video`) VALUES
(1, 2, NULL, 'Сезонный сбор урожая', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\duGARZoEYbivWKlgyI0h.jpg\",\"original_name\":\"img9.jpg\"}]', 'Узнать больше', '/posts', 'Lorem ipsum dolor sit amet lorem ipsum dolor sit amet', 3, '2020-03-21 09:48:46', '2020-06-27 14:43:26', NULL),
(2, 2, NULL, 'Передовая техника ', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\lBnbn3038rGmFtpTcyKj.jpg\",\"original_name\":\"img1.jpg\"}]', '', NULL, 'Для обеспечения роботы целого комплекса, необходимой составляющей является наличие передовой техники', 4, '2020-03-21 10:02:40', '2020-06-27 14:43:26', NULL),
(3, 3, NULL, 'Основное стадо', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\T4ruCEcpNpxfqEgG2XM0.svg\",\"original_name\":\"cow.svg\"}]', 'Перейти', 'osnovnoe-stado', 'Комплекс ООО \"Крым-Фарминг\" построен по принципу минимум капиталовложений а учитывая природно-климатическую зону', 3, '2020-03-21 10:19:33', '2020-06-20 18:10:05', NULL),
(4, 3, NULL, 'Заготовка кормов', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\VYRHAChIAREh5vS5DU1H.svg\",\"original_name\":\"wheat.svg\"}]', 'Перейти', 'zagotovka-kormov', 'Одним из ключевых факторов успешного молочного животноводства является выращивание и заготовка основных кормов', 4, '2020-03-21 10:21:31', '2020-06-20 18:00:02', NULL),
(5, 3, NULL, 'Техника', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\dzDzl9ajNYDgAJTQ0ATX.svg\",\"original_name\":\"tractor.svg\"}]', 'Перейти', 'tehnika', 'Для обеспечения роботы целого комплекса, необходимой составляющей является наличие передовой техники', 5, '2020-03-21 10:23:11', '2020-06-20 18:26:32', NULL),
(6, 4, NULL, 'FAQ', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\P5WlnAV9hhl0SlCxjFGB.svg\",\"original_name\":\"faq.svg\"}]', '', NULL, 'УКР Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi corporis deserunt dicta doloremque earum', 6, '2020-03-21 10:57:22', '2020-03-21 10:58:23', NULL),
(7, 4, NULL, 'FAQ 2', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\hEUN6GOvtbBuJKJJNAar.svg\",\"original_name\":\"faq.svg\"}]', '', NULL, 'УКР Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi corporis deserunt dicta doloremque earum', 7, '2020-03-21 10:58:38', '2020-03-21 10:59:10', NULL),
(8, 5, NULL, 'Delaval', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\s3RaPzb0qY2a0ktCNsnW.png\",\"original_name\":\"delaval-1.png\"}]', '', 'https://www.delaval.com/ru/', '', 8, '2020-03-21 11:10:36', '2020-06-20 13:26:56', NULL),
(10, 5, NULL, 'Альтаир', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\VFRW3I7UZYcHQoKvq2y5.png\",\"original_name\":\"logo.png\"}]', '', 'https://altair-ak.ru/', '', 9, '2020-06-20 15:02:57', '2020-06-20 15:03:42', NULL),
(11, 5, NULL, 'Новатор', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\JzHnnwdgAmrU3ixr7iyT.png\",\"original_name\":\"logo3.png\"}]', '', 'http://novator.com.ru/', '', 10, '2020-06-20 15:05:12', '2020-06-20 15:05:37', NULL),
(12, 5, NULL, 'Долина легенд', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\od3BQqrKT4cDAxKEgAvW.svg\",\"original_name\":\"1.svg\"}]', '', 'http://dolinalegend.ru/', '', 11, '2020-06-20 15:06:39', '2020-06-20 15:09:35', NULL),
(13, 2, NULL, '3D-тур по територии', 'Посетите нашу ферму онлайн!', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\2wbgbEQjk9V1udkyMnoi.jpg\",\"original_name\":\"tour.jpg\"},{\"download_link\":\"infoblock-items\\\\June2020\\\\97gCnGNyYPnn4ZV01KD4.jpg\",\"original_name\":\"DJI_0173.jpg\"}]', 'Открыть тур', '/post', 'Посетите нашу ферму онлайн!', 2, '2020-06-20 15:37:00', '2020-06-27 14:43:26', NULL),
(14, 8, NULL, 'Заготовка кормов', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\s8T3IOzp7s3TXY8dl0HY.JPG\",\"original_name\":\"img6.JPG\"}]', 'Узнать больше', 'zagotovka-kormov', 'Одним из ключевых факторов успешного молочного животноводства является выращивание и заготовление кормов для кормления скота', 12, '2020-06-20 16:27:46', '2020-06-20 17:59:46', NULL),
(15, 8, NULL, 'Основное стадо', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\q9RzfAc5CBh65wLfhmbP.jpg\",\"original_name\":\"b69dd5a3e121212ce9741a70b266f35d.jpg\"}]', 'Узнать больше', 'osnovnoe-stado', 'Комплекс ООО «Крым-Фарминг» использует систему Драйлот — содержание коров круглый год под открытым небом на выгульно-кормовых площадках ', 13, '2020-06-20 16:29:01', '2020-06-20 18:12:18', NULL),
(16, 8, NULL, 'Доение коров', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\cXktiRQ7O4X7jmPJ8AjL.jpg\",\"original_name\":\"inventar.jpg\"}]', 'Узнать больше', 'doenie-korov', 'Доение коров в доильном зале «Чемпион» на 100 мест, укомплектованном оборудованием компании «DeLaval».', 14, '2020-06-20 16:31:34', '2020-06-20 18:24:47', NULL),
(17, 8, NULL, 'Выращивание стада', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\OjiTuifHQU33Xaa4y83n.png\",\"original_name\":\"image_2020-06-20_20-39-54.png\"}]', 'Узнать больше', 'vyrashivanie-stada', 'Одним из ключевых факторов успешного молочного производства является выращивание ремонтного поголовья', 15, '2020-06-20 16:32:58', '2020-06-20 18:30:10', NULL),
(18, 8, NULL, 'Техника', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\alQasxxNf5VK4e6xoJwp.jpg\",\"original_name\":\"IMG_0392.jpg\"}]', 'Узнать больше', 'tehnika', 'Для обеспечения роботы целого комплекса, необходимой составляющей является наличие передовой техники', 16, '2020-06-20 18:26:58', '2020-06-20 18:27:49', NULL),
(19, 5, NULL, 'ALta', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\G5IQLlxn1UHEPdQa3tRH.svg\",\"original_name\":\"logo.svg\"}]', '', 'https://www.altagenetics.ru/', '', 17, '2020-06-21 08:38:20', '2020-06-21 08:39:10', NULL),
(20, 5, NULL, 'DSM', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\2osFnrQKiQZ1rxDxa0C8.svg\",\"original_name\":\"logo-dsm.svg\"}]', '', 'https://www.dsm.com/corporate/about/businesses/dsm-nutritional-products.html', '', 18, '2020-06-21 09:22:19', '2020-06-21 09:22:53', NULL),
(21, 5, NULL, 'Крайторг', '', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\j4Y3qvZMMM9FrxUjEFz5.jpg\",\"original_name\":\"635899817_w0_h120_635899817 (1).jpg\"}]', '', 'https://xn--80aeciqcf8apdckef.xn--p1ai/', '', 19, '2020-06-21 09:45:11', '2020-06-21 09:46:16', NULL),
(22, 2, NULL, 'Сбор урожая', 'Lorem ipsum dolor sit amet lorem ipsum dolor sit amet', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\LWx2ZzNKdzPwXIqMn2QO.jpg\",\"original_name\":\"video-image.jpg\"}]', '', NULL, '', 1, '2020-06-27 14:41:41', '2020-06-27 14:43:26', '[{\"download_link\":\"infoblock-items\\\\June2020\\\\7Ar21KyHKtIu9D15WrOB.mp4\",\"original_name\":\"1.mp4\"}]');

-- --------------------------------------------------------

--
-- Структура таблиці `infoblock_types`
--

CREATE TABLE `infoblock_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blade_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  `with_items` tinyint(1) NOT NULL,
  `with_item_parent` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `infoblock_types`
--

INSERT INTO `infoblock_types` (`id`, `name`, `blade_path`, `public`, `with_items`, `with_item_parent`, `created_at`, `updated_at`) VALUES
(1, 'About', 'about', 0, 0, 0, '2020-03-15 19:50:16', '2020-03-15 19:50:16'),
(2, 'Слайдер (головний)', 'slider', 0, 1, 0, '2020-03-21 09:04:54', '2020-03-21 09:04:54'),
(3, 'Сервіси (головна)', 'services', 0, 1, 0, '2020-03-21 09:05:54', '2020-03-21 09:05:54'),
(4, 'Корисні посилання', 'useful-links', 0, 1, 0, '2020-03-21 10:56:12', '2020-03-21 10:56:12'),
(5, 'Слайдер (партнери)', 'partners-slider', 0, 1, 0, '2020-03-21 11:08:25', '2020-03-21 11:08:25'),
(7, 'О нас с картинкой', 'about-image', 0, 0, 0, '2020-06-20 14:50:32', '2020-06-20 14:50:32'),
(8, 'Технологии', 'technologies', 0, 1, 0, '2020-06-20 16:25:22', '2020-06-20 16:25:33');

-- --------------------------------------------------------

--
-- Структура таблиці `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-03-10 17:24:10', '2020-03-10 17:24:10'),
(2, 'main-navigation', '2020-03-16 18:52:08', '2020-03-16 18:52:08'),
(3, 'footer-navigation', '2020-03-21 13:45:07', '2020-03-21 13:45:07');

-- --------------------------------------------------------

--
-- Структура таблиці `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Панель управления', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2020-03-10 17:24:10', '2020-06-21 14:49:51', 'voyager.dashboard', 'null'),
(2, 1, 'Медиа', '', '_self', 'voyager-images', '#000000', NULL, 3, '2020-03-10 17:24:10', '2020-06-21 14:50:27', 'voyager.media.index', 'null'),
(3, 1, 'Пользователи', '', '_self', 'voyager-person', '#000000', 24, 2, '2020-03-10 17:24:10', '2020-06-21 14:50:19', 'voyager.users.index', 'null'),
(4, 1, 'Роли', '', '_self', 'voyager-lock', '#000000', 24, 1, '2020-03-10 17:24:10', '2020-06-21 14:50:09', 'voyager.roles.index', 'null'),
(5, 1, 'Настройки', '', '_self', 'voyager-tools', '#000000', NULL, 9, '2020-03-10 17:24:10', '2020-06-21 18:10:24', NULL, ''),
(6, 1, 'Настройки Меню', '', '_self', 'voyager-list', '#000000', 5, 1, '2020-03-10 17:24:10', '2020-06-21 14:55:21', 'voyager.menus.index', 'null'),
(7, 1, 'База данных', '', '_self', 'voyager-data', '#000000', 5, 2, '2020-03-10 17:24:10', '2020-06-21 14:55:32', 'voyager.database.index', 'null'),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-03-10 17:24:10', '2020-03-14 15:46:24', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-03-10 17:24:10', '2020-03-14 15:46:24', 'voyager.bread.index', NULL),
(10, 1, 'Системные настройки', '', '_self', 'voyager-settings', '#000000', NULL, 10, '2020-03-10 17:24:10', '2020-06-21 18:10:24', 'voyager.settings.index', 'null'),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-03-10 17:24:11', '2020-03-14 15:46:24', 'voyager.hooks', NULL),
(12, 1, 'Категории', '', '_self', 'voyager-categories', '#000000', 23, 1, '2020-03-10 17:24:27', '2020-06-21 14:51:00', 'voyager.categories.index', 'null'),
(13, 1, 'Новости', '', '_self', 'voyager-news', '#000000', 23, 2, '2020-03-10 17:24:27', '2020-06-21 14:50:49', 'voyager.posts.index', 'null'),
(14, 1, 'Страницы', '', '_self', 'voyager-file-text', '#000000', NULL, 5, '2020-03-10 17:24:27', '2020-06-21 14:53:49', 'voyager.pages.index', 'null'),
(19, 1, 'Типы инфоблоков', '', '_self', 'voyager-categories', '#000000', 57, 1, '2020-03-15 19:00:14', '2020-06-21 14:56:36', 'voyager.infoblock-types.index', 'null'),
(20, 1, 'Инфоблоки', '', '_self', 'voyager-photos', '#000000', NULL, 6, '2020-03-15 19:05:35', '2020-06-21 14:54:37', 'voyager.infoblocks.index', 'null'),
(23, 1, 'Новости', '', '_self', 'voyager-news', '#000000', NULL, 4, '2020-03-15 19:40:49', '2020-06-21 14:50:40', NULL, ''),
(24, 1, 'Пользователи', '', '_self', 'voyager-person', '#000000', NULL, 2, '2020-03-16 18:01:52', '2020-06-21 14:50:00', NULL, ''),
(25, 1, 'Социальные сети', '', '_self', 'voyager-facebook', '#000000', NULL, 11, '2020-03-16 18:39:45', '2020-06-21 18:10:24', 'voyager.social-networks.index', 'null'),
(30, 2, 'Наша діяльність', '', '_self', NULL, '#000000', 26, 4, '2020-03-16 18:59:05', '2020-03-16 18:59:35', NULL, ''),
(31, 2, 'О нас', 'o-nas', '_self', NULL, '#000000', NULL, 1, '2020-03-16 18:59:42', '2020-06-20 15:21:20', NULL, ''),
(32, 2, 'Технологии', 'tehnologii', '_self', NULL, '#000000', NULL, 3, '2020-03-16 18:59:50', '2020-06-20 16:21:46', NULL, ''),
(34, 2, 'Консультації', '', '_self', NULL, '#000000', 33, 1, '2020-03-16 19:04:55', '2020-03-16 19:20:43', NULL, ''),
(35, 2, 'Навчання', '', '_self', NULL, '#000000', 33, 2, '2020-03-16 19:05:02', '2020-03-16 19:20:44', NULL, ''),
(36, 2, 'Демонстрації', '', '_self', NULL, '#000000', 33, 3, '2020-03-16 19:05:14', '2020-03-16 19:20:45', NULL, ''),
(37, 1, 'Галереи', '', '_self', 'voyager-photos', '#000000', NULL, 7, '2020-03-19 19:29:23', '2020-06-21 18:10:20', 'voyager.galleries.index', 'null'),
(40, 3, 'Послуги', '', '_self', NULL, '#000000', NULL, 3, '2020-03-21 14:02:23', '2020-03-21 14:08:14', NULL, ''),
(41, 3, 'Консультації', '', '_self', NULL, '#000000', 40, 1, '2020-03-21 14:02:46', '2020-03-21 14:03:26', NULL, ''),
(42, 3, 'Навчання', '', '_self', NULL, '#000000', 40, 2, '2020-03-21 14:03:01', '2020-03-21 14:03:27', NULL, ''),
(43, 3, 'Демонстрації', '', '_self', NULL, '#000000', 40, 3, '2020-03-21 14:03:21', '2020-03-21 14:03:29', NULL, ''),
(44, 3, 'Про асоціацію', '', '_self', NULL, '#000000', NULL, 1, '2020-03-21 14:04:11', '2020-03-21 14:07:35', NULL, ''),
(45, 3, 'Загальна інформація', '', '_self', NULL, '#000000', 44, 1, '2020-03-21 14:06:29', '2020-03-21 14:07:30', NULL, ''),
(46, 3, 'Наша команда', '', '_self', NULL, '#000000', 44, 2, '2020-03-21 14:06:47', '2020-03-21 14:07:31', NULL, ''),
(47, 3, 'Реєстраційні документи', '', '_self', NULL, '#000000', 44, 3, '2020-03-21 14:07:00', '2020-03-21 14:07:32', NULL, ''),
(48, 3, 'Наша діяльність', '', '_self', NULL, '#000000', 44, 4, '2020-03-21 14:07:18', '2020-03-21 14:07:33', NULL, ''),
(49, 3, 'Дорадництво', '', '_self', NULL, '#000000', NULL, 2, '2020-03-21 14:07:54', '2020-03-21 14:08:14', NULL, ''),
(50, 3, 'Сервіси', '', '_self', NULL, '#000000', NULL, 4, '2020-03-21 14:36:53', '2020-03-21 14:38:15', NULL, ''),
(51, 3, 'Навчання', 'http://edorada.org/moodle/', '_blank', NULL, '#000000', 50, 1, '2020-03-21 14:38:09', '2020-03-21 14:38:15', NULL, ''),
(52, 2, 'Новости', 'posts', '_self', NULL, '#000000', NULL, 2, '2020-03-21 16:18:38', '2020-06-20 13:44:45', NULL, ''),
(53, 2, '3D-тур', '', '_self', NULL, '#000000', NULL, 11, '2020-06-20 13:45:33', '2020-06-20 13:45:33', NULL, ''),
(54, 2, 'Галерея', 'galereya', '_self', NULL, '#000000', NULL, 12, '2020-06-20 13:45:50', '2020-06-20 17:09:04', NULL, ''),
(55, 2, 'Статистика', 'statistika', '_self', NULL, '#000000', NULL, 13, '2020-06-20 13:46:00', '2020-06-27 13:13:31', NULL, ''),
(57, 1, 'Справочники', '', '_self', 'voyager-window-list', '#000000', NULL, 12, '2020-06-21 14:53:12', '2020-06-21 18:10:24', NULL, ''),
(58, 1, 'Графики', '', '_self', 'voyager-bar-chart', NULL, NULL, 8, '2020-06-21 15:05:04', '2020-06-21 18:10:24', 'voyager.charts.index', NULL),
(59, 1, 'Типы графиков', '', '_self', 'voyager-bar-chart', NULL, 57, 2, '2020-06-21 18:10:06', '2020-06-21 18:10:20', 'voyager.chart-types.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2016_01_01_000000_add_voyager_user_fields', 2),
(5, '2016_01_01_000000_create_data_types_table', 2),
(6, '2016_05_19_173453_create_menu_table', 2),
(7, '2016_10_21_190000_create_roles_table', 2),
(8, '2016_10_21_190000_create_settings_table', 2),
(9, '2016_11_30_135954_create_permission_table', 2),
(10, '2016_11_30_141208_create_permission_role_table', 2),
(11, '2016_12_26_201236_data_types__add__server_side', 2),
(12, '2017_01_13_000000_add_route_to_menu_items_table', 2),
(13, '2017_01_14_005015_create_translations_table', 2),
(14, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 2),
(15, '2017_03_06_000000_add_controller_to_data_types_table', 2),
(16, '2017_04_21_000000_add_order_to_data_rows_table', 2),
(17, '2017_07_05_210000_add_policyname_to_data_types_table', 2),
(18, '2017_08_05_000000_add_group_to_settings_table', 2),
(19, '2017_11_26_013050_add_user_role_relationship', 2),
(20, '2017_11_26_015000_create_user_roles_table', 2),
(21, '2018_03_11_000000_add_user_settings', 2),
(22, '2018_03_14_000000_add_details_to_data_types_table', 2),
(23, '2018_03_16_000000_make_settings_value_nullable', 2),
(24, '2016_01_01_000000_create_pages_table', 3),
(25, '2016_01_01_000000_create_posts_table', 3),
(26, '2016_02_15_204651_create_categories_table', 3),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 3),
(28, '2020_01_22_205910_create_infoblock_types_table', 4),
(29, '2020_01_24_155807_create_infoblocks_table', 4),
(30, '2020_01_24_161735_create_infoblock_items_table', 4),
(31, '2020_01_30_203320_create_social_networks_table', 5),
(32, '2020_02_12_211233_create_galleries_table', 6),
(33, '2020_02_12_211243_create_gallery_images_table', 6),
(34, '2020_06_21_171930_create_chart_types_table', 7),
(35, '2020_06_21_171932_create_charts_table', 7),
(36, '2020_06_21_171952_create_chart_columns_table', 7),
(37, '2020_06_21_171959_create_chart_rows_table', 7),
(38, '2020_06_21_172017_create_chart_cells_table', 7),
(39, '2020_06_23_194010_add_json_column_to_charts_table', 8),
(40, '2020_06_27_171813_add_video_column_to_gallery_images_table', 9),
(41, '2020_06_27_171840_add_video_column_to_infoblock_items_table', 9);

-- --------------------------------------------------------

--
-- Структура таблиці `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'О нас', 'О нас', '<h2 style=\"text-align: center;\">Крым-Фарминг - это молочная ферма нового поколения</h2>\n<p>&nbsp;</p>\n<p>На ферме содержатся около 7000 коров отборной Голштинско Фризской породы, завезенной из Нидерландов. Предприятие укомплектовано самым современным оборудованием от ведущего мирового производителя - фирмы ДеЛаваль.</p>\n<p>&nbsp;</p>\n<p>Мы собираем молоко с применением новейших технологий. Использование системы мгновенного охлаждения молока в потоке, позволяет получить сырье высочайшего качества. В доильном центре используются два зала &laquo;Чемпион&raquo; на 50 стойло мест каждый, система охлаждения молока в потоке, два танка, по 50 м&sup3; каждый, для хранения полученного сырья. Кормление и доение осуществляются в полуавтоматическом режиме.</p>\n<p>&nbsp;</p>\n<p>[gallery code=\"o-nas\"]</p>\n<p>Больше фотографий в розделе \"Галерея\"</p>', 'pages\\June2020\\oPFPYpYOCYFPDfxolcFw.jpg', 'o-nas', 'О Крым-фарминг', 'ферма, Крым-фарминг', 'ACTIVE', '2020-06-20 15:20:54', '2020-06-21 08:32:18'),
(3, 1, 'Технологии', 'Технологии', '<p>[infoblock code=\"tehnologii\"]</p>', 'pages\\June2020\\XUwRrXQpKR26nCy6FJ0Z.jpg', 'tehnologii', 'Технологии Крым-фарминг', 'Крым-фарминг, ферма, технологии, жывотноводство', 'ACTIVE', '2020-06-20 16:21:19', '2020-06-20 16:27:26'),
(4, 1, 'Галерея', 'Галерея', '<p>Галерея</p>', 'pages\\June2020\\A5XgEm4ip79wGIv0h7dI.jpg', 'galereya', 'Галерея Крым-фарминг', 'фото, видео, Галерея, Крым-фарминг, техника, поголовье', 'ACTIVE', '2020-06-20 17:08:51', '2020-06-20 17:08:51'),
(5, 1, 'Заготовка кормов', 'Заготовка кормов', '<p>Одним из ключевых факторов успешного молочного животноводства является выращивание и заготовка основных кормом. Общая площадь сельскохозяйственных угодий для выращивания кормов составляет 4 300 га.</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/pages/June2020/DJI_0173.jpg\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>Среднегодовой уровень осадком в степной зане Крыма составляет 350 мм, что усложняет процесс выращивания и заготовки&nbsp; качественных кормов. Животноводческий комплекс ООО &laquo;Крым-Фарминг&raquo; построен по принципу минимум капиталовложения и по максимум результат. Все грубые корма (силоса и сенажи) буртуются в большие курганы на площадках без покрытия на предварительно выровненной земле.</p>\n<p>&nbsp;</p>\n<p>Годовая потребность комплекса в основных кормах составляет 50 тыс.тонн. Для того чтоб успеть заготовить корма высокого качества в нужную фазу, оптимальным количеством кормоуборочной техники, учитывая особенность растениеводства в условиях степной зоны Крыма, в структуре посевных площадей имеется 5 основных кормовых культур.</p>\n<p>&nbsp;</p>\n<p>Поскольку Крым это зона рискованного земледелия, основной упор делается на озимые культуры (рож &mdash; 600 га, тритикале &mdash;&nbsp; 600 га, пшеница &mdash; 600 га), многолетние эспарцет &mdash; 600 га и кукуруза &mdash; 1500га.</p>\n<p>&nbsp;</p>\n<p>Использую засухоустойчивые гибриды кукурузы при норме посева 35 тыс. семян на гектар удается выращивать полноценно кукурузу на силос и зерно с более низкой урожайностью &mdash; 110-150 ц/га зеленой массы но содержания крахмала более 30%. В таких условиях при достаточной площади питания на растении формируется два початка.</p>\n<p>&nbsp;</p>\n<p>Два раза вгод все корма исследуются мокрой химией в сертефецированой лаборатории NOVA и BLGG, и раз в два месяца на спектральный анализ в эти же лаборатории .</p>\n<p>&nbsp;</p>\n<p>В каждом кормоуборочном комбайне установлен аппликатор для внесения консерванта. Используем кансервант компании Agravis и Pioner.</p>\n<p>&nbsp;</p>\n<p>Цель убрать злаковые в фазе выхода в трубку до колошения, поскольку в этой фазе переваримость больше на 12-15 % и составляет более 70% от СВ. Эспарцет убирается в фазе бутонизации что позволяет получить сенаж с содержанием протеина более 20%. Укрываются курганы полиэтиленовой пленкой 45 и 150 микрон. По периметру курганы обсыпаются землей и все покрышки перевязываются между собой использованным шпагатом от соломы. Для подстилки и кормлении заготавливается ежегодно 7 000 тонн соломы.&nbsp; &nbsp;&nbsp;</p>\n<p>[gallery code=\"zagotovka-kormov\"]</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 'pages\\June2020\\WRO52FCPRNR2HydMDd9q.jpg', 'zagotovka-kormov', 'Заготовка кормов Крым-Фарминг', 'Заготовка кормов, скот, поголовье, Крым-Фарминг', 'ACTIVE', '2020-06-20 17:58:43', '2020-06-20 18:07:01'),
(8, 1, 'Основное стадо', 'Основное стадо', '<p>Комплекс ООО &laquo;Крым-Фарминг&raquo; построен по принципу минимум капиталовложений а учитывая природно-климатическую зону севера Крыма идеально подходит система Драйлот &mdash; содержание коров круглый год под открытым небом на выгульно-кормовых площадках с расчетом 60 м2/голову уплотненной почвы.</p>\n<p>&nbsp;</p>\n<p>&nbsp;Животные содержатся крупногрупповыми методом по 350 голов в группе. Для содержания коров основного стада на комплексе 7 больших групп где размещаются животные согласно физиологическому состоянию.</p>\n<p>&nbsp;</p>\n<p>Группы формируются по дням доения и стельности. Каждая группа имеет навес с площадью 4 м2/голову где коровы могут зимой спрятаться от снега а летом от дождя и солнца. Под навесами в мокрую погоду и зимой ежедневно проводится подстилка из соломы. Навоз ежедневно чистится и вывозится на навозохранилище.</p>\n<p>&nbsp;</p>\n<p><img src=\"http://crim/storage/pages/June2020/DJI_0165.JPG\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>Каждый выгул оснащен кормовым столом и навозным проходом с бетонным покрытием. Процессы кормление, навозоудаление и зооветеринарные манипуляции проводятся синхронизировано с доением. Ежедневно в мокрую пору года навоз из навозных проходах чистится специальной машиной Свипер и вносит жидкую фракцию навоза в поле или сливает в лагуну если в поле нельзя проехать.</p>\n<p>Фронт кормления составляет 60 см. Все кормовые столы оснащенные 100% фиксаторами для головы. Над хедлоками установлена линия орошения что в жаркое время позволяет немного снизить тепловой стресс.</p>\n<p>&nbsp;</p>\n<p>На комплексе всего два капитальных строения &mdash; это доильно-молочный блок и госпиталь. В доильно-молочном блоке размещен доильный зал, доильное,&nbsp; вспомогательное оборудование, емкости для хранения молока 3х50м3 и административный комплекс.&nbsp; Госпиталь рассчитан на 200 гол. В нем размещены животные перед отелом (поздний сухостой) раздельно нетеля и коровы, коровы на лечении и профразчистке копыт, новотельные под наблюдением и животные на лечении. В этих группах коровы содержатся на глубокой подстилке. Технология Драйлот &mdash; это дешевый вариант содержания для сухой климатической зоны но подразумевает ежегодное обслуживание выгулов (подвоз глины и выравнивания поверхностей. В выгулах ежедневно проводится планирования прицепным и навесным выравнивателем. В сутки комплекс производит 80 тонн молока и 800 тонн навоза жидкой и твердой фракции. В доильном зале предусмотрен гидросмыв. Вся вода поступает в приемную емкость и циркулирует по кругу для очистки накопителя. Если уровень воды превышает определенный уровень, жидкая фракция навоза откачуется в лагуну. Возле лагуны установлен сепаратор который разделяет навоз на жидкую и твердую фракцию. Твердая фракция вывозится на навозохранилище, жидкая используется для орошения ближайших угодий.</p>\n<p>[gallery code=\"osnovnoe-stado\"]</p>', 'pages\\June2020\\969EG6FNvtowZI6ZRcbf.jpg', 'osnovnoe-stado', 'Основное стадо Крым-Фарминг', 'стадо, поголовье, Крым-Фарминг', 'ACTIVE', '2020-06-20 18:09:18', '2020-06-20 18:22:14'),
(9, 1, 'Доение коров', 'Доение коров', '<p>Доение&nbsp; коров трехразовое, в доильном зале &laquo;Чемпион&raquo; на 100 мест, укомплектованном оборудованием компании &laquo;DeLaval&raquo;. В правом ухе каждой коровы установлен HDX транспондер, который идентифицируют каждую корову при в ходе животного в доильный зал. После постановки коровы в место согласно протоколу доения животные обрабатываются 1% раствором перекиси водорода. После каждое животное вытирается салфеткой с правилом одна салфетка &mdash; одна корова. Следующая операция здаевание первых струй молока, после чего идет подключение доильного аппарата. После выдаевания, когда поток молока снижается ниже 0,4 л/мин аппарат автоматически снимается с коровы и вся информация (удой, скорость молокоотдачи, электропроводность) автоматически вносится в базу данных компьютера, а затем анализируется специалистами хозяйства. Молоко не имея прямого контакта с внешней средой через систему трубопровода откачивается проходя через систему фильтрации с мгновенным охлаждение до 3&ordm;С в вертикальные емкости хранения по 50 м3.</p>\n<p>[gallery code=\"doenie-korov\"]</p>', 'pages\\June2020\\M3BlubMR8yTs5ENDA9Yp.jpg', 'doenie-korov', 'Доение коров Крым-Фарминг', 'Доение, стадо, Крым-Фарминг', 'ACTIVE', '2020-06-20 18:24:34', '2020-06-20 18:34:58'),
(10, 1, 'Техника', 'Техника', '', 'pages\\June2020\\m4XUS4ab5aqpWMhdhe6h.jpg', 'tehnika', 'Техника Крым-Фарминг', 'Техника, трактор, Крым-Фарминг', 'ACTIVE', '2020-06-20 18:25:53', '2020-06-20 18:25:53'),
(11, 1, 'Выращивание стада', 'Выращивание стада', '<p>Одним из ключевых факторов успешного молочного производства является выращивание ремонтного молодняка. Чем больше в стадо вводится качественного пополнения тем больше можно выбраковать низкопродуктивных коров и соответственно получить больше молока.</p>\n<p>&nbsp;</p>\n<p>Выращивания телок телок делится на несколько этапов:</p>\n<p>&nbsp;</p>\n<h3>Телки 0-2 мес.</h3>\n<p>Это самый важный период в развитии телки, так как формируется будущий организм и закладывается будущая продуктивность. Животные данной технологической группы содержаться в индивидуальных деревянных домиках под постоянным присмотром. Сразу после рождения в первые полчаса зондом вливается 2,0 литра и повторно через 6 часов также 2,0 литра молозива. Перед выпойкой молозиво проверяется на количество иммуноглобулинов. Если молозиво не соответствует требованием, берется уже проверенное замороженное молозиво с банка и размораживается.</p>\n<p>&nbsp;</p>\n<p><img style=\"float: right;\" src=\"http://crim/storage/pages/June2020/IMG_11852.JPG\" alt=\"\" width=\"733\" height=\"549\" /></p>\n<p>Помищаеться теленок в групповой домик для обсушки и наблюдения. Два раза в сутки телят вывозят в индивидуальные домики размер ячейки 1,2 м х 0,8 м. В этом домике теленок находится 30 дней после чего его переводят в другой тип домиков размер ячейки 2,4 м х 0,8 м, а маленький домик чистится и дезинфицируеться для следующего теленка.</p>\n<p>&nbsp;</p>\n<p>Период выпойки составляет 63 дня. за этот период теленок должен выпить 349 л молоко. Выпойка только молоком. Ни один заменитель молока не может сравнится по качеству с натуральным молоком.</p>\n<p>&nbsp;</p>\n<p>Выпаеваються телята с соски и кормятся согласно схемы кормления.</p>\n<p>&nbsp;</p>\n<p>Для формирования иммунитета и защиты используется схема вакцинации.</p>\n<p>&nbsp;</p>\n<p>На предприятии применяется двух кратная схема выпойки, что стимулирует поедаемость комбикорма. Первый день &mdash; двух кратная выпойка молозива с интервалом не больше 6 часов. Второй четвертый день два раза по 2 литра и последующие дни два разы по 3 литра. За неделю до отлучки один раз по 3 литра. Комбикорм имеет 20% протеина стоимостью 15,8 руб/кг. Комбикорм один для телят от 0 до 5 мес.</p>\n<p>&nbsp;</p>\n<p style=\"display: flex;\"><img style=\"width: 49%; margin-right: auto;\" src=\"http://crim/storage/pages/June2020/IMG_E0592.jpg\" alt=\"\" /> <img style=\"width: 49%;\" src=\"http://crim/storage/pages/June2020/IMG_E0599.jpg\" alt=\"\" width=\"562\" height=\"749\" /></p>\n<p>&nbsp;</p>\n<h3>&nbsp;</h3>\n<h3>Телки старше 2-х мес.</h3>\n<p>Телки 2-5 мес. содержатся мелкогрупповым методом под навесом в боксах по 12 гол. Размер бокса 9,0х6,0м. Постилка осуществляется два разы в неделю, При плохих погодных условиях (зимой снег, летом дождь) &mdash; каждый день. Потребляют телята полноценный комбикорм с содержанием 20 % протеина и 1,82 Мкалл энергии. Стоимость 1 кг комбикорма составляет 15,8 руб/кг. В среднем потребление корма в день составляет 5 кг и дают привес 1,0-1,2 кг/сутки.</p>\n<p>&nbsp;</p>\n<p><img style=\"float: left;\" src=\"http://crim/storage/pages/June2020/IMG_0402-768x512.jpg\" alt=\"\" /></p>\n<p>Поение осуществляется через групповые поилки с подогревом компании&nbsp; Delaval WT7. В одном боксе телята находятся 45 дней после чего животные переводятся в другой бокс также по 12 гол. Бокс чистится дезинфицируется перед каждой новой партией телят. Перед переводом в старшую группу телке вешают электронную бирку для удобства работы с мобильным коммуникатором. В 150 дней животные переводят в старшие полововозрастные группы с крупногрупповым содержание по 150-300 гол. За неделю до перевода телок приучают к поедаемости кормосмеси путем дачи 50/50 комбикорм и кормосмесь старшей группы.</p>\n<p>&nbsp;</p>\n<p>Телята группы 5-7 мес., 7-10 мес., 10- 12 мес. и старше 12 мес., содержаться крупногрупповым методом под открытым небом по 150-300 гол. в секции. Весь кормовой фронт 100% оснащен фиксаторами головы (хедлоками) для фиксации животных и проведения зооветеринарных мероприятий. Поение происходит через групповые бетонные поилки из расчета две поилки на 300 гол. Кормление только кормосмесью согласно физиологического состояния и возраста.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<h3>Телки случного возроста.</h3>\n<p>В 12 месяцев телочке одевается датчик активности компании SCR и переводят в группу на осеменение. Параллельно системы активности проводится выявление в охоте по маркерам. Период добровольного ожидания 13 месяцев. Раньше 13 месяцев животных не осеменяют так как организм полностью не сформирован (особенно молочная железа).</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 'pages\\June2020\\9HCsrZkLeplauc2Ig3KL.JPG', 'vyrashivanie-stada', 'Выращивание стада Крым-фарминг', 'Выращивание стада, телята, Крым-фарминг', 'ACTIVE', '2020-06-20 18:29:55', '2020-06-20 19:07:20'),
(12, 1, 'Статистика', 'Статистика', '<p>[chart code=\"statistika-golovna\"]</p>', NULL, 'statistika', 'statistika', 'statistika', 'ACTIVE', '2020-06-27 13:03:22', '2020-06-27 13:03:22');

-- --------------------------------------------------------

--
-- Структура таблиці `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-03-10 17:24:10', '2020-03-10 17:24:10'),
(2, 'browse_bread', NULL, '2020-03-10 17:24:10', '2020-03-10 17:24:10'),
(3, 'browse_database', NULL, '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(4, 'browse_media', NULL, '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(5, 'browse_compass', NULL, '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(6, 'browse_menus', 'menus', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(7, 'read_menus', 'menus', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(8, 'edit_menus', 'menus', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(9, 'add_menus', 'menus', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(10, 'delete_menus', 'menus', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(11, 'browse_roles', 'roles', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(12, 'read_roles', 'roles', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(13, 'edit_roles', 'roles', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(14, 'add_roles', 'roles', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(15, 'delete_roles', 'roles', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(16, 'browse_users', 'users', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(17, 'read_users', 'users', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(18, 'edit_users', 'users', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(19, 'add_users', 'users', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(20, 'delete_users', 'users', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(21, 'browse_settings', 'settings', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(22, 'read_settings', 'settings', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(23, 'edit_settings', 'settings', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(24, 'add_settings', 'settings', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(25, 'delete_settings', 'settings', '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(26, 'browse_hooks', NULL, '2020-03-10 17:24:11', '2020-03-10 17:24:11'),
(27, 'browse_categories', 'categories', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(28, 'read_categories', 'categories', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(29, 'edit_categories', 'categories', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(30, 'add_categories', 'categories', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(31, 'delete_categories', 'categories', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(32, 'browse_posts', 'posts', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(33, 'read_posts', 'posts', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(34, 'edit_posts', 'posts', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(35, 'add_posts', 'posts', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(36, 'delete_posts', 'posts', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(37, 'browse_pages', 'pages', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(38, 'read_pages', 'pages', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(39, 'edit_pages', 'pages', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(40, 'add_pages', 'pages', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(41, 'delete_pages', 'pages', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(42, 'browse_infoblock_types', 'infoblock_types', '2020-03-15 19:00:13', '2020-03-15 19:00:13'),
(43, 'read_infoblock_types', 'infoblock_types', '2020-03-15 19:00:13', '2020-03-15 19:00:13'),
(44, 'edit_infoblock_types', 'infoblock_types', '2020-03-15 19:00:13', '2020-03-15 19:00:13'),
(45, 'add_infoblock_types', 'infoblock_types', '2020-03-15 19:00:13', '2020-03-15 19:00:13'),
(46, 'delete_infoblock_types', 'infoblock_types', '2020-03-15 19:00:13', '2020-03-15 19:00:13'),
(47, 'browse_infoblocks', 'infoblocks', '2020-03-15 19:05:35', '2020-03-15 19:05:35'),
(48, 'read_infoblocks', 'infoblocks', '2020-03-15 19:05:35', '2020-03-15 19:05:35'),
(49, 'edit_infoblocks', 'infoblocks', '2020-03-15 19:05:35', '2020-03-15 19:05:35'),
(50, 'add_infoblocks', 'infoblocks', '2020-03-15 19:05:35', '2020-03-15 19:05:35'),
(51, 'delete_infoblocks', 'infoblocks', '2020-03-15 19:05:35', '2020-03-15 19:05:35'),
(52, 'browse_infoblock_items', 'infoblock_items', '2020-03-15 19:15:21', '2020-03-15 19:15:21'),
(53, 'read_infoblock_items', 'infoblock_items', '2020-03-15 19:15:21', '2020-03-15 19:15:21'),
(54, 'edit_infoblock_items', 'infoblock_items', '2020-03-15 19:15:21', '2020-03-15 19:15:21'),
(55, 'add_infoblock_items', 'infoblock_items', '2020-03-15 19:15:21', '2020-03-15 19:15:21'),
(56, 'delete_infoblock_items', 'infoblock_items', '2020-03-15 19:15:21', '2020-03-15 19:15:21'),
(57, 'browse_social_networks', 'social_networks', '2020-03-16 18:39:44', '2020-03-16 18:39:44'),
(58, 'read_social_networks', 'social_networks', '2020-03-16 18:39:44', '2020-03-16 18:39:44'),
(59, 'edit_social_networks', 'social_networks', '2020-03-16 18:39:44', '2020-03-16 18:39:44'),
(60, 'add_social_networks', 'social_networks', '2020-03-16 18:39:44', '2020-03-16 18:39:44'),
(61, 'delete_social_networks', 'social_networks', '2020-03-16 18:39:44', '2020-03-16 18:39:44'),
(62, 'browse_galleries', 'galleries', '2020-03-19 19:29:22', '2020-03-19 19:29:22'),
(63, 'read_galleries', 'galleries', '2020-03-19 19:29:22', '2020-03-19 19:29:22'),
(64, 'edit_galleries', 'galleries', '2020-03-19 19:29:22', '2020-03-19 19:29:22'),
(65, 'add_galleries', 'galleries', '2020-03-19 19:29:22', '2020-03-19 19:29:22'),
(66, 'delete_galleries', 'galleries', '2020-03-19 19:29:23', '2020-03-19 19:29:23'),
(67, 'browse_gallery_images', 'gallery_images', '2020-03-19 19:34:03', '2020-03-19 19:34:03'),
(68, 'read_gallery_images', 'gallery_images', '2020-03-19 19:34:03', '2020-03-19 19:34:03'),
(69, 'edit_gallery_images', 'gallery_images', '2020-03-19 19:34:03', '2020-03-19 19:34:03'),
(70, 'add_gallery_images', 'gallery_images', '2020-03-19 19:34:03', '2020-03-19 19:34:03'),
(71, 'delete_gallery_images', 'gallery_images', '2020-03-19 19:34:03', '2020-03-19 19:34:03'),
(72, 'browse_charts', 'charts', '2020-06-21 15:05:03', '2020-06-21 15:05:03'),
(73, 'read_charts', 'charts', '2020-06-21 15:05:03', '2020-06-21 15:05:03'),
(74, 'edit_charts', 'charts', '2020-06-21 15:05:03', '2020-06-21 15:05:03'),
(75, 'add_charts', 'charts', '2020-06-21 15:05:03', '2020-06-21 15:05:03'),
(76, 'delete_charts', 'charts', '2020-06-21 15:05:03', '2020-06-21 15:05:03'),
(77, 'browse_chart_types', 'chart_types', '2020-06-21 18:10:06', '2020-06-21 18:10:06'),
(78, 'read_chart_types', 'chart_types', '2020-06-21 18:10:06', '2020-06-21 18:10:06'),
(79, 'edit_chart_types', 'chart_types', '2020-06-21 18:10:06', '2020-06-21 18:10:06'),
(80, 'add_chart_types', 'chart_types', '2020-06-21 18:10:06', '2020-06-21 18:10:06'),
(81, 'delete_chart_types', 'chart_types', '2020-06-21 18:10:06', '2020-06-21 18:10:06');

-- --------------------------------------------------------

--
-- Структура таблиці `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
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
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(5, 1, 1, 'КРЫМ-ФАРМИНГ - ОДНА ИЗ ЛУЧШИХ ФЕРМ РФ С ТОЧКИ ЗРЕНИЯ ЭКОНОМИКИ', '', '18 сентября на площадке ООО Крым-Фарминг в пгт Первомайское состоялся шоу-показ генетических достижений голштинской породы коров компании Alta Genetics.', '<p>С 17 по 20 сентября в Крыму состоялся второй шоу-показ генетических достижений Alta Showcase Crimea 2019. Мероприятие прошло на базе ООО &laquo;Крым-Фарминг&raquo;. Это не только самое крупное животноводческое хозяйство на Крымском полуострове, но и надежный партнер &laquo;Альта Дженентикс Раша&raquo; на протяжении 5 лет.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/posts/June2020/400x2600.20191010b1.jpg\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>Мероприятие посетили более 300 гостей со всей России &mdash; это в 2 раза больше, чем на первом шоу-показе в Воронеже, организованном &laquo;Альтой&raquo; в 2016 году.</p>\n<p>&nbsp;</p>\n<p>Программа мероприятий включала:</p>\n<p>&nbsp;</p>\n<ul>\n<li>Ознакомительную экскурсию по ЖК &laquo;Крым-Фарминг&raquo;;</li>\n<li>Шоу-показ племенных животных, оценку экстерьера;</li>\n<li>Семинар &laquo;Генетика и экономика получения стельности&raquo;;</li>\n<li>Праздничный гала-ужин и экскурсионную программу.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Открыл мероприятие министр сельского хозяйства Республики Крым &mdash; Рюмшин Андрей Васильевич. Он поблагодарил руководство &laquo;Альта Дженетикс Раша&raquo; за всестороннюю поддержку и оказание содействия в развитии племенного животноводства в Республике Крым.</p>\n<p>&nbsp;</p>\n<p>Экскурсия по ферме включала 6 остановок на важных технологических пунктах, где специалисты &laquo;Альты&raquo;, партнеры и представители ЖК &laquo;Крым-Фарминг&raquo; осветили актуальные вопросы, связанные с управлением и работой на ферме.</p>\n<p>&nbsp;</p>\n<p>Гостям мероприятия продемонстрировали более 50 голов первотелок с продуктивностью от 40 литров на голову в сутки. Животных для показа подготовили специалисты &laquo;Альта Дженетикс Раша&raquo;.</p>\n<p>[gallery code=\"alta-genetics\"]</p>\n<p>&nbsp;</p>\n<p>Второй день мероприятия был посвящен семинару &laquo;Генетика и экономика управления стельности&raquo;.</p>\n<p>&nbsp;</p>\n<p>Руководитель отдела продаж ПЦ &laquo;Север&raquo; Андрей Могутов рассказал об эффективном управлении воспроизводством. В своей презентации он наглядно показал, что делает ферму экономически успешной.</p>\n<p>&nbsp;</p>\n<p>Руководитель ПЦ &laquo;Юг&raquo; Андрей Степаненко выступил с докладом об использовании программ гормональной синхронизации на современных молочных комплексах.</p>\n<p>&nbsp;</p>\n<p>Также в семинаре приняли участие наши партнёры из лабораторного кластера АО &laquo;Агроплем&raquo;. Генеральный директор Кирилл Косодуров говорил о том, как получить коммерческий эффект от ежемесячного анализа молока. Заведующий лабораторией молекулярно-генетической экспертизы Илья Рукин подготовил доклад на тему &laquo;Повышение коммерческой эффективности стада за счет геномных технологий&raquo;.</p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\">&nbsp;</p>\n<p style=\"text-align: center;\"><iframe src=\"https://www.youtube.com/embed/_VfC9sEWlmI\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>', 'posts\\June2020\\NqOmsrsVlOwdD50RVEsF.jpg', 'krym-farming-odna-iz-luchshih-ferm-rf-s-tochki-zreniya-ekonomiki', '', '', 'PUBLISHED', 1, '2020-03-20 17:33:10', '2020-06-20 14:23:06'),
(7, 1, 3, 'Руслан Якубов посетил молочно-товарный комплекс ООО «Крым-Фарминг»', '', 'Руслан Якубов и генеральный директор АО «Партизан» Александр Калын посетили крупнейший в Крыму молочно-товарный комплекс ООО «Крым-Фарминг», расположенный в Первомайском районе.', '<p>По поручению главы администрации Симферопольского района Ирины Бойко ее заместитель Руслан Якубов и генеральный директор АО &laquo;Партизан&raquo; Александр Калын посетили крупнейший в Крыму молочно-товарный комплекс ООО &laquo;Крым-Фарминг&raquo;, расположенный в Первомайском районе.</p>\n<p>На территории предприятия гостей встретили глава администрации Первомайского района Елена Крестьянинова, её первый заместитель Айдер Типпа, начальник управления сельского хозяйства Владимир Миронюк и директор по производству ООО &laquo;Крым-Фарминг&raquo; Владимир Чубар.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/posts/June2020/766f67d578248638f7448d162557fec8.jpg\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>Как отметил Руслан Якубов, поездка была организована с целью обмена опытом работы и ознакомления с современными технологиями. В ходе посещения сельхозпредприятия участники побывали на всех производственных участках, ознакомились с условиями содержания, кормления и доения животных.</p>\n<p>&nbsp;</p>\n<p>&laquo;Нас интересовали все этапы производственного процесса &ndash; от выращивания и заготовки кормов до отгрузки охлажденного молока из емкостей-накопителей. Мы получили много новых и полезных знаний, которые, я уверен, можно успешно применить в работе производственных предприятиях Симферопольского района. Надеемся на дальнейшее тесное сотрудничество и взаимодействие в сельскохозяйственной отрасли!&raquo;, - сказал Руслан Якубов.</p>\n<p>&nbsp;</p>\n<p>Справка. ООО &laquo;Крым Фарминг&raquo; - первое в Республике Крым предприятие по производству молока в промышленных масштабах. Комплекс рассчитан на 3000 фуражных коров со шлейфом молодняка. Производство молока на комплексе в день планируется в районе 100 т.</p>\n<p>&nbsp;</p>\n<p>Площадь земельного участка комплекса составляет 34,815 га, площадь застройки 41569,95 м2</p>', 'posts\\June2020\\QqvxwC2R5kkUIEuhNvrK.JPG', 'ruslan-yakubov-posetil-molochno-tovarnyj-kompleks-ooo-krym-farming', '', '', 'PUBLISHED', 0, '2020-03-20 19:08:06', '2020-06-20 14:24:39'),
(8, 1, 3, 'Коровье племя: как голландские \"буренки\" обеспечивают пол-Крыма молоком', '', 'В Крыму успешно работает самое крупное в южном регионе России племенное хозяйство, в котором вот уже четвертый год выращивают голштинскую породу коров, привезенных из Нидерландов', '<p>В Крыму успешно работает самое крупное в южном регионе России племенное хозяйство, в котором вот уже четвертый год выращивают голштинскую породу коров, привезенных из Нидерландов. Голландские \"буренки\" &ndash; самые высокопроизводительные в молочном животноводстве, благодаря чему предприятие \"Крым-Фарминг\" в прошлом году произвело более 31 тысячи тонн молока.&nbsp; Корреспондент РИА Новости Крым побывал на ферме, где коровы живут на свежем воздухе, а рацион для них составляют при помощи специальной компьютерной программы.&nbsp;</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/posts/June2020/image_2020-06-20_20-38-51.png\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>Ферма, а это около 40 гектаров, на которых сейчас разместились более шести тысяч коров, находится в поселке Первомайское и обеспечивает треть поставок молока для нужд производителей полуострова. Так, согласно официальной статистике, в 2018 году в крымских сельскохозяйственных организациях было произведено 57 400 тонн молока, из них 31 400 тонн &mdash; именно тут. Таких результатов удалось достичь благодаря \"правильной\" породе коров.&nbsp; \"Это самая высокопродуктивная порода в мире, потому и было принято решение использовать в производстве именно голштинов. Изначально&nbsp; мы завезли в Крым около трех тысяч голов, а сейчас у нас уже порядка шести тысяч, половина &ndash; дойное стадо. Хозяйство сумело получить в 2018 году&nbsp; племенной статус и право выращивать племенных животных\", &mdash; рассказывает генеральный директор предприятия Владимир Казюк.&nbsp; Здесь впервые на полуострове применили технологию содержания животных под открытым небом: коровы постоянно на выгуле. Чтобы они могли спрятаться от дождя и палящего солнца, в загонах построены обширные навесы. В качестве подстилки &ndash;солома, которая ежедневно меняется.</p>\n<p>&nbsp;</p>\n<h3>Всегда на свежем воздухе</h3>\n<p>\"Мы применили абсолютно новую для Крыма технологию содержания, которая значительно эффективнее, чем традиционная. Она обеспечивает более высокие показатели здоровья животных. Нам была нужна площадка, которая подходила бы по климатическим показателям, и очень хорошо подошел северный Крым. Для коров этой породы особенно важно составлять сбалансированный рацион, поскольку животные высокопродуктивны только при условии хорошего питания. Для каждого возраста есть свое \"меню\". Мы составляем и корректируем его ежедневно, отправляем через интернет оператору специальной машины &mdash;&nbsp; \"миксера\"-кормораздатчика. А оператор на дисплее управления видит, какие корма и в каких объемах нужно загрузить и раздать каждой группе коров\", &mdash; поясняет Владимир Казюк, показывая просторные вольеры, в которых проживают \"буренки\".&nbsp; Такой метод содержания дает возможность обеспечить здоровье животным и высокое качество молока.</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/posts/June2020/image_2020-06-20_20-38-58.png\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>\"Открытый тип содержания, на наш взгляд, эффективнее и успешнее, чем традиционный. В северном Крыму есть такая возможность благодаря небольшому количеству осадков. Да, многие не верили, говорили, что зимой будет массовое вымирание. Но уже не первый год эта технология доказывает свою состоятельность. Главное для животных, чтобы было сухо. Излишняя влага вызывает дискомфорт. А морозы наши питомцы переносят нормально\", &mdash; поясняет Владимир Казюк.</p>\n<p>&nbsp;</p>\n<h3>Анализы и родословная</h3>\n<p>Молоко &ndash; не единственный вид деятельности предприятия &mdash; здесь можно приобрести и племенных животных. Это требование, которое выставляется государством к заводчикам, получившим статус \"племенного хозяйства\".&nbsp; \"Это статус предприятия, который позволяет нам продавать молодняк, в качестве племенного скота. Когда покупаешь коров с родословной, то при правильном уходе получаются стабильные показатели по производству молока. При продаже мы даем родословную до четвертого поколения, где указаны все показатели родителей, в том числе надой. Ежемесячно молоко каждой коровы исследуется в лаборатории для определения качественных показателей, выясняется его соответствие всем нормам и ГОСТам. Кроме того, чтобы доказать достоверность происхождения у мамы и дочки берется анализ крови и направляется на исследование. Покупатель получает не \"кота в мешке\", а животное, которое гарантировано будет высокопродуктивным\", &mdash; рассказывает директор по производству Владимир Чубар.&nbsp; По его словам, племенной статус требует и серьезных затрат.&nbsp; \"Ежемесячно мы расходуем более 100 тысяч рублей только на проведение анализов качества молока. Кроме того, мы ежегодно обновляем и омолаживаем дойное стадо. Не меньше 10% от поголовья должно реализовываться другим хозяйствам, и за это нам правительство РФ дает статус племенного завода\", &mdash; поясняет Владимир Чубар.</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/posts/June2020/image_2020-06-20_20-40-05.png\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>По его словам, несмотря на все сложности, этот статус очень важен не только для самого хозяйства, но и для экономики региона и страны в целом.&nbsp; \"Что такое племенной статус? Это вопрос продовольственной безопасности и импортозамещения. Раньше любой, кто хотел завести племенное животное, должен был купить корову в Дании, Голландии или Германии. Сейчас же у нас первый в Республике племенной завод по голштинской породе и поэтому молочное животноводство России сейчас может опираться на отечественных племенных животных\", &mdash; пояснил Владимир Чубар.&nbsp; Он также отметил, что фермерам, в основном, требуются именно коровы, а не быки, поэтому приходится регулировать рождаемость.&nbsp; \"Мы используем для этого сексированное семя канадской компании. Оно с 93% вероятностью гарантирует, что родится именно телочка, а не бычок\", &mdash; говорит Владимир Чубар.</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/posts/June2020/image_2020-06-20_20-39-29.png\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<h3>80 тонн молока в сутки</h3>\n<p>Каждая корова в сутки дает более 33 литров молока.&nbsp; \"Многое зависит от погоды, ведь у нас содержание открытого типа: чем больше влажность, тем меньше корова потребляет кормов, а значит &mdash; удой снижается. Наша самая продуктивная корова максимально давала в сутки 86 литров молока! А всего ежедневно мы производим около 80 тонн молока\", &mdash; рассказывает Владимир Казюк по пути к \"сердцу\" комплекса &mdash; доильно-молочному блоку.&nbsp; Человек практически не участвует в процессе: большинство работы выполняет техника.&nbsp; \"Дойка происходит бесконтактным методом &ndash; к вымени подключается оборудование, затем молоко по молокопроводу через специальные многоуровневые фильтры проходит в охладитель, а оттуда &ndash; в герметичные танки для хранения. При этом перед дойкой каждый сосок вымени моется, обрабатывается спецсредствами, чтобы ничего лишнего в молоко не попало\", &mdash; показывает Владимир Чубар на молокопроводы, уходящие&nbsp; к оборудованию.</p>\n<p><img src=\"http://crim/storage/posts/June2020/image_2020-06-20_20-39-54.png\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p><a href=\"https://crimea.ria.ru/authors/20190414/1116423889.html\">Ссилка на ресурс.</a></p>', 'posts\\June2020\\9gTV6dpHMqIfHBYeThlG.png', 'korov-e-plemya-kak-gollandskie-burenki-obespechivayut-pol-kryma-molokom', '', '', 'PUBLISHED', 0, '2020-06-20 14:48:06', '2020-06-20 14:48:06');

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-03-10 17:24:10', '2020-03-10 17:24:10'),
(2, 'user', 'Normal User', '2020-03-10 17:24:10', '2020-03-10 17:24:10');

-- --------------------------------------------------------

--
-- Структура таблиці `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Крым-фарминг', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 3, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\June2020\\vZ15w39j5YAocvEe0YS7.png', '', 'image', 4, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 8, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\June2020\\IvJ9MWfhhAzcG0tTSp8Z.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Crim-farming Admin', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Адміністративна панель Crim-farming. Created by Zirael', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\June2020\\qMFaAg0yxp1Sje2NNsZo.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'contacts.mobile-phone', 'Mobile phone', '+380989279554, +380989279554', NULL, 'text', 6, 'Contacts'),
(12, 'contacts.email', 'Email', 'doradaukraine@gmail.com', NULL, 'text', 7, 'Contacts'),
(13, 'site.title-en', 'Site Title EN', 'Crim-farming', NULL, 'text', 2, 'Site'),
(14, 'posts.title', 'Post title', 'Новости', NULL, 'text', 9, 'Posts'),
(16, 'posts.title-en', 'Post title EN', 'News', NULL, 'text', 10, 'Posts'),
(17, 'posts.show-more-title', 'Preview more button title', 'Посмотреть все новости', NULL, 'text', 11, 'Posts'),
(18, 'posts.show-more-title-en', 'Preview more button title EN', 'View all news', NULL, 'text', 12, 'Posts');

-- --------------------------------------------------------

--
-- Структура таблиці `social_networks`
--

CREATE TABLE `social_networks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `svg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `social_networks`
--

INSERT INTO `social_networks` (`id`, `name`, `svg`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Telegram', '[{\"download_link\":\"social-networks\\\\March2020\\\\569I8NbKLsscu7lReXxI.svg\",\"original_name\":\"telegram.svg\"}]', 'Telegram', '2020-03-19 19:40:48', '2020-03-19 19:40:48');

-- --------------------------------------------------------

--
-- Структура таблиці `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(31, 'data_rows', 'display_name', 108, 'en', 'Id', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(32, 'data_rows', 'display_name', 109, 'en', 'Назва', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(33, 'data_rows', 'display_name', 110, 'en', 'Slug', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(34, 'data_rows', 'display_name', 111, 'en', 'Type Id', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(35, 'data_rows', 'display_name', 112, 'en', 'Заголовок', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(36, 'data_rows', 'display_name', 113, 'en', 'Підзаголовок', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(37, 'data_rows', 'display_name', 114, 'en', 'Текст', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(38, 'data_rows', 'display_name', 115, 'en', 'Заголовок кнопки', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(39, 'data_rows', 'display_name', 116, 'en', 'Посилання кнопки', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(40, 'data_rows', 'display_name', 117, 'en', 'Картинка', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(41, 'data_rows', 'display_name', 118, 'en', 'Created At', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(42, 'data_rows', 'display_name', 119, 'en', 'Updated At', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(43, 'data_rows', 'display_name', 120, 'en', 'infoblock_types', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(44, 'data_types', 'display_name_singular', 11, 'en', 'Інфоблок', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(45, 'data_types', 'display_name_plural', 11, 'en', 'Інфоблоки', '2020-03-15 19:07:45', '2020-03-15 19:07:45'),
(46, 'data_rows', 'display_name', 121, 'en', 'infoblock_items', '2020-03-15 19:10:15', '2020-03-15 19:10:15'),
(47, 'data_rows', 'display_name', 122, 'en', 'Id', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(48, 'data_rows', 'display_name', 123, 'en', 'Infoblock Id', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(49, 'data_rows', 'display_name', 124, 'en', 'Parent Id', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(50, 'data_rows', 'display_name', 125, 'en', 'Заголовок', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(51, 'data_rows', 'display_name', 126, 'en', 'Підзаголовок', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(52, 'data_rows', 'display_name', 127, 'en', 'Картинка', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(53, 'data_rows', 'display_name', 128, 'en', 'Заголовок кнопки', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(54, 'data_rows', 'display_name', 129, 'en', 'Посилання кнопки', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(55, 'data_rows', 'display_name', 130, 'en', 'Інформація', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(56, 'data_rows', 'display_name', 131, 'en', 'Порядковий номер', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(57, 'data_rows', 'display_name', 132, 'en', 'Created At', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(58, 'data_rows', 'display_name', 133, 'en', 'Updated At', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(59, 'data_rows', 'display_name', 134, 'en', 'infoblocks', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(60, 'data_rows', 'display_name', 135, 'en', 'infoblock_items', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(61, 'data_types', 'display_name_singular', 12, 'en', 'Елемент інфоблоку', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(62, 'data_types', 'display_name_plural', 12, 'en', 'Елементи інфоблоків', '2020-03-15 19:18:18', '2020-03-15 19:18:18'),
(63, 'data_rows', 'display_name', 100, 'en', 'Id', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(64, 'data_rows', 'display_name', 101, 'en', 'Назва', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(65, 'data_rows', 'display_name', 102, 'en', 'Шлях до файлу', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(66, 'data_rows', 'display_name', 103, 'en', 'Public', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(67, 'data_rows', 'display_name', 104, 'en', 'With Items', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(68, 'data_rows', 'display_name', 105, 'en', 'With Item Parent', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(69, 'data_rows', 'display_name', 106, 'en', 'Created At', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(70, 'data_rows', 'display_name', 107, 'en', 'Updated At', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(71, 'data_types', 'display_name_singular', 10, 'en', 'Тип інфоблоків', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(72, 'data_types', 'display_name_plural', 10, 'en', 'Типи інфоблоків', '2020-03-15 19:25:52', '2020-03-15 19:25:52'),
(73, 'menu_items', 'title', 19, 'en', 'Infoblock types', '2020-03-15 19:28:44', '2020-06-21 14:56:36'),
(74, 'menu_items', 'title', 20, 'en', 'Infoblocks', '2020-03-15 19:28:54', '2020-06-21 14:54:37'),
(76, 'menu_items', 'title', 1, 'en', 'Dashboard', '2020-03-15 19:29:38', '2020-03-15 19:29:38'),
(77, 'menu_items', 'title', 4, 'en', 'Roles', '2020-03-15 19:29:50', '2020-03-15 19:29:50'),
(78, 'menu_items', 'title', 5, 'en', 'Tools', '2020-03-15 19:30:05', '2020-03-15 19:30:05'),
(79, 'menu_items', 'title', 6, 'en', 'Menu Builder', '2020-03-15 19:30:14', '2020-03-15 19:30:14'),
(80, 'menu_items', 'title', 7, 'en', 'Database', '2020-03-15 19:30:26', '2020-03-15 19:30:26'),
(81, 'menu_items', 'title', 10, 'en', 'Settings', '2020-03-15 19:30:37', '2020-03-15 19:30:37'),
(82, 'menu_items', 'title', 12, 'en', 'Categories', '2020-03-15 19:30:49', '2020-03-15 19:30:49'),
(83, 'menu_items', 'title', 13, 'en', 'Posts', '2020-03-15 19:40:16', '2020-03-15 19:40:16'),
(84, 'menu_items', 'title', 23, 'en', 'Posts', '2020-03-15 19:40:49', '2020-03-15 19:40:49'),
(85, 'menu_items', 'title', 14, 'en', 'Pages', '2020-03-15 19:41:23', '2020-03-15 19:41:23'),
(86, 'menu_items', 'title', 3, 'en', 'Users', '2020-03-16 18:01:27', '2020-03-16 18:01:27'),
(87, 'menu_items', 'title', 24, 'en', 'Users', '2020-03-16 18:01:52', '2020-03-16 18:01:52'),
(88, 'menu_items', 'title', 2, 'en', 'Media', '2020-03-16 18:02:14', '2020-03-16 18:02:14'),
(89, 'menu_items', 'title', 36, 'en', 'Demonstrations', '2020-03-16 19:05:14', '2020-03-16 19:15:47'),
(90, 'menu_items', 'title', 35, 'en', 'Education', '2020-03-16 19:05:29', '2020-03-16 19:05:29'),
(91, 'menu_items', 'title', 34, 'en', 'Consulting', '2020-03-16 19:15:32', '2020-03-16 19:15:32'),
(95, 'data_rows', 'display_name', 142, 'en', 'Id', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(96, 'data_rows', 'display_name', 143, 'en', 'Назва', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(97, 'data_rows', 'display_name', 144, 'en', 'Slug', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(98, 'data_rows', 'display_name', 145, 'en', 'Заголовок', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(99, 'data_rows', 'display_name', 146, 'en', 'Підзаголовок', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(100, 'data_rows', 'display_name', 147, 'en', 'Created At', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(101, 'data_rows', 'display_name', 148, 'en', 'Updated At', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(102, 'data_rows', 'display_name', 149, 'en', 'gallery_images', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(103, 'data_types', 'display_name_singular', 14, 'en', 'Галерея', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(104, 'data_types', 'display_name_plural', 14, 'en', 'Галереї', '2020-03-19 19:31:20', '2020-03-19 19:31:20'),
(105, 'data_rows', 'display_name', 150, 'en', 'Id', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(106, 'data_rows', 'display_name', 151, 'en', 'Gallery Id', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(107, 'data_rows', 'display_name', 152, 'en', 'Фото', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(108, 'data_rows', 'display_name', 153, 'en', 'Заголовок', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(109, 'data_rows', 'display_name', 154, 'en', 'Порядковий номер', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(110, 'data_rows', 'display_name', 155, 'en', 'Created At', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(111, 'data_rows', 'display_name', 156, 'en', 'Updated At', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(112, 'data_rows', 'display_name', 157, 'en', 'galleries', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(113, 'data_types', 'display_name_singular', 15, 'en', 'Фото галереї', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(114, 'data_types', 'display_name_plural', 15, 'en', 'Фото галереї', '2020-03-19 19:36:07', '2020-03-19 19:36:07'),
(116, 'menu_items', 'title', 32, 'en', 'Doradnitstvo', '2020-03-19 19:45:58', '2020-03-19 19:45:58'),
(121, 'menu_items', 'title', 30, 'en', 'Our activity', '2020-03-19 19:49:35', '2020-03-19 19:49:35'),
(122, 'menu_items', 'title', 31, 'en', 'Services in the regions', '2020-03-19 19:50:29', '2020-03-19 19:50:29'),
(123, 'posts', 'title', 5, 'en', 'THE LAND MARKET WHAT IT WILL BE', '2020-03-20 17:33:10', '2020-03-20 17:33:10'),
(124, 'posts', 'body', 5, 'en', '<p><span style=\"color: rgba(0, 4, 57, 0.749019607843137); font-family: -apple-system, LandRoverWeb, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 12.8062px;\">The presented model of market equilibrium in the potential land market corresponds to the case when only active agricultural entities are allowed to participate and the right to sell is granted without restriction to all unit owners</span></span></p>', '2020-03-20 17:33:10', '2020-03-20 17:33:10'),
(125, 'posts', 'slug', 5, 'en', 'the-land-market-what-it-will-be', '2020-03-20 17:33:10', '2020-03-20 17:33:10'),
(130, 'posts', 'excerpt', 5, 'en', 'The presented model of market equilibrium in the potential land market corresponds to the case when only active agricultural entities are allowed to participate and the right to sell is granted without restriction to all unit owners', '2020-03-20 17:35:21', '2020-03-20 17:35:21'),
(131, 'posts', 'title', 7, 'en', 'Ministry of Economy Supports Pesticides and Agrochemicals Legislation Upgrades', '2020-03-20 19:08:06', '2020-03-20 19:08:06'),
(132, 'posts', 'excerpt', 7, 'en', 'Adoption of the draft law will provide for a more modern and appropriate regulation of relations in the field of pesticide and agrochemical management.', '2020-03-20 19:08:06', '2020-03-20 19:08:06'),
(133, 'posts', 'body', 7, 'en', '<p>The basic draft law proposed to create more modern and inappropriate regulation of relations in the production of pesticides and agrochemicals.</p>\n<p>&nbsp;</p>\n<p>For almost 25 years, legislation on pesticides and agrochemicals has not been substantially reviewed in Ukraine. A number of fragmentary and haphazard changes have been made to the document during this time. Draft Law 2548 \"We propose to amend to some laws of Ukraine that deal with the regulation of a kind, which is carried out with the help of pesticides and agrochemicals\", which are being considered.</p>\n<p>&nbsp;</p>\n<p>More than two dozen experts from MEDT, State Consumer Service, EVA, ACC, EU SAFPI project, Association \"Ukrainian Agrarian Business Club\", VAR, Phytosanitary Organization of Ukraine, representatives of the Institute of Ecological Hygiene and Toxicology named after them were discussed in the development of the documents. LI Bear of the Ministry of Health of Ukraine, as well as MPs of the Agrarian Committee of the Verkhovna Rada.</p>\n<p>&nbsp;</p>\n<table style=\"border-collapse: collapse; width: 609px; height: 52px;\" border=\"1\">\n<tbody>\n<tr style=\"height: 13px;\">\n<td style=\"width: 118px; height: 13px;\">1</td>\n<td style=\"width: 119px; height: 13px;\">2</td>\n<td style=\"width: 119px; height: 13px;\">3</td>\n<td style=\"width: 119px; height: 13px;\">4</td>\n<td style=\"width: 118px; height: 13px;\">5</td>\n</tr>\n<tr style=\"height: 13px;\">\n<td style=\"width: 118px; height: 13px;\">ЦАцба</td>\n<td style=\"width: 119px; height: 13px;\">уйца</td>\n<td style=\"width: 119px; height: 13px;\">йац</td>\n<td style=\"width: 119px; height: 13px;\">йауцка</td>\n<td style=\"width: 118px; height: 13px;\">Владік</td>\n</tr>\n<tr style=\"height: 13px;\">\n<td style=\"width: 118px; height: 13px;\">Люда</td>\n<td style=\"width: 119px; height: 13px;\">любить</td>\n<td style=\"width: 119px; height: 13px;\">Владіка</td>\n<td style=\"width: 119px; height: 13px;\">дуже</td>\n<td style=\"width: 118px; height: 13px;\">сильно</td>\n</tr>\n<tr style=\"height: 13px;\">\n<td style=\"width: 118px; height: 13px;\">Владік</td>\n<td style=\"width: 119px; height: 13px;\">любить</td>\n<td style=\"width: 119px; height: 13px;\">Люду</td>\n<td style=\"width: 119px; height: 13px;\">ще</td>\n<td style=\"width: 118px; height: 13px;\">сильніше</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p>he changes will primarily relate to adaptation to EU legislation, deregulation for business and CEB, and counterfeiting. Thus, the document prohibits the transport to the territory of Ukraine of plant protection products by individuals, the requirements for marking and packaging have been strengthened. In addition, a State Register of Pesticides and Agrochemicals Permitted for Use in Ukraine is being established, which will operate on a free and open access basis. Thus, the paper list \"Pesticides and Agrochemicals Allowed for Use in Ukraine\" will become an electronic public register with open access on the Ministry of Energy and Energy. Also, information on the state test plan will be available on the site.</p>\n<p>&nbsp;</p>\n<ol>\n<li>One</li>\n<li>Two</li>\n<li>Thus, the document prohibits the transport to the territory of Ukraine of plant protection products by individuals, the requirements for marking and packaging have been strengthened.</li>\n<li>Also, information on the state test plan will be available on the site.</li>\n</ol>', '2020-03-20 19:08:06', '2020-03-22 12:56:37'),
(134, 'posts', 'slug', 7, 'en', 'ministry-of-economy-supports-pesticides-and-agrochemicals-legislation-upgrades', '2020-03-20 19:08:06', '2020-03-20 19:08:06'),
(135, 'infoblocks', 'title', 1, 'en', 'About the Association', '2020-03-21 09:09:54', '2020-03-21 09:09:54'),
(136, 'infoblocks', 'body', 1, 'en', '<p>The purpose of the Association\'s activities is to promote the improvement of the well-being of the rural population and the development of the countryside by raising the level of knowledge and improving the practical skills of the rural population and agricultural producers, satisfying and protecting the social, economic, professional and other common interests of the Association\'s members.</p>', '2020-03-21 09:09:54', '2020-03-21 09:09:54'),
(137, 'infoblocks', 'button_title', 1, 'en', 'Read more', '2020-03-21 09:09:54', '2020-03-21 09:09:54'),
(138, 'infoblock_items', 'title', 1, 'en', 'Agricultural advisory services', '2020-03-21 09:59:47', '2020-03-21 09:59:47'),
(139, 'infoblock_items', 'body', 1, 'en', 'Advisory activities as a factor in information and advisory support for rural development', '2020-03-21 09:59:47', '2020-03-21 09:59:47'),
(140, 'infoblock_items', 'title', 2, 'en', 'The consultancy will help the development of small farming in Ukraine', '2020-03-21 10:02:40', '2020-03-21 10:02:40'),
(141, 'infoblock_items', 'body', 2, 'en', 'FAO implements project in Ukraine to support transition to more efficient agricultural advisory service', '2020-03-21 10:03:26', '2020-03-21 10:03:26'),
(142, 'infoblock_items', 'title', 3, 'en', 'Support advisory services', '2020-03-21 10:19:33', '2020-03-21 10:19:33'),
(143, 'infoblock_items', 'body', 3, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur et eveniet iste minima quasi quidem tenetur! Ad impedit neque nobis porro.', '2020-03-21 10:20:53', '2020-03-21 10:20:53'),
(144, 'infoblock_items', 'title', 4, 'en', 'User education and training', '2020-03-21 10:21:31', '2020-03-21 10:21:31'),
(145, 'infoblock_items', 'button_title', 4, 'en', 'Open', '2020-03-21 10:22:16', '2020-03-21 15:59:10'),
(146, 'infoblock_items', 'body', 4, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur et eveniet iste minima quasi quidem tenetur! Ad impedit neque nobis porro.', '2020-03-21 10:22:16', '2020-03-21 10:22:16'),
(147, 'infoblock_items', 'button_title', 3, 'en', 'Open', '2020-03-21 10:22:38', '2020-03-21 15:59:23'),
(148, 'infoblock_items', 'title', 5, 'en', 'Electronic advisory', '2020-03-21 10:23:11', '2020-03-21 10:23:11'),
(149, 'infoblock_items', 'button_title', 5, 'en', 'Open', '2020-03-21 10:25:31', '2020-03-21 15:58:57'),
(150, 'infoblock_items', 'body', 5, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur et eveniet iste minima quasi quidem tenetur! Ad impedit neque nobis porro.', '2020-03-21 10:25:31', '2020-03-21 10:25:31'),
(151, 'infoblocks', 'title', 4, 'en', 'Useful links', '2020-03-21 10:56:55', '2020-03-21 10:56:55'),
(152, 'infoblock_items', 'title', 6, 'en', 'FAQ', '2020-03-21 10:57:22', '2020-03-21 10:57:22'),
(153, 'infoblock_items', 'body', 6, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi corporis deserunt dicta doloremque earum', '2020-03-21 10:58:23', '2020-03-21 10:58:23'),
(154, 'infoblock_items', 'title', 7, 'en', 'FAQ 2', '2020-03-21 10:58:38', '2020-03-21 10:58:38'),
(155, 'infoblock_items', 'body', 7, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi corporis deserunt dicta doloremque earum', '2020-03-21 10:58:56', '2020-03-21 10:58:56'),
(156, 'infoblocks', 'title', 5, 'en', 'Our partners', '2020-03-21 11:10:09', '2020-03-21 11:10:09'),
(157, 'infoblock_items', 'title', 8, 'en', 'ННЦ \"Інститут аграрної економіки\"', '2020-03-21 11:14:46', '2020-03-21 11:14:46'),
(159, 'menu_items', 'title', 40, 'en', 'Services', '2020-03-21 14:02:23', '2020-03-21 14:02:23'),
(160, 'menu_items', 'title', 41, 'en', 'Consulting', '2020-03-21 14:02:46', '2020-03-21 14:02:46'),
(161, 'menu_items', 'title', 42, 'en', 'Education', '2020-03-21 14:03:01', '2020-03-21 14:03:01'),
(162, 'menu_items', 'title', 43, 'en', 'Demonstrations', '2020-03-21 14:03:21', '2020-03-21 14:03:21'),
(163, 'menu_items', 'title', 44, 'en', 'About association', '2020-03-21 14:04:11', '2020-03-21 14:04:11'),
(164, 'menu_items', 'title', 45, 'en', 'General information', '2020-03-21 14:06:29', '2020-03-21 14:06:29'),
(165, 'menu_items', 'title', 46, 'en', 'Our team', '2020-03-21 14:06:47', '2020-03-21 14:06:47'),
(166, 'menu_items', 'title', 47, 'en', 'Registration documents', '2020-03-21 14:07:00', '2020-03-21 14:07:00'),
(167, 'menu_items', 'title', 48, 'en', 'Our activity', '2020-03-21 14:07:18', '2020-03-21 14:07:18'),
(168, 'menu_items', 'title', 49, 'en', 'Doradnitstvo', '2020-03-21 14:07:54', '2020-03-21 14:07:54'),
(169, 'menu_items', 'title', 50, 'en', 'Services', '2020-03-21 14:36:53', '2020-03-21 14:36:53'),
(170, 'menu_items', 'title', 51, 'en', 'Moodle', '2020-03-21 14:38:09', '2020-03-21 14:38:09'),
(171, 'menu_items', 'title', 52, 'en', 'News', '2020-03-21 16:18:38', '2020-03-21 16:18:38'),
(172, 'data_rows', 'display_name', 22, 'en', 'ID', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(173, 'data_rows', 'display_name', 23, 'en', 'Parent', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(174, 'data_rows', 'display_name', 24, 'en', 'Order', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(175, 'data_rows', 'display_name', 25, 'en', 'Name', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(176, 'data_rows', 'display_name', 26, 'en', 'Slug', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(177, 'data_rows', 'display_name', 27, 'en', 'Created At', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(178, 'data_rows', 'display_name', 28, 'en', 'Updated At', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(179, 'data_types', 'display_name_singular', 4, 'en', 'Category', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(180, 'data_types', 'display_name_plural', 4, 'en', 'Categories', '2020-03-22 12:22:15', '2020-03-22 12:22:15'),
(182, 'categories', 'name', 3, 'en', 'Dorad', '2020-03-22 12:23:57', '2020-03-22 12:23:57'),
(183, 'infoblock_items', 'button_title', 1, 'en', 'Детальніше', '2020-06-20 09:36:18', '2020-06-20 09:36:18'),
(184, 'gallery_images', 'caption', 1, 'en', '1', '2020-06-20 14:11:41', '2020-06-20 14:11:41'),
(185, 'gallery_images', 'caption', 2, 'en', '2', '2020-06-20 14:12:01', '2020-06-20 14:12:01'),
(186, 'gallery_images', 'caption', 3, 'en', '3', '2020-06-20 14:12:18', '2020-06-20 14:12:18'),
(187, 'gallery_images', 'caption', 4, 'en', '4', '2020-06-20 14:16:01', '2020-06-20 14:16:01'),
(188, 'infoblocks', 'title', 7, 'en', 'О нас', '2020-06-20 14:58:28', '2020-06-20 14:58:28'),
(189, 'infoblocks', 'body', 7, 'en', '<p>Крым-Фарминг - это молочная ферма нового поколения. На ферме содержатся около 5000 коров отборной Голштинско Фризской породы, завезенной из Нидерландов. Предприятие укомплектовано самым современным оборудованием от ведущего мирового производителя - фирмы ДеЛаваль.</p>', '2020-06-20 14:58:28', '2020-06-20 14:58:28'),
(190, 'infoblock_items', 'title', 10, 'en', 'Долина легенд', '2020-06-20 15:03:23', '2020-06-20 15:03:23'),
(191, 'infoblock_items', 'title', 11, 'en', 'Новатор', '2020-06-20 15:05:37', '2020-06-20 15:05:37'),
(192, 'infoblock_items', 'title', 12, 'en', 'Долина легенд', '2020-06-20 15:06:47', '2020-06-20 15:06:47'),
(193, 'pages', 'title', 2, 'en', 'О нас', '2020-06-20 15:26:12', '2020-06-20 15:26:12'),
(194, 'pages', 'body', 2, 'en', '<p>La la</p>', '2020-06-20 15:26:12', '2020-06-20 15:26:12'),
(195, 'pages', 'slug', 2, 'en', 'o-nas', '2020-06-20 15:26:12', '2020-06-20 15:26:12'),
(196, 'gallery_images', 'caption', 5, 'en', '1', '2020-06-20 15:27:41', '2020-06-20 15:27:41'),
(197, 'gallery_images', 'caption', 6, 'en', '2', '2020-06-20 15:28:14', '2020-06-20 15:28:14'),
(198, 'gallery_images', 'caption', 7, 'en', '3', '2020-06-20 15:28:47', '2020-06-20 15:28:47'),
(199, 'gallery_images', 'caption', 8, 'en', '4', '2020-06-20 15:29:15', '2020-06-20 15:29:15'),
(200, 'infoblock_items', 'title', 13, 'en', '3D-ТУР ПО ТЕРИТОРИИ', '2020-06-20 15:38:17', '2020-06-20 15:38:17'),
(201, 'infoblock_items', 'sub_title', 13, 'en', 'Посетите нашу ферму онлайн!', '2020-06-20 15:39:07', '2020-06-20 15:39:07'),
(202, 'infoblock_items', 'button_title', 13, 'en', 'Открыть тур', '2020-06-20 15:39:07', '2020-06-20 15:39:07'),
(203, 'pages', 'title', 3, 'en', 'Технологии', '2020-06-20 16:27:26', '2020-06-20 16:27:26'),
(204, 'pages', 'slug', 3, 'en', 'tehnologii', '2020-06-20 16:27:26', '2020-06-20 16:27:26'),
(205, 'infoblock_items', 'title', 14, 'en', 'Заготовка кормов', '2020-06-20 16:28:44', '2020-06-20 16:28:44'),
(206, 'infoblock_items', 'title', 15, 'en', 'Основное стадо', '2020-06-20 16:31:07', '2020-06-20 16:31:07'),
(207, 'infoblock_items', 'title', 16, 'en', 'Доение коров', '2020-06-20 16:32:45', '2020-06-20 16:32:45'),
(208, 'infoblock_items', 'title', 17, 'en', 'Выращивание стада', '2020-06-20 16:33:29', '2020-06-20 16:33:29'),
(209, 'infoblock_items', 'body', 14, 'en', 'Одним из ключевых факторов успешного молочного животноводства является выращивание и заготовление кормов для кормления скота', '2020-06-20 16:51:53', '2020-06-20 16:51:53'),
(210, 'infoblock_items', 'body', 15, 'en', 'Комплекс ООО «Крым-Фарминг» использует систему Драйлот — содержание коров круглый год под открытым небом на выгульно-кормовых площадках ', '2020-06-20 16:51:59', '2020-06-20 16:51:59'),
(211, 'infoblock_items', 'body', 16, 'en', 'Доение коров в доильном зале «Чемпион» на 100 мест, укомплектованном оборудованием компании «DeLaval».', '2020-06-20 16:52:06', '2020-06-20 16:52:06'),
(212, 'infoblock_items', 'body', 17, 'en', 'Одним из ключевых факторов успешного молочного производства является выращивание ремонтного поголовья', '2020-06-20 16:52:12', '2020-06-20 16:52:12'),
(213, 'menu_items', 'title', 54, 'en', 'Галерея', '2020-06-20 17:09:04', '2020-06-20 17:09:04'),
(214, 'infoblock_items', 'button_title', 14, 'en', 'Узнать больше', '2020-06-20 17:59:46', '2020-06-20 17:59:46'),
(215, 'pages', 'title', 5, 'en', 'Заготовка кормов', '2020-06-20 18:02:54', '2020-06-20 18:02:54'),
(216, 'pages', 'body', 5, 'en', '<p>Одним из ключевых факторов успешного молочного животноводства является выращивание и заготовка основных кормом. Общая площадь сельскохозяйственных угодий для выращивания кормов составляет 4 300 га.</p>\n<p>&nbsp;</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://crim/storage/pages/June2020/DJI_0173.jpg\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '2020-06-20 18:02:54', '2020-06-20 18:02:54'),
(217, 'pages', 'slug', 5, 'en', 'zagotovka-kormov', '2020-06-20 18:02:54', '2020-06-20 18:02:54'),
(218, 'gallery_images', 'caption', 9, 'en', '1', '2020-06-20 18:03:41', '2020-06-20 18:03:41'),
(219, 'gallery_images', 'caption', 10, 'en', '2', '2020-06-20 18:03:58', '2020-06-20 18:03:58'),
(220, 'gallery_images', 'caption', 11, 'en', '3', '2020-06-20 18:04:14', '2020-06-20 18:04:14'),
(221, 'gallery_images', 'caption', 12, 'en', '4', '2020-06-20 18:04:30', '2020-06-20 18:04:30'),
(222, 'infoblock_items', 'button_title', 15, 'en', 'Узнать больше', '2020-06-20 18:09:43', '2020-06-20 18:09:43'),
(223, 'pages', 'title', 8, 'en', 'Основное стадо', '2020-06-20 18:18:01', '2020-06-20 18:18:01'),
(224, 'pages', 'slug', 8, 'en', 'osnovnoe-stado', '2020-06-20 18:18:01', '2020-06-20 18:18:01'),
(225, 'gallery_images', 'caption', 13, 'en', '1', '2020-06-20 18:18:46', '2020-06-20 18:18:46'),
(226, 'gallery_images', 'caption', 14, 'en', '2', '2020-06-20 18:19:04', '2020-06-20 18:19:04'),
(227, 'gallery_images', 'caption', 15, 'en', '3', '2020-06-20 18:19:21', '2020-06-20 18:19:21'),
(228, 'gallery_images', 'caption', 16, 'en', '4', '2020-06-20 18:20:27', '2020-06-20 18:20:27'),
(229, 'gallery_images', 'caption', 17, 'en', '5', '2020-06-20 18:21:29', '2020-06-20 18:21:29'),
(230, 'pages', 'body', 8, 'en', '<p>Комплекс ООО &laquo;Крым-Фарминг&raquo; построен по принципу минимум капиталовложений а учитывая природно-климатическую зону севера Крыма идеально подходит система Драйлот &mdash; содержание коров круглый год под открытым небом на выгульно-кормовых площадках с расчетом 60 м2/голову уплотненной почвы.</p>\n<p>&nbsp;</p>\n<p>&nbsp;Животные содержатся крупногрупповыми методом по 350 голов в группе. Для содержания коров основного стада на комплексе 7 больших групп где размещаются животные согласно физиологическому состоянию.</p>\n<p>&nbsp;</p>\n<p>Группы формируются по дням доения и стельности. Каждая группа имеет навес с площадью 4 м2/голову где коровы могут зимой спрятаться от снега а летом от дождя и солнца. Под навесами в мокрую погоду и зимой ежедневно проводится подстилка из соломы. Навоз ежедневно чистится и вывозится на навозохранилище.</p>\n<p>&nbsp;</p>\n<p><img src=\"http://crim/storage/pages/June2020/DJI_0165.JPG\" alt=\"\" /></p>\n<p>&nbsp;</p>\n<p>Каждый выгул оснащен кормовым столом и навозным проходом с бетонным покрытием. Процессы кормление, навозоудаление и зооветеринарные манипуляции проводятся синхронизировано с доением. Ежедневно в мокрую пору года навоз из навозных проходах чистится специальной машиной Свипер и вносит жидкую фракцию навоза в поле или сливает в лагуну если в поле нельзя проехать.</p>\n<p>Фронт кормления составляет 60 см. Все кормовые столы оснащенные 100% фиксаторами для головы. Над хедлоками установлена линия орошения что в жаркое время позволяет немного снизить тепловой стресс.</p>\n<p>&nbsp;</p>\n<p>На комплексе всего два капитальных строения &mdash; это доильно-молочный блок и госпиталь. В доильно-молочном блоке размещен доильный зал, доильное,&nbsp; вспомогательное оборудование, емкости для хранения молока 3х50м3 и административный комплекс.&nbsp; Госпиталь рассчитан на 200 гол. В нем размещены животные перед отелом (поздний сухостой) раздельно нетеля и коровы, коровы на лечении и профразчистке копыт, новотельные под наблюдением и животные на лечении. В этих группах коровы содержатся на глубокой подстилке. Технология Драйлот &mdash; это дешевый вариант содержания для сухой климатической зоны но подразумевает ежегодное обслуживание выгулов (подвоз глины и выравнивания поверхностей. В выгулах ежедневно проводится планирования прицепным и навесным выравнивателем. В сутки комплекс производит 80 тонн молока и 800 тонн навоза жидкой и твердой фракции. В доильном зале предусмотрен гидросмыв. Вся вода поступает в приемную емкость и циркулирует по кругу для очистки накопителя. Если уровень воды превышает определенный уровень, жидкая фракция навоза откачуется в лагуну. Возле лагуны установлен сепаратор который разделяет навоз на жидкую и твердую фракцию. Твердая фракция вывозится на навозохранилище, жидкая используется для орошения ближайших угодий.</p>', '2020-06-20 18:22:14', '2020-06-20 18:22:14'),
(231, 'infoblock_items', 'button_title', 16, 'en', 'Узнать больше', '2020-06-20 18:24:47', '2020-06-20 18:24:47'),
(232, 'infoblock_items', 'title', 18, 'en', 'Техника', '2020-06-20 18:27:49', '2020-06-20 18:27:49'),
(233, 'infoblock_items', 'button_title', 17, 'en', 'Узнать больше', '2020-06-20 18:30:10', '2020-06-20 18:30:10'),
(234, 'pages', 'title', 9, 'en', 'Доение коров', '2020-06-20 18:31:36', '2020-06-20 18:31:36'),
(235, 'pages', 'slug', 9, 'en', 'doenie-korov', '2020-06-20 18:31:36', '2020-06-20 18:31:36'),
(236, 'gallery_images', 'caption', 18, 'en', '1', '2020-06-20 18:33:43', '2020-06-20 18:33:43'),
(237, 'gallery_images', 'caption', 19, 'en', '2', '2020-06-20 18:33:56', '2020-06-20 18:33:56'),
(238, 'gallery_images', 'caption', 20, 'en', '3', '2020-06-20 18:34:13', '2020-06-20 18:34:13'),
(239, 'gallery_images', 'caption', 21, 'en', '4', '2020-06-20 18:34:28', '2020-06-20 18:34:28'),
(240, 'pages', 'body', 9, 'en', '<p>Доение&nbsp; коров трехразовое, в доильном зале &laquo;Чемпион&raquo; на 100 мест, укомплектованном оборудованием компании &laquo;DeLaval&raquo;. В правом ухе каждой коровы установлен HDX транспондер, который идентифицируют каждую корову при в ходе животного в доильный зал. После постановки коровы в место согласно протоколу доения животные обрабатываются 1% раствором перекиси водорода. После каждое животное вытирается салфеткой с правилом одна салфетка &mdash; одна корова. Следующая операция здаевание первых струй молока, после чего идет подключение доильного аппарата. После выдаевания, когда поток молока снижается ниже 0,4 л/мин аппарат автоматически снимается с коровы и вся информация (удой, скорость молокоотдачи, электропроводность) автоматически вносится в базу данных компьютера, а затем анализируется специалистами хозяйства. Молоко не имея прямого контакта с внешней средой через систему трубопровода откачивается проходя через систему фильтрации с мгновенным охлаждение до 3&ordm;С в вертикальные емкости хранения по 50 м3.</p>', '2020-06-20 18:34:58', '2020-06-20 18:34:58'),
(241, 'gallery_images', 'caption', 22, 'en', '1', '2020-06-20 18:40:02', '2020-06-20 18:40:02'),
(242, 'pages', 'title', 11, 'en', 'Выращивание стада', '2020-06-20 18:43:16', '2020-06-20 18:43:16'),
(243, 'pages', 'slug', 11, 'en', 'vyrashivanie-stada', '2020-06-20 18:43:16', '2020-06-20 18:43:16'),
(244, 'pages', 'body', 11, 'en', '<p>Одним из ключевых факторов успешного молочного производства является выращивание ремонтного молодняка. Чем больше в стадо вводится качественного пополнения тем больше можно выбраковать низкопродуктивных коров и соответственно получить больше молока.</p>\n<p>&nbsp;</p>\n<p>Выращивания телок телок делится на несколько этапов:</p>\n<p>&nbsp;</p>\n<h3>Телки 0-2 мес.</h3>\n<p>Это самый важный период в развитии телки, так как формируется будущий организм и закладывается будущая продуктивность. Животные данной технологической группы содержаться в индивидуальных деревянных домиках под постоянным присмотром. Сразу после рождения в первые полчаса зондом вливается 2,0 литра и повторно через 6 часов также 2,0 литра молозива. Перед выпойкой молозиво проверяется на количество иммуноглобулинов. Если молозиво не соответствует требованием, берется уже проверенное замороженное молозиво с банка и размораживается.</p>\n<p>&nbsp;</p>\n<p><img style=\"float: right;\" src=\"http://crim/storage/pages/June2020/IMG_11852.JPG\" alt=\"\" width=\"733\" height=\"549\" /></p>\n<p>Помищаеться теленок в групповой домик для обсушки и наблюдения. Два раза в сутки телят вывозят в индивидуальные домики размер ячейки 1,2 м х 0,8 м. В этом домике теленок находится 30 дней после чего его переводят в другой тип домиков размер ячейки 2,4 м х 0,8 м, а маленький домик чистится и дезинфицируеться для следующего теленка.</p>\n<p>&nbsp;</p>\n<p>Период выпойки составляет 63 дня. за этот период теленок должен выпить 349 л молоко. Выпойка только молоком. Ни один заменитель молока не может сравнится по качеству с натуральным молоком.</p>\n<p>&nbsp;</p>\n<p>Выпаеваються телята с соски и кормятся согласно схемы кормления.</p>\n<p>&nbsp;</p>\n<p>Для формирования иммунитета и защиты используется схема вакцинации.</p>\n<p>&nbsp;</p>\n<p>На предприятии применяется двух кратная схема выпойки, что стимулирует поедаемость комбикорма. Первый день &mdash; двух кратная выпойка молозива с интервалом не больше 6 часов. Второй четвертый день два раза по 2 литра и последующие дни два разы по 3 литра. За неделю до отлучки один раз по 3 литра. Комбикорм имеет 20% протеина стоимостью 15,8 руб/кг. Комбикорм один для телят от 0 до 5 мес.</p>\n<p>&nbsp;</p>\n<p><img style=\"float: left;\" src=\"http://crim/storage/pages/June2020/IMG_E0592.jpg\" alt=\"\" width=\"563\" height=\"750\" /> <img style=\"float: left;\" src=\"http://crim/storage/pages/June2020/IMG_E0599.jpg\" alt=\"\" width=\"562\" height=\"749\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<h3>Телки старше 2-х мес.</h3>\n<p>Телки 2-5 мес. содержатся мелкогрупповым методом под навесом в боксах по 12 гол. Размер бокса 9,0х6,0м. Постилка осуществляется два разы в неделю, При плохих погодных условиях (зимой снег, летом дождь) &mdash; каждый день. Потребляют телята полноценный комбикорм с содержанием 20 % протеина и 1,82 Мкалл энергии. Стоимость 1 кг комбикорма составляет 15,8 руб/кг. В среднем потребление корма в день составляет 5 кг и дают привес 1,0-1,2 кг/сутки.</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '2020-06-20 19:01:05', '2020-06-20 19:01:05'),
(245, 'infoblock_items', 'body', 13, 'en', 'Посетите нашу ферму онлайн!', '2020-06-21 08:31:25', '2020-06-21 08:31:25'),
(246, 'gallery_images', 'caption', 24, 'en', '5', '2020-06-21 08:33:14', '2020-06-21 08:33:14'),
(247, 'infoblock_items', 'title', 19, 'en', 'ALta', '2020-06-21 08:39:10', '2020-06-21 08:39:10'),
(248, 'infoblock_items', 'title', 20, 'en', 'DSM', '2020-06-21 09:22:53', '2020-06-21 09:22:53'),
(249, 'infoblock_items', 'title', 21, 'en', 'Крайторг', '2020-06-21 09:46:16', '2020-06-21 09:46:16'),
(251, 'menu_items', 'title', 37, 'en', 'Galleries', '2020-06-21 14:54:54', '2020-06-21 14:54:54'),
(252, 'menu_items', 'title', 25, 'en', 'Social networks', '2020-06-21 14:56:14', '2020-06-21 14:56:14'),
(253, 'data_rows', 'display_name', 158, 'en', 'Id', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(254, 'data_rows', 'display_name', 159, 'en', 'Название', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(255, 'data_rows', 'display_name', 160, 'en', 'Slug', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(256, 'data_rows', 'display_name', 161, 'en', 'Type Id', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(257, 'data_rows', 'display_name', 162, 'en', 'Заголовок', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(258, 'data_rows', 'display_name', 163, 'en', 'Подзаголовок', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(259, 'data_rows', 'display_name', 164, 'en', 'Минимальный показатель', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(260, 'data_rows', 'display_name', 165, 'en', 'Максимальный показатель', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(261, 'data_rows', 'display_name', 166, 'en', 'Создан', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(262, 'data_rows', 'display_name', 167, 'en', 'Изменен', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(263, 'data_rows', 'display_name', 168, 'en', 'chart_types', '2020-06-21 15:07:02', '2020-06-21 15:07:02'),
(264, 'data_types', 'display_name_singular', 16, 'en', 'График', '2020-06-21 15:07:03', '2020-06-21 15:07:03'),
(265, 'data_types', 'display_name_plural', 16, 'en', 'Графики', '2020-06-21 15:07:03', '2020-06-21 15:07:03'),
(266, 'charts', 'title', 1, 'en', 'Статистика', '2020-06-27 09:29:44', '2020-06-27 09:29:44'),
(267, 'charts', 'sub_title', 1, 'en', 'Статистика удоя молока Крым-Фарминг', '2020-06-27 09:29:44', '2020-06-27 09:29:44'),
(268, 'menu_items', 'title', 55, 'en', 'Статистика', '2020-06-27 13:08:11', '2020-06-27 13:08:11'),
(269, 'gallery_images', 'caption', 25, 'en', '5 Видео', '2020-06-27 14:24:42', '2020-06-27 14:24:42'),
(270, 'infoblock_items', 'title', 22, 'en', 'Сбор урожая', '2020-06-27 14:42:19', '2020-06-27 14:42:19');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$Ij59I.GDhV43/.pqq4FOPOxMzDv.nwrbPD2uN3IxUrIK9CRjXzWpK', 'r9eatNdxmdAlTWxXAL9eTB4CIuUB1BeoqLZwtW7RQFEBP99VVWpJs4BzZRL0', '{\"locale\":\"ru\"}', '2020-03-10 17:24:27', '2020-06-20 13:21:52');

-- --------------------------------------------------------

--
-- Структура таблиці `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Індекси таблиці `charts`
--
ALTER TABLE `charts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `charts_slug_unique` (`slug`),
  ADD KEY `charts_type_id_foreign` (`type_id`);

--
-- Індекси таблиці `chart_types`
--
ALTER TABLE `chart_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Індекси таблиці `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Індекси таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `galleries_slug_unique` (`slug`);

--
-- Індекси таблиці `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_images_gallery_id_foreign` (`gallery_id`);

--
-- Індекси таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `infoblocks_slug_unique` (`slug`),
  ADD KEY `infoblocks_type_id_foreign` (`type_id`);

--
-- Індекси таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `infoblock_items_infoblock_id_foreign` (`infoblock_id`);

--
-- Індекси таблиці `infoblock_types`
--
ALTER TABLE `infoblock_types`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Індекси таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Індекси таблиці `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Індекси таблиці `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Індекси таблиці `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Індекси таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Індекси таблиці `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Індекси таблиці `social_networks`
--
ALTER TABLE `social_networks`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Індекси таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `charts`
--
ALTER TABLE `charts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `chart_types`
--
ALTER TABLE `chart_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT для таблиці `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблиці `infoblock_types`
--
ALTER TABLE `infoblock_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблиці `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблиці `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблиці `social_networks`
--
ALTER TABLE `social_networks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `charts`
--
ALTER TABLE `charts`
  ADD CONSTRAINT `charts_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `chart_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD CONSTRAINT `gallery_images_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  ADD CONSTRAINT `infoblocks_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `infoblock_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  ADD CONSTRAINT `infoblock_items_infoblock_id_foreign` FOREIGN KEY (`infoblock_id`) REFERENCES `infoblocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
