-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Трв 12 2020 р., 22:29
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
-- База даних: `doradadb`
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
(1, NULL, 1, 'Категорія 1', 'category-1', '2020-03-10 17:24:27', '2020-03-22 12:23:08'),
(3, NULL, 1, 'Дорадництво', 'doradnictvo', '2020-03-22 12:23:57', '2020-03-22 12:23:57');

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
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(48, 6, 'body', 'rich_text_box', 'Body', 0, 0, 1, 1, 1, 1, '{}', 6),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 4),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, '{}', 12),
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
(128, 12, 'button_title', 'text', 'Заголовок кнопки', 0, 0, 1, 1, 1, 0, '{}', 7),
(129, 12, 'button_link', 'text', 'Посилання кнопки', 0, 0, 1, 1, 1, 0, '{}', 8),
(130, 12, 'body', 'text_area', 'Інформація', 0, 0, 1, 1, 1, 0, '{}', 9),
(131, 12, 'order', 'number', 'Порядковий номер', 1, 0, 0, 0, 0, 0, '{}', 10),
(132, 12, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 11),
(133, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 12),
(134, 12, 'infoblock_item_belongsto_infoblock_relationship', 'relationship', 'Інфоблок', 0, 1, 1, 1, 1, 1, '{\"isItemsParent\":true,\"parentDataTypeSlug\":\"infoblocks\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\Infoblock\",\"table\":\"infoblocks\",\"type\":\"belongsTo\",\"column\":\"infoblock_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(135, 12, 'infoblock_item_hasmany_infoblock_item_relationship', 'relationship', 'Дочірні елементи', 0, 1, 1, 1, 1, 1, '{\"isChildItems\":true,\"childItemsProperty\":\"children\",\"model\":\"App\\\\Models\\\\Infoblocks\\\\InfoblockItem\",\"table\":\"infoblock_items\",\"type\":\"hasMany\",\"column\":\"parent_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
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
(152, 15, 'image', 'image', 'Фото', 1, 1, 1, 1, 1, 1, '{}', 3),
(153, 15, 'caption', 'text', 'Заголовок', 0, 1, 1, 1, 1, 1, '{}', 4),
(154, 15, 'order', 'number', 'Порядковий номер', 1, 0, 0, 0, 0, 0, '{}', 5),
(155, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 1, '{}', 6),
(156, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 7),
(157, 15, 'gallery_image_belongsto_gallery_relationship', 'relationship', 'Галерея', 0, 1, 1, 1, 1, 1, '{\"isItemsParent\":true,\"parentDataTypeSlug\":\"galleries\",\"model\":\"App\\\\Models\\\\Galleries\\\\Gallery\",\"table\":\"galleries\",\"type\":\"belongsTo\",\"column\":\"gallery_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8);

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
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'App\\Models\\Pages\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-03-10 17:24:27', '2020-03-25 17:53:35'),
(10, 'infoblock_types', 'infoblock-types', 'Тип інфоблоків', 'Типи інфоблоків', 'voyager-categories', 'App\\Models\\Infoblocks\\InfoblockType', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-15 19:00:13', '2020-03-15 19:25:52'),
(11, 'infoblocks', 'infoblocks', 'Інфоблок', 'Інфоблоки', 'voyager-photos', 'App\\Models\\Infoblocks\\Infoblock', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-15 19:05:35', '2020-03-15 19:27:43'),
(12, 'infoblock_items', 'infoblock-items', 'Елемент інфоблоку', 'Елементи інфоблоків', 'voyager-photo', 'App\\Models\\Infoblocks\\InfoblockItem', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"title\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-15 19:15:20', '2020-03-21 10:59:39'),
(13, 'social_networks', 'social-networks', 'Соцільна мережа', 'Соціальні мережі', 'voyager-facebook', 'App\\Models\\SocialNetwork', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-03-16 18:39:44', '2020-03-16 18:39:44'),
(14, 'galleries', 'galleries', 'Галерея', 'Галереї', 'voyager-photos', 'App\\Models\\Galleries\\Gallery', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseWithItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-19 19:29:21', '2020-03-19 19:31:19'),
(15, 'gallery_images', 'gallery-images', 'Фото галереї', 'Фото галереї', 'voyager-photo', 'App\\Models\\Galleries\\GalleryImage', NULL, 'App\\Http\\Controllers\\WithItemsBase\\BaseItemController', NULL, 1, 0, '{\"order_column\":\"order\",\"order_display_column\":\"caption\",\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-03-19 19:34:03', '2020-03-19 19:36:06');

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
(1, 'Тест', 'test', 'Галерея', '', '2020-03-26 18:47:23', '2020-03-26 18:47:23');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `gallery_id`, `image`, `caption`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 'gallery-images\\March2020\\OKN6bx3Xlxq0R8nbiddS.png', '1', 1, '2020-03-26 18:49:33', '2020-03-26 18:49:46'),
(2, 1, 'gallery-images\\March2020\\2U0Rt0SaiYQVomkJhBHv.png', '2', 2, '2020-03-26 18:49:54', '2020-03-26 18:50:01'),
(3, 1, 'gallery-images\\March2020\\OP4mwo3vrws5n1mYfGZQ.png', '3', 3, '2020-03-26 18:50:07', '2020-03-26 18:50:14'),
(4, 1, 'gallery-images\\March2020\\4rXldOOgaGpvTAq7xdLY.png', '4', 4, '2020-03-26 18:50:30', '2020-03-26 18:50:37'),
(5, 1, 'gallery-images\\March2020\\2YM7w1vJwKLSYTCPQ8WS.png', '5', 5, '2020-03-26 18:50:43', '2020-03-26 18:50:50');

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
(1, 'Опис (головна)', 'opis-golovna', 1, 'Про асоціацію', '', '<p>Метою діяльності Асоціації є сприяння покращенню добробуту сільського населення та розвитку сільської місцевості через підвищення рівня знань і вдосконалення практичних навичок сільського населення та сільськогосподарських товаровиробників, задоволення та захист соціальних, економічних, фахових та інших спільних інтересів членів Асоціації.</p>', 'Читати далі', NULL, NULL, '2020-03-15 19:52:26', '2020-03-21 09:11:21'),
(2, 'Слайдер (головна)', 'slajder-golovna', 2, '', '', '', '', NULL, NULL, '2020-03-21 09:40:12', '2020-03-21 09:40:12'),
(3, 'Сервіси (головна)', 'servisi-golovna', 3, '', '', '', '', NULL, NULL, '2020-03-21 10:19:00', '2020-03-21 10:19:00'),
(4, 'Корисні посилання (головна)', 'korisni-posilannya-golovna', 4, 'Корисні посилання', '', '', '', NULL, NULL, '2020-03-21 10:56:55', '2020-03-21 10:56:55'),
(5, 'Наші партнери (головна)', 'nashi-partneri-golovna', 5, 'Наші партнери', '', '', '', NULL, NULL, '2020-03-21 11:10:09', '2020-03-21 11:10:09'),
(6, 'Наші цінності', 'nashi-cinnosti', 6, 'Наші цінності', '', '', '', NULL, NULL, '2020-03-26 18:37:45', '2020-03-26 18:37:45'),
(7, 'Наші послуги', 'nashi-poslugi', 7, 'Наші послуги', '', '', '', NULL, NULL, '2020-05-12 16:05:59', '2020-05-12 16:05:59');

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `infoblock_items`
--

INSERT INTO `infoblock_items` (`id`, `infoblock_id`, `parent_id`, `title`, `sub_title`, `image`, `button_title`, `button_link`, `body`, `order`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'Сільськогосподарське дорадництво', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\1P1YJrUxhGP4bSLnwipR.jpg\",\"original_name\":\"slide1.jpg\"}]', '', NULL, 'Дорадча діяльність як фактор інформаційно-консультаційного забезпечення розвитку сільських територій', 2, '2020-03-21 09:48:46', '2020-05-12 16:26:07'),
(2, 2, NULL, 'Дорадництво допоможе розвитку малого фермерства в Україні', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\4E7ChOwsmPt84ZtjJT1z.jpg\",\"original_name\":\"slide2.jpg\"}]', '', NULL, 'ФАО реалізує в Україні проект з надання підтримки для переходу до більш ефективної системи надання сільськогосподарських дорадчих послуг', 1, '2020-03-21 10:02:40', '2020-05-12 16:26:07'),
(3, 3, NULL, 'Підтримка дорадчих служб', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\8n3XnZc5P91v6BayHnMG.svg\",\"original_name\":\"teh-support.svg\"}]', 'Перейти', NULL, 'УКР Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur et eveniet iste minima quasi quidem tenetur! Ad impedit neque nobis porro.', 3, '2020-03-21 10:19:33', '2020-03-21 15:59:23'),
(4, 3, NULL, 'Навчання та самонавчання користувачів', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\gItQNa6KnIp8rYaW9Hzw.svg\",\"original_name\":\"student.svg\"}]', 'Перейти', NULL, 'УКР Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur et eveniet iste minima quasi quidem tenetur! Ad impedit neque nobis porro.', 4, '2020-03-21 10:21:31', '2020-03-21 15:59:10'),
(5, 3, NULL, 'Електронне дорадницто', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\w0DKpV0PPa9R25yeNBBh.svg\",\"original_name\":\"book.svg\"}]', 'Перейти', NULL, 'УКР Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur et eveniet iste minima quasi quidem tenetur! Ad impedit neque nobis porro.', 5, '2020-03-21 10:23:11', '2020-03-21 10:41:32'),
(6, 4, NULL, 'FAQ', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\P5WlnAV9hhl0SlCxjFGB.svg\",\"original_name\":\"faq.svg\"}]', '', NULL, 'УКР Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi corporis deserunt dicta doloremque earum', 6, '2020-03-21 10:57:22', '2020-03-21 10:58:23'),
(7, 4, NULL, 'FAQ 2', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\hEUN6GOvtbBuJKJJNAar.svg\",\"original_name\":\"faq.svg\"}]', '', NULL, 'УКР Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam animi corporis deserunt dicta doloremque earum', 7, '2020-03-21 10:58:38', '2020-03-21 10:59:10'),
(8, 5, NULL, 'ННЦ \"Інститут аграрної економіки\"', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\Gry65VDjCL7BVBIQanLJ.jpg\",\"original_name\":\"partner1.jpg\"}]', '', 'http://iae.faaf.org.ua/', '', 8, '2020-03-21 11:10:36', '2020-03-21 11:14:46'),
(9, 5, NULL, 'Журнал \"Землевпорядний вісник\"', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\FuwT1xMSsLiVmTgH6n1j.jpg\",\"original_name\":\"Visnik.jpg\"}]', '', 'http://zemvisnuk.com.ua/', '', 9, '2020-03-21 11:16:52', '2020-03-21 11:17:08'),
(10, 6, NULL, 'Лорем іпсум', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\GzG4DhycPRM0pF8L2xCK.svg\",\"original_name\":\"adv1.svg\"}]', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 10, '2020-03-26 18:38:16', '2020-03-26 18:38:56'),
(11, 6, NULL, 'Лорем 2', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\yn9d1N82PnqrNK0E35R8.svg\",\"original_name\":\"adv1.svg\"}]', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 11, '2020-03-26 18:39:17', '2020-03-26 18:39:32'),
(13, 6, NULL, 'Іпсум 3', '', '[{\"download_link\":\"infoblock-items\\\\March2020\\\\YmXWRAProhPWAZehs1tg.svg\",\"original_name\":\"book.svg\"}]', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 13, '2020-03-26 18:39:52', '2020-03-26 18:40:11'),
(14, 7, NULL, 'Назва послуги 1', '', '[{\"download_link\":\"infoblock-items\\\\May2020\\\\wTyr3QwWCmy0UUUn2wHS.svg\",\"original_name\":\"support.svg\"}]', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus architecto, cumque cupiditate dolorem ea est fugit modi nisi officiis quae quidem quis saepe, soluta, ullam voluptatibus! Dignissimos ipsa necessitatibus ut!', 14, '2020-05-12 16:06:34', '2020-05-12 16:07:41'),
(15, 7, NULL, 'Назва послуги 2', '', '[{\"download_link\":\"infoblock-items\\\\May2020\\\\weReH4blp5EJKqcHZdBC.svg\",\"original_name\":\"help.svg\"}]', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus architecto, cumque cupiditate dolorem ea est fugit modi nisi officiis quae quidem quis saepe, soluta, ullam voluptatibus! Dignissimos ipsa necessitatibus ut!', 15, '2020-05-12 16:07:53', '2020-05-12 16:08:37'),
(16, 7, NULL, 'Назва послуги 3', '', '[{\"download_link\":\"infoblock-items\\\\May2020\\\\gpFvHWjMZ5cKlt1XAB3m.svg\",\"original_name\":\"hr.svg\"}]', '', NULL, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus architecto, cumque cupiditate dolorem ea est fugit modi nisi officiis quae quidem quis saepe, soluta, ullam voluptatibus! Dignissimos ipsa necessitatibus ut!', 16, '2020-05-12 16:09:04', '2020-05-12 16:09:19');

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
(6, 'Картки (Іконка + опис)', 'advantages', 0, 1, 0, '2020-03-26 18:36:15', '2020-03-26 18:42:27'),
(7, 'Послуги', 'poslugi', 0, 1, 0, '2020-05-12 16:04:50', '2020-05-12 16:04:50');

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
(1, 1, 'Панель управління', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2020-03-10 17:24:10', '2020-03-15 19:29:38', 'voyager.dashboard', 'null'),
(2, 1, 'Медіа', '', '_self', 'voyager-images', '#000000', NULL, 3, '2020-03-10 17:24:10', '2020-03-16 18:02:14', 'voyager.media.index', 'null'),
(3, 1, 'Користувачі', '', '_self', 'voyager-person', '#000000', 24, 2, '2020-03-10 17:24:10', '2020-03-16 18:02:05', 'voyager.users.index', 'null'),
(4, 1, 'Ролі', '', '_self', 'voyager-lock', '#000000', 24, 1, '2020-03-10 17:24:10', '2020-03-16 18:02:04', 'voyager.roles.index', 'null'),
(5, 1, 'Налаштування', '', '_self', 'voyager-tools', '#000000', NULL, 8, '2020-03-10 17:24:10', '2020-03-19 19:37:13', NULL, ''),
(6, 1, 'Налаштування Меню', '', '_self', 'voyager-list', '#000000', 5, 1, '2020-03-10 17:24:10', '2020-03-15 19:30:14', 'voyager.menus.index', 'null'),
(7, 1, 'База даних', '', '_self', 'voyager-data', '#000000', 5, 2, '2020-03-10 17:24:10', '2020-03-15 19:30:26', 'voyager.database.index', 'null'),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-03-10 17:24:10', '2020-03-14 15:46:24', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-03-10 17:24:10', '2020-03-14 15:46:24', 'voyager.bread.index', NULL),
(10, 1, 'Системні налаштування', '', '_self', 'voyager-settings', '#000000', NULL, 9, '2020-03-10 17:24:10', '2020-03-19 19:37:13', 'voyager.settings.index', 'null'),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-03-10 17:24:11', '2020-03-14 15:46:24', 'voyager.hooks', NULL),
(12, 1, 'Категорії', '', '_self', 'voyager-categories', '#000000', 23, 1, '2020-03-10 17:24:27', '2020-03-15 19:41:08', 'voyager.categories.index', 'null'),
(13, 1, 'Новини', '', '_self', 'voyager-news', '#000000', 23, 2, '2020-03-10 17:24:27', '2020-03-15 19:41:08', 'voyager.posts.index', 'null'),
(14, 1, 'Сторінки', '', '_self', 'voyager-file-text', '#000000', NULL, 5, '2020-03-10 17:24:27', '2020-03-16 18:02:05', 'voyager.pages.index', 'null'),
(19, 1, 'Типи інфоблоків', '', '_self', 'voyager-categories', '#000000', 22, 1, '2020-03-15 19:00:14', '2020-03-15 19:28:44', 'voyager.infoblock-types.index', 'null'),
(20, 1, 'Інфоблоки', '', '_self', 'voyager-photos', '#000000', 22, 2, '2020-03-15 19:05:35', '2020-03-15 19:28:54', 'voyager.infoblocks.index', 'null'),
(21, 1, 'Елементи інфоблоків', '', '_self', 'voyager-photo', '#000000', 22, 3, '2020-03-15 19:15:21', '2020-03-15 19:29:03', 'voyager.infoblock-items.index', 'null'),
(22, 1, 'Інфоблоки', '', '_self', 'voyager-photos', '#000000', NULL, 6, '2020-03-15 19:28:22', '2020-03-16 18:02:05', NULL, ''),
(23, 1, 'Новини', '', '_self', 'voyager-news', '#000000', NULL, 4, '2020-03-15 19:40:49', '2020-03-16 18:02:05', NULL, ''),
(24, 1, 'Користувачі', '', '_self', 'voyager-person', '#000000', NULL, 2, '2020-03-16 18:01:52', '2020-03-16 18:02:03', NULL, ''),
(25, 1, 'Соціальні мережі', '', '_self', 'voyager-facebook', NULL, NULL, 10, '2020-03-16 18:39:45', '2020-03-19 19:37:13', 'voyager.social-networks.index', NULL),
(26, 2, 'Про асоціацію', '', '_self', NULL, '#000000', NULL, 1, '2020-03-16 18:58:17', '2020-03-16 18:59:32', NULL, ''),
(27, 2, 'Загальна інформація', '', '_self', NULL, '#000000', 26, 1, '2020-03-16 18:58:42', '2020-03-16 18:59:32', NULL, ''),
(28, 2, 'Наша команда', '', '_self', NULL, '#000000', 26, 2, '2020-03-16 18:58:51', '2020-03-16 18:59:33', NULL, ''),
(29, 2, 'Реєстраційні документи', '', '_self', NULL, '#000000', 26, 3, '2020-03-16 18:58:58', '2020-03-16 18:59:34', NULL, ''),
(30, 2, 'Наша діяльність', '', '_self', NULL, '#000000', 26, 4, '2020-03-16 18:59:05', '2020-03-16 18:59:35', NULL, ''),
(31, 2, 'Дорадчі служби в регіонах', '', '_self', NULL, '#000000', NULL, 2, '2020-03-16 18:59:42', '2020-03-19 19:50:29', NULL, ''),
(32, 2, 'Дорадництво', '', '_self', NULL, '#000000', NULL, 3, '2020-03-16 18:59:50', '2020-03-16 19:15:21', NULL, ''),
(33, 2, 'Послуги', '', '_self', NULL, '#000000', NULL, 4, '2020-03-16 19:04:45', '2020-03-16 19:15:22', NULL, ''),
(34, 2, 'Консультації', '', '_self', NULL, '#000000', 33, 1, '2020-03-16 19:04:55', '2020-03-16 19:20:43', NULL, ''),
(35, 2, 'Навчання', '', '_self', NULL, '#000000', 33, 2, '2020-03-16 19:05:02', '2020-03-16 19:20:44', NULL, ''),
(36, 2, 'Демонстрації', '', '_self', NULL, '#000000', 33, 3, '2020-03-16 19:05:14', '2020-03-16 19:20:45', NULL, ''),
(37, 1, 'Галереї', '', '_self', 'voyager-photos', NULL, 39, 1, '2020-03-19 19:29:23', '2020-03-19 19:36:52', 'voyager.galleries.index', NULL),
(38, 1, 'Фото галереї', '', '_self', 'voyager-photo', NULL, 39, 2, '2020-03-19 19:34:03', '2020-03-19 19:36:54', 'voyager.gallery-images.index', NULL),
(39, 1, 'Галереї', '', '_self', 'voyager-photos', '#000000', NULL, 7, '2020-03-19 19:36:44', '2020-03-19 19:37:13', NULL, ''),
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
(52, 2, 'Новини', 'posts', '_self', NULL, '#000000', NULL, 11, '2020-03-21 16:18:38', '2020-03-21 16:18:38', NULL, '');

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
(33, '2020_02_12_211243_create_gallery_images_table', 6);

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
(1, 1, 'Привіт світ', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>\n<p>&nbsp;</p>\n<p>[infoblock code=\"nashi-cinnosti\"]</p>\n<p>[gallery code=\"test\"]</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-03-10 17:24:27', '2020-03-26 19:00:52'),
(2, 1, 'Тест файлів', '', '<p>&nbsp;</p>\n<p><span style=\"color: #ff0000;\"><strong><a style=\"color: #ff0000;\" title=\"Розклад тайтл\" href=\"http://dorada.com/storage/files/%D0%A0%D0%BE%D0%B7%D0%BA%D0%BB%D0%B0%D0%B4%20%D0%B7%D0%B0%D0%BD%D1%8F%D1%82%D1%8C.xlsx\" target=\"_blank\" rel=\"noopener\">Розклад</a></strong></span></p>', NULL, 'test-fajliv', '', '', 'INACTIVE', '2020-03-25 18:00:36', '2020-03-25 18:03:50');

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
(71, 'delete_gallery_images', 'gallery_images', '2020-03-19 19:34:03', '2020-03-19 19:34:03');

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
(71, 1);

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
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-03-10 17:24:27', '2020-03-10 17:24:27'),
(5, 1, 1, 'РИНОК ЗЕМЛІ, ЯКИМ ВІН БУДЕ, ЯКЩО БУДЕ', '', 'Представлена модель ринкової рівноваги на потенційному ринку землі відповідає випадку, коли до участі допущено тільки діючі суб’єкти аграрного бізнесу, а право на продаж представлено без обмежень усім власникам паїв', '<p><span style=\"color: rgba(0, 4, 57, 0.75); font-family: -apple-system, LandRoverWeb, \'Segoe UI\', Roboto, \'Helvetica Neue\', Arial, \'Noto Sans\', sans-serif, \'Apple Color Emoji\', \'Segoe UI Emoji\', \'Segoe UI Symbol\', \'Noto Color Emoji\'; font-size: 12.8062px;\">Представлена модель ринкової рівноваги на потенційному ринку землі відповідає випадку, коли до участі допущено тільки діючі суб&rsquo;єкти аграрного бізнесу, а право на продаж представлено без обмежень усім власникам паїв</span></p>', 'posts\\March2020\\vb7L373j4nTB7tojsHPa.jpg', 'rinok-zemli-yakim-vin-bude-yaksho-bude', '', '', 'PUBLISHED', 1, '2020-03-20 17:33:10', '2020-03-20 17:33:10'),
(6, 1, 1, 'З ПОЧАТКУ 2019/20 МР З УКРАЇНИ ЕКСПОРТОВАНО 29,4 МЛН ТОНН ЗЕРНА', '', 'Станом на 23 грудня з початку 2019/2020 маркетингового року з України експортовано 29 350 тис. тонн зернових культур, що на 7,6 млн тонн більше ніж за аналогічний період минулого маркетингового року.', '<p>Станом на 23 грудня з початку 2019/2020 маркетингового року з України експортовано 29 350 тис. тонн зернових культур, що на 7,6 млн тонн більше ніж за аналогічний період минулого маркетингового року.</p>\n<p>&nbsp;</p>\n<p>Зокрема, на зовнішні ринки поставлено:</p>\n<ul>\n<li>пшениці &ndash; 14,5 млн тонн;</li>\n<li>ячменю &ndash; 3,7 млн тонн;</li>\n<li>жита &ndash; 5 тис. тонн;</li>\n<li>кукурудзи &ndash; 10,9 млн тонн.</li>\n</ul>\n<p>Крім того, експортовано борошна пшеничного та інших культур &ndash; 182,4 тис. тонн, що на 64,3 тис. тонн більше ніж за відповідний період минулого МР.</p>', 'posts\\March2020\\7xKq9EBeyhoxgTRu5m07.jpg', 'z-pochatku-2019-20-mr-z-ukrayini-eksportovano-29-4-mln-tonn-zerna', '', '', 'PUBLISHED', 1, '2020-03-20 17:34:39', '2020-03-22 12:52:09'),
(7, 1, 1, 'МІНЕКОНОМІКИ ПІДТРИМУЄ МОДЕРНІЗАЦІЮ ЗАКОНОДАВСТВА ПРО ПЕСТИЦИДИ ТА АГРОХІМІКАТАМИ', '', 'Прийняття проекту Закону забезпечить створення більш сучасного та належного регулювання відносин у сфері поводження з пестицидами та агрохімікатами.', '<p>Прийняття проекту Закону забезпечить створення більш сучасного та належного регулювання відносин у сфері поводження з пестицидами та агрохімікатами.</p>\n<p>&nbsp;</p>\n<p>За майже 25 років в Україні суттєво не переглядалося законодавство про пестициди та агрохімікати. За цей час до документу за цей час було внесено низку фрагментарних та безсистемних змін. Проект Закону 2548 &laquo;Про внесення змін до деяких законів України щодо вдосконалення державного регулювання у сфері поводження із пестицидами та агрохімікатами&raquo;, що винесений на розгляд Аграрного комітету Верховної Ради передбачає системну модернізацію цієї сфери.&nbsp;&nbsp;</p>\n<p>&nbsp;</p>\n<p>У розробці документу брали участь більше двох десятків експертів з МЕРТ, Держпродспоживслужби, ЕВА, АСС, проекту ЄС SAFPI, Асоціація &laquo;Український клуб аграрного бізнесу&raquo;, ВАР, Фітосанітарної асоціації України, представники Інституту екогігієни і токсикології ім. Л. І. Медведя МОЗ України, а також народні депутати Аграрного комітету ВРУ.</p>\n<p>&nbsp;</p>\n<table style=\"border-collapse: collapse; width: 100%; height: 52px;\" border=\"1\">\n<tbody>\n<tr style=\"height: 13px;\">\n<td style=\"width: 20%; height: 13px;\">1</td>\n<td style=\"width: 20%; height: 13px;\">2</td>\n<td style=\"width: 20%; height: 13px;\">3</td>\n<td style=\"width: 20%; height: 13px;\">4</td>\n<td style=\"width: 20%; height: 13px;\">5</td>\n</tr>\n<tr style=\"height: 13px;\">\n<td style=\"width: 20%; height: 13px;\">ЦАцба</td>\n<td style=\"width: 20%; height: 13px;\">уйца</td>\n<td style=\"width: 20%; height: 13px;\">йац</td>\n<td style=\"width: 20%; height: 13px;\">йауцка</td>\n<td style=\"width: 20%; height: 13px;\">Владік</td>\n</tr>\n<tr style=\"height: 13px;\">\n<td style=\"width: 20%; height: 13px;\">Люда</td>\n<td style=\"width: 20%; height: 13px;\">любить</td>\n<td style=\"width: 20%; height: 13px;\">Владіка</td>\n<td style=\"width: 20%; height: 13px;\">дуже</td>\n<td style=\"width: 20%; height: 13px;\">сильно</td>\n</tr>\n<tr style=\"height: 13px;\">\n<td style=\"width: 20%; height: 13px;\">Владік</td>\n<td style=\"width: 20%; height: 13px;\">любить</td>\n<td style=\"width: 20%; height: 13px;\">Люду</td>\n<td style=\"width: 20%; height: 13px;\">ще</td>\n<td style=\"width: 20%; height: 13px;\">сильніше</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>\n<p>Зміни стосуватимуться насамперед адаптації до законодавства ЄС, дерегуляції для бізнесу та ЦОВВ, боротьби з фальсифікатом. Так, документом забороняється провезення на територію України засобів захисту рослин фізичними особами, посилено вимоги до маркування та упаковки. Окрім цього, запроваджується Державний реєстр пестицидів і агрохімікатів, дозволених до використання в Україні, який буде функціонувати на засадах безоплатності та відкритого доступу до нього. Таким чином паперовий перелік &laquo;Пестицидів та агрохімікатів, дозволений для використання в Україні&raquo; стане електронним державним реєстром з відкритим доступом на сайті Мінекоенерго. Так само на сайті буде доступна інформація про план державних випробувань.</p>\n<p>&nbsp;</p>\n<ol>\n<li>Один</li>\n<li>Два</li>\n<li>Так, документом забороняється провезення на територію України засобів захисту рослин фізичними особами, посилено вимоги до маркування та упаковки.</li>\n<li>Так само на сайті буде доступна інформація про план державних випробувань.</li>\n</ol>', 'posts\\March2020\\03utxjhNYemIQpWTfxnm.jpg', 'minekonomiki-pidtrimuye-modernizaciyu-zakonodavstva-pro-pesticidi-ta-agrohimikatami', '', '', 'PUBLISHED', 0, '2020-03-20 19:08:06', '2020-03-22 12:56:37');

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
(1, 'site.title', 'Site Title', 'Дорада', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 3, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 4, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 8, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\May2020\\TDo9avUgCdvht6b0X7NC.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Dorada Admin', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Адміністративна панель DORADA. Created by Zirael', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\May2020\\ATD9MkglOwq71reIcSTb.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\May2020\\Ukt3wND7fBHA3uEGCc6x.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'contacts.mobile-phone', 'Mobile phone', '+380989279554, +380989279554', NULL, 'text', 6, 'Contacts'),
(12, 'contacts.email', 'Email', 'doradaukraine@gmail.com', NULL, 'text', 7, 'Contacts'),
(13, 'site.title-en', 'Site Title EN', 'Dorada', NULL, 'text', 2, 'Site'),
(14, 'posts.title', 'Post title', 'Новини', NULL, 'text', 9, 'Posts'),
(16, 'posts.title-en', 'Post title EN', 'News', NULL, 'text', 10, 'Posts'),
(17, 'posts.show-more-title', 'Preview more button title', 'Переглянути всі новини', NULL, 'text', 11, 'Posts'),
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
(73, 'menu_items', 'title', 19, 'en', 'Типи інфоблоків', '2020-03-15 19:28:44', '2020-03-15 19:28:44'),
(74, 'menu_items', 'title', 20, 'en', 'Інфоблоки', '2020-03-15 19:28:54', '2020-03-15 19:28:54'),
(75, 'menu_items', 'title', 21, 'en', 'Елементи інфоблоків', '2020-03-15 19:29:03', '2020-03-15 19:29:03'),
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
(92, 'pages', 'title', 1, 'en', 'Hello World', '2020-03-18 16:44:17', '2020-03-18 16:44:17'),
(93, 'pages', 'body', 1, 'en', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-03-18 16:44:17', '2020-03-18 16:44:17'),
(94, 'pages', 'slug', 1, 'en', 'hello-world', '2020-03-18 16:44:17', '2020-03-18 16:44:17'),
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
(115, 'menu_items', 'title', 33, 'en', 'Services', '2020-03-19 19:45:04', '2020-03-19 19:45:04'),
(116, 'menu_items', 'title', 32, 'en', 'Doradnitstvo', '2020-03-19 19:45:58', '2020-03-19 19:45:58'),
(117, 'menu_items', 'title', 26, 'en', 'About association', '2020-03-19 19:48:22', '2020-03-19 19:48:22'),
(118, 'menu_items', 'title', 27, 'en', 'General information', '2020-03-19 19:48:40', '2020-03-19 19:48:40'),
(119, 'menu_items', 'title', 28, 'en', 'Our team', '2020-03-19 19:48:59', '2020-03-19 19:48:59'),
(120, 'menu_items', 'title', 29, 'en', 'Registration documents', '2020-03-19 19:49:14', '2020-03-19 19:49:14'),
(121, 'menu_items', 'title', 30, 'en', 'Our activity', '2020-03-19 19:49:35', '2020-03-19 19:49:35'),
(122, 'menu_items', 'title', 31, 'en', 'Services in the regions', '2020-03-19 19:50:29', '2020-03-19 19:50:29'),
(123, 'posts', 'title', 5, 'en', 'THE LAND MARKET WHAT IT WILL BE', '2020-03-20 17:33:10', '2020-03-20 17:33:10'),
(124, 'posts', 'body', 5, 'en', '<p><span style=\"color: rgba(0, 4, 57, 0.749019607843137); font-family: -apple-system, LandRoverWeb, Segoe UI, Roboto, Helvetica Neue, Arial, Noto Sans, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol, Noto Color Emoji;\"><span style=\"font-size: 12.8062px;\">The presented model of market equilibrium in the potential land market corresponds to the case when only active agricultural entities are allowed to participate and the right to sell is granted without restriction to all unit owners</span></span></p>', '2020-03-20 17:33:10', '2020-03-20 17:33:10'),
(125, 'posts', 'slug', 5, 'en', 'the-land-market-what-it-will-be', '2020-03-20 17:33:10', '2020-03-20 17:33:10'),
(126, 'posts', 'title', 6, 'en', '29.4 MILLION TONES OF Grain EXPORTED FROM UKRAINE IN YEAR 2019/20', '2020-03-20 17:34:39', '2020-03-20 17:34:39'),
(127, 'posts', 'excerpt', 6, 'en', 'As of December 23, since the beginning of the 2019/2020 marketing year, 29 350 thousand tons of cereals have been exported from Ukraine, which is 7.6 million tons more than in the same period of the last marketing year.', '2020-03-20 17:34:39', '2020-03-20 17:34:39'),
(128, 'posts', 'body', 6, 'en', '<p>As of December 23, since the beginning of the 2019/2020 marketing year, 29 350 thousand tons of cereals have been exported from Ukraine, which is 7.6 million tons more than in the same period of the last marketing year.</p>', '2020-03-20 17:34:39', '2020-03-20 17:34:39'),
(129, 'posts', 'slug', 6, 'en', '29-4-million-tones-of-grain-exported-from-ukraine-in-year-2019-20', '2020-03-20 17:34:39', '2020-03-20 17:34:39'),
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
(158, 'infoblock_items', 'title', 9, 'en', 'Журнал \"Землевпорядний вісник\"', '2020-03-21 11:16:52', '2020-03-21 11:16:52'),
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
(181, 'categories', 'name', 1, 'en', 'Category 1', '2020-03-22 12:23:08', '2020-03-22 12:23:08'),
(182, 'categories', 'name', 3, 'en', 'Dorad', '2020-03-22 12:23:57', '2020-03-22 12:23:57'),
(183, 'data_rows', 'display_name', 44, 'en', 'ID', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(184, 'data_rows', 'display_name', 45, 'en', 'Author', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(185, 'data_rows', 'display_name', 46, 'en', 'Title', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(186, 'data_rows', 'display_name', 47, 'en', 'Excerpt', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(187, 'data_rows', 'display_name', 48, 'en', 'Body', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(188, 'data_rows', 'display_name', 55, 'en', 'Page Image', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(189, 'data_rows', 'display_name', 49, 'en', 'Slug', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(190, 'data_rows', 'display_name', 50, 'en', 'Meta Description', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(191, 'data_rows', 'display_name', 51, 'en', 'Meta Keywords', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(192, 'data_rows', 'display_name', 52, 'en', 'Status', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(193, 'data_rows', 'display_name', 53, 'en', 'Created At', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(194, 'data_rows', 'display_name', 54, 'en', 'Updated At', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(195, 'data_types', 'display_name_singular', 6, 'en', 'Page', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(196, 'data_types', 'display_name_plural', 6, 'en', 'Pages', '2020-03-25 17:53:35', '2020-03-25 17:53:35'),
(197, 'pages', 'title', 2, 'en', 'Тест файлів', '2020-03-25 18:03:50', '2020-03-25 18:03:50'),
(198, 'pages', 'body', 2, 'en', '<p>&nbsp;</p>\n<p><a title=\"Розклад тайтл\" href=\"http://dorada.com/storage/files/%D0%A0%D0%BE%D0%B7%D0%BA%D0%BB%D0%B0%D0%B4%20%D0%B7%D0%B0%D0%BD%D1%8F%D1%82%D1%8C.xlsx\" target=\"_blank\" rel=\"noopener\">Розклад</a></p>', '2020-03-25 18:03:50', '2020-03-25 18:03:50'),
(199, 'infoblocks', 'title', 6, 'en', 'Our values', '2020-03-26 18:37:45', '2020-03-26 18:37:45'),
(200, 'infoblock_items', 'title', 10, 'en', 'Lorem ipsum', '2020-03-26 18:38:16', '2020-03-26 18:38:16'),
(201, 'infoblock_items', 'body', 10, 'en', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2020-03-26 18:38:56', '2020-03-26 18:38:56'),
(202, 'infoblock_items', 'title', 11, 'en', 'Lorem ipsum 2', '2020-03-26 18:39:17', '2020-03-26 18:39:17'),
(203, 'infoblock_items', 'body', 11, 'en', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2020-03-26 18:39:32', '2020-03-26 18:39:32'),
(205, 'infoblock_items', 'title', 13, 'en', 'Lorem ipsum 3', '2020-03-26 18:39:52', '2020-03-26 18:39:52'),
(206, 'infoblock_items', 'body', 13, 'en', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2020-03-26 18:40:11', '2020-03-26 18:40:11'),
(207, 'pages', 'excerpt', 1, 'en', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '2020-03-26 18:45:05', '2020-03-26 18:45:05'),
(208, 'pages', 'meta_description', 1, 'en', 'Yar Meta Description', '2020-03-26 18:45:05', '2020-03-26 18:45:05'),
(209, 'pages', 'meta_keywords', 1, 'en', 'Keyword1, Keyword2', '2020-03-26 18:45:05', '2020-03-26 18:45:05'),
(210, 'galleries', 'title', 1, 'en', 'Gallery', '2020-03-26 18:47:40', '2020-03-26 18:47:40'),
(211, 'gallery_images', 'caption', 1, 'en', '1', '2020-03-26 18:49:46', '2020-03-26 18:49:46'),
(212, 'gallery_images', 'caption', 2, 'en', '2', '2020-03-26 18:50:01', '2020-03-26 18:50:01'),
(213, 'gallery_images', 'caption', 3, 'en', '3', '2020-03-26 18:50:14', '2020-03-26 18:50:14'),
(214, 'gallery_images', 'caption', 4, 'en', '4', '2020-03-26 18:50:37', '2020-03-26 18:50:37'),
(215, 'gallery_images', 'caption', 5, 'en', '5', '2020-03-26 18:50:50', '2020-03-26 18:50:50'),
(216, 'infoblocks', 'title', 7, 'en', 'Our services', '2020-05-12 16:05:59', '2020-05-12 16:05:59'),
(217, 'infoblock_items', 'title', 14, 'en', 'Service name 1', '2020-05-12 16:07:41', '2020-05-12 16:09:35'),
(218, 'infoblock_items', 'title', 15, 'en', 'Service name 2', '2020-05-12 16:08:37', '2020-05-12 16:08:37'),
(219, 'infoblock_items', 'title', 16, 'en', 'Service name 3', '2020-05-12 16:09:04', '2020-05-12 16:09:04'),
(220, 'infoblock_items', 'body', 14, 'en', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus architecto, cumque cupiditate dolorem ea est fugit modi nisi officiis quae quidem quis saepe, soluta, ullam voluptatibus! Dignissimos ipsa necessitatibus ut!', '2020-05-12 16:09:35', '2020-05-12 16:09:35');

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
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$Ij59I.GDhV43/.pqq4FOPOxMzDv.nwrbPD2uN3IxUrIK9CRjXzWpK', 'ngDd0PCzOUsXktA0VGLijEHpClLnkQLRJMZUXuBXSE5PDqswxXSOtbrwvtqG', '{\"locale\":\"uk\"}', '2020-03-10 17:24:27', '2020-03-10 19:15:58'),
(2, 1, 'Сергій Саяпін', 'sayapin_sp@ukr.net', 'users/default.png', NULL, '$2y$10$l9oa.5VSp4qW/F7spDG10.yChu6YnQLOWzz4.MH5Ty4m1g921oPFa', NULL, '{\"locale\":\"uk\"}', '2020-05-12 16:28:53', '2020-05-12 16:28:53');

-- --------------------------------------------------------

--
-- Структура таблиці `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 1);

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
-- AUTO_INCREMENT для таблиці `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT для таблиці `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `infoblocks`
--
ALTER TABLE `infoblocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `infoblock_items`
--
ALTER TABLE `infoblock_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблиці `infoblock_types`
--
ALTER TABLE `infoblock_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблиці `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
