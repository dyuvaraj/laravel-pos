/*
 Navicat Premium Data Transfer

 Source Server         : ssa
 Source Server Type    : MariaDB
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : pos

 Target Server Type    : MariaDB
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 17/02/2021 17:50:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_02_16_163514_create_products_table', 2);
INSERT INTO `migrations` VALUES (5, '2021_02_16_164619_create_salesorders_table', 2);
INSERT INTO `migrations` VALUES (6, '2021_02_16_165234_create_orderlists_table', 2);
INSERT INTO `migrations` VALUES (8, '2021_02_16_190025_create_order_histories_table', 3);
INSERT INTO `migrations` VALUES (9, '2021_02_16_185742_order_history', 4);

-- ----------------------------
-- Table structure for order_histories
-- ----------------------------
DROP TABLE IF EXISTS `order_histories`;
CREATE TABLE `order_histories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_histories
-- ----------------------------
INSERT INTO `order_histories` VALUES (1, '2021-02-16', 'Yuvaraj', 18, NULL, NULL);
INSERT INTO `order_histories` VALUES (2, '2021-02-16', 'Yuvaraj', 182, NULL, NULL);

-- ----------------------------
-- Table structure for orderlists
-- ----------------------------
DROP TABLE IF EXISTS `orderlists`;
CREATE TABLE `orderlists`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `salesorder_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlists
-- ----------------------------
INSERT INTO `orderlists` VALUES (1, '3', '1', '2', '2021-02-16 18:17:32', '2021-02-16 18:28:47');
INSERT INTO `orderlists` VALUES (2, '3', '2', '3', '2021-02-16 18:17:32', '2021-02-16 18:28:47');
INSERT INTO `orderlists` VALUES (3, '6', '1', '1', '2021-02-16 19:06:48', '2021-02-16 19:06:48');
INSERT INTO `orderlists` VALUES (4, '6', '2', '1', '2021-02-16 19:06:48', '2021-02-16 19:06:48');
INSERT INTO `orderlists` VALUES (5, '7', '1', '1', '2021-02-16 19:07:46', '2021-02-16 19:07:46');
INSERT INTO `orderlists` VALUES (6, '7', '2', '1', '2021-02-16 19:07:46', '2021-02-16 19:07:46');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_sell_price` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Pencil', 'P-PENCIL', 5, 10, '2021-02-16 17:22:28', '2021-02-16 17:22:28');
INSERT INTO `products` VALUES (2, 'Pencil 2', 'P-PENCIL2', 5, 8, '2021-02-16 18:07:36', '2021-02-16 18:23:08');
INSERT INTO `products` VALUES (3, 'Pencil 3', 'P-PENCIL3', 6, 12, '2021-02-17 08:26:17', '2021-02-17 08:26:17');
INSERT INTO `products` VALUES (4, 'Pencil 4', 'P-PENCIL4', 7, 14, '2021-02-17 08:30:28', '2021-02-17 08:30:28');
INSERT INTO `products` VALUES (5, 'Pencil 5', 'P-PENCIL5', 8, 16, '2021-02-17 08:51:10', '2021-02-17 08:51:10');

-- ----------------------------
-- Table structure for salesorders
-- ----------------------------
DROP TABLE IF EXISTS `salesorders`;
CREATE TABLE `salesorders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salesorders
-- ----------------------------
INSERT INTO `salesorders` VALUES (3, '2021-03-16', 'Yuvaraj', 20, '2021-02-16 18:17:32', '2021-02-16 18:28:08');
INSERT INTO `salesorders` VALUES (6, '2021-02-16', 'Yuvaraj', 18, '2021-02-16 19:06:48', '2021-02-16 19:06:48');
INSERT INTO `salesorders` VALUES (7, '2021-02-08', 'Yuvaraj', 182, '2021-02-16 19:07:45', '2021-02-16 19:07:45');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Yuvaraj', 'd_yuvaraj@hotmail.com', '2021-02-17 05:35:14', '$2y$10$aE9k95dUGaV9CKdbX5wACuUMCbmgoQtdaNHpXxoRblzoKQTLzVxQ.', NULL, '2021-02-16 16:23:02', '2021-02-17 05:35:14');
INSERT INTO `users` VALUES (6, 'Yuvaraj', 'd_yuvarajs@hotmail.com', '2021-02-16 20:17:31', '$2y$10$01XI9Db2zUrEOQi6/rUrn.VkL54CyV3uUa6VeuAGGdia5aoxNzytO', NULL, '2021-02-16 20:10:58', '2021-02-16 20:17:31');
INSERT INTO `users` VALUES (7, 'Yuvaraj D', 'd_yuvaraja@hotmail.com', '2021-02-17 05:17:33', '$2y$10$P07QGmah7LXW4BMQdNgBC.eOcLy5XzpykyCaFxdURXxPyp.OMyFWa', NULL, '2021-02-17 05:16:15', '2021-02-17 05:17:33');

-- ----------------------------
-- Triggers structure for table salesorders
-- ----------------------------
DROP TRIGGER IF EXISTS `so_to_oh`;
delimiter ;;
CREATE TRIGGER `so_to_oh` AFTER INSERT ON `salesorders` FOR EACH ROW BEGIN
                   INSERT INTO `order_histories` (`order_date`, `customer_name`, `total`) VALUES (NEW.order_date, NEW.customer_name, NEW.total);
                END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
