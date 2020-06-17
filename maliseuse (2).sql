-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 17 juin 2020 à 12:31
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `maliseuse`
--
CREATE DATABASE IF NOT EXISTS `maliseuse` DEFAULT CHARACTER SET utf16le COLLATE utf16le_general_ci;
USE `maliseuse`;

-- --------------------------------------------------------

--
-- Structure de la table `wp_actionscheduler_actions`
--

DROP TABLE IF EXISTS `wp_actionscheduler_actions`;
CREATE TABLE IF NOT EXISTS `wp_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`action_id`),
  KEY `hook` (`hook`),
  KEY `status` (`status`),
  KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  KEY `args` (`args`),
  KEY `group_id` (`group_id`),
  KEY `last_attempt_gmt` (`last_attempt_gmt`),
  KEY `claim_id` (`claim_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_actionscheduler_claims`
--

DROP TABLE IF EXISTS `wp_actionscheduler_claims`;
CREATE TABLE IF NOT EXISTS `wp_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`claim_id`),
  KEY `date_created_gmt` (`date_created_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_actionscheduler_groups`
--

DROP TABLE IF EXISTS `wp_actionscheduler_groups`;
CREATE TABLE IF NOT EXISTS `wp_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `slug` (`slug`(191))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_actionscheduler_groups`
--

INSERT INTO `wp_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration');

-- --------------------------------------------------------

--
-- Structure de la table `wp_actionscheduler_logs`
--

DROP TABLE IF EXISTS `wp_actionscheduler_logs`;
CREATE TABLE IF NOT EXISTS `wp_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`log_id`),
  KEY `action_id` (`action_id`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10)),
  KEY `woo_idx_comment_type` (`comment_type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Un commentateur WordPress', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2020-04-07 15:30:15', '2020-04-07 13:30:15', 'Bonjour, ceci est un commentaire.\nPour débuter avec la modération, la modification et la suppression de commentaires, veuillez visiter l’écran des Commentaires dans le Tableau de bord.\nLes avatars des personnes qui commentent arrivent depuis <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mailchimp_carts`
--

DROP TABLE IF EXISTS `wp_mailchimp_carts`;
CREATE TABLE IF NOT EXISTS `wp_mailchimp_carts` (
  `id` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cart` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_mailchimp_jobs`
--

DROP TABLE IF EXISTS `wp_mailchimp_jobs`;
CREATE TABLE IF NOT EXISTS `wp_mailchimp_jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_id` text COLLATE utf8mb4_unicode_520_ci,
  `job` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM AUTO_INCREMENT=866 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/MaLiseuse/wordpress', 'yes'),
(2, 'home', 'http://localhost/MaLiseuse/wordpress', 'yes'),
(3, 'blogname', 'MaLiseuse.fr', 'yes'),
(4, 'blogdescription', 'La lecture du futur.', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'jonathanprevedan@laplateforme.io', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(25, 'links_updated_date_format', 'j F Y G \\h i \\m\\i\\n', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:157:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:11:\"boutique/?$\";s:27:\"index.php?post_type=product\";s:41:\"boutique/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:36:\"boutique/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=product&feed=$matches[1]\";s:28:\"boutique/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=product&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:48:\"product/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:43:\"product/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?product=$matches[1]&feed=$matches[2]\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=2&cpage=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:62:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$\";s:99:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]\";s:62:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:73:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:6:{i:0;s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";i:1;s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";i:2;s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";i:3;s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";i:4;s:45:\"woocommerce-services/woocommerce-services.php\";i:5;s:27:\"woocommerce/woocommerce.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'storefront', 'yes'),
(41, 'stylesheet', 'storefront', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '47018', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:3:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;i:4;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:1;}}', 'yes'),
(79, 'widget_text', 'a:3:{i:2;a:4:{s:5:\"title\";s:20:\"À propos de ce site\";s:4:\"text\";s:99:\"C’est peut-être le bon endroit pour vous présenter et votre site ou insérer quelques crédits.\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}i:3;a:4:{s:5:\"title\";s:14:\"Retrouvez-nous\";s:4:\"text\";s:185:\"<strong>Adresse</strong>\nAvenue des Champs-Élysées\n75008, Paris\n\n<strong>Heures d’ouverture</strong>\nDu lundi au vendredi : 9h00—17h00\nLes samedi et dimanche : 11h00&ndash;15h00\";s:6:\"filter\";b:1;s:6:\"visual\";b:1;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:45:\"woocommerce-services/woocommerce-services.php\";a:2:{i:0;s:17:\"WC_Connect_Loader\";i:1;s:16:\"plugin_uninstall\";}}', 'no'),
(82, 'timezone_string', 'Europe/Paris', 'yes'),
(83, 'page_for_posts', '31', 'yes'),
(84, 'page_on_front', '2', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '28', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '1', 'yes'),
(93, 'admin_email_lifespan', '1601818215', 'yes'),
(94, 'initial_db_version', '47018', 'yes'),
(95, 'wp_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:114:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}', 'yes'),
(96, 'fresh_site', '0', 'yes'),
(97, 'WPLANG', 'fr_FR', 'yes'),
(98, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-posts', 'a:2:{i:2;a:3:{s:5:\"title\";s:10:\"Catégorie\";s:6:\"number\";i:5;s:9:\"show_date\";b:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:20:\"Les meilleurs ventes\";s:6:\"number\";i:3;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:12:\"Plan du site\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'sidebars_widgets', 'a:6:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:12:\"categories-2\";i:3;s:10:\"archives-2\";}s:12:\"main-sidebar\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:14:\"footer-sidebar\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:16:\"masthead-sidebar\";a:0:{}s:13:\"array_version\";i:3;s:9:\"sidebar-2\";a:2:{i:0;s:6:\"meta-2\";i:1;s:12:\"categories-4\";}}', 'yes'),
(104, 'cron', 'a:14:{i:1592396906;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1592397015;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1592399549;a:1:{s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1592399560;a:1:{s:29:\"wc_admin_unsnooze_admin_notes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1592400167;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1592400615;a:5:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592400631;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592400632;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592406747;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592417547;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1592431200;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592482357;a:2:{s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1592914407;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:11:\"fifteendays\";s:4:\"args\";a:0:{}s:8:\"interval\";i:1296000;}}}s:7:\"version\";i:2;}', 'yes'),
(105, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'theme_mods_twentytwenty', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1586266736;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(116, 'recovery_keys', 'a:0:{}', 'yes'),
(220, 'action_scheduler_hybrid_store_demarkation', '57', 'yes'),
(221, 'schema-ActionScheduler_StoreSchema', '3.0.1586434345', 'yes'),
(222, 'schema-ActionScheduler_LoggerSchema', '2.0.1586434346', 'yes'),
(225, 'woocommerce_store_address', '31 rue Raphaël', 'yes'),
(226, 'woocommerce_store_address_2', '', 'yes'),
(131, 'can_compress_scripts', '1', 'no'),
(775, '_site_transient_browser_7178962ad06c4f9758986cbf76506171', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"83.0.4103.97\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(160, 'theme_switch_menu_locations', '', 'yes'),
(161, 'theme_switched_via_customizer', '', 'yes'),
(197, '_transient_health-check-site-status-result', '{\"good\":\"9\",\"recommended\":\"6\",\"critical\":\"2\"}', 'yes'),
(242, 'woocommerce_price_decimal_sep', ',', 'yes'),
(243, 'woocommerce_price_num_decimals', '2', 'yes'),
(215, 'recently_activated', 'a:0:{}', 'yes'),
(800, '_transient_woocommerce_reports-transient-version', '1592159413', 'yes'),
(801, '_transient_timeout_wc_report_orders_stats_7fbb73f3e45d6187778dd7a5ff128265', '1592764213', 'no'),
(802, '_transient_wc_report_orders_stats_7fbb73f3e45d6187778dd7a5ff128265', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":12:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2019-24\";s:10:\"date_start\";s:19:\"2019-06-10 02:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-10 00:00:00\";s:8:\"date_end\";s:19:\"2019-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:3;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(803, '_transient_timeout_wc_report_orders_stats_a4c28b03f1023c40ceda0ec99b538cbf', '1592764212', 'no'),
(804, '_transient_wc_report_orders_stats_a4c28b03f1023c40ceda0ec99b538cbf', 'a:2:{s:7:\"version\";s:10:\"1592159412\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":12:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2020-24\";s:10:\"date_start\";s:19:\"2020-06-08 02:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-08 00:00:00\";s:8:\"date_end\";s:19:\"2020-06-14 20:30:00\";s:12:\"date_end_gmt\";s:19:\"2020-06-14 18:30:00\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:2;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(805, '_transient_timeout_wc_report_orders_stats_8a9b39c3a8377956608f9de322459df2', '1592764212', 'no'),
(806, '_transient_timeout_wc_report_orders_stats_a2a286b7b83c6c3feb042196a377df3d', '1592764212', 'no'),
(807, '_transient_wc_report_orders_stats_8a9b39c3a8377956608f9de322459df2', 'a:2:{s:7:\"version\";s:10:\"1592159412\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":11:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2020-24\";s:10:\"date_start\";s:19:\"2020-06-08 02:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-08 00:00:00\";s:8:\"date_end\";s:19:\"2020-06-14 20:30:00\";s:12:\"date_end_gmt\";s:19:\"2020-06-14 18:30:00\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:2;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(808, '_transient_wc_report_orders_stats_a2a286b7b83c6c3feb042196a377df3d', 'a:2:{s:7:\"version\";s:10:\"1592159412\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":11:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2019-24\";s:10:\"date_start\";s:19:\"2019-06-10 02:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-10 00:00:00\";s:8:\"date_end\";s:19:\"2019-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:3;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(809, '_transient_timeout_wc_report_orders_stats_bec37fe415751a50a5b5715feb850151', '1592764214', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(810, '_transient_wc_report_orders_stats_bec37fe415751a50a5b5715feb850151', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":12:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2020-06-01\";s:10:\"date_start\";s:19:\"2020-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2020-06-02\";s:10:\"date_start\";s:19:\"2020-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2020-06-03\";s:10:\"date_start\";s:19:\"2020-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2020-06-04\";s:10:\"date_start\";s:19:\"2020-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2020-06-05\";s:10:\"date_start\";s:19:\"2020-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2020-06-06\";s:10:\"date_start\";s:19:\"2020-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2020-06-07\";s:10:\"date_start\";s:19:\"2020-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2020-06-08\";s:10:\"date_start\";s:19:\"2020-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2020-06-09\";s:10:\"date_start\";s:19:\"2020-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2020-06-10\";s:10:\"date_start\";s:19:\"2020-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2020-06-11\";s:10:\"date_start\";s:19:\"2020-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2020-06-12\";s:10:\"date_start\";s:19:\"2020-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2020-06-13\";s:10:\"date_start\";s:19:\"2020-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2020-06-14\";s:10:\"date_start\";s:19:\"2020-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(811, '_transient_timeout_wc_report_orders_stats_a5016df2d65cceddedbc192cbe3c396c', '1592764214', 'no'),
(812, '_transient_wc_report_orders_stats_a5016df2d65cceddedbc192cbe3c396c', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":11:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2020-06-01\";s:10:\"date_start\";s:19:\"2020-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2020-06-02\";s:10:\"date_start\";s:19:\"2020-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2020-06-03\";s:10:\"date_start\";s:19:\"2020-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2020-06-04\";s:10:\"date_start\";s:19:\"2020-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2020-06-05\";s:10:\"date_start\";s:19:\"2020-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2020-06-06\";s:10:\"date_start\";s:19:\"2020-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2020-06-07\";s:10:\"date_start\";s:19:\"2020-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2020-06-08\";s:10:\"date_start\";s:19:\"2020-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2020-06-09\";s:10:\"date_start\";s:19:\"2020-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2020-06-10\";s:10:\"date_start\";s:19:\"2020-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2020-06-11\";s:10:\"date_start\";s:19:\"2020-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2020-06-12\";s:10:\"date_start\";s:19:\"2020-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2020-06-13\";s:10:\"date_start\";s:19:\"2020-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2020-06-14\";s:10:\"date_start\";s:19:\"2020-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(813, '_transient_timeout_wc_report_orders_stats_df1079e31d504b28aba811464fa85a2c', '1592764214', 'no'),
(814, '_transient_wc_report_orders_stats_df1079e31d504b28aba811464fa85a2c', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":12:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2019-06-01\";s:10:\"date_start\";s:19:\"2019-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2019-06-02\";s:10:\"date_start\";s:19:\"2019-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2019-06-03\";s:10:\"date_start\";s:19:\"2019-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2019-06-04\";s:10:\"date_start\";s:19:\"2019-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2019-06-05\";s:10:\"date_start\";s:19:\"2019-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2019-06-06\";s:10:\"date_start\";s:19:\"2019-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2019-06-07\";s:10:\"date_start\";s:19:\"2019-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2019-06-08\";s:10:\"date_start\";s:19:\"2019-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2019-06-09\";s:10:\"date_start\";s:19:\"2019-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2019-06-10\";s:10:\"date_start\";s:19:\"2019-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2019-06-11\";s:10:\"date_start\";s:19:\"2019-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2019-06-12\";s:10:\"date_start\";s:19:\"2019-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2019-06-13\";s:10:\"date_start\";s:19:\"2019-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2019-06-14\";s:10:\"date_start\";s:19:\"2019-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":11:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:11:\"gross_sales\";d:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(815, '_transient_timeout_wc_report_orders_stats_fbd43c2f1cfa57b26c7a6fee974c96ce', '1592764214', 'no'),
(816, '_transient_wc_report_orders_stats_fbd43c2f1cfa57b26c7a6fee974c96ce', 'a:2:{s:7:\"version\";s:10:\"1592159412\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":11:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2019-06-01\";s:10:\"date_start\";s:19:\"2019-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2019-06-02\";s:10:\"date_start\";s:19:\"2019-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2019-06-03\";s:10:\"date_start\";s:19:\"2019-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2019-06-04\";s:10:\"date_start\";s:19:\"2019-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2019-06-05\";s:10:\"date_start\";s:19:\"2019-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2019-06-06\";s:10:\"date_start\";s:19:\"2019-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2019-06-07\";s:10:\"date_start\";s:19:\"2019-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2019-06-08\";s:10:\"date_start\";s:19:\"2019-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2019-06-09\";s:10:\"date_start\";s:19:\"2019-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2019-06-10\";s:10:\"date_start\";s:19:\"2019-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2019-06-11\";s:10:\"date_start\";s:19:\"2019-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2019-06-12\";s:10:\"date_start\";s:19:\"2019-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2019-06-13\";s:10:\"date_start\";s:19:\"2019-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2019-06-14\";s:10:\"date_start\";s:19:\"2019-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":10:{s:11:\"net_revenue\";d:0;s:15:\"avg_order_value\";d:0;s:12:\"orders_count\";i:0;s:19:\"avg_items_per_order\";d:0;s:14:\"num_items_sold\";i:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:23:\"num_returning_customers\";i:0;s:17:\"num_new_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(826, '_transient_timeout_wc_report_downloads_stats_5b814a77d14e4c363bbeefaafc261c56', '1592764216', 'no'),
(818, '_transient_timeout_wc_report_coupons_stats_70945b1236346760e2a1f9880a7e8b28', '1592764215', 'no'),
(819, '_transient_wc_report_coupons_stats_70945b1236346760e2a1f9880a7e8b28', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2019-06-01\";s:10:\"date_start\";s:19:\"2019-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2019-06-02\";s:10:\"date_start\";s:19:\"2019-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2019-06-03\";s:10:\"date_start\";s:19:\"2019-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2019-06-04\";s:10:\"date_start\";s:19:\"2019-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2019-06-05\";s:10:\"date_start\";s:19:\"2019-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2019-06-06\";s:10:\"date_start\";s:19:\"2019-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2019-06-07\";s:10:\"date_start\";s:19:\"2019-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2019-06-08\";s:10:\"date_start\";s:19:\"2019-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2019-06-09\";s:10:\"date_start\";s:19:\"2019-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2019-06-10\";s:10:\"date_start\";s:19:\"2019-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2019-06-11\";s:10:\"date_start\";s:19:\"2019-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2019-06-12\";s:10:\"date_start\";s:19:\"2019-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2019-06-13\";s:10:\"date_start\";s:19:\"2019-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2019-06-14\";s:10:\"date_start\";s:19:\"2019-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(820, '_transient_timeout_wc_report_coupons_stats_5302c5cbc3a07361b0e646253f3868e5', '1592764215', 'no'),
(821, '_transient_wc_report_coupons_stats_5302c5cbc3a07361b0e646253f3868e5', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2020-06-01\";s:10:\"date_start\";s:19:\"2020-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2020-06-02\";s:10:\"date_start\";s:19:\"2020-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2020-06-03\";s:10:\"date_start\";s:19:\"2020-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2020-06-04\";s:10:\"date_start\";s:19:\"2020-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2020-06-05\";s:10:\"date_start\";s:19:\"2020-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2020-06-06\";s:10:\"date_start\";s:19:\"2020-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2020-06-07\";s:10:\"date_start\";s:19:\"2020-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2020-06-08\";s:10:\"date_start\";s:19:\"2020-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2020-06-09\";s:10:\"date_start\";s:19:\"2020-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2020-06-10\";s:10:\"date_start\";s:19:\"2020-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2020-06-11\";s:10:\"date_start\";s:19:\"2020-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2020-06-12\";s:10:\"date_start\";s:19:\"2020-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2020-06-13\";s:10:\"date_start\";s:19:\"2020-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2020-06-14\";s:10:\"date_start\";s:19:\"2020-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":4:{s:6:\"amount\";d:0;s:13:\"coupons_count\";i:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(822, '_transient_timeout_wc_report_taxes_stats_a20bd60def8fbb67e204c712c02e5669', '1592764215', 'no'),
(823, '_transient_timeout_wc_report_taxes_stats_dbee19f0294b4dd2c8319ff67edf5051', '1592764215', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(824, '_transient_wc_report_taxes_stats_a20bd60def8fbb67e204c712c02e5669', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2020-06-01\";s:10:\"date_start\";s:19:\"2020-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2020-06-02\";s:10:\"date_start\";s:19:\"2020-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2020-06-03\";s:10:\"date_start\";s:19:\"2020-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2020-06-04\";s:10:\"date_start\";s:19:\"2020-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2020-06-05\";s:10:\"date_start\";s:19:\"2020-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2020-06-06\";s:10:\"date_start\";s:19:\"2020-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2020-06-07\";s:10:\"date_start\";s:19:\"2020-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2020-06-08\";s:10:\"date_start\";s:19:\"2020-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2020-06-09\";s:10:\"date_start\";s:19:\"2020-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2020-06-10\";s:10:\"date_start\";s:19:\"2020-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2020-06-11\";s:10:\"date_start\";s:19:\"2020-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2020-06-12\";s:10:\"date_start\";s:19:\"2020-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2020-06-13\";s:10:\"date_start\";s:19:\"2020-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2020-06-14\";s:10:\"date_start\";s:19:\"2020-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(825, '_transient_wc_report_taxes_stats_dbee19f0294b4dd2c8319ff67edf5051', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2019-06-01\";s:10:\"date_start\";s:19:\"2019-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:1;a:6:{s:8:\"interval\";s:10:\"2019-06-02\";s:10:\"date_start\";s:19:\"2019-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:2;a:6:{s:8:\"interval\";s:10:\"2019-06-03\";s:10:\"date_start\";s:19:\"2019-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:3;a:6:{s:8:\"interval\";s:10:\"2019-06-04\";s:10:\"date_start\";s:19:\"2019-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:4;a:6:{s:8:\"interval\";s:10:\"2019-06-05\";s:10:\"date_start\";s:19:\"2019-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:5;a:6:{s:8:\"interval\";s:10:\"2019-06-06\";s:10:\"date_start\";s:19:\"2019-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:6;a:6:{s:8:\"interval\";s:10:\"2019-06-07\";s:10:\"date_start\";s:19:\"2019-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:7;a:6:{s:8:\"interval\";s:10:\"2019-06-08\";s:10:\"date_start\";s:19:\"2019-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:8;a:6:{s:8:\"interval\";s:10:\"2019-06-09\";s:10:\"date_start\";s:19:\"2019-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:9;a:6:{s:8:\"interval\";s:10:\"2019-06-10\";s:10:\"date_start\";s:19:\"2019-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:10;a:6:{s:8:\"interval\";s:10:\"2019-06-11\";s:10:\"date_start\";s:19:\"2019-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:11;a:6:{s:8:\"interval\";s:10:\"2019-06-12\";s:10:\"date_start\";s:19:\"2019-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:12;a:6:{s:8:\"interval\";s:10:\"2019-06-13\";s:10:\"date_start\";s:19:\"2019-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}i:13;a:6:{s:8:\"interval\";s:10:\"2019-06-14\";s:10:\"date_start\";s:19:\"2019-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":6:{s:9:\"tax_codes\";i:0;s:9:\"total_tax\";d:0;s:9:\"order_tax\";d:0;s:12:\"shipping_tax\";d:0;s:12:\"orders_count\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(827, '_transient_wc_report_downloads_stats_5b814a77d14e4c363bbeefaafc261c56', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2019-06-01\";s:10:\"date_start\";s:19:\"2019-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:1;a:6:{s:8:\"interval\";s:10:\"2019-06-02\";s:10:\"date_start\";s:19:\"2019-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:2;a:6:{s:8:\"interval\";s:10:\"2019-06-03\";s:10:\"date_start\";s:19:\"2019-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:3;a:6:{s:8:\"interval\";s:10:\"2019-06-04\";s:10:\"date_start\";s:19:\"2019-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:4;a:6:{s:8:\"interval\";s:10:\"2019-06-05\";s:10:\"date_start\";s:19:\"2019-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:5;a:6:{s:8:\"interval\";s:10:\"2019-06-06\";s:10:\"date_start\";s:19:\"2019-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:6;a:6:{s:8:\"interval\";s:10:\"2019-06-07\";s:10:\"date_start\";s:19:\"2019-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:7;a:6:{s:8:\"interval\";s:10:\"2019-06-08\";s:10:\"date_start\";s:19:\"2019-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:8;a:6:{s:8:\"interval\";s:10:\"2019-06-09\";s:10:\"date_start\";s:19:\"2019-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:9;a:6:{s:8:\"interval\";s:10:\"2019-06-10\";s:10:\"date_start\";s:19:\"2019-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:10;a:6:{s:8:\"interval\";s:10:\"2019-06-11\";s:10:\"date_start\";s:19:\"2019-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:11;a:6:{s:8:\"interval\";s:10:\"2019-06-12\";s:10:\"date_start\";s:19:\"2019-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:12;a:6:{s:8:\"interval\";s:10:\"2019-06-13\";s:10:\"date_start\";s:19:\"2019-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:13;a:6:{s:8:\"interval\";s:10:\"2019-06-14\";s:10:\"date_start\";s:19:\"2019-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2019-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2019-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2019-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(828, '_transient_timeout_wc_report_downloads_stats_a3d32615b18bfb87ee6c05cfbf759673', '1592764217', 'no'),
(829, '_transient_wc_report_downloads_stats_a3d32615b18bfb87ee6c05cfbf759673', 'a:2:{s:7:\"version\";s:10:\"1592159413\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}s:9:\"intervals\";a:14:{i:0;a:6:{s:8:\"interval\";s:10:\"2020-06-01\";s:10:\"date_start\";s:19:\"2020-06-01 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-05-31 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-01 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-01 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:1;a:6:{s:8:\"interval\";s:10:\"2020-06-02\";s:10:\"date_start\";s:19:\"2020-06-02 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-01 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-02 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-02 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:2;a:6:{s:8:\"interval\";s:10:\"2020-06-03\";s:10:\"date_start\";s:19:\"2020-06-03 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-02 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-03 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-03 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:3;a:6:{s:8:\"interval\";s:10:\"2020-06-04\";s:10:\"date_start\";s:19:\"2020-06-04 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-03 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-04 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-04 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:4;a:6:{s:8:\"interval\";s:10:\"2020-06-05\";s:10:\"date_start\";s:19:\"2020-06-05 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-04 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-05 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-05 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:5;a:6:{s:8:\"interval\";s:10:\"2020-06-06\";s:10:\"date_start\";s:19:\"2020-06-06 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-05 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-06 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-06 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:6;a:6:{s:8:\"interval\";s:10:\"2020-06-07\";s:10:\"date_start\";s:19:\"2020-06-07 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-06 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-07 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-07 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:7;a:6:{s:8:\"interval\";s:10:\"2020-06-08\";s:10:\"date_start\";s:19:\"2020-06-08 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-07 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-08 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-08 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:8;a:6:{s:8:\"interval\";s:10:\"2020-06-09\";s:10:\"date_start\";s:19:\"2020-06-09 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-08 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-09 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-09 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:9;a:6:{s:8:\"interval\";s:10:\"2020-06-10\";s:10:\"date_start\";s:19:\"2020-06-10 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-09 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-10 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-10 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:10;a:6:{s:8:\"interval\";s:10:\"2020-06-11\";s:10:\"date_start\";s:19:\"2020-06-11 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-10 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-11 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-11 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:11;a:6:{s:8:\"interval\";s:10:\"2020-06-12\";s:10:\"date_start\";s:19:\"2020-06-12 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-11 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-12 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-12 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:12;a:6:{s:8:\"interval\";s:10:\"2020-06-13\";s:10:\"date_start\";s:19:\"2020-06-13 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-12 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-13 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-13 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}i:13;a:6:{s:8:\"interval\";s:10:\"2020-06-14\";s:10:\"date_start\";s:19:\"2020-06-14 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2020-06-13 22:00:00\";s:8:\"date_end\";s:19:\"2020-06-14 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2020-06-14 21:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":1:{s:14:\"download_count\";i:0;}}}s:5:\"total\";i:14;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(830, '_transient_is_multi_author', '0', 'yes'),
(184, 'category_children', 'a:0:{}', 'yes'),
(146, 'current_theme', 'Storefront', 'yes'),
(147, 'theme_mods_siteorigin-unwind', 'a:20:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:7:\"primary\";i:0;}s:10:\"custom_css\";s:3456:\"@import url(//fonts.googleapis.com/css?family=ABeeZee%3Aregular&subset=latin);     table {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }  .button,#page #infinite-handle span button,button,input[type=\"button\"],input[type=\"reset\"],input[type=\"submit\"],.woocommerce #respond input#submit,.woocommerce a.button,.woocommerce button.button,.woocommerce #page #infinite-handle span button,#page #infinite-handle span .woocommerce button,.woocommerce input.button,.woocommerce.single-product .cart button {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }        .main-navigation > div li a {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }      #mobile-navigation ul li a {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }    .posts-navigation .nav-links,.comment-navigation .nav-links { font-family: {\"font\":\"ABeeZee\",\"webfont\":true,\"category\":\"sans-serif\",\"variant\":\"regular\",\"subset\":\"latin\"} !important; }     .pagination .next,.pagination .prev {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }    .post-navigation a .sub-title {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  } .breadcrumbs,.woocommerce .woocommerce-breadcrumb {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }     #masthead .site-branding .site-title {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }    #fullscreen-search h3 {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }    .entry-meta {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }     .more-link-wrapper .more-text {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }       .blog-layout-grid .archive-entry .entry-thumbnail .thumbnail-meta a,.blog-layout-grid .archive-entry .entry-thumbnail .thumbnail-meta span {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }   .blog-layout-masonry .archive-entry .entry-thumbnail .thumbnail-meta a,.blog-layout-masonry .archive-entry .entry-thumbnail .thumbnail-meta span {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }   .blog-layout-alternate .archive-entry .entry-thumbnail .thumbnail-meta a,.blog-layout-alternate .archive-entry .entry-thumbnail .thumbnail-meta span {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }   .blog-layout-offset .archive-entry .entry-header .entry-time {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }     .archive .container > .page-header .page-title,.search .container > .page-header .page-title {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }              .archive-project .entry-project-type {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }   .jetpack-portfolio-shortcode .portfolio-entry-meta {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }        .comment-list li.comment .comment-reply-link {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }  .comment-reply-title #cancel-comment-reply-link {  font-family: \"ABeeZee\", sans-serif; font-weight: normal;  }             @media screen and (max-width: 768px) { .main-navigation .menu-toggle { display: block; } .main-navigation > div, .main-navigation > div ul, .main-navigation .shopping-cart { display: none; } } @media screen and (min-width: 769px) { #mobile-navigation { display: none !important; } .main-navigation > div ul { display: block; } .main-navigation .shopping-cart { display: inline-block; } .main-navigation .menu-toggle { display: none; } }\";s:14:\"custom_css_key\";s:32:\"b1c00968b91a8f9d327b55458c67f4e7\";s:18:\"custom_css_post_id\";i:-1;s:27:\"page_settings_template_home\";a:2:{s:6:\"layout\";s:10:\"full-width\";s:15:\"masthead_margin\";b:1;}s:11:\"custom_logo\";i:14;s:16:\"background_color\";s:6:\"ffffff\";s:16:\"background_image\";s:72:\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/back.jpg\";s:15:\"background_size\";s:5:\"cover\";s:32:\"theme_settings_navigation_search\";b:1;s:34:\"theme_settings_layout_main_sidebar\";s:5:\"right\";s:35:\"theme_settings_blog_featured_slider\";b:0;s:34:\"theme_settings_blog_archive_layout\";s:7:\"masonry\";s:29:\"page_settings_template_author\";a:1:{s:6:\"layout\";s:10:\"full-width\";}s:28:\"theme_settings_branding_logo\";i:13;s:35:\"theme_settings_branding_retina_logo\";i:13;s:35:\"theme_settings_blog_archive_content\";s:4:\"full\";s:26:\"page_settings_template_404\";a:1:{s:6:\"layout\";s:7:\"default\";}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1586270416;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:12:\"main-sidebar\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:14:\"footer-sidebar\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:16:\"masthead-sidebar\";a:0:{}}}}', 'yes'),
(148, 'theme_switched', '', 'yes'),
(157, '_transient_siteorigin_unwind_categories', '1', 'yes'),
(159, 'theme_mods_hello-elementor', 'a:4:{s:18:\"custom_css_post_id\";i:-1;s:11:\"custom_logo\";i:20;s:18:\"nav_menu_locations\";a:1:{s:6:\"menu-1\";i:0;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1586270713;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";}s:12:\"main-sidebar\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:14:\"footer-sidebar\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:16:\"masthead-sidebar\";a:0:{}}}}', 'yes'),
(162, 'customize_stashed_theme_mods', 'a:0:{}', 'no'),
(747, '_transient_wc_featured_products', 'a:0:{}', 'no'),
(748, '_transient_timeout_wc_products_onsale', '1594545488', 'no'),
(749, '_transient_wc_products_onsale', 'a:0:{}', 'no'),
(750, '_transient_timeout_wc_product_loop_6147550c3f3af9236789687d89ed040c', '1594545488', 'no'),
(751, '_transient_wc_product_loop_6147550c3f3af9236789687d89ed040c', 'a:2:{s:7:\"version\";s:10:\"1586439426\";s:5:\"value\";O:8:\"stdClass\":5:{s:3:\"ids\";a:2:{i:0;i:90;i:1;i:81;}s:5:\"total\";i:2;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:2;s:12:\"current_page\";i:1;}}', 'no'),
(164, 'theme_mods_twentynineteen', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(165, 'theme_mods_twentyseventeen', 'a:6:{s:18:\"custom_css_post_id\";i:-1;s:21:\"external_header_video\";s:43:\"https://www.youtube.com/watch?v=16rl8djGOeI\";s:11:\"custom_logo\";i:26;s:11:\"page_layout\";s:10:\"one-column\";s:7:\"panel_1\";i:42;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1586434160;s:4:\"data\";a:5:{s:19:\"wp_inactive_widgets\";a:4:{i:0;s:6:\"text-2\";i:1;s:6:\"text-3\";i:2;s:12:\"categories-2\";i:3;s:10:\"archives-2\";}s:12:\"main-sidebar\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:14:\"footer-sidebar\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:16:\"masthead-sidebar\";a:0:{}s:9:\"sidebar-2\";a:2:{i:0;s:6:\"meta-2\";i:1;s:12:\"categories-4\";}}}}', 'yes'),
(227, 'woocommerce_store_city', 'Marseille', 'yes'),
(228, 'woocommerce_default_country', 'FR:*', 'yes'),
(189, '_transient_twentyseventeen_categories', '1', 'yes'),
(732, '_transient_timeout_wc_shipping_method_count_legacy', '1594545391', 'no'),
(229, 'woocommerce_store_postcode', '13008', 'yes'),
(230, 'woocommerce_allowed_countries', 'all', 'yes'),
(231, 'woocommerce_all_except_countries', '', 'yes'),
(232, 'woocommerce_specific_allowed_countries', '', 'yes'),
(233, 'woocommerce_ship_to_countries', '', 'yes'),
(234, 'woocommerce_specific_ship_to_countries', '', 'yes'),
(235, 'woocommerce_default_customer_address', 'base', 'yes'),
(236, 'woocommerce_calc_taxes', 'yes', 'yes'),
(237, 'woocommerce_enable_coupons', 'yes', 'yes'),
(238, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(239, 'woocommerce_currency', 'EUR', 'yes'),
(240, 'woocommerce_currency_pos', 'right', 'yes'),
(241, 'woocommerce_price_thousand_sep', ' ', 'yes'),
(211, 'storefront_nux_fresh_site', '0', 'yes'),
(212, 'storefront_nux_guided_tour', '1', 'yes'),
(213, 'theme_mods_storefront', 'a:4:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:0:{}s:11:\"custom_logo\";i:97;s:32:\"storefront_button_alt_text_color\";s:7:\"#81d742\";}', 'yes'),
(393, 'mailchimp_woocommerce_version', '2.3.6', 'no'),
(394, 'mailchimp-woocommerce', 'a:2:{s:33:\"woocommerce_settings_save_general\";b:1;s:19:\"store_currency_code\";s:3:\"EUR\";}', 'yes'),
(395, 'mailchimp-woocommerce-store_id', '5e8f1197c2973', 'yes'),
(396, 'mailchimp-woocommerce-store-id-last-verified', '1592396569', 'yes'),
(399, 'mailchimp-woocommerce_cart_table_add_index_update', '1', 'yes'),
(403, 'wc_stripe_show_sca_notice', 'no', 'yes'),
(404, 'wc_stripe_version', '4.3.3', 'yes'),
(851, '_transient_timeout__woocommerce_helper_updates', '1592426301', 'no'),
(852, '_transient__woocommerce_helper_updates', 'a:4:{s:4:\"hash\";s:32:\"358c40eaa335ac0d027f3e9faa3c726e\";s:7:\"updated\";i:1592383101;s:8:\"products\";a:0:{}s:6:\"errors\";a:1:{i:0;s:10:\"http-error\";}}', 'no'),
(778, '_transient_timeout_wc_low_stock_count', '1594751394', 'no'),
(779, '_transient_wc_low_stock_count', '0', 'no'),
(780, '_transient_timeout_wc_outofstock_count', '1594751394', 'no'),
(781, '_transient_wc_outofstock_count', '0', 'no'),
(244, 'woocommerce_shop_page_id', '58', 'yes'),
(245, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(246, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(247, 'woocommerce_placeholder_image', '57', 'yes'),
(248, 'woocommerce_weight_unit', 'kg', 'yes'),
(249, 'woocommerce_dimension_unit', 'cm', 'yes'),
(250, 'woocommerce_enable_reviews', 'yes', 'yes'),
(251, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(252, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(253, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(254, 'woocommerce_review_rating_required', 'yes', 'no'),
(255, 'woocommerce_manage_stock', 'yes', 'yes'),
(256, 'woocommerce_hold_stock_minutes', '60', 'no'),
(257, 'woocommerce_notify_low_stock', 'yes', 'no'),
(258, 'woocommerce_notify_no_stock', 'yes', 'no'),
(259, 'woocommerce_stock_email_recipient', 'jonathanprevedan@laplateforme.io', 'no'),
(260, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(261, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(262, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(263, 'woocommerce_stock_format', '', 'yes'),
(264, 'woocommerce_file_download_method', 'force', 'no'),
(265, 'woocommerce_downloads_require_login', 'no', 'no'),
(266, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(267, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(268, 'woocommerce_prices_include_tax', 'no', 'yes'),
(269, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(270, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(271, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(272, 'woocommerce_tax_classes', '', 'yes'),
(273, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(274, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(275, 'woocommerce_price_display_suffix', '', 'yes'),
(276, 'woocommerce_tax_total_display', 'itemized', 'no'),
(277, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(278, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(279, 'woocommerce_ship_to_destination', 'billing', 'no'),
(280, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(281, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(282, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(283, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(284, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(285, 'woocommerce_registration_generate_username', 'yes', 'no'),
(286, 'woocommerce_registration_generate_password', 'yes', 'no'),
(287, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(288, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(289, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(290, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(291, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(292, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(293, 'woocommerce_trash_pending_orders', '', 'no'),
(294, 'woocommerce_trash_failed_orders', '', 'no'),
(295, 'woocommerce_trash_cancelled_orders', '', 'no'),
(296, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(297, 'woocommerce_email_from_name', 'MaLiseuse.fr', 'no'),
(298, 'woocommerce_email_from_address', 'jonathanprevedan@laplateforme.io', 'no'),
(299, 'woocommerce_email_header_image', '', 'no'),
(300, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(301, 'woocommerce_email_base_color', '#96588a', 'no'),
(302, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(303, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(304, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(305, 'woocommerce_cart_page_id', '59', 'no'),
(306, 'woocommerce_checkout_page_id', '60', 'no'),
(307, 'woocommerce_myaccount_page_id', '61', 'no'),
(308, 'woocommerce_terms_page_id', '', 'no'),
(309, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(310, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(311, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(312, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(313, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(314, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(315, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(316, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(317, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(318, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(319, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(320, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(321, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(322, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(323, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(324, 'woocommerce_api_enabled', 'no', 'yes'),
(325, 'woocommerce_allow_tracking', 'no', 'no'),
(326, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(327, 'woocommerce_single_image_width', '600', 'yes'),
(328, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(329, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(330, 'woocommerce_demo_store', 'no', 'no'),
(331, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}', 'yes'),
(332, 'current_theme_supports_woocommerce', 'yes', 'yes'),
(333, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(334, '_transient_wc_attribute_taxonomies', 'a:0:{}', 'yes'),
(552, 'product_cat_children', 'a:0:{}', 'yes'),
(336, 'default_product_cat', '15', 'yes'),
(743, '_transient_timeout_wc_term_counts', '1594751450', 'no'),
(738, '_site_transient_timeout_php_check_6b697d679328a3c033f27d9ce3f7f22b', '1592558196', 'no'),
(739, '_site_transient_php_check_6b697d679328a3c033f27d9ce3f7f22b', 'a:5:{s:19:\"recommended_version\";s:3:\"7.3\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(744, '_transient_wc_term_counts', 'a:20:{i:27;s:1:\"3\";i:32;s:1:\"1\";i:21;s:1:\"2\";i:15;s:1:\"0\";i:36;s:1:\"1\";i:35;s:1:\"1\";i:17;s:1:\"4\";i:37;s:1:\"1\";i:34;s:1:\"1\";i:33;s:1:\"1\";i:23;s:1:\"2\";i:25;s:1:\"1\";i:22;s:1:\"1\";i:24;s:1:\"1\";i:20;s:1:\"2\";i:26;s:1:\"1\";i:31;s:1:\"1\";i:28;s:1:\"1\";i:30;s:1:\"1\";i:29;s:1:\"1\";}', 'no'),
(752, '_transient_timeout_wc_product_loop_cd4ceb08a6a3e9bac7f4260a4e03a47f', '1594545489', 'no'),
(337, 'woocommerce_admin_notices', 'a:1:{i:0;s:20:\"no_secure_connection\";}', 'yes'),
(367, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(372, 'woocommerce_product_type', 'both', 'yes'),
(340, 'woocommerce_version', '4.0.1', 'yes'),
(341, 'woocommerce_db_version', '4.0.1', 'yes'),
(342, 'action_scheduler_lock_async-request-runner', '1592396629', 'yes'),
(343, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:\"database_prefix\";s:32:\"QwC9BSnZQZN8LD5Y7bzsALHDU8Knqwet\";}', 'yes'),
(344, '_transient_woocommerce_webhook_ids_status_active', 'a:0:{}', 'yes'),
(345, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(346, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(347, 'widget_woocommerce_layered_nav', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(348, 'widget_woocommerce_price_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(349, 'widget_woocommerce_product_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(350, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(351, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(352, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(353, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(354, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(355, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(356, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(357, 'woocommerce_onboarding_opt_in', 'no', 'yes'),
(774, '_site_transient_timeout_browser_7178962ad06c4f9758986cbf76506171', '1592764192', 'no'),
(365, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:1;s:3:\"all\";i:1;s:8:\"approved\";s:1:\"1\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(364, 'woocommerce_admin_version', '1.0.3', 'yes'),
(370, 'woocommerce_setup_ab_wc_admin_onboarding', 'a', 'yes'),
(369, 'woocommerce_admin_last_orders_milestone', '0', 'yes'),
(753, '_transient_wc_product_loop_cd4ceb08a6a3e9bac7f4260a4e03a47f', 'a:2:{s:7:\"version\";s:10:\"1586439426\";s:5:\"value\";O:8:\"stdClass\":5:{s:3:\"ids\";a:4:{i:0;i:62;i:1;i:70;i:2;i:81;i:3;i:90;}s:5:\"total\";i:4;s:11:\"total_pages\";i:1;s:8:\"per_page\";i:4;s:12:\"current_page\";i:1;}}', 'no'),
(366, 'woocommerce_admin_install_timestamp', '1586434349', 'yes'),
(400, 'woocommerce_admin_notice_facebook-for-woocommerce_install_error', 'Facebook for WooCommerce could not be installed (Impossible de copier le fichier.). <a href=\"http://localhost/MaLiseuse/wordpress/wp-admin/index.php?wc-install-plugin-redirect=facebook-for-woocommerce\">Please install it manually by clicking here.</a>', 'yes'),
(368, 'action_scheduler_migration_status', 'complete', 'yes'),
(373, 'woocommerce_sell_in_person', '1', 'yes'),
(383, 'woocommerce_ppec_paypal_settings', 'a:3:{s:7:\"enabled\";s:3:\"yes\";s:16:\"reroute_requests\";s:3:\"yes\";s:5:\"email\";s:32:\"jonathanprevedan@laplateforme.io\";}', 'yes'),
(398, 'mailchimp_woocommerce_db_mailchimp_carts', '1', 'no'),
(402, 'wc_stripe_show_style_notice', 'no', 'yes'),
(381, 'woocommerce_stripe_settings', 'a:3:{s:7:\"enabled\";s:3:\"yes\";s:14:\"create_account\";s:3:\"yes\";s:5:\"email\";s:32:\"jonathanprevedan@laplateforme.io\";}', 'yes'),
(384, 'woocommerce_cheque_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(385, 'woocommerce_bacs_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(386, 'woocommerce_cod_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(387, '_transient_shipping-transient-version', '1586434435', 'yes'),
(388, 'woocommerce_flat_rate_1_settings', 'a:3:{s:5:\"title\";s:9:\"Flat rate\";s:10:\"tax_status\";s:7:\"taxable\";s:4:\"cost\";s:2:\"50\";}', 'yes'),
(389, 'woocommerce_setup_automated_taxes', '1', 'yes'),
(390, 'mailchimp_woocommerce_plugin_do_activation_redirect', '', 'yes'),
(397, 'woocommerce_admin_notice_jetpack_install_error', 'Jetpack could not be installed (). <a href=\"http://localhost/MaLiseuse/wordpress/wp-admin/index.php?wc-install-plugin-redirect=jetpack\">Please install it manually by clicking here.</a>', 'yes'),
(419, 'wc_facebook_for_woocommerce_is_active', 'yes', 'yes'),
(424, 'wc_facebook_for_woocommerce_lifecycle_events', '[{\"name\":\"install\",\"time\":1586442177,\"version\":\"1.10.2\"}]', 'no'),
(425, 'wc_facebook_for_woocommerce_version', '1.10.2', 'yes'),
(614, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(618, 'woocommerce_maybe_regenerate_images_hash', '27acde77266b4d2a3491118955cb3f66', 'yes'),
(734, '_transient_timeout_wc_blocks_query_196f95fe0f1beda3ed4922f8b0505b6e', '1594751420', 'no'),
(735, '_transient_wc_blocks_query_196f95fe0f1beda3ed4922f8b0505b6e', 'a:2:{s:7:\"version\";s:10:\"1592159394\";s:5:\"value\";a:3:{i:0;i:90;i:1;i:81;i:2;i:70;}}', 'no'),
(719, 'wc_ppec_version', '1.6.20', 'yes'),
(746, '_transient_timeout_wc_featured_products', '1594545488', 'no'),
(855, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.4.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.4.2-partial-0.zip\";s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:3:\"5.4\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"fr_FR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/fr_FR/wordpress-5.4.2.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1592383104;s:15:\"version_checked\";s:3:\"5.4\";s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:4:\"core\";s:4:\"slug\";s:7:\"default\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"5.4\";s:7:\"updated\";s:19:\"2020-04-23 12:17:12\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/5.4/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}}', 'no'),
(856, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1592383105;s:7:\"checked\";a:6:{s:15:\"hello-elementor\";s:5:\"2.2.2\";s:17:\"siteorigin-unwind\";s:5:\"1.6.1\";s:10:\"storefront\";s:5:\"2.5.5\";s:14:\"twentynineteen\";s:3:\"1.5\";s:15:\"twentyseventeen\";s:3:\"2.3\";s:12:\"twentytwenty\";s:3:\"1.2\";}s:8:\"response\";a:5:{s:15:\"hello-elementor\";a:6:{s:5:\"theme\";s:15:\"hello-elementor\";s:11:\"new_version\";s:5:\"2.3.0\";s:3:\"url\";s:45:\"https://wordpress.org/themes/hello-elementor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/hello-elementor.2.3.0.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";b:0;}s:17:\"siteorigin-unwind\";a:6:{s:5:\"theme\";s:17:\"siteorigin-unwind\";s:11:\"new_version\";s:5:\"1.6.4\";s:3:\"url\";s:47:\"https://wordpress.org/themes/siteorigin-unwind/\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/theme/siteorigin-unwind.1.6.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:3:\"7.3\";}s:10:\"storefront\";a:6:{s:5:\"theme\";s:10:\"storefront\";s:11:\"new_version\";s:5:\"2.5.7\";s:3:\"url\";s:40:\"https://wordpress.org/themes/storefront/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/storefront.2.5.7.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";b:0;}s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.6.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:5:{i:0;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:15:\"hello-elementor\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"2.2.2\";s:7:\"updated\";s:19:\"2019-09-17 16:37:43\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/theme/hello-elementor/2.2.2/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:10:\"storefront\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"2.5.5\";s:7:\"updated\";s:19:\"2019-05-11 10:36:17\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/translation/theme/storefront/2.5.5/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:14:\"twentynineteen\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"1.5\";s:7:\"updated\";s:19:\"2020-04-23 12:16:20\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/translation/theme/twentynineteen/1.5/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:3;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:15:\"twentyseventeen\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"2.3\";s:7:\"updated\";s:19:\"2020-05-04 10:28:27\";s:7:\"package\";s:79:\"https://downloads.wordpress.org/translation/theme/twentyseventeen/2.3/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:4;a:7:{s:4:\"type\";s:5:\"theme\";s:4:\"slug\";s:12:\"twentytwenty\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:3:\"1.2\";s:7:\"updated\";s:19:\"2020-05-04 10:25:06\";s:7:\"package\";s:76:\"https://downloads.wordpress.org/translation/theme/twentytwenty/1.2/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}}', 'no'),
(427, '_transient_product_query-transient-version', '1592159394', 'yes'),
(428, '_transient_product-transient-version', '1586439131', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(733, '_transient_wc_shipping_method_count_legacy', 'a:2:{s:7:\"version\";s:10:\"1586434435\";s:5:\"value\";i:1;}', 'no'),
(857, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1592383105;s:7:\"checked\";a:8:{s:19:\"akismet/akismet.php\";s:5:\"4.1.4\";s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";s:6:\"1.10.2\";s:9:\"hello.php\";s:5:\"1.7.2\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:5:\"2.3.6\";s:27:\"woocommerce/woocommerce.php\";s:5:\"4.0.1\";s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";s:6:\"1.6.20\";s:45:\"woocommerce-services/woocommerce-services.php\";s:6:\"1.23.0\";s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";s:5:\"4.3.3\";}s:8:\"response\";a:7:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.6\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.6.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:38:\"w.org/plugins/facebook-for-woocommerce\";s:4:\"slug\";s:24:\"facebook-for-woocommerce\";s:6:\"plugin\";s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";s:11:\"new_version\";s:6:\"1.11.4\";s:3:\"url\";s:55:\"https://wordpress.org/plugins/facebook-for-woocommerce/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/facebook-for-woocommerce.1.11.4.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:77:\"https://ps.w.org/facebook-for-woocommerce/assets/icon-256x256.png?rev=2040223\";s:2:\"1x\";s:69:\"https://ps.w.org/facebook-for-woocommerce/assets/icon.svg?rev=2040223\";s:3:\"svg\";s:69:\"https://ps.w.org/facebook-for-woocommerce/assets/icon.svg?rev=2040223\";}s:7:\"banners\";a:0:{}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.3.4\";s:12:\"requires_php\";b:0;s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:39:\"w.org/plugins/mailchimp-for-woocommerce\";s:4:\"slug\";s:25:\"mailchimp-for-woocommerce\";s:6:\"plugin\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:11:\"new_version\";s:5:\"2.4.0\";s:3:\"url\";s:56:\"https://wordpress.org/plugins/mailchimp-for-woocommerce/\";s:7:\"package\";s:74:\"https://downloads.wordpress.org/plugin/mailchimp-for-woocommerce.2.4.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";s:2:\"1x\";s:78:\"https://ps.w.org/mailchimp-for-woocommerce/assets/icon-256x256.png?rev=1509501\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:81:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-1544x500.png?rev=1950415\";s:2:\"1x\";s:80:\"https://ps.w.org/mailchimp-for-woocommerce/assets/banner-772x250.jpg?rev=1950415\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"7.0\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"4.2.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.4.2.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2075035\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2075035\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2075035\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2075035\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"7.0\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:57:\"w.org/plugins/woocommerce-gateway-paypal-express-checkout\";s:4:\"slug\";s:43:\"woocommerce-gateway-paypal-express-checkout\";s:6:\"plugin\";s:91:\"woocommerce-gateway-paypal-express-checkout/woocommerce-gateway-paypal-express-checkout.php\";s:11:\"new_version\";s:5:\"2.0.2\";s:3:\"url\";s:74:\"https://wordpress.org/plugins/woocommerce-gateway-paypal-express-checkout/\";s:7:\"package\";s:92:\"https://downloads.wordpress.org/plugin/woocommerce-gateway-paypal-express-checkout.2.0.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:96:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/icon-256x256.png?rev=1900204\";s:2:\"1x\";s:96:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/icon-128x128.png?rev=1900204\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:99:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/banner-1544x500.png?rev=1948167\";s:2:\"1x\";s:98:\"https://ps.w.org/woocommerce-gateway-paypal-express-checkout/assets/banner-772x250.png?rev=1948167\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"5.5\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:45:\"woocommerce-services/woocommerce-services.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:34:\"w.org/plugins/woocommerce-services\";s:4:\"slug\";s:20:\"woocommerce-services\";s:6:\"plugin\";s:45:\"woocommerce-services/woocommerce-services.php\";s:11:\"new_version\";s:6:\"1.23.2\";s:3:\"url\";s:51:\"https://wordpress.org/plugins/woocommerce-services/\";s:7:\"package\";s:70:\"https://downloads.wordpress.org/plugin/woocommerce-services.1.23.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-256x256.png?rev=1910075\";s:2:\"1x\";s:73:\"https://ps.w.org/woocommerce-services/assets/icon-128x128.png?rev=1910075\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:76:\"https://ps.w.org/woocommerce-services/assets/banner-1544x500.png?rev=1962920\";s:2:\"1x\";s:75:\"https://ps.w.org/woocommerce-services/assets/banner-772x250.png?rev=1962920\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"5.3\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:40:\"w.org/plugins/woocommerce-gateway-stripe\";s:4:\"slug\";s:26:\"woocommerce-gateway-stripe\";s:6:\"plugin\";s:57:\"woocommerce-gateway-stripe/woocommerce-gateway-stripe.php\";s:11:\"new_version\";s:5:\"4.4.0\";s:3:\"url\";s:57:\"https://wordpress.org/plugins/woocommerce-gateway-stripe/\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/plugin/woocommerce-gateway-stripe.4.4.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/woocommerce-gateway-stripe/assets/icon-256x256.png?rev=1917495\";s:2:\"1x\";s:79:\"https://ps.w.org/woocommerce-gateway-stripe/assets/icon-128x128.png?rev=1917495\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:82:\"https://ps.w.org/woocommerce-gateway-stripe/assets/banner-1544x500.png?rev=1917495\";s:2:\"1x\";s:81:\"https://ps.w.org/woocommerce-gateway-stripe/assets/banner-772x250.png?rev=1917495\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.4.2\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:4:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"hello-dolly\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"1.7.2\";s:7:\"updated\";s:19:\"2018-04-27 10:03:32\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/translation/plugin/hello-dolly/1.7.2/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:11:\"woocommerce\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"4.0.1\";s:7:\"updated\";s:19:\"2020-05-02 15:44:01\";s:7:\"package\";s:78:\"https://downloads.wordpress.org/translation/plugin/woocommerce/4.0.1/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:2;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:43:\"woocommerce-gateway-paypal-express-checkout\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:6:\"1.6.20\";s:7:\"updated\";s:19:\"2020-02-06 10:44:13\";s:7:\"package\";s:111:\"https://downloads.wordpress.org/translation/plugin/woocommerce-gateway-paypal-express-checkout/1.6.20/fr_FR.zip\";s:10:\"autoupdate\";b:1;}i:3;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:26:\"woocommerce-gateway-stripe\";s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"4.3.3\";s:7:\"updated\";s:19:\"2020-04-10 12:54:31\";s:7:\"package\";s:93:\"https://downloads.wordpress.org/translation/plugin/woocommerce-gateway-stripe/4.3.3/fr_FR.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(776, '_transient_timeout_sv_wc_plugin_wc_versions', '1592764193', 'no'),
(777, '_transient_sv_wc_plugin_wc_versions', 'a:62:{i:0;s:5:\"4.2.0\";i:1;s:5:\"4.1.1\";i:2;s:5:\"4.1.0\";i:3;s:5:\"4.0.1\";i:4;s:5:\"4.0.0\";i:5;s:5:\"3.9.3\";i:6;s:5:\"3.9.2\";i:7;s:5:\"3.9.1\";i:8;s:5:\"3.9.0\";i:9;s:5:\"3.8.1\";i:10;s:5:\"3.8.0\";i:11;s:5:\"3.7.1\";i:12;s:5:\"3.7.0\";i:13;s:5:\"3.6.5\";i:14;s:5:\"3.6.4\";i:15;s:5:\"3.6.3\";i:16;s:5:\"3.6.2\";i:17;s:5:\"3.6.1\";i:18;s:5:\"3.6.0\";i:19;s:5:\"3.5.8\";i:20;s:5:\"3.5.7\";i:21;s:5:\"3.5.6\";i:22;s:5:\"3.5.5\";i:23;s:5:\"3.5.4\";i:24;s:5:\"3.5.3\";i:25;s:5:\"3.5.2\";i:26;s:5:\"3.5.1\";i:27;s:5:\"3.5.0\";i:28;s:5:\"3.4.7\";i:29;s:5:\"3.4.6\";i:30;s:5:\"3.4.5\";i:31;s:5:\"3.4.4\";i:32;s:5:\"3.4.3\";i:33;s:5:\"3.4.2\";i:34;s:5:\"3.4.1\";i:35;s:5:\"3.4.0\";i:36;s:5:\"3.3.5\";i:37;s:5:\"3.3.4\";i:38;s:5:\"3.3.3\";i:39;s:5:\"3.3.2\";i:40;s:5:\"3.3.1\";i:41;s:5:\"3.3.0\";i:42;s:5:\"3.2.6\";i:43;s:5:\"3.2.5\";i:44;s:5:\"3.2.4\";i:45;s:5:\"3.2.3\";i:46;s:5:\"3.2.2\";i:47;s:5:\"3.2.1\";i:48;s:5:\"3.2.0\";i:49;s:5:\"3.1.2\";i:50;s:5:\"3.1.1\";i:51;s:5:\"3.1.0\";i:52;s:5:\"3.0.9\";i:53;s:5:\"3.0.8\";i:54;s:5:\"3.0.7\";i:55;s:5:\"3.0.6\";i:56;s:5:\"3.0.5\";i:57;s:5:\"3.0.4\";i:58;s:5:\"3.0.3\";i:59;s:5:\"3.0.2\";i:60;s:5:\"3.0.1\";i:61;s:5:\"3.0.0\";}', 'no');

-- --------------------------------------------------------

--
-- Structure de la table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(20, 13, '_wp_attached_file', '2020/04/logoliseuse.png'),
(21, 13, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:200;s:4:\"file\";s:23:\"2020/04/logoliseuse.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:23:\"logoliseuse-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:23:\"logoliseuse-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:30:\"siteorigin-unwind-263x174-crop\";a:4:{s:4:\"file\";s:23:\"logoliseuse-200x174.png\";s:5:\"width\";i:200;s:6:\"height\";i:174;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(22, 14, '_wp_attached_file', '2020/04/cropped-logoliseuse.png'),
(23, 14, '_wp_attachment_context', 'custom-logo'),
(24, 14, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:200;s:4:\"file\";s:31:\"2020/04/cropped-logoliseuse.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"cropped-logoliseuse-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"cropped-logoliseuse-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:30:\"siteorigin-unwind-263x174-crop\";a:4:{s:4:\"file\";s:31:\"cropped-logoliseuse-200x174.png\";s:5:\"width\";i:200;s:6:\"height\";i:174;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(25, 15, '_wp_attached_file', '2020/04/back.jpg'),
(26, 15, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:672;s:6:\"height\";i:372;s:4:\"file\";s:16:\"2020/04/back.jpg\";s:5:\"sizes\";a:8:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:16:\"back-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"back-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:16:\"back-416x230.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:230;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"back-300x166.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:166;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"back-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"siteorigin-unwind-263x174-crop\";a:4:{s:4:\"file\";s:16:\"back-263x174.jpg\";s:5:\"width\";i:263;s:6:\"height\";i:174;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"siteorigin-unwind-360x238-crop\";a:4:{s:4:\"file\";s:16:\"back-360x238.jpg\";s:5:\"width\";i:360;s:6:\"height\";i:238;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:30:\"siteorigin-unwind-500x500-crop\";a:4:{s:4:\"file\";s:16:\"back-500x372.jpg\";s:5:\"width\";i:500;s:6:\"height\";i:372;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"5.6\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:22:\"Canon EOS-1Ds Mark III\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1218131478\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"75\";s:3:\"iso\";s:3:\"100\";s:13:\"shutter_speed\";s:2:\"15\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(27, 15, '_wp_attachment_is_custom_background', 'siteorigin-unwind'),
(39, 20, '_wp_attached_file', '2020/04/cropped-logoliseuse-1.png'),
(40, 20, '_wp_attachment_context', 'custom-logo'),
(41, 20, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:200;s:4:\"file\";s:33:\"2020/04/cropped-logoliseuse-1.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:30:\"siteorigin-unwind-263x174-crop\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-1-200x174.png\";s:5:\"width\";i:200;s:6:\"height\";i:174;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(52, 26, '_wp_attached_file', '2020/04/cropped-logoliseuse-2.png'),
(53, 26, '_wp_attachment_context', 'custom-logo'),
(54, 26, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:250;s:6:\"height\";i:250;s:4:\"file\";s:33:\"2020/04/cropped-logoliseuse-2.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-2-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-2-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(56, 28, '_wp_attached_file', '2020/04/cropped-logoliseuse-3.png'),
(57, 28, '_wp_attachment_context', 'site-icon'),
(58, 28, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:33:\"2020/04/cropped-logoliseuse-3.png\";s:5:\"sizes\";a:7:{s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-3-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-3-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-3-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-3-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-3-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:31:\"cropped-logoliseuse-3-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(68, 31, '_customize_changeset_uuid', '616a1cc6-dd39-45bc-afc6-76be7814a86b'),
(282, 42, '_wp_desired_post_slug', 'top-ventes'),
(72, 2, '_edit_lock', '1586439759:1'),
(73, 36, '_wp_attached_file', '2020/04/kindle.jpg'),
(74, 36, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:450;s:6:\"height\";i:400;s:4:\"file\";s:18:\"2020/04/kindle.jpg\";s:5:\"sizes\";a:6:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:18:\"kindle-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:18:\"kindle-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:18:\"kindle-416x370.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"kindle-300x267.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:267;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"kindle-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:18:\"kindle-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(75, 37, '_wp_attached_file', '2020/04/kobo.jpg'),
(76, 37, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:340;s:6:\"height\";i:340;s:4:\"file\";s:16:\"2020/04/kobo.jpg\";s:5:\"sizes\";a:5:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:16:\"kobo-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:16:\"kobo-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"kobo-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"kobo-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:16:\"kobo-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(77, 38, '_wp_attached_file', '2020/04/kindle-1.jpg'),
(78, 38, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:450;s:6:\"height\";i:400;s:4:\"file\";s:20:\"2020/04/kindle-1.jpg\";s:5:\"sizes\";a:6:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"kindle-1-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"kindle-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"kindle-1-416x370.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"kindle-1-300x267.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:267;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"kindle-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"kindle-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(280, 42, '_wp_trash_meta_status', 'draft'),
(281, 42, '_wp_trash_meta_time', '1591953394'),
(84, 42, '_edit_lock', '1586437289:1'),
(85, 45, '_wp_attached_file', '2020/04/kindle-2.jpg'),
(86, 45, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:450;s:6:\"height\";i:400;s:4:\"file\";s:20:\"2020/04/kindle-2.jpg\";s:5:\"sizes\";a:6:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"kindle-2-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"kindle-2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"kindle-2-416x370.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"kindle-2-300x267.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:267;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"kindle-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"kindle-2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(87, 46, '_wp_attached_file', '2020/04/kobo-1.jpg'),
(88, 46, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:340;s:6:\"height\";i:340;s:4:\"file\";s:18:\"2020/04/kobo-1.jpg\";s:5:\"sizes\";a:5:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:18:\"kobo-1-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:18:\"kobo-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"kobo-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"kobo-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:18:\"kobo-1-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(89, 48, '_edit_lock', '1586273818:1'),
(93, 1, '_edit_lock', '1586436596:1'),
(94, 52, '_wp_attached_file', '2020/04/kobo-2.jpg'),
(95, 52, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:340;s:6:\"height\";i:340;s:4:\"file\";s:18:\"2020/04/kobo-2.jpg\";s:5:\"sizes\";a:5:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:18:\"kobo-2-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:18:\"kobo-2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:18:\"kobo-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:18:\"kobo-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:18:\"kobo-2-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(96, 53, '_wp_attached_file', '2020/04/kindle-3.jpg'),
(97, 53, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:450;s:6:\"height\";i:400;s:4:\"file\";s:20:\"2020/04/kindle-3.jpg\";s:5:\"sizes\";a:6:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:20:\"kindle-3-324x324.jpg\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:10:\"image/jpeg\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:20:\"kindle-3-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:20:\"kindle-3-416x370.jpg\";s:5:\"width\";i:416;s:6:\"height\";i:370;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"kindle-3-300x267.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:267;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"kindle-3-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:32:\"twentyseventeen-thumbnail-avatar\";a:4:{s:4:\"file\";s:20:\"kindle-3-100x100.jpg\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(104, 57, '_wp_attached_file', 'woocommerce-placeholder.png'),
(105, 57, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:5:\"sizes\";a:7:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-416x416.png\";s:5:\"width\";i:416;s:6:\"height\";i:416;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"woocommerce-placeholder-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(106, 62, '_edit_last', '1'),
(107, 62, '_edit_lock', '1586439131:1'),
(108, 62, '_oembed_40989e7a95f322a4fbbd132c9e492df9', '{{unknown}}'),
(109, 62, '_thumbnail_id', '38'),
(110, 62, '_regular_price', '155'),
(111, 62, 'total_sales', '0'),
(112, 62, '_tax_status', 'taxable'),
(113, 62, '_tax_class', ''),
(114, 62, '_manage_stock', 'no'),
(115, 62, '_backorders', 'no'),
(116, 62, '_sold_individually', 'no'),
(117, 62, '_virtual', 'no'),
(118, 62, '_downloadable', 'no'),
(119, 62, '_download_limit', '-1'),
(120, 62, '_download_expiry', '-1'),
(121, 62, '_stock', NULL),
(122, 62, '_stock_status', 'instock'),
(123, 62, '_wc_average_rating', '0'),
(124, 62, '_wc_review_count', '0'),
(125, 62, '_product_version', '4.0.1'),
(126, 62, '_price', '155'),
(127, 63, '_wp_attached_file', '2020/04/téléchargement.png'),
(128, 63, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:28:\"2020/04/téléchargement.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:28:\"téléchargement-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:28:\"téléchargement-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:28:\"téléchargement-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:28:\"téléchargement-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:29:\"téléchargement-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:28:\"téléchargement-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:28:\"téléchargement-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:29:\"téléchargement-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:28:\"téléchargement-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:28:\"téléchargement-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:28:\"téléchargement-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(129, 64, '_wp_attached_file', '2020/04/téléchargement-1.png'),
(130, 64, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-1.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-1-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-1-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-1-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-1-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-1-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-1-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-1-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-1-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-1-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(131, 65, '_wp_attached_file', '2020/04/téléchargement-2.png'),
(132, 65, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-2.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-2-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-2-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-2-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-2-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-2-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-2-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-2-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-2-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-2-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-2-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(133, 66, '_wp_attached_file', '2020/04/téléchargement-3.png'),
(134, 66, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-3.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-3-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-3-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-3-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-3-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-3-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-3-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-3-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-3-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-3-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-3-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-3-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(135, 62, '_product_image_gallery', '64,65,66'),
(136, 58, '_edit_lock', '1586436307:1'),
(137, 71, '_wp_attached_file', '2020/04/téléchargement-4.png'),
(138, 71, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-4.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-4-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-4-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-4-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-4-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-4-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-4-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-4-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-4-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-4-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-4-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(139, 72, '_wp_attached_file', '2020/04/téléchargement-5.png'),
(140, 72, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-5.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-5-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-5-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-5-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-5-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-5-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-5-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-5-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-5-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-5-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-5-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-5-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(141, 73, '_wp_attached_file', '2020/04/téléchargement-10.png'),
(142, 73, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:31:\"2020/04/téléchargement-10.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"téléchargement-10-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-10-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-10-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"téléchargement-10-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:32:\"téléchargement-10-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-10-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:31:\"téléchargement-10-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:32:\"téléchargement-10-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:31:\"téléchargement-10-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-10-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-10-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(143, 74, '_wp_attached_file', '2020/04/téléchargement-9.png'),
(144, 74, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-9.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-9-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-9-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-9-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-9-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-9-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-9-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-9-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-9-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-9-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-9-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-9-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(145, 75, '_wp_attached_file', '2020/04/téléchargement-8.png'),
(146, 75, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-8.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-8-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-8-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-8-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-8-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-8-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-8-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-8-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-8-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-8-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-8-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-8-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(147, 76, '_wp_attached_file', '2020/04/téléchargement-7.png'),
(148, 76, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-7.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-7-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-7-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-7-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-7-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-7-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-7-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-7-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-7-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-7-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-7-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-7-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(149, 77, '_wp_attached_file', '2020/04/téléchargement-6.png'),
(150, 77, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:30:\"2020/04/téléchargement-6.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:30:\"téléchargement-6-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-6-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-6-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:30:\"téléchargement-6-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:31:\"téléchargement-6-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-6-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:30:\"téléchargement-6-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:31:\"téléchargement-6-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:30:\"téléchargement-6-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:30:\"téléchargement-6-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:30:\"téléchargement-6-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(151, 70, '_edit_last', '1'),
(152, 70, '_thumbnail_id', '72'),
(153, 70, '_regular_price', '179.99'),
(154, 70, 'total_sales', '0'),
(155, 70, '_tax_status', 'taxable'),
(156, 70, '_tax_class', ''),
(157, 70, '_manage_stock', 'no'),
(158, 70, '_backorders', 'no'),
(159, 70, '_sold_individually', 'no'),
(160, 70, '_virtual', 'no'),
(161, 70, '_downloadable', 'no'),
(162, 70, '_download_limit', '-1'),
(163, 70, '_download_expiry', '-1'),
(164, 70, '_stock', NULL),
(165, 70, '_stock_status', 'instock'),
(166, 70, '_wc_average_rating', '0'),
(167, 70, '_wc_review_count', '0'),
(168, 70, '_product_version', '4.0.1'),
(169, 70, '_price', '179.99'),
(170, 70, '_product_image_gallery', '73,74,76'),
(171, 70, '_edit_lock', '1592159734:1'),
(174, 82, '_wp_attached_file', '2020/04/téléchargement-11.png');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(175, 82, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:31:\"2020/04/téléchargement-11.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"téléchargement-11-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-11-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-11-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"téléchargement-11-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:32:\"téléchargement-11-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-11-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:31:\"téléchargement-11-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:32:\"téléchargement-11-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:31:\"téléchargement-11-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-11-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-11-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(176, 83, '_wp_attached_file', '2020/04/téléchargement-15.png'),
(177, 83, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:31:\"2020/04/téléchargement-15.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"téléchargement-15-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-15-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-15-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"téléchargement-15-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:32:\"téléchargement-15-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-15-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:31:\"téléchargement-15-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:32:\"téléchargement-15-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:31:\"téléchargement-15-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-15-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-15-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(178, 84, '_wp_attached_file', '2020/04/téléchargement-14.png'),
(179, 84, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:31:\"2020/04/téléchargement-14.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"téléchargement-14-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-14-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-14-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"téléchargement-14-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:32:\"téléchargement-14-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-14-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:31:\"téléchargement-14-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:32:\"téléchargement-14-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:31:\"téléchargement-14-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-14-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-14-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(180, 85, '_wp_attached_file', '2020/04/téléchargement-13.png'),
(181, 85, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:31:\"2020/04/téléchargement-13.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"téléchargement-13-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-13-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-13-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"téléchargement-13-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:32:\"téléchargement-13-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-13-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:31:\"téléchargement-13-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:32:\"téléchargement-13-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:31:\"téléchargement-13-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-13-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-13-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(182, 86, '_wp_attached_file', '2020/04/téléchargement-12.png'),
(183, 86, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1660;s:6:\"height\";i:923;s:4:\"file\";s:31:\"2020/04/téléchargement-12.png\";s:5:\"sizes\";a:11:{s:21:\"woocommerce_thumbnail\";a:5:{s:4:\"file\";s:31:\"téléchargement-12-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-12-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:18:\"woocommerce_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-12-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"téléchargement-12-300x167.png\";s:5:\"width\";i:300;s:6:\"height\";i:167;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:32:\"téléchargement-12-1024x569.png\";s:5:\"width\";i:1024;s:6:\"height\";i:569;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-12-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:31:\"téléchargement-12-768x427.png\";s:5:\"width\";i:768;s:6:\"height\";i:427;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:32:\"téléchargement-12-1536x854.png\";s:5:\"width\";i:1536;s:6:\"height\";i:854;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"shop_catalog\";a:5:{s:4:\"file\";s:31:\"téléchargement-12-324x324.png\";s:5:\"width\";i:324;s:6:\"height\";i:324;s:9:\"mime-type\";s:9:\"image/png\";s:9:\"uncropped\";b:0;}s:11:\"shop_single\";a:4:{s:4:\"file\";s:31:\"téléchargement-12-416x231.png\";s:5:\"width\";i:416;s:6:\"height\";i:231;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:31:\"téléchargement-12-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(184, 81, '_edit_last', '1'),
(185, 81, '_thumbnail_id', '82'),
(186, 81, 'total_sales', '0'),
(187, 81, '_tax_status', 'taxable'),
(188, 81, '_tax_class', ''),
(189, 81, '_manage_stock', 'no'),
(190, 81, '_backorders', 'no'),
(191, 81, '_sold_individually', 'no'),
(192, 81, '_virtual', 'no'),
(193, 81, '_downloadable', 'no'),
(194, 81, '_download_limit', '-1'),
(195, 81, '_download_expiry', '-1'),
(196, 81, '_stock', NULL),
(197, 81, '_stock_status', 'instock'),
(198, 81, '_wc_average_rating', '0'),
(199, 81, '_wc_review_count', '0'),
(200, 81, '_product_version', '4.0.1'),
(201, 81, '_product_image_gallery', '83,84,85,86'),
(202, 81, '_edit_lock', '1586437037:1'),
(203, 81, '_regular_price', '139.99'),
(204, 81, '_price', '139.99'),
(206, 91, '_wp_attached_file', '2020/04/sav.png'),
(207, 91, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:299;s:6:\"height\";i:290;s:4:\"file\";s:15:\"2020/04/sav.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:15:\"sav-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:15:\"sav-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:15:\"sav-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(208, 90, '_edit_last', '1'),
(209, 90, '_thumbnail_id', '91'),
(210, 90, '_regular_price', '0'),
(211, 90, 'total_sales', '0'),
(212, 90, '_tax_status', 'taxable'),
(213, 90, '_tax_class', ''),
(214, 90, '_manage_stock', 'no'),
(215, 90, '_backorders', 'no'),
(216, 90, '_sold_individually', 'no'),
(217, 90, '_virtual', 'no'),
(218, 90, '_downloadable', 'no'),
(219, 90, '_download_limit', '-1'),
(220, 90, '_download_expiry', '-1'),
(221, 90, '_stock', NULL),
(222, 90, '_stock_status', 'instock'),
(223, 90, '_wc_average_rating', '0'),
(224, 90, '_wc_review_count', '0'),
(225, 90, '_product_version', '4.0.1'),
(226, 90, '_price', '0'),
(227, 90, '_edit_lock', '1586438180:1'),
(228, 92, '_menu_item_type', 'post_type'),
(229, 92, '_menu_item_menu_item_parent', '0'),
(230, 92, '_menu_item_object_id', '61'),
(231, 92, '_menu_item_object', 'page'),
(232, 92, '_menu_item_target', ''),
(233, 92, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(234, 92, '_menu_item_xfn', ''),
(235, 92, '_menu_item_url', ''),
(266, 96, '_wp_attachment_context', 'custom-header'),
(237, 93, '_menu_item_type', 'post_type'),
(238, 93, '_menu_item_menu_item_parent', '0'),
(239, 93, '_menu_item_object_id', '60'),
(240, 93, '_menu_item_object', 'page'),
(241, 93, '_menu_item_target', ''),
(242, 93, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(243, 93, '_menu_item_xfn', ''),
(244, 93, '_menu_item_url', ''),
(246, 94, '_menu_item_type', 'post_type'),
(247, 94, '_menu_item_menu_item_parent', '0'),
(248, 94, '_menu_item_object_id', '58'),
(249, 94, '_menu_item_object', 'page'),
(250, 94, '_menu_item_target', ''),
(251, 94, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(252, 94, '_menu_item_xfn', ''),
(253, 94, '_menu_item_url', ''),
(265, 96, '_wp_attached_file', '2020/04/cropped-logoliseuse-4.png'),
(255, 95, '_menu_item_type', 'post_type'),
(256, 95, '_menu_item_menu_item_parent', '0'),
(257, 95, '_menu_item_object_id', '48'),
(258, 95, '_menu_item_object', 'page'),
(259, 95, '_menu_item_target', ''),
(260, 95, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(261, 95, '_menu_item_xfn', ''),
(262, 95, '_menu_item_url', ''),
(264, 61, '_edit_lock', '1586439309:1'),
(267, 96, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:200;s:4:\"file\";s:33:\"2020/04/cropped-logoliseuse-4.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-4-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-4-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:33:\"cropped-logoliseuse-4-100x100.png\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(271, 97, '_wp_attachment_context', 'custom-logo'),
(270, 97, '_wp_attached_file', '2020/04/cropped-logoliseuse-5.png'),
(272, 97, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:200;s:6:\"height\";i:46;s:4:\"file\";s:33:\"2020/04/cropped-logoliseuse-5.png\";s:5:\"sizes\";a:3:{s:29:\"woocommerce_gallery_thumbnail\";a:4:{s:4:\"file\";s:32:\"cropped-logoliseuse-5-100x46.png\";s:5:\"width\";i:100;s:6:\"height\";i:46;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"cropped-logoliseuse-5-150x46.png\";s:5:\"width\";i:150;s:6:\"height\";i:46;s:9:\"mime-type\";s:9:\"image/png\";}s:14:\"shop_thumbnail\";a:4:{s:4:\"file\";s:32:\"cropped-logoliseuse-5-100x46.png\";s:5:\"width\";i:100;s:6:\"height\";i:46;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}');

-- --------------------------------------------------------

--
-- Structure de la table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2020-04-07 15:30:15', '2020-04-07 13:30:15', '<!-- wp:woocommerce/product-categories /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'NOS PRODUITS', '', 'publish', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2020-04-09 14:52:00', '2020-04-09 12:52:00', '', 0, 'http://localhost/MaLiseuse/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2020-04-07 15:30:15', '2020-04-07 13:30:15', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Bonjour&nbsp;! Nous sommes une entreprise qui est présente sur le marché des         \"E-book\" depuis maintenant plus de 30 ans. Nous sommes spécialisés dans la vente/conseil en direct. Mais aujourd\'hui en 2020 nous nous devons de concevoir un site internet afin de rencontrer nos plus fidèles client au quatre coins du globe. Nous sommes basés à Marseille.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote {\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote is-style-large\"><p>Nous sommes une société à échelle familiale qui peine à survire face au géants.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:group -->\n<div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">Alors j\'espère de tout mon coeur (et en va ma vie financière en jeu) de bien vouloir utilisé notre site que j\'ai crée moi même car nous utilisons un CMS (vu qu\'on a pas d\'argent pour payer un Dev, et que youtube existe).</pre>\n<!-- /wp:preformatted --></div></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:woocommerce/product-best-sellers /-->', 'A Propos', '', 'publish', 'closed', 'open', '', 'page-d-exemple', '', '', '2020-04-09 15:45:00', '2020-04-09 13:45:00', '', 0, 'http://localhost/MaLiseuse/wordpress/?page_id=2', 0, 'page', '', 0),
(34, 1, '2020-04-07 17:06:52', '2020-04-07 15:06:52', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Bonjour ! Nous sommes une entreprise qui est présente sur le marché des         \"E-book\" depuis maintenant plus de 30 ans. Nous sommes spécialisés dans la vente/conseil en direct. Mais aujourd\'hui en 2020 nous nous devons de concevoir un site internet afin de rencontrer nos plus fidèles client au quatre coins du globe. Nous sommes basés à Marseille.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Nous sommes une société à échelle familiale qui peine à survire face au géants.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>Alors j\'espère de tout mon coeur (et en va ma vie financière en jeu) de bien vouloir utilisé notre site que j\'ai crée moi même car nous utilisons un CMS (vu qu\'on a pas d\'argent pour payer un Dev, et que youtube existe).</p>\n<!-- /wp:paragraph -->', 'A Propos', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-04-07 17:06:52', '2020-04-07 15:06:52', '', 2, 'http://localhost/MaLiseuse/wordpress/2020/04/07/2-revision-v1/', 0, 'revision', '', 0),
(3, 1, '2020-04-07 15:30:15', '2020-04-07 13:30:15', '<!-- wp:heading --><h2>Qui sommes-nous ?</h2><!-- /wp:heading --><!-- wp:paragraph --><p>L’adresse de notre site Web est : http://localhost/MaLiseuse/wordpress.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Utilisation des données personnelles collectées</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Commentaires</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Quand vous laissez un commentaire sur notre site web, les données inscrites dans le formulaire de commentaire, mais aussi votre adresse IP et l’agent utilisateur de votre navigateur sont collectés pour nous aider à la détection des commentaires indésirables.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Une chaîne anonymisée créée à partir de votre adresse de messagerie (également appelée hash) peut être envoyée au service Gravatar pour vérifier si vous utilisez ce dernier. Les clauses de confidentialité du service Gravatar sont disponibles ici : https://automattic.com/privacy/. Après validation de votre commentaire, votre photo de profil sera visible publiquement à coté de votre commentaire.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Médias</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous êtes un utilisateur ou une utilisatrice enregistré·e et que vous téléversez des images sur le site web, nous vous conseillons d’éviter de téléverser des images contenant des données EXIF de coordonnées GPS. Les visiteurs de votre site web peuvent télécharger et extraire des données de localisation depuis ces images.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Formulaires de contact</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Cookies</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous déposez un commentaire sur notre site, il vous sera proposé d’enregistrer votre nom, adresse de messagerie et site web dans des cookies. C’est uniquement pour votre confort afin de ne pas avoir à saisir ces informations si vous déposez un autre commentaire plus tard. Ces cookies expirent au bout d’un an.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Si vous vous rendez sur la page de connexion, un cookie temporaire sera créé afin de déterminer si votre navigateur accepte les cookies. Il ne contient pas de données personnelles et sera supprimé automatiquement à la fermeture de votre navigateur.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Lorsque vous vous connecterez, nous mettrons en place un certain nombre de cookies pour enregistrer vos informations de connexion et vos préférences d’écran. La durée de vie d’un cookie de connexion est de deux jours, celle d’un cookie d’option d’écran est d’un an. Si vous cochez « Se souvenir de moi », votre cookie de connexion sera conservé pendant deux semaines. Si vous vous déconnectez de votre compte, le cookie de connexion sera effacé.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>En modifiant ou en publiant une publication, un cookie supplémentaire sera enregistré dans votre navigateur. Ce cookie ne comprend aucune donnée personnelle. Il indique simplement l’ID de la publication que vous venez de modifier. Il expire au bout d’un jour.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Contenu embarqué depuis d’autres sites</h3><!-- /wp:heading --><!-- wp:paragraph --><p>Les articles de ce site peuvent inclure des contenus intégrés (par exemple des vidéos, images, articles…). Le contenu intégré depuis d’autres sites se comporte de la même manière que si le visiteur se rendait sur cet autre site.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Ces sites web pourraient collecter des données sur vous, utiliser des cookies, embarquer des outils de suivis tiers, suivre vos interactions avec ces contenus embarqués si vous disposez d’un compte connecté sur leur site web.</p><!-- /wp:paragraph --><!-- wp:heading {\"level\":3} --><h3>Statistiques et mesures d’audience</h3><!-- /wp:heading --><!-- wp:heading --><h2>Utilisation et transmission de vos données personnelles</h2><!-- /wp:heading --><!-- wp:heading --><h2>Durées de stockage de vos données</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous laissez un commentaire, le commentaire et ses métadonnées sont conservés indéfiniment. Cela permet de reconnaître et approuver automatiquement les commentaires suivants au lieu de les laisser dans la file de modération.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>Pour les utilisateurs et utilisatrices qui s’enregistrent sur notre site (si cela est possible), nous stockons également les données personnelles indiquées dans leur profil. Tous les utilisateurs et utilisatrices peuvent voir, modifier ou supprimer leurs informations personnelles à tout moment (à l’exception de leur nom d’utilisateur·ice). Les gestionnaires du site peuvent aussi voir et modifier ces informations.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Les droits que vous avez sur vos données</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Si vous avez un compte ou si vous avez laissé des commentaires sur le site, vous pouvez demander à recevoir un fichier contenant toutes les données personnelles que nous possédons à votre sujet, incluant celles que vous nous avez fournies. Vous pouvez également demander la suppression des données personnelles vous concernant. Cela ne prend pas en compte les données stockées à des fins administratives, légales ou pour des raisons de sécurité.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Transmission de vos données personnelles</h2><!-- /wp:heading --><!-- wp:paragraph --><p>Les commentaires des visiteurs peuvent être vérifiés à l’aide d’un service automatisé de détection des commentaires indésirables.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Informations de contact</h2><!-- /wp:heading --><!-- wp:heading --><h2>Informations supplémentaires</h2><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Comment nous protégeons vos données</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Procédures mises en œuvre en cas de fuite de données</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Les services tiers qui nous transmettent des données</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Opérations de marketing automatisé et/ou de profilage réalisées à l’aide des données personnelles</h3><!-- /wp:heading --><!-- wp:heading {\"level\":3} --><h3>Affichage des informations liées aux secteurs soumis à des régulations spécifiques</h3><!-- /wp:heading -->', 'Politique de confidentialité', '', 'draft', 'closed', 'open', '', 'politique-de-confidentialite', '', '', '2020-04-07 15:30:15', '2020-04-07 13:30:15', '', 0, 'http://localhost/MaLiseuse/wordpress/?page_id=3', 0, 'page', '', 0),
(13, 1, '2020-04-07 16:27:31', '2020-04-07 14:27:31', '', 'logoliseuse', '', 'inherit', 'open', 'closed', '', 'logoliseuse', '', '', '2020-04-09 14:25:06', '2020-04-09 12:25:06', '', 62, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/logoliseuse.png', 0, 'attachment', 'image/png', 0),
(14, 1, '2020-04-07 16:27:40', '2020-04-07 14:27:40', 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse.png', 'cropped-logoliseuse.png', '', 'inherit', 'open', 'closed', '', 'cropped-logoliseuse-png', '', '', '2020-04-07 16:27:40', '2020-04-07 14:27:40', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse.png', 0, 'attachment', 'image/png', 0),
(15, 1, '2020-04-07 16:29:40', '2020-04-07 14:29:40', '', 'back', '', 'inherit', 'open', 'closed', '', 'back', '', '', '2020-04-07 16:29:40', '2020-04-07 14:29:40', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/back.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2020-04-07 16:40:01', '2020-04-07 14:40:01', 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-1.png', 'cropped-logoliseuse-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-logoliseuse-1-png', '', '', '2020-04-07 16:40:01', '2020-04-07 14:40:01', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-1.png', 0, 'attachment', 'image/png', 0),
(26, 1, '2020-04-07 16:51:14', '2020-04-07 14:51:14', 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-2.png', 'cropped-logoliseuse-2.png', '', 'inherit', 'open', 'closed', '', 'cropped-logoliseuse-2-png', '', '', '2020-04-07 16:51:14', '2020-04-07 14:51:14', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-2.png', 0, 'attachment', 'image/png', 0),
(28, 1, '2020-04-07 16:52:40', '2020-04-07 14:52:40', 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-3.png', 'cropped-logoliseuse-3.png', '', 'inherit', 'open', 'closed', '', 'cropped-logoliseuse-3-png', '', '', '2020-04-07 16:52:40', '2020-04-07 14:52:40', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-3.png', 0, 'attachment', 'image/png', 0),
(31, 1, '2020-04-07 17:01:17', '2020-04-07 15:01:17', '', 'Article', '', 'publish', 'closed', 'closed', '', 'article', '', '', '2020-04-07 17:01:17', '2020-04-07 15:01:17', '', 0, 'http://localhost/MaLiseuse/wordpress/?page_id=31', 0, 'page', '', 0),
(33, 1, '2020-04-07 17:01:17', '2020-04-07 15:01:17', '', 'Article', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2020-04-07 17:01:17', '2020-04-07 15:01:17', '', 31, 'http://localhost/MaLiseuse/wordpress/2020/04/07/31-revision-v1/', 0, 'revision', '', 0),
(35, 1, '2020-04-07 17:08:57', '2020-04-07 15:08:57', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Bonjour ! Nous sommes une entreprise qui est présente sur le marché des         \"E-book\" depuis maintenant plus de 30 ans. Nous sommes spécialisés dans la vente/conseil en direct. Mais aujourd\'hui en 2020 nous nous devons de concevoir un site internet afin de rencontrer nos plus fidèles client au quatre coins du globe. Nous sommes basés à Marseille.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote {\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote is-style-large\"><p>Nous sommes une société à échelle familiale qui peine à survire face au géants.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:group -->\n<div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">Alors j\'espère de tout mon coeur (et en va ma vie financière en jeu) de bien vouloir utilisé notre site que j\'ai crée moi même car nous utilisons un CMS (vu qu\'on a pas d\'argent pour payer un Dev, et que youtube existe).</pre>\n<!-- /wp:preformatted --></div></div>\n<!-- /wp:group -->', 'A Propos', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-04-07 17:08:57', '2020-04-07 15:08:57', '', 2, 'http://localhost/MaLiseuse/wordpress/2020/04/07/2-revision-v1/', 0, 'revision', '', 0),
(36, 1, '2020-04-07 17:11:27', '2020-04-07 15:11:27', '', 'kindle', '', 'inherit', 'open', 'closed', '', 'kindle', '', '', '2020-04-07 17:11:27', '2020-04-07 15:11:27', '', 2, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle.jpg', 0, 'attachment', 'image/jpeg', 0),
(37, 1, '2020-04-07 17:14:02', '2020-04-07 15:14:02', '', 'kobo', '', 'inherit', 'open', 'closed', '', 'kobo', '', '', '2020-04-07 17:14:02', '2020-04-07 15:14:02', '', 2, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo.jpg', 0, 'attachment', 'image/jpeg', 0),
(38, 1, '2020-04-07 17:14:06', '2020-04-07 15:14:06', '', 'kindle-1', '', 'inherit', 'open', 'closed', '', 'kindle-1', '', '', '2020-04-07 17:14:06', '2020-04-07 15:14:06', '', 2, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(39, 1, '2020-04-07 17:15:08', '2020-04-07 15:15:08', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Bonjour&nbsp;! Nous sommes une entreprise qui est présente sur le marché des         \"E-book\" depuis maintenant plus de 30 ans. Nous sommes spécialisés dans la vente/conseil en direct. Mais aujourd\'hui en 2020 nous nous devons de concevoir un site internet afin de rencontrer nos plus fidèles client au quatre coins du globe. Nous sommes basés à Marseille.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote {\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote is-style-large\"><p>Nous sommes une société à échelle familiale qui peine à survire face au géants.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:group -->\n<div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">Alors j\'espère de tout mon coeur (et en va ma vie financière en jeu) de bien vouloir utilisé notre site que j\'ai crée moi même car nous utilisons un CMS (vu qu\'on a pas d\'argent pour payer un Dev, et que youtube existe).</pre>\n<!-- /wp:preformatted --></div></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nos articles phare sont :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Les liseuse Kindle de chez Amazon et Les liseuse Kobo de chez la Fnac.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"ids\":[37,38],\"linkTo\":\"attachment\",\"sizeSlug\":\"medium\"} -->\n<figure class=\"wp-block-gallery columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kobo/\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo-300x300.jpg\" alt=\"\" data-id=\"37\" data-link=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kobo/\" class=\"wp-image-37\"/></a><figcaption class=\"blocks-gallery-item__caption\">Kobo</figcaption></figure></li><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kindle-1/\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-1-300x267.jpg\" alt=\"\" data-id=\"38\" data-full-url=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-1.jpg\" data-link=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kindle-1/\" class=\"wp-image-38\"/></a><figcaption class=\"blocks-gallery-item__caption\">Kindle </figcaption></figure></li></ul></figure>\n<!-- /wp:gallery -->', 'A Propos', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-04-07 17:15:08', '2020-04-07 15:15:08', '', 2, 'http://localhost/MaLiseuse/wordpress/2020/04/07/2-revision-v1/', 0, 'revision', '', 0),
(44, 1, '2020-04-07 17:33:23', '2020-04-07 15:33:23', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Bonjour&nbsp;! Nous sommes une entreprise qui est présente sur le marché des         \"E-book\" depuis maintenant plus de 30 ans. Nous sommes spécialisés dans la vente/conseil en direct. Mais aujourd\'hui en 2020 nous nous devons de concevoir un site internet afin de rencontrer nos plus fidèles client au quatre coins du globe. Nous sommes basés à Marseille.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote {\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote is-style-large\"><p>Nous sommes une société à échelle familiale qui peine à survire face au géants.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:group -->\n<div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">Alors j\'espère de tout mon coeur (et en va ma vie financière en jeu) de bien vouloir utilisé notre site que j\'ai crée moi même car nous utilisons un CMS (vu qu\'on a pas d\'argent pour payer un Dev, et que youtube existe).</pre>\n<!-- /wp:preformatted --></div></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'A Propos', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-04-07 17:33:23', '2020-04-07 15:33:23', '', 2, 'http://localhost/MaLiseuse/wordpress/2020/04/07/2-revision-v1/', 0, 'revision', '', 0),
(40, 1, '2020-04-07 17:16:03', '2020-04-07 15:16:03', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Bonjour&nbsp;! Nous sommes une entreprise qui est présente sur le marché des         \"E-book\" depuis maintenant plus de 30 ans. Nous sommes spécialisés dans la vente/conseil en direct. Mais aujourd\'hui en 2020 nous nous devons de concevoir un site internet afin de rencontrer nos plus fidèles client au quatre coins du globe. Nous sommes basés à Marseille.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote {\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote is-style-large\"><p>Nous sommes une société à échelle familiale qui peine à survire face au géants.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:group -->\n<div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">Alors j\'espère de tout mon coeur (et en va ma vie financière en jeu) de bien vouloir utilisé notre site que j\'ai crée moi même car nous utilisons un CMS (vu qu\'on a pas d\'argent pour payer un Dev, et que youtube existe).</pre>\n<!-- /wp:preformatted --></div></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Nos articles phare sont :</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Les liseuse Kindle de chez Amazon et Les liseuse Kobo de chez la Fnac.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"ids\":[\"37\",\"38\"],\"linkTo\":\"attachment\",\"sizeSlug\":\"full\",\"align\":\"center\"} -->\n<figure class=\"wp-block-gallery aligncenter columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kobo/\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo.jpg\" alt=\"\" data-id=\"37\" data-link=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kobo/\" class=\"wp-image-37\"/></a><figcaption class=\"blocks-gallery-item__caption\">Kobo</figcaption></figure></li><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kindle-1/\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-1.jpg\" alt=\"\" data-id=\"38\" data-full-url=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-1.jpg\" data-link=\"http://localhost/MaLiseuse/wordpress/page-d-exemple/kindle-1/\" class=\"wp-image-38\"/></a><figcaption class=\"blocks-gallery-item__caption\">Kindle </figcaption></figure></li></ul></figure>\n<!-- /wp:gallery -->', 'A Propos', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-04-07 17:16:03', '2020-04-07 15:16:03', '', 2, 'http://localhost/MaLiseuse/wordpress/2020/04/07/2-revision-v1/', 0, 'revision', '', 0),
(42, 1, '2020-04-07 17:32:15', '2020-04-07 15:32:15', '<!-- wp:heading {\"level\":1} -->\n<h1>Nos articles phares</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Top', '', 'trash', 'closed', 'closed', '', 'top-ventes__trashed', '', '', '2020-06-12 11:16:34', '2020-06-12 09:16:34', '', 0, 'http://localhost/MaLiseuse/wordpress/?page_id=42', 0, 'page', '', 0),
(43, 1, '2020-04-07 17:32:15', '2020-04-07 15:32:15', '', 'Top', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2020-04-07 17:32:15', '2020-04-07 15:32:15', '', 42, 'http://localhost/MaLiseuse/wordpress/2020/04/07/42-revision-v1/', 0, 'revision', '', 0),
(45, 1, '2020-04-07 17:35:07', '2020-04-07 15:35:07', '', 'kindle-2', '', 'inherit', 'open', 'closed', '', 'kindle-2', '', '', '2020-04-07 17:35:07', '2020-04-07 15:35:07', '', 42, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(46, 1, '2020-04-07 17:35:09', '2020-04-07 15:35:09', '', 'kobo-1', '', 'inherit', 'open', 'closed', '', 'kobo-1', '', '', '2020-04-07 17:35:09', '2020-04-07 15:35:09', '', 42, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(90, 1, '2020-04-09 15:16:19', '2020-04-09 13:16:19', '<h1 style=\"text-align: center;\"><strong>PRESTATION S.A.V</strong></h1>\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\nNous réalisons aussi les réparation des liseuses, pour celles qui seraient hors garantie. Garantir la qualité et notre devise, c\'est pour cela que nous travaillons uniquement avec les pièces détachées de la part des usines mère.\r\n\r\nLe dérouler est simple vous nous envoyés* votre Liseuse, notre équipe experte S.A.V réaliseront une expertise et ainsi nous vous contacterons afin de vous communiqué le tarif.\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n<h6><em>*L\'adresse est trouvable sur notre page de contact ! </em></h6>', 'Réparation de votre E-Book', '', 'publish', 'open', 'closed', '', 'reparation-de-votre-e-book', '', '', '2020-04-09 15:16:20', '2020-04-09 13:16:20', '', 0, 'http://localhost/MaLiseuse/wordpress/?post_type=product&#038;p=90', 0, 'product', '', 0),
(91, 1, '2020-04-09 15:14:50', '2020-04-09 13:14:50', '', 'sav', '', 'inherit', 'open', 'closed', '', 'sav', '', '', '2020-04-09 15:14:50', '2020-04-09 13:14:50', '', 90, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/sav.png', 0, 'attachment', 'image/png', 0),
(47, 1, '2020-04-07 17:36:23', '2020-04-07 15:36:23', '<!-- wp:heading {\"level\":1} -->\n<h1>Nos articles phares</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"ids\":[45,46],\"linkTo\":\"attachment\"} -->\n<figure class=\"wp-block-gallery columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/top/kindle-2/\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-2.jpg\" alt=\"\" data-id=\"45\" data-link=\"http://localhost/MaLiseuse/wordpress/top/kindle-2/\" class=\"wp-image-45\"/></a><figcaption class=\"blocks-gallery-item__caption\">Kindle</figcaption></figure></li><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/top/kobo-1/\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo-1.jpg\" alt=\"\" data-id=\"46\" data-full-url=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo-1.jpg\" data-link=\"http://localhost/MaLiseuse/wordpress/top/kobo-1/\" class=\"wp-image-46\"/></a><figcaption class=\"blocks-gallery-item__caption\">Kobo</figcaption></figure></li></ul></figure>\n<!-- /wp:gallery -->', 'Top', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2020-04-07 17:36:23', '2020-04-07 15:36:23', '', 42, 'http://localhost/MaLiseuse/wordpress/2020/04/07/42-revision-v1/', 0, 'revision', '', 0),
(48, 1, '2020-04-07 17:39:21', '2020-04-07 15:39:21', '<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\">L\'aventure commence lorsque Sandra m\'envoie un message afin de me demander de réaliser avec elle un projet CMS. En ce concertant nous décidons de prendre le projet \"MaLiseuse.fr\" afin de nous familiarisé avec le CMS WordPress. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"large\"} -->\n<p class=\"has-large-font-size\">C\'est ainsi que ce projet vu le jour et qu\'une aventure riche en apprentissage commença !</p>\n<!-- /wp:paragraph -->', 'Notre histoire', '', 'publish', 'closed', 'closed', '', 'notre-histoire', '', '', '2020-04-07 17:39:21', '2020-04-07 15:39:21', '', 0, 'http://localhost/MaLiseuse/wordpress/?page_id=48', 0, 'page', '', 0),
(49, 1, '2020-04-07 17:39:21', '2020-04-07 15:39:21', '<!-- wp:paragraph {\"fontSize\":\"medium\"} -->\n<p class=\"has-medium-font-size\">L\'aventure commence lorsque Sandra m\'envoie un message afin de me demander de réaliser avec elle un projet CMS. En ce concertant nous décidons de prendre le projet \"MaLiseuse.fr\" afin de nous familiarisé avec le CMS WordPress. </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"fontSize\":\"large\"} -->\n<p class=\"has-large-font-size\">C\'est ainsi que ce projet vu le jour et qu\'une aventure riche en apprentissage commença !</p>\n<!-- /wp:paragraph -->', 'Notre histoire', '', 'inherit', 'closed', 'closed', '', '48-revision-v1', '', '', '2020-04-07 17:39:21', '2020-04-07 15:39:21', '', 48, 'http://localhost/MaLiseuse/wordpress/2020/04/07/48-revision-v1/', 0, 'revision', '', 0),
(86, 1, '2020-04-09 14:55:21', '2020-04-09 12:55:21', '', 'epais', '', 'inherit', 'open', 'closed', '', 'telechargement-12', '', '', '2020-04-09 14:55:58', '2020-04-09 12:55:58', '', 81, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-12.png', 0, 'attachment', 'image/png', 0),
(52, 1, '2020-04-07 17:48:41', '2020-04-07 15:48:41', '', 'kobo-2', '', 'inherit', 'open', 'closed', '', 'kobo-2', '', '', '2020-04-07 17:48:41', '2020-04-07 15:48:41', '', 1, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2020-04-07 17:48:42', '2020-04-07 15:48:42', '', 'kindle-3', '', 'inherit', 'open', 'closed', '', 'kindle-3', '', '', '2020-04-07 17:48:42', '2020-04-07 15:48:42', '', 1, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-3.jpg', 0, 'attachment', 'image/jpeg', 0),
(83, 1, '2020-04-09 14:55:12', '2020-04-09 12:55:12', '', 'taille', '', 'inherit', 'open', 'closed', '', 'telechargement-15', '', '', '2020-04-09 14:55:36', '2020-04-09 12:55:36', '', 81, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-15.png', 0, 'attachment', 'image/png', 0),
(84, 1, '2020-04-09 14:55:15', '2020-04-09 12:55:15', '', 'fine', '', 'inherit', 'open', 'closed', '', 'telechargement-14', '', '', '2020-04-09 14:55:45', '2020-04-09 12:55:45', '', 81, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-14.png', 0, 'attachment', 'image/png', 0),
(85, 1, '2020-04-09 14:55:18', '2020-04-09 12:55:18', '', 'dos', '', 'inherit', 'open', 'closed', '', 'telechargement-13', '', '', '2020-04-09 14:55:53', '2020-04-09 12:55:53', '', 81, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-13.png', 0, 'attachment', 'image/png', 0),
(79, 1, '2020-04-09 14:52:00', '2020-04-09 12:52:00', '<!-- wp:woocommerce/product-categories /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'NOS PRODUITS', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-04-09 14:52:00', '2020-04-09 12:52:00', '', 1, 'http://localhost/MaLiseuse/wordpress/2020/04/09/1-revision-v1/', 0, 'revision', '', 0),
(103, 1, '2020-06-14 20:29:54', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2020-06-14 20:29:54', '0000-00-00 00:00:00', '', 0, 'http://localhost/MaLiseuse/wordpress/?p=103', 0, 'post', '', 0),
(81, 1, '2020-04-09 14:56:08', '2020-04-09 12:56:08', '<div class=\"best-points bottom\">\r\n<h2 class=\"best-points-title\">Les points clés</h2>\r\n<ul class=\"bestpoints-list\">\r\n 	<li class=\"bestpoints-item\">Poids Net 180 g</li>\r\n 	<li class=\"bestpoints-item\">Autonomie Jusqu\'à 1 mois</li>\r\n 	<li class=\"bestpoints-item\">Mémoire flash 8 Go</li>\r\n</ul>\r\n<ul class=\"best-points-plus\">\r\n 	<li class=\"best-points-plusItem\"><span class=\"bold\">Le + : </span>Son écran tactile ainsi que la présence de bouton mécaniques</li>\r\n</ul>\r\n</div>\r\n<div class=\"features-table\">\r\n<table class=\"characteristic\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Les + de ce modèle</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Avantages :</span> Une des seules liseuses avec écran tactile et boutons mécaniques</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Caractéristiques générales</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Taille de l\'écran (en pouces) :</span> 6</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Equivalence :</span> 15,2 cm</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Coloris :</span> Noir</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Ecran tactile :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Résolution :</span> 1448 x 1072 pixels</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Etanche :</span> Non</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Caractéristiques de lecture</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Technologie :</span> e-Ink</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Sens de lecture :</span> Vertical</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Fonctionnalités</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Luminosité ajustable :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Détail :</span> Marque-pages, Surlignage, Bloc-Notes, Dictionnaire</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Dictionnaire :</span> Oui</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Stockage</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Mémoire flash :</span> 8 Go</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Equivalence (en e-Book) :</span> Environ 6000 livres</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Lecteur de carte mémoire :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Carte(s) lue(s) :</span> Micros SD</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Compatibilités formats DRM</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">eBook :</span> ePub, PDF Adobe DRM, HTML, Txt, FB2, DJVU</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Photo :</span> JPEG, PNG, GIF, BMP, ICO, PSD</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Connectivité</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Détail :</span> Wi-Fi, Port micro USB</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Alimentation</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Autonomie :</span> Jusqu\'à 1 mois</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Dimensions</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Poids Net :</span> 180 g</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', 'Liseuse eBook Bookeen Cybook Muse HD', '', 'publish', 'open', 'closed', '', 'liseuse-ebook-bookeen-cybook-muse-hd', '', '', '2020-04-09 14:57:17', '2020-04-09 12:57:17', '', 0, 'http://localhost/MaLiseuse/wordpress/?post_type=product&#038;p=81', 0, 'product', '', 0),
(82, 1, '2020-04-09 14:55:09', '2020-04-09 12:55:09', '', 'titre', '', 'inherit', 'open', 'closed', '', 'telechargement-11', '', '', '2020-04-09 14:55:26', '2020-04-09 12:55:26', '', 81, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-11.png', 0, 'attachment', 'image/png', 0),
(54, 1, '2020-04-07 17:55:28', '2020-04-07 15:55:28', '<!-- wp:paragraph -->\n<p>Nos liseuses</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"ids\":[52,53]} -->\n<figure class=\"wp-block-gallery columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kobo-2.jpg\" alt=\"\" data-id=\"52\" data-link=\"http://localhost/MaLiseuse/wordpress/2020/04/07/bonjour-tout-le-monde/kobo-2/\" class=\"wp-image-52\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-3.jpg\" alt=\"\" data-id=\"53\" data-full-url=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/kindle-3.jpg\" data-link=\"http://localhost/MaLiseuse/wordpress/2020/04/07/bonjour-tout-le-monde/kindle-3/\" class=\"wp-image-53\"/></figure></li></ul></figure>\n<!-- /wp:gallery -->', 'NOS PRODUITS', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2020-04-07 17:55:28', '2020-04-07 15:55:28', '', 1, 'http://localhost/MaLiseuse/wordpress/2020/04/07/1-revision-v1/', 0, 'revision', '', 0),
(57, 1, '2020-04-09 14:12:27', '2020-04-09 12:12:27', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2020-04-09 14:12:27', '2020-04-09 12:12:27', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(58, 1, '2020-04-09 14:13:05', '2020-04-09 12:13:05', '<!-- wp:paragraph {\"textColor\":\"pale-cyan-blue\"} -->\n<p class=\"has-text-color has-pale-cyan-blue-color\">Voici notre petite boutique !</p>\n<!-- /wp:paragraph -->', 'Boutique', '', 'publish', 'closed', 'closed', '', 'boutique', '', '', '2020-04-09 14:47:27', '2020-04-09 12:47:27', '', 0, 'http://localhost/MaLiseuse/wordpress/shop/', 0, 'page', '', 0),
(59, 1, '2020-04-09 14:13:05', '2020-04-09 12:13:05', '<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2020-04-09 14:13:05', '2020-04-09 12:13:05', '', 0, 'http://localhost/MaLiseuse/wordpress/cart/', 0, 'page', '', 0),
(60, 1, '2020-04-09 14:13:05', '2020-04-09 12:13:05', '<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2020-04-09 14:13:05', '2020-04-09 12:13:05', '', 0, 'http://localhost/MaLiseuse/wordpress/checkout/', 0, 'page', '', 0),
(61, 1, '2020-04-09 14:13:05', '2020-04-09 12:13:05', '<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->', 'My account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2020-04-09 14:13:05', '2020-04-09 12:13:05', '', 0, 'http://localhost/MaLiseuse/wordpress/my-account/', 0, 'page', '', 0),
(62, 1, '2020-04-09 14:33:40', '2020-04-09 12:33:40', '<div class=\"best-points bottom\">\r\n<h2 class=\"best-points-title\">Les points clés</h2>\r\n<ul class=\"bestpoints-list\">\r\n 	<li class=\"bestpoints-item\">Poids Net 182 g</li>\r\n 	<li class=\"bestpoints-item\">Autonomie Jusqu\'à 6 semaines</li>\r\n 	<li class=\"bestpoints-item\">Mémoire flash 32 Go</li>\r\n</ul>\r\n<ul class=\"best-points-plus\">\r\n 	<li class=\"best-points-plusItem\"><span class=\"bold\">Le + : </span>Maintenant résistant à l\'eau (IPX8), afin que vous puissiez lire en toute tranquillité à la plage, au bord de la piscine ou dans le bain</li>\r\n</ul>\r\n</div>\r\n<div class=\"features-table\">\r\n<table class=\"characteristic\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Les + de ce modèle</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Avantages :</span> Maintenant résistant à l\'eau (IPX8), afin que vous puissiez lire en toute tranquillité à la plage, au bord de la piscine ou dans le bain</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Caractéristiques générales</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Taille de l\'écran (en pouces) :</span> 6</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Equivalence :</span> 15,2 cm</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Ecran tactile :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Etanche :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Autres :</span> Modèle avec Publicité - Éclairage intégré 5 LED</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Modèle :</span> Liseuse Amazon Kindle</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Caractéristiques de lecture</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Niveaux de gris :</span> 16</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Sens de lecture :</span> Vertical</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Fonctionnalités</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Luminosité ajustable :</span> Oui</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Stockage</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Mémoire flash :</span> 32 Go</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Equivalence (en e-Book) :</span> Environ 32000 livres</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Connectivité</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Détail :</span> Wi-Fi</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Alimentation</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Temps de chargement via USB :</span> 3 h</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Autonomie :</span> Jusqu\'à 6 semaines</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Dimensions</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Dimensions l x h x p :</span> 11.6 x 16.7 x 0.82 cm</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Poids Net :</span> 182 g</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Contenu du carton</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Livré avec :</span> Câble USB</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n&nbsp;\r\n\r\n</div>\r\n&nbsp;', 'Liseuse eBook Amazon Nouveau Kindle Paperwhite 6\' Noir 32Go', 'Petite &amp; efficace.', 'publish', 'open', 'closed', '', 'liseuse-ebook-amazon-nouveau-kindle-paperwhite-6-noir-32go', '', '', '2020-04-09 15:32:11', '2020-04-09 13:32:11', '', 0, 'http://localhost/MaLiseuse/wordpress/?post_type=product&#038;p=62', 0, 'product', '', 0),
(64, 1, '2020-04-09 14:31:14', '2020-04-09 12:31:14', '', 'dos', '', 'inherit', 'open', 'closed', '', 'telechargement-1', '', '', '2020-04-09 14:31:36', '2020-04-09 12:31:36', '', 62, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-1.png', 0, 'attachment', 'image/png', 0),
(63, 1, '2020-04-09 14:30:58', '2020-04-09 12:30:58', '', 'téléchargement', '', 'inherit', 'open', 'closed', '', 'telechargement', '', '', '2020-04-09 14:30:58', '2020-04-09 12:30:58', '', 62, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement.png', 0, 'attachment', 'image/png', 0),
(65, 1, '2020-04-09 14:31:19', '2020-04-09 12:31:19', '', 'proof', '', 'inherit', 'open', 'closed', '', 'telechargement-2', '', '', '2020-04-09 14:31:45', '2020-04-09 12:31:45', '', 62, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-2.png', 0, 'attachment', 'image/png', 0),
(66, 1, '2020-04-09 14:31:23', '2020-04-09 12:31:23', '', 'lecture', '', 'inherit', 'open', 'closed', '', 'telechargement-3', '', '', '2020-04-09 14:31:51', '2020-04-09 12:31:51', '', 62, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-3.png', 0, 'attachment', 'image/png', 0),
(89, 1, '2020-04-09 15:03:51', '2020-04-09 13:03:51', '<!-- wp:heading {\"level\":1} -->\n<h1>Nos articles phares</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Top', '', 'inherit', 'closed', 'closed', '', '42-revision-v1', '', '', '2020-04-09 15:03:51', '2020-04-09 13:03:51', '', 42, 'http://localhost/MaLiseuse/wordpress/2020/04/09/42-revision-v1/', 0, 'revision', '', 0),
(78, 1, '2020-04-09 14:47:27', '2020-04-09 12:47:27', '<!-- wp:paragraph {\"textColor\":\"pale-cyan-blue\"} -->\n<p class=\"has-text-color has-pale-cyan-blue-color\">Voici notre petite boutique !</p>\n<!-- /wp:paragraph -->', 'Boutique', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2020-04-09 14:47:27', '2020-04-09 12:47:27', '', 58, 'http://localhost/MaLiseuse/wordpress/2020/04/09/58-revision-v1/', 0, 'revision', '', 0),
(68, 1, '2020-04-09 14:39:29', '2020-04-09 12:39:29', '<!-- wp:paragraph -->\n<p>Dans cette catégorie vous y trouverez notre petit marché !</p>\n<!-- /wp:paragraph -->', 'Shop', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2020-04-09 14:39:29', '2020-04-09 12:39:29', '', 58, 'http://localhost/MaLiseuse/wordpress/2020/04/09/58-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2020-04-09 14:39:57', '2020-04-09 12:39:57', '<!-- wp:paragraph {\"textColor\":\"pale-cyan-blue\"} -->\n<p class=\"has-text-color has-pale-cyan-blue-color\">Dans cette catégorie vous y trouverez notre petit marché !</p>\n<!-- /wp:paragraph -->', 'Boutique', '', 'inherit', 'closed', 'closed', '', '58-revision-v1', '', '', '2020-04-09 14:39:57', '2020-04-09 12:39:57', '', 58, 'http://localhost/MaLiseuse/wordpress/2020/04/09/58-revision-v1/', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(70, 1, '2020-04-09 14:44:58', '2020-04-09 12:44:58', '<div class=\"best-points bottom\">\r\n<h2 class=\"best-points-title\">Les points clés</h2>\r\n<ul class=\"bestpoints-list\">\r\n 	<li class=\"bestpoints-item\">Poids Net 190 g</li>\r\n 	<li class=\"bestpoints-item\">Autonomie Jusqu\'à 2 mois</li>\r\n 	<li class=\"bestpoints-item\">Mémoire flash 8 Go</li>\r\n</ul>\r\n</div>\r\n<div class=\"features-table\">\r\n<table class=\"characteristic\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Caractéristiques générales</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Taille de l\'écran (en pouces) :</span> 7</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Equivalence :</span> 17,8 cm</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Fonction glisser-déposer :</span> Non</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Coloris :</span> Noir</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Ecran tactile :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Ecran couleur :</span> Non</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Résolution :</span> 1264 x 1680 pixels</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Etanche :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Modèle :</span> KOBO Libra H2O</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Caractéristiques de lecture</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Technologie :</span> e-Ink Carta HD</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Niveaux de gris :</span> 16</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Sens de lecture :</span> Horizontal et vertical</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Ecran LCD :</span> Non</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line\">\r\n<tr>\r\n<th colspan=\"2\">Fonctionnalités</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Luminosité ajustable :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Recommandations personnalisées :</span> Oui</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Détail :</span> Recommandations personnalisées, Dictionnaire</td>\r\n</tr>\r\n<tr class=\"feature-line\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Dictionnaire :</span> Oui</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Stockage</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Mémoire flash :</span> 8 Go</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Equivalence (en e-Book) :</span> Environ 6000 livres</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Lecteur de carte mémoire :</span> Non</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Compatibilités formats DRM</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">eBook :</span> Tout format sauf ANZ</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Audio :</span> Non</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Connectivité</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Détail :</span> Wi-Fi</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Alimentation</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Batterie :</span> Li-ion</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Autonomie :</span> Jusqu\'à 2 mois</td>\r\n</tr>\r\n</tbody>\r\n<thead class=\"feature-line excess-feature\">\r\n<tr>\r\n<th colspan=\"2\">Dimensions</th>\r\n</tr>\r\n</thead>\r\n<tbody>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Dimensions l x h x p :</span> 14.4 x 15.9 x 0.78 cm</td>\r\n</tr>\r\n<tr class=\"feature-line excess-feature\">\r\n<td class=\"characteristics-table\"><span class=\"bold-title\">Poids Net :</span> 190 g</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>', 'Liseuse eBook Kobo Libra H2O Noire', '', 'publish', 'open', 'closed', '', 'liseuse-ebook-kobo-libra-h2o-noire', '', '', '2020-04-09 15:16:59', '2020-04-09 13:16:59', '', 0, 'http://localhost/MaLiseuse/wordpress/?post_type=product&#038;p=70', 0, 'product', '', 0),
(71, 1, '2020-04-09 14:43:19', '2020-04-09 12:43:19', '', 'téléchargement (4)', '', 'inherit', 'open', 'closed', '', 'telechargement-4', '', '', '2020-04-09 14:43:19', '2020-04-09 12:43:19', '', 70, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-4.png', 0, 'attachment', 'image/png', 0),
(72, 1, '2020-04-09 14:43:28', '2020-04-09 12:43:28', '', 'Kobo', '', 'inherit', 'open', 'closed', '', 'telechargement-5', '', '', '2020-04-09 14:43:53', '2020-04-09 12:43:53', '', 70, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-5.png', 0, 'attachment', 'image/png', 0),
(73, 1, '2020-04-09 14:43:31', '2020-04-09 12:43:31', '', 'dos', '', 'inherit', 'open', 'closed', '', 'telechargement-10', '', '', '2020-04-09 14:44:07', '2020-04-09 12:44:07', '', 70, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-10.png', 0, 'attachment', 'image/png', 0),
(74, 1, '2020-04-09 14:43:33', '2020-04-09 12:43:33', '', 'nuit', '', 'inherit', 'open', 'closed', '', 'telechargement-9', '', '', '2020-04-09 14:44:13', '2020-04-09 12:44:13', '', 70, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-9.png', 0, 'attachment', 'image/png', 0),
(75, 1, '2020-04-09 14:43:36', '2020-04-09 12:43:36', '', 'téléchargement (8)', '', 'inherit', 'open', 'closed', '', 'telechargement-8', '', '', '2020-04-09 14:43:36', '2020-04-09 12:43:36', '', 70, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-8.png', 0, 'attachment', 'image/png', 0),
(76, 1, '2020-04-09 14:43:39', '2020-04-09 12:43:39', '', 'couleur', '', 'inherit', 'open', 'closed', '', 'telechargement-7', '', '', '2020-04-09 14:44:20', '2020-04-09 12:44:20', '', 70, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-7.png', 0, 'attachment', 'image/png', 0),
(77, 1, '2020-04-09 14:43:42', '2020-04-09 12:43:42', '', 'téléchargement (6)', '', 'inherit', 'open', 'closed', '', 'telechargement-6', '', '', '2020-04-09 14:43:42', '2020-04-09 12:43:42', '', 70, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-6.png', 0, 'attachment', 'image/png', 0),
(88, 1, '2020-04-09 15:03:12', '2020-04-09 13:03:12', '<!-- wp:heading {\"level\":1} -->\n<h1>Nos articles phares</h1>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"ids\":[72,63],\"linkTo\":\"attachment\"} -->\n<figure class=\"wp-block-gallery columns-2 is-cropped\"><ul class=\"blocks-gallery-grid\"><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/?attachment_id=72\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-5-1024x569.png\" alt=\"\" data-id=\"72\" data-full-url=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-5.png\" data-link=\"http://localhost/MaLiseuse/wordpress/?attachment_id=72\" class=\"wp-image-72\"/></a></figure></li><li class=\"blocks-gallery-item\"><figure><a href=\"http://localhost/MaLiseuse/wordpress/?attachment_id=63\"><img src=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement-1024x569.png\" alt=\"\" data-id=\"63\" data-full-url=\"http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/téléchargement.png\" data-link=\"http://localhost/MaLiseuse/wordpress/?attachment_id=63\" class=\"wp-image-63\"/></a></figure></li></ul></figure>\n<!-- /wp:gallery -->', 'Top', '', 'inherit', 'closed', 'closed', '', '42-autosave-v1', '', '', '2020-04-09 15:03:12', '2020-04-09 13:03:12', '', 42, 'http://localhost/MaLiseuse/wordpress/2020/04/09/42-autosave-v1/', 0, 'revision', '', 0),
(92, 1, '2020-04-09 15:37:06', '2020-04-09 13:37:06', ' ', '', '', 'publish', 'closed', 'closed', '', '92', '', '', '2020-04-09 15:37:06', '2020-04-09 13:37:06', '', 0, 'http://localhost/MaLiseuse/wordpress/?p=92', 1, 'nav_menu_item', '', 0),
(93, 1, '2020-04-09 15:37:06', '2020-04-09 13:37:06', ' ', '', '', 'publish', 'closed', 'closed', '', '93', '', '', '2020-04-09 15:37:06', '2020-04-09 13:37:06', '', 0, 'http://localhost/MaLiseuse/wordpress/?p=93', 2, 'nav_menu_item', '', 0),
(94, 1, '2020-04-09 15:37:06', '2020-04-09 13:37:06', ' ', '', '', 'publish', 'closed', 'closed', '', '94', '', '', '2020-04-09 15:37:06', '2020-04-09 13:37:06', '', 0, 'http://localhost/MaLiseuse/wordpress/?p=94', 3, 'nav_menu_item', '', 0),
(95, 1, '2020-04-09 15:37:06', '2020-04-09 13:37:06', ' ', '', '', 'publish', 'closed', 'closed', '', '95', '', '', '2020-04-09 15:37:06', '2020-04-09 13:37:06', '', 0, 'http://localhost/MaLiseuse/wordpress/?p=95', 4, 'nav_menu_item', '', 0),
(96, 1, '2020-04-09 15:38:20', '2020-04-09 13:38:20', '', 'cropped-logoliseuse-4.png', '', 'inherit', 'open', 'closed', '', 'cropped-logoliseuse-4-png', '', '', '2020-04-09 15:38:20', '2020-04-09 13:38:20', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-4.png', 0, 'attachment', 'image/png', 0),
(97, 1, '2020-04-09 15:39:03', '2020-04-09 13:39:03', 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-5.png', 'cropped-logoliseuse-5.png', '', 'inherit', 'open', 'closed', '', 'cropped-logoliseuse-5-png', '', '', '2020-04-09 15:39:03', '2020-04-09 13:39:03', '', 0, 'http://localhost/MaLiseuse/wordpress/wp-content/uploads/2020/04/cropped-logoliseuse-5.png', 0, 'attachment', 'image/png', 0),
(102, 1, '2020-04-09 15:45:00', '2020-04-09 13:45:00', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Bonjour&nbsp;! Nous sommes une entreprise qui est présente sur le marché des         \"E-book\" depuis maintenant plus de 30 ans. Nous sommes spécialisés dans la vente/conseil en direct. Mais aujourd\'hui en 2020 nous nous devons de concevoir un site internet afin de rencontrer nos plus fidèles client au quatre coins du globe. Nous sommes basés à Marseille.</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote {\"className\":\"is-style-large\"} -->\n<blockquote class=\"wp-block-quote is-style-large\"><p>Nous sommes une société à échelle familiale qui peine à survire face au géants.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:group -->\n<div class=\"wp-block-group\"><div class=\"wp-block-group__inner-container\"><!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">Alors j\'espère de tout mon coeur (et en va ma vie financière en jeu) de bien vouloir utilisé notre site que j\'ai crée moi même car nous utilisons un CMS (vu qu\'on a pas d\'argent pour payer un Dev, et que youtube existe).</pre>\n<!-- /wp:preformatted --></div></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:woocommerce/product-best-sellers /-->', 'A Propos', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2020-04-09 15:45:00', '2020-04-09 13:45:00', '', 2, 'http://localhost/MaLiseuse/wordpress/2020/04/09/2-revision-v1/', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_termmeta`
--

INSERT INTO `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 15, 'product_count_product_cat', '0'),
(2, 16, 'product_count_product_tag', '1'),
(3, 17, 'product_count_product_tag', '4'),
(4, 18, 'product_count_product_tag', '1'),
(5, 19, 'product_count_product_tag', '1'),
(6, 20, 'product_count_product_tag', '2'),
(7, 21, 'order', '0'),
(8, 21, 'product_count_product_cat', '2'),
(9, 22, 'product_count_product_tag', '1'),
(10, 23, 'product_count_product_tag', '2'),
(11, 24, 'product_count_product_tag', '1'),
(12, 25, 'product_count_product_tag', '1'),
(13, 26, 'product_count_product_tag', '1'),
(14, 27, 'order', '0'),
(15, 27, 'display_type', ''),
(16, 27, 'thumbnail_id', '0'),
(17, 27, 'product_count_product_cat', '3'),
(18, 28, 'product_count_product_tag', '1'),
(19, 29, 'product_count_product_tag', '1'),
(20, 30, 'product_count_product_tag', '1'),
(21, 31, 'product_count_product_tag', '1'),
(22, 32, 'order', '0'),
(23, 32, 'display_type', ''),
(24, 32, 'thumbnail_id', '0'),
(25, 32, 'product_count_product_cat', '1'),
(26, 33, 'product_count_product_tag', '1'),
(27, 34, 'product_count_product_tag', '1'),
(28, 35, 'product_count_product_tag', '1'),
(29, 36, 'product_count_product_tag', '1'),
(30, 37, 'product_count_product_tag', '1');

-- --------------------------------------------------------

--
-- Structure de la table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Liseuse', 'liseuse', 0),
(2, 'simple', 'simple', 0),
(3, 'grouped', 'grouped', 0),
(4, 'variable', 'variable', 0),
(5, 'external', 'external', 0),
(6, 'exclude-from-search', 'exclude-from-search', 0),
(7, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(8, 'featured', 'featured', 0),
(9, 'outofstock', 'outofstock', 0),
(10, 'rated-1', 'rated-1', 0),
(11, 'rated-2', 'rated-2', 0),
(12, 'rated-3', 'rated-3', 0),
(13, 'rated-4', 'rated-4', 0),
(14, 'rated-5', 'rated-5', 0),
(15, 'Uncategorized', 'uncategorized', 0),
(16, 'Kindle', 'kindle', 0),
(17, 'Liseuse', 'liseuse', 0),
(18, 'amazon', 'amazon', 0),
(19, '32go', '32go', 0),
(20, 'noir', 'noir', 0),
(21, 'TOP VENTES', 'top-ventes', 0),
(22, 'kobo', 'kobo', 0),
(23, '8go', '8go', 0),
(24, 'libra', 'libra', 0),
(25, 'h2o', 'h2o', 0),
(26, 'noire', 'noire', 0),
(27, 'Liseuses', 'liseuses', 0),
(28, 'ebook', 'ebook', 0),
(29, 'muse', 'muse', 0),
(30, 'hd', 'hd', 0),
(31, 'autonomie', 'autonomie', 0),
(32, 'Prestations', 'sav', 0),
(33, 'sav', 'sav', 0),
(34, 'reparation', 'reparation', 0),
(35, 'ecran', 'ecran', 0),
(36, 'batterie', 'batterie', 0),
(37, 'pas cher', 'pas-cher', 0),
(38, 'Menu', 'menu', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(70, 21, 0),
(62, 16, 0),
(62, 17, 0),
(62, 18, 0),
(62, 19, 0),
(62, 20, 0),
(62, 2, 0),
(62, 21, 0),
(70, 22, 0),
(70, 17, 0),
(70, 20, 0),
(70, 23, 0),
(70, 24, 0),
(70, 25, 0),
(70, 26, 0),
(70, 2, 0),
(81, 27, 0),
(81, 17, 0),
(81, 28, 0),
(81, 23, 0),
(81, 29, 0),
(81, 30, 0),
(81, 31, 0),
(81, 2, 0),
(90, 32, 0),
(90, 33, 0),
(90, 34, 0),
(90, 35, 0),
(90, 36, 0),
(90, 17, 0),
(90, 37, 0),
(90, 2, 0),
(70, 27, 0),
(62, 27, 0),
(92, 38, 0),
(93, 38, 0),
(94, 38, 0),
(95, 38, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'product_type', '', 0, 4),
(3, 3, 'product_type', '', 0, 0),
(4, 4, 'product_type', '', 0, 0),
(5, 5, 'product_type', '', 0, 0),
(6, 6, 'product_visibility', '', 0, 0),
(7, 7, 'product_visibility', '', 0, 0),
(8, 8, 'product_visibility', '', 0, 0),
(9, 9, 'product_visibility', '', 0, 0),
(10, 10, 'product_visibility', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_cat', '', 0, 0),
(16, 16, 'product_tag', '', 0, 1),
(17, 17, 'product_tag', '', 0, 4),
(18, 18, 'product_tag', '', 0, 1),
(19, 19, 'product_tag', '', 0, 1),
(20, 20, 'product_tag', '', 0, 2),
(21, 21, 'product_cat', '', 0, 2),
(22, 22, 'product_tag', '', 0, 1),
(23, 23, 'product_tag', '', 0, 2),
(24, 24, 'product_tag', '', 0, 1),
(25, 25, 'product_tag', '', 0, 1),
(26, 26, 'product_tag', '', 0, 1),
(27, 27, 'product_cat', 'Toutes nos liseuses.', 0, 3),
(28, 28, 'product_tag', '', 0, 1),
(29, 29, 'product_tag', '', 0, 1),
(30, 30, 'product_tag', '', 0, 1),
(31, 31, 'product_tag', '', 0, 1),
(32, 32, 'product_cat', '', 0, 1),
(33, 33, 'product_tag', '', 0, 1),
(34, 34, 'product_tag', '', 0, 1),
(35, 35, 'product_tag', '', 0, 1),
(36, 36, 'product_tag', '', 0, 1),
(37, 37, 'product_tag', '', 0, 1),
(38, 38, 'nav_menu', '', 0, 4);

-- --------------------------------------------------------

--
-- Structure de la table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'Jonathan'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"dd5e913bdd5de4cb018956a8cca25c52d89eaa85d47309c4295a565579bd96f3\";a:4:{s:10:\"expiration\";i:1592332189;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36\";s:5:\"login\";i:1592159389;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '103'),
(18, 1, 'wp_user-settings', 'libraryContent=browse&editor=tinymce'),
(19, 1, 'wp_user-settings-time', '1586435616'),
(24, 1, '_order_count', '0'),
(20, 1, '_woocommerce_tracks_anon_id', 'woo:ipLZ83FwLCKwkViwRQIEv5Ju'),
(21, 1, 'wc_last_active', '1592092800'),
(22, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(23, 1, 'metaboxhidden_nav-menus', 'a:4:{i:0;s:21:\"add-post-type-product\";i:1;s:12:\"add-post_tag\";i:2;s:15:\"add-product_cat\";i:3;s:15:\"add-product_tag\";}');

-- --------------------------------------------------------

--
-- Structure de la table `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'Jonathan', '$P$BNllAKObGGSR//kJDmdYpx8MbW7B3E/', 'jonathan', 'jonathanprevedan@laplateforme.io', 'http://localhost/MaLiseuse/wordpress', '2020-04-07 13:30:15', '', 0, 'Jonathan');

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_admin_notes`
--

DROP TABLE IF EXISTS `wp_wc_admin_notes`;
CREATE TABLE IF NOT EXISTS `wp_wc_admin_notes` (
  `note_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`note_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_wc_admin_notes`
--

INSERT INTO `wp_wc_admin_notes` (`note_id`, `name`, `type`, `locale`, `title`, `content`, `icon`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`) VALUES
(1, 'wc-admin-welcome-note', 'info', 'en_US', 'New feature(s)', 'Welcome to the new WooCommerce experience! In this new release you\'ll be able to have a glimpse of how your store is doing in the Dashboard, manage important aspects of your business (such as managing orders, stock, reviews) from anywhere in the interface, dive into your store data with a completely new Analytics section and more!', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-04-09 12:12:29', NULL, 0),
(2, 'wc-admin-store-notice-setting-moved', 'info', 'en_US', 'Looking for the Store Notice setting?', 'It can now be found in the Customizer.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-04-09 12:12:29', NULL, 0),
(3, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', 'info', '{}', 'unactioned', 'woocommerce-admin', '2020-04-09 12:12:29', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_admin_note_actions`
--

DROP TABLE IF EXISTS `wp_wc_admin_note_actions`;
CREATE TABLE IF NOT EXISTS `wp_wc_admin_note_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`),
  KEY `note_id` (`note_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_wc_admin_note_actions`
--

INSERT INTO `wp_wc_admin_note_actions` (`action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`) VALUES
(1, 1, 'learn-more', 'Learn more', 'https://woocommerce.wordpress.com/', 'actioned', 0),
(2, 2, 'open-customizer', 'Open Customizer', 'customize.php', 'actioned', 0),
(3, 3, 'connect', 'Connect', '?page=wc-addons&section=helper', 'actioned', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_category_lookup`
--

DROP TABLE IF EXISTS `wp_wc_category_lookup`;
CREATE TABLE IF NOT EXISTS `wp_wc_category_lookup` (
  `category_tree_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`category_tree_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_customer_lookup`
--

DROP TABLE IF EXISTS `wp_wc_customer_lookup`;
CREATE TABLE IF NOT EXISTS `wp_wc_customer_lookup` (
  `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_download_log`
--

DROP TABLE IF EXISTS `wp_wc_download_log`;
CREATE TABLE IF NOT EXISTS `wp_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`download_log_id`),
  KEY `permission_id` (`permission_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_order_coupon_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_coupon_lookup`;
CREATE TABLE IF NOT EXISTS `wp_wc_order_coupon_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`coupon_id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `date_created` (`date_created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_order_product_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_product_lookup`;
CREATE TABLE IF NOT EXISTS `wp_wc_order_product_lookup` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT '0',
  `product_gross_revenue` double NOT NULL DEFAULT '0',
  `coupon_amount` double NOT NULL DEFAULT '0',
  `tax_amount` double NOT NULL DEFAULT '0',
  `shipping_amount` double NOT NULL DEFAULT '0',
  `shipping_tax_amount` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `date_created` (`date_created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_order_stats`
--

DROP TABLE IF EXISTS `wp_wc_order_stats`;
CREATE TABLE IF NOT EXISTS `wp_wc_order_stats` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT '0',
  `total_sales` double NOT NULL DEFAULT '0',
  `tax_total` double NOT NULL DEFAULT '0',
  `shipping_total` double NOT NULL DEFAULT '0',
  `net_total` double NOT NULL DEFAULT '0',
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `date_created` (`date_created`),
  KEY `customer_id` (`customer_id`),
  KEY `status` (`status`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_order_tax_lookup`
--

DROP TABLE IF EXISTS `wp_wc_order_tax_lookup`;
CREATE TABLE IF NOT EXISTS `wp_wc_order_tax_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT '0',
  `order_tax` double NOT NULL DEFAULT '0',
  `total_tax` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`tax_rate_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `date_created` (`date_created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_product_meta_lookup`
--

DROP TABLE IF EXISTS `wp_wc_product_meta_lookup`;
CREATE TABLE IF NOT EXISTS `wp_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT '0',
  `downloadable` tinyint(1) DEFAULT '0',
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT '0',
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT '0',
  `average_rating` decimal(3,2) DEFAULT '0.00',
  `total_sales` bigint(20) DEFAULT '0',
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT '',
  PRIMARY KEY (`product_id`),
  KEY `virtual` (`virtual`),
  KEY `downloadable` (`downloadable`),
  KEY `stock_status` (`stock_status`),
  KEY `stock_quantity` (`stock_quantity`),
  KEY `onsale` (`onsale`),
  KEY `min_max_price` (`min_price`,`max_price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_wc_product_meta_lookup`
--

INSERT INTO `wp_wc_product_meta_lookup` (`product_id`, `sku`, `virtual`, `downloadable`, `min_price`, `max_price`, `onsale`, `stock_quantity`, `stock_status`, `rating_count`, `average_rating`, `total_sales`, `tax_status`, `tax_class`) VALUES
(62, '', 0, 0, '155.0000', '155.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(70, '', 0, 0, '179.9900', '179.9900', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(81, '', 0, 0, '139.9900', '139.9900', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', ''),
(90, '', 0, 0, '0.0000', '0.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', '');

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_tax_rate_classes`
--

DROP TABLE IF EXISTS `wp_wc_tax_rate_classes`;
CREATE TABLE IF NOT EXISTS `wp_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_class_id`),
  UNIQUE KEY `slug` (`slug`(191))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_wc_tax_rate_classes`
--

INSERT INTO `wp_wc_tax_rate_classes` (`tax_rate_class_id`, `name`, `slug`) VALUES
(1, 'Reduced rate', 'reduced-rate'),
(2, 'Zero rate', 'zero-rate');

-- --------------------------------------------------------

--
-- Structure de la table `wp_wc_webhooks`
--

DROP TABLE IF EXISTS `wp_wc_webhooks`;
CREATE TABLE IF NOT EXISTS `wp_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT '0',
  `pending_delivery` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`webhook_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_api_keys`
--

DROP TABLE IF EXISTS `wp_woocommerce_api_keys`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_520_ci,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`key_id`),
  KEY `consumer_key` (`consumer_key`),
  KEY `consumer_secret` (`consumer_secret`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_attribute_taxonomies`
--

DROP TABLE IF EXISTS `wp_woocommerce_attribute_taxonomies`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_name` (`attribute_name`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_downloadable_product_permissions`
--

DROP TABLE IF EXISTS `wp_woocommerce_downloadable_product_permissions`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `order_key` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  KEY `order_id` (`order_id`),
  KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_log`
--

DROP TABLE IF EXISTS `wp_woocommerce_log`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`log_id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_order_itemmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_itemmeta`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_order_items`
--

DROP TABLE IF EXISTS `wp_woocommerce_order_items`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_item_name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_payment_tokenmeta`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokenmeta`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`meta_id`),
  KEY `payment_token_id` (`payment_token_id`),
  KEY `meta_key` (`meta_key`(32))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_payment_tokens`
--

DROP TABLE IF EXISTS `wp_woocommerce_payment_tokens`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`token_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_sessions`
--

DROP TABLE IF EXISTS `wp_woocommerce_sessions`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `session_key` (`session_key`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_shipping_zones`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zones`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_woocommerce_shipping_zones`
--

INSERT INTO `wp_woocommerce_shipping_zones` (`zone_id`, `zone_name`, `zone_order`) VALUES
(1, 'France', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_shipping_zone_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_locations`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `location_id` (`location_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_woocommerce_shipping_zone_locations`
--

INSERT INTO `wp_woocommerce_shipping_zone_locations` (`location_id`, `zone_id`, `location_code`, `location_type`) VALUES
(1, 1, 'FR', 'country');

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_shipping_zone_methods`
--

DROP TABLE IF EXISTS `wp_woocommerce_shipping_zone_methods`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`instance_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Déchargement des données de la table `wp_woocommerce_shipping_zone_methods`
--

INSERT INTO `wp_woocommerce_shipping_zone_methods` (`zone_id`, `instance_id`, `method_id`, `method_order`, `is_enabled`) VALUES
(0, 1, 'flat_rate', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_tax_rates`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rates`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT '0',
  `tax_rate_shipping` int(1) NOT NULL DEFAULT '1',
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_rate_id`),
  KEY `tax_rate_country` (`tax_rate_country`),
  KEY `tax_rate_state` (`tax_rate_state`(2)),
  KEY `tax_rate_class` (`tax_rate_class`(10)),
  KEY `tax_rate_priority` (`tax_rate_priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wp_woocommerce_tax_rate_locations`
--

DROP TABLE IF EXISTS `wp_woocommerce_tax_rate_locations`;
CREATE TABLE IF NOT EXISTS `wp_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  KEY `location_type_code` (`location_type`(10),`location_code`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
