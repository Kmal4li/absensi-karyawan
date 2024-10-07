/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - db_database
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_database`;

/*Table structure for table `absensis` */

DROP TABLE IF EXISTS `absensis`;

CREATE TABLE `absensis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(20) NOT NULL,
  `status` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `absensis` */

insert  into `absensis`(`id`,`users_id`,`status`,`keterangan`,`created_at`,`updated_at`) values 
(2,1,'Izin','Kepentingan Keluarga','2022-01-13 19:05:43','2022-01-13 19:05:43'),
(3,2,'Hadir','Membuat aplikasi laravel','2022-01-14 09:56:00','2022-01-14 09:56:00'),
(4,2,'Hadir','Mengerjakan penulisan','2022-01-15 06:56:44','2022-01-15 06:56:44'),
(5,2,'Hadir','Membaca','2022-01-15 06:59:00','2022-01-15 06:59:00'),
(6,2,'Sakit','Batuk','2022-01-15 07:05:12','2022-01-15 07:05:12'),
(7,2,'Sakit','Sakit Kepala','2022-01-17 08:52:02','2022-01-17 08:52:02'),
(8,3,'Izin','keperluan keluarga','2022-01-17 23:47:38','2022-01-17 23:47:38'),
(9,4,'Sakit','tidak bisa hadir','2022-01-17 23:56:31','2022-01-17 23:56:31'),
(10,6,'Hadir','mengikuti mata kuliah pemograman framework','2022-01-18 00:42:22','2022-01-18 00:42:22'),
(11,7,'Hadir','ikut kuliah pemograman framework','2022-01-18 00:48:55','2022-01-18 00:48:55'),
(12,9,'Hadir','mengikuti perkuliahan','2022-01-18 01:10:57','2022-01-18 01:10:57');

/*Table structure for table `attendance_position` */

DROP TABLE IF EXISTS `attendance_position`;

CREATE TABLE `attendance_position` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attendance_id` bigint(20) unsigned NOT NULL,
  `position_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_position_attendance_id_foreign` (`attendance_id`),
  KEY `attendance_position_position_id_foreign` (`position_id`),
  CONSTRAINT `attendance_position_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_position_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attendance_position` */

insert  into `attendance_position`(`id`,`attendance_id`,`position_id`,`created_at`,`updated_at`) values 
(1,1,1,NULL,NULL);

/*Table structure for table `attendances` */

DROP TABLE IF EXISTS `attendances`;

CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `start_time` time NOT NULL,
  `batas_start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `batas_end_time` time NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `attendances` */

insert  into `attendances`(`id`,`title`,`description`,`start_time`,`batas_start_time`,`end_time`,`batas_end_time`,`code`,`created_at`,`updated_at`) values 
(1,'contoh','contoh\n','09:00:00','09:30:00','16:00:00','16:20:00',NULL,'2024-10-03 09:07:11','2024-10-03 09:09:11');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2022_06_16_075041_create_roles_table',1),
(6,'2022_06_16_075123_add_role_id_to_users_table',1),
(7,'2022_06_17_134607_create_positions_table',1),
(8,'2022_06_17_142639_add_phone_and_position_id_to_users_table',1),
(9,'2022_06_20_114945_create_holidays_table',1),
(10,'2022_06_21_135647_create_attendances_table',1),
(11,'2022_06_21_135721_create_attendance_position_table',1),
(12,'2022_06_21_144144_create_presences_table',1),
(13,'2022_06_26_214220_create_permissions_table',1),
(14,'2022_06_26_214239_add_is_permission_to_presences_table',1),
(15,'2022_06_26_215859_add_permission_date_to_permissions_table',1),
(16,'2022_06_27_162656_add_is_accepted_to_permissions_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `pembimbings` */

DROP TABLE IF EXISTS `pembimbings`;

CREATE TABLE `pembimbings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `name_pbb` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `wa` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pembimbings` */

insert  into `pembimbings`(`id`,`users_id`,`name_pbb`,`alamat`,`wa`,`created_at`,`updated_at`) values 
(5,1,'Juwaeni','Jln. Oma Anggawisastra No. 50','08814500689','2022-01-17 10:56:24','2022-01-18 01:14:49'),
(8,9,'putra','cisaranten kulon','089765432455','2022-01-18 01:14:01','2022-01-18 01:14:01');

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `attendance_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(500) NOT NULL,
  `permission_date` date NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_user_id_foreign` (`user_id`),
  KEY `permissions_attendance_id_foreign` (`attendance_id`),
  CONSTRAINT `permissions_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `positions` */

DROP TABLE IF EXISTS `positions`;

CREATE TABLE `positions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `positions` */

insert  into `positions`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'Pegawai \"Biasa\"','2024-10-03 05:59:25','2024-10-03 05:59:25'),
(2,'Manager','2024-10-03 05:59:25','2024-10-03 05:59:25'),
(3,'Direktur','2024-10-03 05:59:25','2024-10-03 05:59:25'),
(4,'Operator','2024-10-03 05:59:25','2024-10-03 05:59:25');

/*Table structure for table `presences` */

DROP TABLE IF EXISTS `presences`;

CREATE TABLE `presences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `attendance_id` bigint(20) unsigned NOT NULL,
  `presence_date` date NOT NULL,
  `presence_enter_time` varchar(255) DEFAULT NULL,
  `presence_out_time` time DEFAULT NULL,
  `is_permission` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `presences_user_id_foreign` (`user_id`),
  KEY `presences_attendance_id_foreign` (`attendance_id`),
  CONSTRAINT `presences_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `presences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `presences` */

insert  into `presences`(`id`,`user_id`,`attendance_id`,`presence_date`,`presence_enter_time`,`presence_out_time`,`is_permission`,`created_at`,`updated_at`) values 
(1,14,1,'2024-10-03','09:09:31',NULL,0,'2024-10-03 09:09:31','2024-10-03 09:09:31');

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'admin','2024-10-03 05:59:25','2024-10-03 05:59:25'),
(2,'operator','2024-10-03 05:59:25','2024-10-03 05:59:25'),
(3,'user','2024-10-03 05:59:25','2024-10-03 05:59:25');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `position_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_position_id_foreign` (`position_id`),
  CONSTRAINT `users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`phone`,`position_id`,`role_id`,`remember_token`,`created_at`,`updated_at`) values 
(1,'kamalz','admin@gmail.com','2024-10-03 05:59:25','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','09172381',4,1,'A5rBnjiVEyrfhJTSIqUkgMa0sQtZl6YrhYMz3DjkPeE994ipapSBm1gxKO34','2024-10-03 05:59:25','2024-10-03 11:51:53'),
(13,'Akmal','akmal@gmail.com',NULL,'$2y$10$7lW73.mdbCfUqiPzs0gLvu4K3Dzr7Qm365pa7JAOwYS6tGiDPPCJu','0821239131',2,1,'MVDrmbB7sHRAdlucwIJc6mlURXihKVWOBpS23x2PjDXB4yW4WmsO60VvWm4Z','2024-10-03 08:47:15','2024-10-03 08:47:15'),
(14,'kamal','kamal@gmail.com',NULL,'$2y$10$1q7Lt0BtCILlia4QOI5q6Oz0GFuwfMz5cz881BvKoNcF1ddz5aNQm','082138713',1,3,NULL,'2024-10-03 09:07:46','2024-10-03 09:07:46');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
