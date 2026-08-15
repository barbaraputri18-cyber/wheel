-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jan 2023 pada 07.33
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wheel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_apicustom`
--

CREATE TABLE `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `tabel` varchar(255) DEFAULT NULL,
  `aksi` varchar(255) DEFAULT NULL,
  `kolom` varchar(255) DEFAULT NULL,
  `orderby` varchar(255) DEFAULT NULL,
  `sub_query_1` varchar(255) DEFAULT NULL,
  `sql_where` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) DEFAULT NULL,
  `parameters` longtext DEFAULT NULL,
  `responses` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_apikey`
--

CREATE TABLE `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL,
  `screetkey` varchar(255) DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_dashboard`
--

CREATE TABLE `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_email_queues`
--

CREATE TABLE `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) DEFAULT NULL,
  `email_from_email` varchar(255) DEFAULT NULL,
  `email_from_name` varchar(255) DEFAULT NULL,
  `email_cc_email` varchar(255) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_content` text DEFAULT NULL,
  `email_attachments` text DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_email_templates`
--

CREATE TABLE `cms_email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `from_name` varchar(255) DEFAULT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `cc_email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_email_templates`
--

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`) VALUES
(1, 'Email Template Forgot Password Backend', 'forgot_password_backend', NULL, '<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>', '[password]', 'System', 'system@crudbooster.com', NULL, '2022-11-11 07:13:03', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_logs`
--

CREATE TABLE `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(50) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-11 07:13:24', NULL),
(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-11-11 07:15:31', NULL),
(3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-11 07:15:54', NULL),
(4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-11-11 07:17:47', NULL),
(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-11 07:19:37', NULL),
(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 07:39:41', NULL),
(7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/1', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-11 07:40:03', NULL),
(8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-11 07:47:53', NULL),
(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/edit-save/1', 'Update data  at Uniqe Code', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>ZMZUC</td><td>3KJFO7T</td></tr></tbody></table>', 1, '2022-11-11 07:47:59', NULL),
(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-11 07:50:25', NULL),
(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-11 07:50:51', NULL),
(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-11 07:50:56', NULL),
(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-11 07:51:35', NULL),
(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-11 07:52:24', NULL),
(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-11 07:53:31', NULL),
(16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/edit-save/7', 'Update data  at Uniqe Code', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>NZ9QIID</td><td>6LKHS3S</td></tr><tr><td>used</td><td>1</td><td>0</td></tr></tbody></table>', 1, '2022-11-11 08:03:34', NULL),
(17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 08:05:00', NULL),
(18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 08:05:16', NULL),
(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/1', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-11 08:05:26', NULL),
(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 08:36:54', NULL),
(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data halo at List Draw', '', 1, '2022-11-11 08:43:55', NULL),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/edit-save/1', 'Update data halo at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sent</td><td>0</td><td>1</td></tr><tr><td>retry_used</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2022-11-11 08:44:07', NULL),
(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:3000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-11 18:56:33', NULL),
(24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:3000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 18:57:17', NULL),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:3000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 18:57:33', NULL),
(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:3000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 18:57:49', NULL),
(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:3000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-11 18:58:05', NULL),
(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:3000/admin/prize/edit-save/7', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-11 18:58:13', NULL),
(29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-12 01:20:09', NULL),
(30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccd at List Draw', '', 1, '2022-11-12 02:51:07', NULL),
(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data xxxx at List Draw', '', 1, '2022-11-12 02:56:54', NULL),
(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccc at List Draw', '', 1, '2022-11-12 02:58:12', NULL),
(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ddd at List Draw', '', 1, '2022-11-12 03:04:43', NULL),
(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 03:09:37', NULL),
(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 04:22:33', NULL),
(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cva at List Draw', '', 1, '2022-11-12 04:22:57', NULL),
(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 04:25:30', NULL),
(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cccc at List Draw', '', 1, '2022-11-12 04:25:47', NULL),
(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 04:28:38', NULL),
(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cvc at List Draw', '', 1, '2022-11-12 04:28:54', NULL),
(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 04:31:38', NULL),
(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data xxxx at List Draw', '', 1, '2022-11-12 04:31:52', NULL),
(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 04:49:54', NULL),
(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccc at List Draw', '', 1, '2022-11-12 04:50:11', NULL),
(45, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 04:53:10', NULL),
(46, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data aaaa at List Draw', '', 1, '2022-11-12 04:53:25', NULL),
(47, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:21:20', NULL),
(48, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccd at List Draw', '', 1, '2022-11-12 05:21:40', NULL),
(49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:25:51', NULL),
(50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ddd at List Draw', '', 1, '2022-11-12 05:26:09', NULL),
(51, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:28:27', NULL),
(52, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data dfg at List Draw', '', 1, '2022-11-12 05:28:45', NULL),
(53, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:29:23', NULL),
(54, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sddd at List Draw', '', 1, '2022-11-12 05:29:45', NULL),
(55, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-12 05:30:40', NULL),
(56, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:31:02', NULL),
(57, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data weddd at List Draw', '', 1, '2022-11-12 05:31:20', NULL),
(58, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:41:14', NULL),
(59, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cvx at List Draw', '', 1, '2022-11-12 05:41:39', NULL),
(60, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:46:03', NULL),
(61, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 05:46:26', NULL),
(62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:50:27', NULL),
(63, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cfd at List Draw', '', 1, '2022-11-12 05:50:51', NULL),
(64, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/delete/9', 'Delete data 9 at List Prize', '', 1, '2022-11-12 05:51:37', NULL),
(65, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:52:03', NULL),
(66, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data dss at List Draw', '', 1, '2022-11-12 05:52:30', NULL),
(67, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 05:55:18', NULL),
(68, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sddd at List Draw', '', 1, '2022-11-12 05:55:37', NULL),
(69, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 06:10:16', NULL),
(70, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data dss at List Draw', '', 1, '2022-11-12 06:10:34', NULL),
(71, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-12 06:17:33', NULL),
(72, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/delete/10', 'Delete data 10 at List Prize', '', 1, '2022-11-12 06:26:23', NULL),
(73, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 06:28:34', NULL),
(74, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data aaa at List Draw', '', 1, '2022-11-12 06:28:54', NULL),
(75, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 06:38:56', NULL),
(76, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data aaa at List Draw', '', 1, '2022-11-12 06:39:14', NULL),
(77, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 06:39:52', NULL),
(78, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data aaa at List Draw', '', 1, '2022-11-12 06:40:07', NULL),
(79, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-12 07:08:27', NULL),
(80, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/delete/11', 'Delete data 11 at List Prize', '', 1, '2022-11-12 07:19:13', NULL),
(81, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 07:51:05', NULL),
(82, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data xxxx at List Draw', '', 1, '2022-11-12 07:51:22', NULL),
(83, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 07:57:45', NULL),
(84, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 07:57:59', NULL),
(85, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:04:57', NULL),
(86, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 08:05:15', NULL),
(87, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:05:55', NULL),
(88, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccc at List Draw', '', 1, '2022-11-12 08:06:12', NULL),
(89, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-12 08:06:55', NULL),
(90, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:07:01', NULL),
(91, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 08:07:14', NULL),
(92, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/prize/delete/12', 'Delete data 12 at List Prize', '', 1, '2022-11-12 08:07:48', NULL),
(93, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:08:00', NULL),
(94, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data xxx at List Draw', '', 1, '2022-11-12 08:08:30', NULL),
(95, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:11:40', NULL),
(96, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data aaaa at List Draw', '', 1, '2022-11-12 08:18:13', NULL),
(97, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:24:27', NULL),
(98, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ssss at List Draw', '', 1, '2022-11-12 08:24:47', NULL),
(99, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:37:40', NULL),
(100, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccc at List Draw', '', 1, '2022-11-12 08:38:02', NULL),
(101, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:45:21', NULL),
(102, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data xxx at List Draw', '', 1, '2022-11-12 08:45:37', NULL),
(103, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:46:28', NULL),
(104, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 08:46:43', NULL),
(105, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:49:40', NULL),
(106, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 08:49:56', NULL),
(107, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 08:51:25', NULL),
(108, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data dddd at List Draw', '', 1, '2022-11-12 08:51:42', NULL),
(109, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 09:03:09', NULL),
(110, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccc at List Draw', '', 1, '2022-11-12 09:03:23', NULL),
(111, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 09:05:40', NULL),
(112, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cdf at List Draw', '', 1, '2022-11-12 09:06:03', NULL),
(113, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/edit-save/2', 'Update data cdf at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>rotation</td><td>10</td><td></td></tr><tr><td>prize_id</td><td>3</td><td>8</td></tr></tbody></table>', 1, '2022-11-12 09:06:34', NULL),
(114, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 09:09:14', NULL),
(115, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccc at List Draw', '', 1, '2022-11-12 09:09:51', NULL),
(116, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/edit-save/3', 'Update data ccc at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>rotation</td><td>10</td><td></td></tr><tr><td>prize_id</td><td>5</td><td>3</td></tr></tbody></table>', 1, '2022-11-12 09:09:58', NULL),
(117, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 09:14:31', NULL),
(118, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccc at List Draw', '', 1, '2022-11-12 09:14:50', NULL),
(119, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/add-save', 'Add New Data Wheel Spin at Tampilan Web', '', 1, '2022-11-12 09:44:55', NULL),
(120, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>background</td><td></td><td>uploads/1/2022-11/wheel_background_20220825160150.jpg</td></tr></tbody></table>', 1, '2022-11-12 09:47:30', NULL),
(121, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-12 09:58:00', NULL),
(122, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>background</td><td></td><td>uploads/1/2022-11/luiz_santos_luffy_prancheta_1.jpg</td></tr></tbody></table>', 1, '2022-11-12 09:58:05', NULL),
(123, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-12 10:07:12', NULL),
(124, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>logo</td><td></td><td>uploads/1/2022-11/pngegg.png</td></tr></tbody></table>', 1, '2022-11-12 10:07:18', NULL),
(125, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-12 10:08:31', NULL),
(126, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>background</td><td></td><td>uploads/1/2022-11/kid_luffy_minimalist_by_ryuzakidesigns_dbuqbt1_fullview.jpg</td></tr></tbody></table>', 1, '2022-11-12 10:08:36', NULL),
(127, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-11-12 10:11:18', NULL),
(128, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-12 10:11:24', NULL),
(129, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 10:11:32', NULL),
(130, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data mka at List Draw', '', 1, '2022-11-12 10:11:57', NULL),
(131, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Minimal Total Deposit Rp. 100.000,- Untuk 1 Tiket ( Hanya berlaku via at Faq', '', 1, '2022-11-12 10:14:40', NULL),
(132, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data ersyaratan untuk mendapatkan tiket lucky SPIN wheel member harus menca at Faq', '', 1, '2022-11-12 10:14:48', NULL),
(133, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Member wajib claim untuk mendapatkan kode kupon (tiket) dan claim ke w at Faq', '', 1, '2022-11-12 10:14:55', NULL),
(134, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Bonus Lucky SPIN Wheel dapat di ambil disini, LuckySPIN at Faq', '', 1, '2022-11-12 10:15:04', NULL),
(135, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Tiket / Kupon akan di berikan setiap hari 1x. at Faq', '', 1, '2022-11-12 10:15:11', NULL),
(136, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Tiket Lucky SPIN Wheel hanya berlaku sampai pukul 23:59 WIB, Jika tike at Faq', '', 1, '2022-11-12 10:15:18', NULL),
(137, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Wajib screenshoot bukti history deposit di periode hari tersebut dan H at Faq', '', 1, '2022-11-12 10:15:38', NULL),
(138, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Wajib Join Group Telegram MENARA3388 at Faq', '', 1, '2022-11-12 10:15:50', NULL),
(139, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/add-save', 'Add New Data Semua Keputusan Dari Pihak MENARA3388 Bersifat Mutlak Dan Tidak Dapat at Faq', '', 1, '2022-11-12 10:15:56', NULL),
(140, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>favicon</td><td></td><td>uploads/1/2022-11/favicon.ico</td></tr></tbody></table>', 1, '2022-11-12 10:28:48', NULL),
(141, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/delete/9', 'Delete data Semua Keputusan Dari Pihak MENARA3388 Bersifat Mutlak Dan Tidak Dapat at Faq', '', 1, '2022-11-12 10:39:48', NULL),
(142, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/faq/delete/8', 'Delete data Wajib Join Group Telegram MENARA3388 at Faq', '', 1, '2022-11-12 10:39:51', NULL),
(143, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/users/add-save', 'Add New Data admin at Users Management', '', 1, '2022-11-12 10:41:49', NULL),
(144, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/menu_management/edit-save/3', 'Update data List Draw at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>', 1, '2022-11-12 10:42:06', NULL),
(145, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/menu_management/edit-save/1', 'Update data Uniqe Code at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2022-11-12 10:42:11', NULL),
(146, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/menu_management/edit-save/2', 'Update data List Prize at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-11-12 10:42:17', NULL),
(147, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/menu_management/edit-save/5', 'Update data Tampilan Web at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2022-11-12 10:42:22', NULL),
(148, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/menu_management/edit-save/6', 'Update data Faq at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2022-11-12 10:42:28', NULL),
(149, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-11-12 10:42:33', NULL),
(150, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/login', 'admin@wheel.com login with IP Address 127.0.0.1', '', 2, '2022-11-12 10:42:38', NULL),
(151, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 2, '2022-11-12 10:42:46', NULL),
(152, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data dff at List Draw', '', 2, '2022-11-12 10:43:02', NULL),
(153, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 2, '2022-11-12 10:45:41', NULL),
(154, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ddd at List Draw', '', 2, '2022-11-12 10:45:56', NULL),
(155, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 2, '2022-11-12 10:46:24', NULL),
(156, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cvb at List Draw', '', 2, '2022-11-12 10:46:41', NULL),
(157, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 2, '2022-11-12 10:47:21', NULL),
(158, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data cvf at List Draw', '', 2, '2022-11-12 10:47:39', NULL),
(159, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>music</td><td></td><td>uploads/2/2022-11/binks_no_sake_one_piecefull_with_lyrics_rcaiy5n1hpa.mp3</td></tr></tbody></table>', 2, '2022-11-12 10:52:31', NULL),
(160, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 2, '2022-11-12 10:57:13', NULL),
(161, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/draw/add-save', 'Add New Data ccfff at List Draw', '', 2, '2022-11-12 10:57:31', NULL),
(162, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/logout', 'admin@wheel.com logout', '', 2, '2022-11-12 11:02:47', NULL),
(163, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-12 11:02:51', NULL),
(164, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/statistic_builder/add-save', 'Add New Data History Draw at Statistic Builder', '', 1, '2022-11-12 11:03:10', NULL),
(165, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2022-11-12 11:21:29', NULL),
(166, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:4000/admin/login', 'admin@wheel.com login with IP Address 127.0.0.1', '', 2, '2022-11-12 11:21:51', NULL),
(167, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-12 18:41:43', NULL),
(168, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 18:41:49', NULL),
(169, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 18:43:48', NULL),
(170, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/edit-save/12', 'Update data  at Uniqe Code', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>4I1BPUJ</td><td>RW6CW</td></tr></tbody></table>', 1, '2022-11-12 18:43:52', NULL),
(171, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/edit-save/12', 'Update data  at Uniqe Code', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>RW6CW</td><td>4JW3ZG</td></tr></tbody></table>', 1, '2022-11-12 18:43:57', NULL),
(172, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data nfs at List Draw', '', 1, '2022-11-12 18:47:12', NULL),
(173, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-12 19:45:15', NULL),
(174, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2022-11/aaa.png</td></tr></tbody></table>', 1, '2022-11-12 19:45:24', NULL),
(175, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-12 19:46:57', NULL),
(176, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-12 19:47:21', NULL),
(177, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/8', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>Uang 10 Rb</td><td>100 Rb</td></tr><tr><td>try_again</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2022-11-12 19:47:37', NULL),
(178, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/7', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>Uang 100 rb</td><td>200 rb</td></tr><tr><td>try_again</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2022-11-12 19:47:46', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(179, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/8', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>100 Rb</td><td>100 rb</td></tr></tbody></table>', 1, '2022-11-12 19:47:52', NULL),
(180, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/5', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>Uang 500 Rb</td><td>500 rb</td></tr><tr><td>try_again</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2022-11-12 19:48:06', NULL),
(181, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/7', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-12 19:48:12', NULL),
(182, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/8', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-12 19:48:16', NULL),
(183, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/5', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-12 19:48:21', NULL),
(184, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 19:50:20', NULL),
(185, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data xxx at List Draw', '', 1, '2022-11-12 19:50:34', NULL),
(186, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/14', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-12 19:51:39', NULL),
(187, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 19:51:46', NULL),
(188, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data ssss at List Draw', '', 1, '2022-11-12 19:52:26', NULL),
(189, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-12 19:59:29', NULL),
(190, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>outwheel</td><td></td><td>uploads/1/2022-11/aaaaaa.png</td></tr></tbody></table>', 1, '2022-11-12 20:06:43', NULL),
(191, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-12 20:09:29', NULL),
(192, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>outwheel</td><td></td><td>uploads/1/2022-11/aaaaaa.png</td></tr></tbody></table>', 1, '2022-11-12 20:10:20', NULL),
(193, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 20:11:04', NULL),
(194, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 20:11:48', NULL),
(195, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/delete/14', 'Delete data 14 at List Prize', '', 1, '2022-11-12 20:12:34', NULL),
(196, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/delete/13', 'Delete data 13 at List Prize', '', 1, '2022-11-12 20:12:37', NULL),
(197, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-12 20:12:56', NULL),
(198, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 20:13:28', NULL),
(199, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 20:14:00', NULL),
(200, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/edit-save/15', 'Update data sss at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>FDKRTUM</td><td>PULWH</td></tr><tr><td>rotation</td><td>10</td><td></td></tr></tbody></table>', 1, '2022-11-12 20:14:26', NULL),
(201, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/delete/15', 'Delete data 15 at List Prize', '', 1, '2022-11-12 20:16:13', NULL),
(202, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-12 20:19:38', NULL),
(203, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-12 20:20:09', NULL),
(204, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@wheel.com login with IP Address 127.0.0.1', '', 2, '2022-11-13 01:39:14', NULL),
(205, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 2, '2022-11-13 01:42:59', NULL),
(206, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data SLI9S at List Draw', '', 2, '2022-11-13 01:43:17', NULL),
(207, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Try delete the image of Wheel Spin data at Tampilan Web', '', 2, '2022-11-13 01:44:21', NULL),
(208, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@wheel.com logout', '', 2, '2022-11-13 01:44:25', NULL),
(209, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-13 01:44:35', NULL),
(210, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-13 01:44:47', NULL),
(211, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Wheel Spin at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>music</td><td></td><td>uploads/1/2022-11/mario.mp3</td></tr></tbody></table>', 1, '2022-11-13 01:45:12', NULL),
(212, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-13 01:45:22', NULL),
(213, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data ssw at List Draw', '', 1, '2022-11-13 01:45:37', NULL),
(214, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-13 01:50:30', NULL),
(215, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-13 01:50:32', NULL),
(216, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-13 01:50:35', NULL),
(217, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data 2UHXDMZ at List Draw', '', 1, '2022-11-13 01:50:48', NULL),
(218, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data SLI9S at List Draw', '', 1, '2022-11-13 01:51:01', NULL),
(219, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2022-11-28 04:45:22', NULL),
(220, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-28 04:45:34', NULL),
(221, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-28 04:45:37', NULL),
(222, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-28 04:45:39', NULL),
(223, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-28 04:45:42', NULL),
(224, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-28 04:45:45', NULL),
(225, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Wheel Spin at Tampilan Web', '', 1, '2022-11-28 04:45:47', NULL),
(226, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-28 04:46:28', NULL),
(227, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data ccd at List Draw', '', 1, '2022-11-28 04:46:50', NULL),
(228, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Wheel Spin</td><td>Langkah4D</td></tr><tr><td>wheel</td><td></td><td>uploads/1/2022-11/wheel.png</td></tr><tr><td>outwheel</td><td></td><td>uploads/1/2022-11/outwheel.png</td></tr><tr><td>logo</td><td></td><td>uploads/1/2022-11/logo.png</td></tr><tr><td>background</td><td></td><td>uploads/1/2022-11/home.png</td></tr><tr><td>favicon</td><td></td><td>uploads/1/2022-11/favicon.png</td></tr><tr><td>music</td><td></td><td>uploads/1/2022-11/home.mp3</td></tr><tr><td>music_win</td><td></td><td>uploads/1/2022-11/win.mp3</td></tr><tr><td>music_lose</td><td></td><td>uploads/1/2022-11/lose.mp3</td></tr><tr><td>music_spin</td><td></td><td>uploads/1/2022-11/spin.mp3</td></tr></tbody></table>', 1, '2022-11-28 04:49:37', NULL),
(229, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/1', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>Notihing . . .</td><td>IPHONE 12</td></tr></tbody></table>', 1, '2022-11-28 04:56:30', NULL),
(230, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/2', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>IPHONE 12</td><td>NOTHING . . .</td></tr><tr><td>try_again</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2022-11-28 04:56:50', NULL),
(231, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/2', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>winner</td><td>1</td><td>0</td></tr><tr><td>try_again</td><td>1</td><td>0</td></tr></tbody></table>', 1, '2022-11-28 04:57:01', NULL),
(232, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/3', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>FREE SPIN</td><td>100 RB</td></tr></tbody></table>', 1, '2022-11-28 04:57:14', NULL),
(233, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/4', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>Nothing ...</td><td>200 RB</td></tr></tbody></table>', 1, '2022-11-28 04:57:24', NULL),
(234, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/6', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>Nothing . . .</td><td>NOTHING . . .</td></tr></tbody></table>', 1, '2022-11-28 04:57:36', NULL),
(235, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/8', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>100 rb</td><td>FREE SPIN</td></tr></tbody></table>', 1, '2022-11-28 04:57:51', NULL),
(236, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/7', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>200 rb</td><td>1 JT</td></tr></tbody></table>', 1, '2022-11-28 04:58:07', NULL),
(237, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/1', 'Update data Super Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2022-11/tanlalana.png</td></tr><tr><td>email</td><td>admin@crudbooster.com</td><td>superadmin@wheel.com</td></tr><tr><td>password</td><td>$2y$10$H3/1JQfqKbdCNfLjpnCjd.wmrN9sNBHT5u2LaBE9fPxIgtopgaf.O</td><td>$2y$10$gzd0fadI2hU71ZdsGWZeBuiDEjwx4QyiLZEC8t2l2InReaJkGFPm6</td></tr><tr><td>status</td><td>Active</td><td></td></tr></tbody></table>', 1, '2022-11-28 05:00:43', NULL),
(238, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/1', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-28 05:19:32', NULL),
(239, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/8', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2022-11-28 05:19:38', NULL),
(240, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-28 05:19:52', NULL),
(241, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data alif at List Draw', '', 1, '2022-11-28 05:20:26', NULL),
(242, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-28 05:21:49', NULL),
(243, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data afif at List Draw', '', 1, '2022-11-28 05:22:08', NULL),
(244, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-28 05:22:59', NULL),
(245, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data aisyah at List Draw', '', 1, '2022-11-28 05:23:15', NULL),
(246, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-28 05:53:26', NULL),
(247, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data sss at List Draw', '', 1, '2022-11-28 05:53:46', NULL),
(248, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-11-29 06:06:13', NULL),
(249, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-29 06:06:20', NULL),
(250, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data nfs at List Draw', '', 1, '2022-11-29 06:06:34', NULL),
(251, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-11-30 13:57:47', NULL),
(252, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 13:57:55', NULL),
(253, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 13:58:00', NULL),
(254, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2022-11/done_wheel_1.png</td></tr><tr><td>outwheel</td><td></td><td>uploads/1/2022-11/done_wheel.png</td></tr></tbody></table>', 1, '2022-11-30 13:58:11', NULL),
(255, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:22:31', NULL),
(256, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:22:34', NULL),
(257, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:22:36', NULL),
(258, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:22:39', NULL),
(259, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2022-11/blue.png</td></tr><tr><td>outwheel</td><td></td><td>uploads/1/2022-11/zeus2.png</td></tr><tr><td>logo</td><td></td><td>uploads/1/2022-11/logo.png</td></tr><tr><td>background</td><td></td><td>uploads/1/2022-11/wheel_background_20220821154738.jpg</td></tr></tbody></table>', 1, '2022-11-30 14:23:14', NULL),
(260, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:25:47', NULL),
(261, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>music</td><td></td><td>uploads/1/2022-11/musik.mp3</td></tr></tbody></table>', 1, '2022-11-30 14:25:59', NULL),
(262, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:27:53', NULL),
(263, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:28:02', NULL),
(264, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2022-11/blue.png</td></tr><tr><td>logo</td><td></td><td>uploads/1/2022-11/wheel_logo_20220821155631.png</td></tr></tbody></table>', 1, '2022-11-30 14:28:26', NULL),
(265, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:30:41', NULL),
(266, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2022-11/blue.png</td></tr></tbody></table>', 1, '2022-11-30 14:30:46', NULL),
(267, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:32:02', NULL),
(268, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2022-11/blue.png</td></tr></tbody></table>', 1, '2022-11-30 14:32:07', NULL),
(269, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-30 14:35:13', NULL),
(270, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/add-save', 'Add New Data  at List Prize', '', 1, '2022-11-30 14:35:43', NULL),
(271, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2022-11-30 14:40:08', NULL),
(272, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2022-11/blue.png</td></tr></tbody></table>', 1, '2022-11-30 14:40:17', NULL),
(273, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/6', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>NOTHING . . .</td><td>MOTOR NMAX</td></tr></tbody></table>', 1, '2022-11-30 14:45:59', NULL),
(274, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/prize/edit-save/16', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>MOTOR NMAX</td><td>NOTHING . . .</td></tr><tr><td>winner</td><td>1</td><td>0</td></tr></tbody></table>', 1, '2022-11-30 14:46:14', NULL),
(275, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-11-30 14:46:33', NULL),
(276, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data nfs d at List Draw', '', 1, '2022-11-30 14:46:49', NULL),
(277, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2022-11-30 14:50:17', NULL),
(278, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@wheel.com login with IP Address 127.0.0.1', '', 2, '2022-11-30 14:50:24', NULL),
(279, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@wheel.com logout', '', 2, '2022-11-30 14:50:36', NULL),
(280, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-11-30 14:50:43', NULL),
(281, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/7', 'Update data Users Access at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2022-11-30 14:50:53', NULL),
(282, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-12-01 04:47:47', NULL),
(283, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-12-01 08:11:19', NULL),
(284, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2022-12-01 08:11:27', NULL),
(285, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/top-marontoto%24%24/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-12-01 08:17:05', NULL),
(286, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/top-marontoto%24%24/logout', 'superadmin@wheel.com logout', '', 1, '2022-12-01 08:17:31', NULL),
(287, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-12-03 04:17:15', NULL),
(288, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/8', 'Update data Dashboard at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2022-12-03 04:19:33', NULL),
(289, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/1', 'Update data Generate Ticket / Code at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Uniqe Code</td><td>Generate Ticket / Code</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2022-12-03 04:33:29', NULL),
(290, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-12-03 04:35:22', NULL),
(291, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data nfs at List Draw', '', 1, '2022-12-03 04:35:40', NULL),
(292, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2022-12-03 04:58:43', NULL),
(293, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-12-03 04:58:59', NULL),
(294, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2022-12-03 11:59:51', NULL),
(295, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2022-12-03 12:00:03', NULL),
(296, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-12-03 12:28:34', NULL),
(297, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data Neng Yuyun Yunia Wati at List Draw', '', 1, '2022-12-03 12:28:55', NULL),
(298, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/login', 'superadmin@wheel.com login with IP Address 114.124.141.7', '', 1, '2022-12-04 12:24:44', NULL),
(299, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/prize/edit-save/2', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>NOTHING . . .</td><td>ZONK</td></tr></tbody></table>', 1, '2022-12-04 12:25:11', NULL),
(300, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/prize/edit-save/16', 'Update data  at List Prize', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>label</td><td>NOTHING . . .</td><td>ZONK</td></tr></tbody></table>', 1, '2022-12-04 12:25:29', NULL),
(301, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-12-04 12:25:41', NULL),
(302, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-12-04 12:25:43', NULL),
(303, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2022-12-04 12:25:44', NULL),
(304, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/draw/add-save', 'Add New Data Zippyshare at List Draw', '', 1, '2022-12-04 12:26:08', NULL),
(305, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/draw/add-save', 'Add New Data NYY at List Draw', '', 1, '2022-12-04 12:27:28', NULL),
(306, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/draw/add-save', 'Add New Data cddd at List Draw', '', 1, '2022-12-04 12:28:36', NULL),
(307, '114.124.141.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'https://luckyspin.ngebug.site/admin/logout', 'superadmin@wheel.com logout', '', 1, '2022-12-04 12:30:48', NULL),
(308, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2023-01-19 14:04:30', NULL),
(309, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2023-01-19 14:09:31', NULL),
(310, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2023-01-19 14:09:34', NULL),
(311, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2023-01-19 14:09:37', NULL),
(312, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2023-01-19 14:40:19', NULL),
(313, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 14:40:38', NULL),
(314, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>background</td><td></td><td>uploads/1/2023-01/ycs7wlelibc313onjhc8dclxrinlghmcya7l0bbb.jpg</td></tr></tbody></table>', 1, '2023-01-19 14:41:25', NULL),
(315, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 14:46:34', NULL),
(316, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>outwheel</td><td></td><td>uploads/1/2023-01/deee.png</td></tr></tbody></table>', 1, '2023-01-19 14:47:04', NULL),
(317, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:14:43', NULL),
(318, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>music</td><td></td><td>uploads/1/2023-01/music_utama.mp3</td></tr></tbody></table>', 1, '2023-01-19 15:15:29', NULL),
(319, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:26:31', NULL),
(320, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/donneeee.png</td></tr></tbody></table>', 1, '2023-01-19 15:26:48', NULL),
(321, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:28:08', NULL),
(322, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/done2.png</td></tr></tbody></table>', 1, '2023-01-19 15:28:16', NULL),
(323, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:29:39', NULL),
(324, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>outwheel</td><td></td><td>uploads/1/2023-01/ssssss.png</td></tr></tbody></table>', 1, '2023-01-19 15:30:28', NULL),
(325, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:30:34', NULL),
(326, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/donee3.png</td></tr></tbody></table>', 1, '2023-01-19 15:30:42', NULL),
(327, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:41:41', NULL),
(328, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/aaaaaaxxx.png</td></tr></tbody></table>', 1, '2023-01-19 15:41:49', NULL),
(329, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:50:15', NULL),
(330, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:50:19', NULL),
(331, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/zswqe.png</td></tr><tr><td>outwheel</td><td></td><td>uploads/1/2023-01/aaaaaxxxxxxz.png</td></tr></tbody></table>', 1, '2023-01-19 15:50:40', NULL),
(332, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:52:00', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(333, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/d.png</td></tr></tbody></table>', 1, '2023-01-19 15:52:09', NULL),
(334, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:54:17', NULL),
(335, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/d.png</td></tr></tbody></table>', 1, '2023-01-19 15:54:23', NULL),
(336, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:55:16', NULL),
(337, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/cfds.png</td></tr></tbody></table>', 1, '2023-01-19 15:55:28', NULL),
(338, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 15:57:57', NULL),
(339, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/xde.png</td></tr></tbody></table>', 1, '2023-01-19 15:58:05', NULL),
(340, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:00:09', NULL),
(341, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/swer.png</td></tr></tbody></table>', 1, '2023-01-19 16:00:22', NULL),
(342, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 16:31:37', NULL),
(343, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 16:31:40', NULL),
(344, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data ccccccc at List Draw', '', 1, '2023-01-19 16:31:55', NULL),
(345, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:34:03', NULL),
(346, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/assswwww.png</td></tr></tbody></table>', 1, '2023-01-19 16:34:10', NULL),
(347, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:34:50', NULL),
(348, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/3333.png</td></tr></tbody></table>', 1, '2023-01-19 16:34:56', NULL),
(349, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:35:31', NULL),
(350, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/4444.png</td></tr></tbody></table>', 1, '2023-01-19 16:35:38', NULL),
(351, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:36:14', NULL),
(352, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/5555.png</td></tr></tbody></table>', 1, '2023-01-19 16:36:21', NULL),
(353, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:37:04', NULL),
(354, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/567.png</td></tr></tbody></table>', 1, '2023-01-19 16:37:14', NULL),
(355, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:37:57', NULL),
(356, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/1234.png</td></tr></tbody></table>', 1, '2023-01-19 16:38:05', NULL),
(357, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:38:54', NULL),
(358, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/432.png</td></tr></tbody></table>', 1, '2023-01-19 16:39:00', NULL),
(359, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:41:01', NULL),
(360, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/qww.png</td></tr></tbody></table>', 1, '2023-01-19 16:41:14', NULL),
(361, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:42:05', NULL),
(362, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data Langkah4D at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/jadii.png</td></tr></tbody></table>', 1, '2023-01-19 16:42:15', NULL),
(363, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data misbah at List Draw', '', 1, '2023-01-19 16:50:21', NULL),
(364, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/edit-save/5', 'Update data misbah at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>code</td><td>WCWCI36</td><td>DCX3G</td></tr><tr><td>rotation</td><td>10</td><td></td></tr></tbody></table>', 1, '2023-01-19 16:50:58', NULL),
(365, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of Langkah4D at Tampilan Web', '', 1, '2023-01-19 16:52:27', NULL),
(366, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data spin wheel at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Langkah4D</td><td>spin wheel</td></tr><tr><td>wheel</td><td></td><td>uploads/1/2023-01/woke.png</td></tr></tbody></table>', 1, '2023-01-19 16:52:45', NULL),
(367, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 16:53:35', NULL),
(368, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data spin wheel at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/okw.png</td></tr></tbody></table>', 1, '2023-01-19 16:53:45', NULL),
(369, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 16:54:28', NULL),
(370, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data spin wheel at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/usaaaaaa.png</td></tr></tbody></table>', 1, '2023-01-19 16:54:40', NULL),
(371, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 16:56:48', NULL),
(372, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data spin wheel at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/500px.png</td></tr></tbody></table>', 1, '2023-01-19 16:56:58', NULL),
(373, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 16:59:02', NULL),
(374, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data spin wheel at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/asss.png</td></tr></tbody></table>', 1, '2023-01-19 16:59:13', NULL),
(375, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 17:01:33', NULL),
(376, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data spin wheel at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/spin.png</td></tr></tbody></table>', 1, '2023-01-19 17:01:41', NULL),
(377, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 17:02:02', NULL),
(378, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data misbah at List Draw', '', 1, '2023-01-19 17:02:18', NULL),
(379, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 17:12:17', NULL),
(380, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data rahmat at List Draw', '', 1, '2023-01-19 17:12:29', NULL),
(381, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 17:14:08', NULL),
(382, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data yasfa at List Draw', '', 1, '2023-01-19 17:14:24', NULL),
(383, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 17:19:18', NULL),
(384, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 17:19:21', NULL),
(385, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/delete-image', 'Delete the image of spin wheel at Tampilan Web', '', 1, '2023-01-19 17:19:24', NULL),
(386, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/content/edit-save/1', 'Update data spin wheel at Tampilan Web', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>wheel</td><td></td><td>uploads/1/2023-01/2a.png</td></tr><tr><td>outwheel</td><td></td><td>uploads/1/2023-01/2.png</td></tr><tr><td>background</td><td></td><td>uploads/1/2023-01/2aa.png</td></tr></tbody></table>', 1, '2023-01-19 17:19:50', NULL),
(387, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/delete-image', 'Delete the image of admin at Users Management', '', 1, '2023-01-19 18:05:27', NULL),
(388, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/2', 'Update data admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2023-01/airplane.png</td></tr><tr><td>password</td><td>$2y$10$U2cqL/yFfrMAWcRQN2Onf.VsbogGj/LfpcXjyOBxj9jfCYqlkOZ5K</td><td></td></tr><tr><td>status</td><td></td><td></td></tr></tbody></table>', 1, '2023-01-19 18:05:46', NULL),
(389, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:06:45', NULL),
(390, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:06:47', NULL),
(391, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data rahmat at List Draw', '', 1, '2023-01-19 18:07:01', NULL),
(392, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:24:44', NULL),
(393, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data 6ST4YMH at List Draw', '', 1, '2023-01-19 18:24:59', NULL),
(394, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data AU2U0Y at List Draw', '', 1, '2023-01-19 18:27:52', NULL),
(395, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/edit-save/3', 'Update data LJIWK at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nama</td><td>AU2U0Y</td><td>LJIWK</td></tr><tr><td>code</td><td>AU2U0Y</td><td>LJIWK</td></tr><tr><td>rotation</td><td>10</td><td></td></tr></tbody></table>', 1, '2023-01-19 18:28:36', NULL),
(396, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:31:03', NULL),
(397, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:31:05', NULL),
(398, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:31:06', NULL),
(399, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data GIC3T at List Draw', '', 1, '2023-01-19 18:31:39', NULL),
(400, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data V5S4N at List Draw', '', 1, '2023-01-19 18:32:24', NULL),
(401, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data QBZB8 at List Draw', '', 1, '2023-01-19 18:33:37', NULL),
(402, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:34:17', NULL),
(403, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:34:19', NULL),
(404, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-19 18:34:20', NULL),
(405, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data I5XIZ at List Draw', '', 1, '2023-01-19 18:34:31', NULL),
(406, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2023-01-20 04:28:23', NULL),
(407, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data EZVFH at List Draw', '', 1, '2023-01-20 04:30:21', NULL),
(408, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/code/add-save', 'Add New Data  at Uniqe Code', '', 1, '2023-01-20 04:36:29', NULL),
(409, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/add-save', 'Add New Data TR5AUPA at List Draw', '', 1, '2023-01-20 04:36:41', NULL),
(410, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/edit-save/8', 'Update data  at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>rotation</td><td>10</td><td></td></tr><tr><td>date</td><td>2023-01-20</td><td></td></tr><tr><td>prize_id</td><td>17</td><td>2</td></tr></tbody></table>', 1, '2023-01-20 04:37:18', NULL),
(411, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/draw/edit-save/8', 'Update data  at List Draw', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>nama</td><td>EZVFH</td><td></td></tr><tr><td>code</td><td>EZVFH</td><td>VSJQN</td></tr><tr><td>rotation</td><td>10</td><td></td></tr><tr><td>date</td><td>2023-01-20</td><td></td></tr></tbody></table>', 1, '2023-01-20 04:37:43', NULL),
(412, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2023-01-20 04:38:18', NULL),
(413, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@wheel.com login with IP Address 127.0.0.1', '', 2, '2023-01-20 04:38:24', NULL),
(414, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@wheel.com logout', '', 2, '2023-01-20 04:38:43', NULL),
(415, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2023-01-20 04:38:51', NULL),
(416, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/8', 'Update data Dashboard at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>0</td><td></td></tr></tbody></table>', 1, '2023-01-20 04:40:18', NULL),
(417, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2023-01-20 04:40:25', NULL),
(418, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@wheel.com login with IP Address 127.0.0.1', '', 2, '2023-01-20 04:40:32', NULL),
(419, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'superadmin@wheel.com login with IP Address 127.0.0.1', '', 1, '2023-01-20 04:41:42', NULL),
(420, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'superadmin@wheel.com logout', '', 1, '2023-01-20 04:42:04', NULL),
(421, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@wheel.com login with IP Address 127.0.0.1', '', 2, '2023-01-20 04:42:16', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_menus`
--

CREATE TABLE `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'url',
  `path` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(1, 'Generate Ticket / Code', 'Route', 'AdminCodeControllerGetIndex', 'normal', 'fa fa-code', 0, 1, 0, 1, 3, '2022-11-11 07:29:09', '2022-12-03 04:33:29'),
(2, 'List Prize', 'Route', 'AdminPrizeControllerGetIndex', 'normal', 'fa fa-gift', 0, 1, 0, 1, 4, '2022-11-11 07:31:44', '2022-11-12 10:42:17'),
(3, 'List Draw', 'Route', 'AdminDrawControllerGetIndex', 'normal', 'fa fa-bar-chart', 0, 1, 0, 1, 2, '2022-11-11 07:35:33', '2022-11-12 10:42:06'),
(4, 'History Draw', 'Route', 'AdminHistoryDrawControllerGetIndex', NULL, 'fa fa-th-list', 0, 0, 0, 1, 1, '2022-11-11 08:57:47', NULL),
(5, 'Tampilan Web', 'Route', 'AdminContentControllerGetIndex', 'normal', 'fa fa-image', 0, 1, 0, 1, 5, '2022-11-12 09:41:35', '2022-11-12 10:42:22'),
(6, 'Faq', 'Route', 'AdminFaqControllerGetIndex', 'normal', 'fa fa-book', 0, 1, 0, 1, 6, '2022-11-12 10:14:23', '2022-11-12 10:42:28'),
(7, 'Users Access', 'Route', 'AdminCmsUsers1ControllerGetIndex', 'normal', 'fa fa-users', 0, 1, 0, 1, 7, '2022-11-30 14:47:53', '2022-11-30 14:50:53'),
(8, 'Dashboard', 'Route', 'AdminDashboardControllerGetIndex', 'normal', 'fa fa-dashboard', 0, 1, 1, 1, 1, '2022-12-03 04:19:12', '2023-01-20 04:40:18'),
(9, 'Log Access', 'Route', 'AdminLogAccessControllerGetIndex', NULL, 'fa fa-flag', 0, 1, 0, 1, 8, '2022-12-03 04:58:20', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_menus_privileges`
--

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(4, 4, 1),
(7, 3, 2),
(8, 3, 1),
(11, 2, 2),
(12, 2, 1),
(13, 5, 2),
(14, 5, 1),
(15, 6, 2),
(16, 6, 1),
(18, 7, 2),
(19, 7, 1),
(22, 1, 2),
(23, 1, 1),
(24, 9, 1),
(25, 8, 2),
(26, 8, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_moduls`
--

CREATE TABLE `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2022-11-11 07:13:03', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2022-11-11 07:13:03', NULL, NULL),
(12, 'Uniqe Code', 'fa fa-code', 'code', 'code', 'AdminCodeController', 0, 0, '2022-11-11 07:29:09', NULL, NULL),
(13, 'List Prize', 'fa fa-gift', 'prize', 'prize', 'AdminPrizeController', 0, 0, '2022-11-11 07:31:44', NULL, NULL),
(14, 'List Draw', 'fa fa-bar-chart', 'draw', 'draw', 'AdminDrawController', 0, 0, '2022-11-11 07:35:33', NULL, NULL),
(15, 'History Draw', 'fa fa-th-list', 'history_draw', 'history_draw', 'AdminHistoryDrawController', 0, 0, '2022-11-11 08:57:47', NULL, NULL),
(16, 'Tampilan Web', 'fa fa-image', 'content', 'content', 'AdminContentController', 0, 0, '2022-11-12 09:41:35', NULL, NULL),
(17, 'Faq', 'fa fa-book', 'faq', 'faq', 'AdminFaqController', 0, 0, '2022-11-12 10:14:23', NULL, NULL),
(18, 'Users Access', 'fa fa-users', 'cms_users', 'cms_users', 'AdminCmsUsers1Controller', 0, 0, '2022-11-30 14:47:52', NULL, NULL),
(19, 'Dashboard', 'fa fa-dashboard', 'dashboard', 'dashboard', 'AdminDashboardController', 0, 0, '2022-12-03 04:19:12', NULL, NULL),
(20, 'Log Access', 'fa fa-flag', 'log_access', 'log_access', 'AdminLogAccessController', 0, 0, '2022-12-03 04:58:20', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_notifications`
--

CREATE TABLE `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_privileges`
--

CREATE TABLE `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-black-light', '2022-11-11 07:13:03', NULL),
(2, 'admin', 0, 'skin-black-light', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_privileges_roles`
--

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(12, 1, 1, 1, 1, 1, 1, 4, NULL, NULL),
(13, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(14, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(15, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(16, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(17, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(18, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(33, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(42, 1, 1, 1, 1, 1, 1, 19, NULL, NULL),
(43, 1, 1, 1, 1, 1, 1, 20, NULL, NULL),
(44, 1, 1, 1, 1, 1, 2, 19, NULL, NULL),
(45, 1, 1, 1, 1, 1, 2, 17, NULL, NULL),
(46, 1, 0, 1, 0, 0, 2, 15, NULL, NULL),
(47, 1, 1, 1, 1, 1, 2, 14, NULL, NULL),
(48, 1, 0, 1, 1, 0, 2, 13, NULL, NULL),
(49, 1, 1, 1, 1, 1, 2, 16, NULL, NULL),
(50, 1, 1, 1, 1, 1, 2, 12, NULL, NULL),
(51, 1, 1, 1, 1, 1, 2, 18, NULL, NULL),
(52, 1, 1, 1, 1, 1, 2, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `content_input_type` varchar(255) DEFAULT NULL,
  `dataenum` varchar(255) DEFAULT NULL,
  `helper` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', NULL, 'text', NULL, 'Input hexacode', '2022-11-11 07:13:03', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2022-11-11 07:13:03', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', 'uploads/2023-01/093ff0ec65e65343e62ef5f94612bde9.png', 'upload_image', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2022-11-11 07:13:03', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2022-11-11 07:13:03', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'Lucky Spin', 'text', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2022-11-11 07:13:03', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2023-01/1fc20ad2917f9d4c73685ab6cc26bfa9.png', 'upload_image', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', NULL, 'upload_image', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2022-11-11 07:13:03', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2022-11-11 07:13:03', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_statistics`
--

CREATE TABLE `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_statistics`
--

INSERT INTO `cms_statistics` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'History Draw', 'history-draw', '2022-11-12 11:03:10', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_statistic_components`
--

CREATE TABLE `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) DEFAULT NULL,
  `component_name` varchar(255) DEFAULT NULL,
  `area_name` varchar(55) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_statistic_components`
--

INSERT INTO `cms_statistic_components` (`id`, `id_cms_statistics`, `componentID`, `component_name`, `area_name`, `sorting`, `name`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, '443871f67247280afbf861817d86ccab', 'smallbox', NULL, 0, 'Untitled', NULL, '2022-11-12 11:03:27', NULL),
(2, 1, '6eed3bc23ec6275b2da805900bd31ae2', 'table', 'area5', 0, NULL, '{\"name\":\"List Draw\",\"sql\":\"SELECT nama, code, prize.label as prize, created_at as date FROM history_draw  JOIN prize ON history_draw.prize_id = prize.id;\"}', '2022-11-12 11:03:29', NULL),
(3, 1, '2c80cc918a10ecd3784250c4081645d2', 'table', NULL, 0, 'Untitled', NULL, '2022-11-12 11:07:23', NULL),
(4, 1, 'f78f258b340a93c761704daf7663b6e5', 'table', 'area5', 0, NULL, '{\"name\":\"History Draw\",\"sql\":\"SELECT nama, code, created_at as date ,prize.label as prize FROM history_draw JOIN prize ON history_draw.prize_id = prize.id;\"}', '2022-11-12 11:07:27', NULL),
(5, 1, 'f0c129c34a252768b9675026f6ed33c1', 'chartarea', NULL, 0, 'Untitled', NULL, '2022-11-12 11:10:11', NULL),
(6, 1, 'c5d90ef910f85b7b0ece1ec478763d96', 'chartarea', NULL, 0, 'Untitled', NULL, '2022-11-12 11:10:12', NULL),
(7, 1, '56151e90a3f8676b941e05c8103ed523', 'chartbar', 'area1', 0, 'Untitled', NULL, '2022-11-12 11:10:18', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Admin', 'uploads/1/2022-11/tanlalana.png', 'superadmin@wheel.com', '$2y$10$gzd0fadI2hU71ZdsGWZeBuiDEjwx4QyiLZEC8t2l2InReaJkGFPm6', 1, '2022-11-11 07:13:03', '2022-11-28 05:00:43', 'Active'),
(2, 'admin', 'uploads/1/2023-01/airplane.png', 'admin@wheel.com', '$2y$10$U2cqL/yFfrMAWcRQN2Onf.VsbogGj/LfpcXjyOBxj9jfCYqlkOZ5K', 2, '2022-11-12 10:41:49', '2023-01-19 18:05:46', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `code`
--

CREATE TABLE `code` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `used` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `code`
--

INSERT INTO `code` (`id`, `code`, `used`, `created_at`, `updated_at`) VALUES
(1, 'AU2U0Y', 1, '2023-01-19 18:06:45', '2023-01-19 18:07:09'),
(2, 'LJIWK', 1, '2023-01-19 18:06:47', '2023-01-19 18:28:42'),
(3, '6ST4YMH', 1, '2023-01-19 18:24:44', '2023-01-19 18:25:04'),
(4, 'GIC3T', 1, '2023-01-19 18:31:03', '2023-01-19 18:31:42'),
(5, 'V5S4N', 1, '2023-01-19 18:31:05', '2023-01-19 18:32:30'),
(6, 'QBZB8', 1, '2023-01-19 18:31:06', '2023-01-19 18:33:41'),
(7, 'BMMUL', 0, '2023-01-19 18:34:17', NULL),
(8, 'VSJQN', 1, '2023-01-19 18:34:19', '2023-01-20 04:37:47'),
(9, 'I5XIZ', 1, '2023-01-19 18:34:20', '2023-01-19 18:34:38'),
(10, 'TR5AUPA', 1, '2023-01-20 04:36:29', '2023-01-20 04:36:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `content`
--

CREATE TABLE `content` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `wheel` varchar(255) DEFAULT NULL,
  `outwheel` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `background` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `music` varchar(255) DEFAULT NULL,
  `music_win` varchar(255) DEFAULT NULL,
  `music_lose` varchar(255) DEFAULT NULL,
  `music_spin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `content`
--

INSERT INTO `content` (`id`, `name`, `wheel`, `outwheel`, `logo`, `background`, `favicon`, `music`, `music_win`, `music_lose`, `music_spin`, `created_at`, `updated_at`) VALUES
(1, 'spin wheel', 'uploads/1/2023-01/2a.png', 'uploads/1/2023-01/2.png', 'uploads/1/2022-11/wheel_logo_20220821155631.png', 'uploads/1/2023-01/2aa.png', 'uploads/1/2022-11/favicon.png', 'uploads/1/2023-01/music_utama.mp3', 'uploads/1/2022-11/win.mp3', 'uploads/1/2022-11/lose.mp3', 'uploads/1/2022-11/spin.mp3', '2022-11-12 09:44:55', '2023-01-19 17:19:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dashboard`
--

CREATE TABLE `dashboard` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `draw`
--

CREATE TABLE `draw` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `sent` int(11) DEFAULT NULL,
  `rotation` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `prize_id` int(11) NOT NULL,
  `retry_used` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `draw`
--

INSERT INTO `draw` (`id`, `nama`, `code`, `sent`, `rotation`, `date`, `prize_id`, `retry_used`, `created_at`, `updated_at`) VALUES
(1, 'rahmat', 'AU2U0Y', 1, 36414, '2023-01-01', 7, 0, '2023-01-19 18:07:01', '2023-01-19 18:07:09'),
(2, '6ST4YMH', '6ST4YMH', 1, 36558, '2023-01-03', 3, 0, '2023-01-19 18:24:59', '2023-01-19 18:25:04'),
(3, 'LJIWK', 'LJIWK', 1, 36414, '2022-12-26', 7, 0, '2023-01-19 18:27:52', '2023-01-19 18:28:42'),
(4, 'GIC3T', 'GIC3T', 1, 36594, '2023-01-01', 2, 0, '2023-01-19 18:31:39', '2023-01-19 18:31:42'),
(5, 'V5S4N', 'V5S4N', 1, 36522, '2023-01-23', 4, 0, '2023-01-19 18:32:24', '2023-01-19 18:32:30'),
(6, 'QBZB8', 'QBZB8', 1, 36558, '2023-01-03', 3, 0, '2023-01-19 18:33:37', '2023-01-19 18:33:41'),
(7, 'I5XIZ', 'I5XIZ', 1, 36594, '2023-01-10', 2, 0, '2023-01-19 18:34:31', '2023-01-19 18:34:38'),
(8, 'EZVFH', 'VSJQN', 1, 36594, '2023-01-20', 2, 0, '2023-01-20 04:30:21', '2023-01-20 04:37:47'),
(9, 'TR5AUPA', 'TR5AUPA', 1, 36558, '2023-01-20', 3, 0, '2023-01-20 04:36:41', '2023-01-20 04:36:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `faq`
--

INSERT INTO `faq` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Minimal Total Deposit Rp. 100.000,- Untuk 1 Tiket ( Hanya berlaku via', '2022-11-12 10:14:40', NULL),
(2, 'ersyaratan untuk mendapatkan tiket lucky SPIN wheel member harus menca', '2022-11-12 10:14:48', NULL),
(3, 'Member wajib claim untuk mendapatkan kode kupon (tiket) dan claim ke w', '2022-11-12 10:14:55', NULL),
(4, 'Bonus Lucky SPIN Wheel dapat di ambil disini, LuckySPIN', '2022-11-12 10:15:04', NULL),
(5, 'Tiket / Kupon akan di berikan setiap hari 1x.', '2022-11-12 10:15:11', NULL),
(6, 'Tiket Lucky SPIN Wheel hanya berlaku sampai pukul 23:59 WIB, Jika tike', '2022-11-12 10:15:18', NULL),
(7, 'Wajib screenshoot bukti history deposit di periode hari tersebut dan H', '2022-11-12 10:15:38', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `history_draw`
--

CREATE TABLE `history_draw` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `draw_id` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `rotation` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `prize_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `history_draw`
--

INSERT INTO `history_draw` (`id`, `draw_id`, `nama`, `code`, `rotation`, `date`, `prize_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'AU2U0Y', 'AU2U0Y', 36414, '2023-01-20', 7, '2023-01-19 18:07:09', '2023-01-19 18:07:09'),
(2, 2, '6ST4YMH', '6ST4YMH', 36558, '2023-01-20', 3, '2023-01-19 18:25:04', '2023-01-19 18:25:04'),
(3, 3, 'LJIWK', 'LJIWK', 36414, '2023-01-20', 7, '2023-01-19 18:28:42', '2023-01-19 18:28:42'),
(4, 4, 'GIC3T', 'GIC3T', 36594, '2023-01-20', 2, '2023-01-19 18:31:42', '2023-01-19 18:31:42'),
(5, 5, 'V5S4N', 'V5S4N', 36522, '2023-01-20', 4, '2023-01-19 18:32:30', '2023-01-19 18:32:30'),
(6, 6, 'QBZB8', 'QBZB8', 36558, '2023-01-20', 3, '2023-01-19 18:33:41', '2023-01-19 18:33:41'),
(7, 7, 'I5XIZ', 'I5XIZ', 36594, '2023-01-20', 2, '2023-01-19 18:34:38', '2023-01-19 18:34:38'),
(8, 9, 'TR5AUPA', 'TR5AUPA', 36558, '2023-01-20', 3, '2023-01-20 04:36:55', '2023-01-20 04:36:55'),
(9, 8, 'VSJQN', 'VSJQN', 36594, '2023-01-20', 2, '2023-01-20 04:37:47', '2023-01-20 04:37:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_access`
--

CREATE TABLE `log_access` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `log_access`
--

INSERT INTO `log_access` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:39:22', '2023-01-20 00:39:22', '2023-01-20 00:39:22'),
(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:39:33', '2023-01-20 00:39:33', '2023-01-20 00:39:33'),
(3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:40:20', '2023-01-20 00:40:20', '2023-01-20 00:40:20'),
(4, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'http://127.0.0.1:8000/', 'visit spin', '00:40:33', '2023-01-20 00:40:33', '2023-01-20 00:40:33'),
(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:40:40', '2023-01-20 00:40:40', '2023-01-20 00:40:40'),
(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:40:54', '2023-01-20 00:40:54', '2023-01-20 00:40:54'),
(7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:41:16', '2023-01-20 00:41:16', '2023-01-20 00:41:16'),
(8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:43:13', '2023-01-20 00:43:13', '2023-01-20 00:43:13'),
(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:43:30', '2023-01-20 00:43:30', '2023-01-20 00:43:30'),
(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:43:35', '2023-01-20 00:43:35', '2023-01-20 00:43:35'),
(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:50:54', '2023-01-20 00:50:54', '2023-01-20 00:50:54'),
(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:53:55', '2023-01-20 00:53:55', '2023-01-20 00:53:55'),
(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:55:40', '2023-01-20 00:55:40', '2023-01-20 00:55:40'),
(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:56:39', '2023-01-20 00:56:39', '2023-01-20 00:56:39'),
(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:57:22', '2023-01-20 00:57:22', '2023-01-20 00:57:22'),
(16, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'http://127.0.0.1:8000/', 'visit spin', '00:57:46', '2023-01-20 00:57:46', '2023-01-20 00:57:46'),
(17, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'http://127.0.0.1:8000/', 'visit spin', '00:58:12', '2023-01-20 00:58:12', '2023-01-20 00:58:12'),
(18, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'http://127.0.0.1:8000/', 'visit spin', '00:59:26', '2023-01-20 00:59:26', '2023-01-20 00:59:26'),
(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '00:59:33', '2023-01-20 00:59:33', '2023-01-20 00:59:33'),
(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:01:08', '2023-01-20 01:01:08', '2023-01-20 01:01:08'),
(21, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'http://127.0.0.1:8000/', 'visit spin', '01:02:29', '2023-01-20 01:02:29', '2023-01-20 01:02:29'),
(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:02:35', '2023-01-20 01:02:35', '2023-01-20 01:02:35'),
(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:03:24', '2023-01-20 01:03:24', '2023-01-20 01:03:24'),
(24, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'http://127.0.0.1:8000/', 'visit spin', '01:03:33', '2023-01-20 01:03:33', '2023-01-20 01:03:33'),
(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:03:39', '2023-01-20 01:03:39', '2023-01-20 01:03:39'),
(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:04:38', '2023-01-20 01:04:38', '2023-01-20 01:04:38'),
(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:04:43', '2023-01-20 01:04:43', '2023-01-20 01:04:43'),
(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:04:48', '2023-01-20 01:04:48', '2023-01-20 01:04:48'),
(29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:05:02', '2023-01-20 01:05:02', '2023-01-20 01:05:02'),
(30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:05:05', '2023-01-20 01:05:05', '2023-01-20 01:05:05'),
(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:05:13', '2023-01-20 01:05:13', '2023-01-20 01:05:13'),
(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:07:44', '2023-01-20 01:07:44', '2023-01-20 01:07:44'),
(33, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'http://127.0.0.1:8000/', 'visit spin', '01:08:02', '2023-01-20 01:08:02', '2023-01-20 01:08:02'),
(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:24:37', '2023-01-20 01:24:37', '2023-01-20 01:24:37'),
(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:28:07', '2023-01-20 01:28:07', '2023-01-20 01:28:07'),
(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:28:11', '2023-01-20 01:28:11', '2023-01-20 01:28:11'),
(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:28:16', '2023-01-20 01:28:16', '2023-01-20 01:28:16'),
(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:30:57', '2023-01-20 01:30:57', '2023-01-20 01:30:57'),
(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:32:09', '2023-01-20 01:32:09', '2023-01-20 01:32:09'),
(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:32:52', '2023-01-20 01:32:52', '2023-01-20 01:32:52'),
(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '01:34:35', '2023-01-20 01:34:35', '2023-01-20 01:34:35'),
(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 Edg/109.0.1518.55', 'http://127.0.0.1:8000/', 'visit spin', '03:38:08', '2023-01-20 03:38:08', '2023-01-20 03:38:08'),
(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '03:38:23', '2023-01-20 03:38:23', '2023-01-20 03:38:23'),
(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '03:38:29', '2023-01-20 03:38:29', '2023-01-20 03:38:29'),
(45, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '03:38:34', '2023-01-20 03:38:34', '2023-01-20 03:38:34'),
(46, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '11:28:09', '2023-01-20 11:28:09', '2023-01-20 11:28:09'),
(47, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '11:36:49', '2023-01-20 11:36:49', '2023-01-20 11:36:49'),
(48, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '11:37:23', '2023-01-20 11:37:23', '2023-01-20 11:37:23'),
(49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '11:37:26', '2023-01-20 11:37:26', '2023-01-20 11:37:26'),
(50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/', 'visit spin', '11:40:51', '2023-01-20 11:40:51', '2023-01-20 11:40:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_08_07_145904_add_table_cms_apicustom', 1),
(4, '2016_08_07_150834_add_table_cms_dashboard', 1),
(5, '2016_08_07_151210_add_table_cms_logs', 1),
(6, '2016_08_07_151211_add_details_cms_logs', 1),
(7, '2016_08_07_152014_add_table_cms_privileges', 1),
(8, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(9, '2016_08_07_152320_add_table_cms_settings', 1),
(10, '2016_08_07_152421_add_table_cms_users', 1),
(11, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
(12, '2016_08_07_154624_add_table_cms_moduls', 1),
(13, '2016_08_17_225409_add_status_cms_users', 1),
(14, '2016_08_20_125418_add_table_cms_notifications', 1),
(15, '2016_09_04_033706_add_table_cms_email_queues', 1),
(16, '2016_09_16_035347_add_group_setting', 1),
(17, '2016_09_16_045425_add_label_setting', 1),
(18, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(19, '2016_10_01_141740_add_method_type_apicustom', 1),
(20, '2016_10_01_141846_add_parameters_apicustom', 1),
(21, '2016_10_01_141934_add_responses_apicustom', 1),
(22, '2016_10_01_144826_add_table_apikey', 1),
(23, '2016_11_14_141657_create_cms_menus', 1),
(24, '2016_11_15_132350_create_cms_email_templates', 1),
(25, '2016_11_15_190410_create_cms_statistics', 1),
(26, '2016_11_17_102740_create_cms_statistic_components', 1),
(27, '2017_06_06_164501_add_deleted_at_cms_moduls', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2022_11_11_142120_create_code_table', 2),
(30, '2022_11_11_142133_create_draw_table', 2),
(31, '2022_11_11_142202_create_prize_table', 2),
(32, '2022_11_11_155550_create_history_draw_table', 3),
(33, '2022_11_12_161715_create_content_table', 4),
(34, '2022_11_12_162203_create_faq_table', 4),
(35, '2022_12_03_110437_create_dashboard_table', 5),
(37, '2022_12_03_115016_create_log_access_table', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prize`
--

CREATE TABLE `prize` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `winner` int(11) NOT NULL,
  `try_again` int(11) NOT NULL,
  `sorter` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `prize`
--

INSERT INTO `prize` (`id`, `label`, `winner`, `try_again`, `sorter`, `created_at`, `updated_at`) VALUES
(1, 'IPHONE 12', 1, 0, 1, '2022-11-11 07:39:41', '2022-11-28 05:19:32'),
(2, 'ZONK', 0, 0, 2, '2022-11-11 08:05:00', '2022-12-04 12:25:11'),
(3, '100 RB', 1, 0, 3, '2022-11-11 08:05:16', '2022-11-28 04:57:14'),
(4, '200 RB', 1, 0, 4, '2022-11-11 08:36:54', '2022-11-28 04:57:24'),
(5, '500 rb', 1, 0, 5, '2022-11-11 18:57:17', '2022-11-12 19:48:21'),
(6, 'MOTOR NMAX', 1, 0, 6, '2022-11-11 18:57:33', '2022-11-30 14:45:59'),
(7, '1 JT', 1, 0, 7, '2022-11-11 18:57:49', '2022-11-28 04:58:07'),
(8, 'FREE SPIN', 0, 1, 8, '2022-11-11 18:58:05', '2022-11-28 05:19:38'),
(16, 'ZONK', 0, 0, 9, '2022-11-30 14:35:13', '2022-12-04 12:25:29'),
(17, '20 RB', 1, 0, 10, '2022-11-30 14:35:43', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_apikey`
--
ALTER TABLE `cms_apikey`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_logs`
--
ALTER TABLE `cms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_menus`
--
ALTER TABLE `cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_moduls`
--
ALTER TABLE `cms_moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_notifications`
--
ALTER TABLE `cms_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_privileges`
--
ALTER TABLE `cms_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_statistics`
--
ALTER TABLE `cms_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `draw`
--
ALTER TABLE `draw`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `history_draw`
--
ALTER TABLE `history_draw`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_access`
--
ALTER TABLE `log_access`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `prize`
--
ALTER TABLE `prize`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_apikey`
--
ALTER TABLE `cms_apikey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_email_templates`
--
ALTER TABLE `cms_email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cms_logs`
--
ALTER TABLE `cms_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT untuk tabel `cms_menus`
--
ALTER TABLE `cms_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `cms_moduls`
--
ALTER TABLE `cms_moduls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `cms_notifications`
--
ALTER TABLE `cms_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cms_privileges`
--
ALTER TABLE `cms_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `cms_statistics`
--
ALTER TABLE `cms_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `code`
--
ALTER TABLE `code`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `content`
--
ALTER TABLE `content`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `dashboard`
--
ALTER TABLE `dashboard`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `draw`
--
ALTER TABLE `draw`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `history_draw`
--
ALTER TABLE `history_draw`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `log_access`
--
ALTER TABLE `log_access`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `prize`
--
ALTER TABLE `prize`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
