/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50641
 Source Host           : localhost:3306
 Source Schema         : gateway

 Target Server Type    : MySQL
 Target Server Version : 50641
 File Encoding         : 65001

 Date: 26/04/2022 19:01:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dynamic_version
-- ----------------------------
DROP TABLE IF EXISTS `dynamic_version`;
CREATE TABLE `dynamic_version`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键、自动增长、版本号',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dynamic_version
-- ----------------------------
INSERT INTO `dynamic_version` VALUES (4, '2022-04-18 21:57:56');
INSERT INTO `dynamic_version` VALUES (5, '2022-04-18 22:04:20');
INSERT INTO `dynamic_version` VALUES (6, '2022-04-18 22:10:56');
INSERT INTO `dynamic_version` VALUES (7, '2022-04-18 22:15:16');
INSERT INTO `dynamic_version` VALUES (8, '2022-04-19 15:12:37');
INSERT INTO `dynamic_version` VALUES (9, '2022-04-19 15:15:51');
INSERT INTO `dynamic_version` VALUES (10, '2022-04-19 15:17:25');
INSERT INTO `dynamic_version` VALUES (11, '2022-04-19 15:22:17');
INSERT INTO `dynamic_version` VALUES (12, '2022-04-19 15:25:45');
INSERT INTO `dynamic_version` VALUES (13, '2022-04-19 15:30:03');
INSERT INTO `dynamic_version` VALUES (14, '2022-04-19 15:43:56');
INSERT INTO `dynamic_version` VALUES (15, '2022-04-19 15:45:10');
INSERT INTO `dynamic_version` VALUES (16, '2022-04-19 15:46:14');
INSERT INTO `dynamic_version` VALUES (17, '2022-04-19 15:51:10');
INSERT INTO `dynamic_version` VALUES (18, '2022-04-19 15:51:38');
INSERT INTO `dynamic_version` VALUES (19, '2022-04-19 15:51:53');
INSERT INTO `dynamic_version` VALUES (20, '2022-04-19 15:52:10');
INSERT INTO `dynamic_version` VALUES (21, '2022-04-19 15:55:19');
INSERT INTO `dynamic_version` VALUES (22, '2022-04-19 15:55:31');
INSERT INTO `dynamic_version` VALUES (23, '2022-04-19 15:56:47');
INSERT INTO `dynamic_version` VALUES (24, '2022-04-19 15:59:45');
INSERT INTO `dynamic_version` VALUES (25, '2022-04-19 16:00:19');
INSERT INTO `dynamic_version` VALUES (26, '2022-04-19 16:02:15');
INSERT INTO `dynamic_version` VALUES (27, '2022-04-19 16:04:28');
INSERT INTO `dynamic_version` VALUES (28, '2022-04-19 16:06:45');
INSERT INTO `dynamic_version` VALUES (29, '2022-04-19 16:52:47');
INSERT INTO `dynamic_version` VALUES (30, '2022-04-19 17:05:49');
INSERT INTO `dynamic_version` VALUES (31, '2022-04-19 17:07:05');
INSERT INTO `dynamic_version` VALUES (32, '2022-04-20 09:10:55');
INSERT INTO `dynamic_version` VALUES (33, '2022-04-21 16:32:36');
INSERT INTO `dynamic_version` VALUES (34, '2022-04-21 16:32:42');
INSERT INTO `dynamic_version` VALUES (35, '2022-04-21 16:33:58');
INSERT INTO `dynamic_version` VALUES (36, '2022-04-21 16:35:33');
INSERT INTO `dynamic_version` VALUES (37, '2022-04-21 17:16:14');
INSERT INTO `dynamic_version` VALUES (38, '2022-04-21 17:19:30');
INSERT INTO `dynamic_version` VALUES (39, '2022-04-21 19:26:36');
INSERT INTO `dynamic_version` VALUES (40, '2022-04-21 21:32:21');
INSERT INTO `dynamic_version` VALUES (41, '2022-04-21 21:32:43');
INSERT INTO `dynamic_version` VALUES (42, '2022-04-21 21:33:57');
INSERT INTO `dynamic_version` VALUES (43, '2022-04-21 21:37:12');
INSERT INTO `dynamic_version` VALUES (44, '2022-04-25 10:17:02');
INSERT INTO `dynamic_version` VALUES (45, '2022-04-25 10:32:59');
INSERT INTO `dynamic_version` VALUES (46, '2022-04-25 10:33:26');
INSERT INTO `dynamic_version` VALUES (47, '2022-04-25 10:40:24');
INSERT INTO `dynamic_version` VALUES (48, '2022-04-25 10:51:56');
INSERT INTO `dynamic_version` VALUES (49, '2022-04-25 14:23:12');
INSERT INTO `dynamic_version` VALUES (50, '2022-04-25 14:24:10');

-- ----------------------------
-- Table structure for gateway_route
-- ----------------------------
DROP TABLE IF EXISTS `gateway_route`;
CREATE TABLE `gateway_route`  (
  `id` bigint(28) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转发地址',
  `predicates` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问路径',
  `filters` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过滤',
  `order_` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '顺序',
  `creator_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT NULL,
  `update_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_date` datetime(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gateway_route
-- ----------------------------
INSERT INTO `gateway_route` VALUES (1, 'serviceNode1', 'https://baidu.com/', '/api-baidu/**', '1', '0', '', '2020-03-02 00:05:59', '', '2020-03-02 00:50:27', NULL, '0');
INSERT INTO `gateway_route` VALUES (2, 'serviceNode2', 'https://www.taobao.com/', '/api-taobao/**', '1', '0', '', '2020-03-02 00:51:30', NULL, NULL, NULL, '0');
INSERT INTO `gateway_route` VALUES (8, 'serviceNode4', 'http://127.0.0.1:8080/', '/showup/login/**', '0', '0', '', '2020-03-23 01:41:45', NULL, NULL, NULL, '0');
INSERT INTO `gateway_route` VALUES (11, 'serviceNode3', 'http://localhost:8001/', '/payment/lb/**', '0', '0', NULL, NULL, NULL, NULL, NULL, '0');
INSERT INTO `gateway_route` VALUES (13, 'serviceNode3', 'https://www.csdn.net/tags/NtjaIg2sMDczMDQtYmxvZwO0O0OO0O0O.html/', '/test/**', '1', '0', NULL, NULL, NULL, NULL, NULL, '0');

-- ----------------------------
-- Table structure for gateway_routes
-- ----------------------------
DROP TABLE IF EXISTS `gateway_routes`;
CREATE TABLE `gateway_routes`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `route_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由id',
  `route_uri` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转发目标uri',
  `route_order` int(11) NULL DEFAULT NULL COMMENT '路由执行顺序',
  `predicates` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '断言字符串集合，字符串结构：[{\r\n                \"name\":\"Path\",\r\n                \"args\":{\r\n                   \"pattern\" : \"/zy/**\"\r\n                }\r\n              }]',
  `filters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过滤器字符串集合，字符串结构：{\r\n              	\"name\":\"StripPrefix\",\r\n              	 \"args\":{\r\n              	 	\"_genkey_0\":\"1\"\r\n              	 }\r\n              }',
  `is_ebl` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gateway_routes
-- ----------------------------
INSERT INTO `gateway_routes` VALUES (3, 'cloud-payment-service', 'http://localhost:8001/', 0, '[{\"name\": \"Path\",\"args\": {\"pattern\":\"/test/**\"}}]', '[{\"name\": \"StripPrefix\", \"args\": { \"_genkey_0\": \"1\" }}]', 0, 0, '2022-04-18 22:04:17', '2022-04-19 16:04:22');
INSERT INTO `gateway_routes` VALUES (7, 'consumer-service', 'http://localhost:9700/', 0, '[\n{\"name\": \"Path\",\"args\": {\"pattern\": \"/zy/**\"}\n}]', '[{\"name\": \"StripPrefix\", \"args\": { \"_genkey_0\": \"1\" }}]', 0, 0, '2022-04-19 15:56:45', '2022-04-19 16:00:17');
INSERT INTO `gateway_routes` VALUES (11, 'cloud-showup-service', 'http://localhost:8080/', 1, '[{\"name\": \"Path\",\"args\": {\"pattern\": \"/showup/**\"}}]', '[{\"name\": \"StripPrefix\", \"args\": { \"_genkey_0\": \"1\" }}]', 0, 1, NULL, NULL);

-- ----------------------------
-- Table structure for ipwhitelist
-- ----------------------------
DROP TABLE IF EXISTS `ipwhitelist`;
CREATE TABLE `ipwhitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flag` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ip`(`ip`) USING BTREE COMMENT '唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ipwhitelist
-- ----------------------------
INSERT INTO `ipwhitelist` VALUES (1, '192.168.137.11', 0);
INSERT INTO `ipwhitelist` VALUES (2, '192.168.137.12', 0);
INSERT INTO `ipwhitelist` VALUES (5, '192.168.137.13', 0);
INSERT INTO `ipwhitelist` VALUES (6, '192.168.137.14', 0);
INSERT INTO `ipwhitelist` VALUES (11, '192.168.137.1', 1);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES (13, '123');
INSERT INTO `payment` VALUES (14, 'test');
INSERT INTO `payment` VALUES (15, NULL);
INSERT INTO `payment` VALUES (16, NULL);
INSERT INTO `payment` VALUES (17, '900666');
INSERT INTO `payment` VALUES (18, '900666');
INSERT INTO `payment` VALUES (19, '9001231321312');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES ('coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES ('s-marketing', 'el-icon-s-marketing', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (16, 'cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (17, '649002da71c8473db39892b4a758f875.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 0);
INSERT INTO `sys_file` VALUES (18, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 0);
INSERT INTO `sys_file` VALUES (19, 'Java3年经验开发个人简历模板.doc', 'doc', 47, 'http://localhost:9090/file/0e020e1337474a93ba3b43a75b2890ee.doc', '9ace4fac24420f85c753aa663009edb4', 0, 1);
INSERT INTO `sys_file` VALUES (20, '1626102561055-2.jpg', 'jpg', 24, 'http://localhost:9090/file/cd379f381364482aaad0d6ffb7209d3d.jpg', 'adb0481b283645af3809e3d8a1bdb294', 0, 1);
INSERT INTO `sys_file` VALUES (21, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (22, '1622536738094-7.jpg', 'jpg', 12, 'http://localhost:9090/file/ad5946fe27c14508ac796115f6465826.jpg', '35977e7dc2159a734f3c81de460e4b8d', 0, 1);
INSERT INTO `sys_file` VALUES (23, '用户信息 (1).xlsx', 'xlsx', 3, 'http://localhost:9090/file/02f70e07e69045c38b4748283ffeeabb.xlsx', '687f150737c967e74cfd6fa9ec981589', 0, 1);
INSERT INTO `sys_file` VALUES (24, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (25, '1641024983532cf.png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (26, '6.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 0, 1);
INSERT INTO `sys_file` VALUES (27, '9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'jpg', 30, 'http://localhost:9090/file/9b21a2b133b140e0bcd9bf66dc5cad1d.jpg', 'a2cf10bcbed5e9d98cbaf5467acae28d', 0, 1);
INSERT INTO `sys_file` VALUES (28, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (29, '1641024983532cf (1).png', 'png', 634, 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'e1a9407cd0e937c4b411a93b7aca7c87', 0, 1);
INSERT INTO `sys_file` VALUES (30, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (31, '465099FEFEC3057DE96408C8B639F4E7.png', 'png', 99, 'http://localhost:9090/file/c452dafb6a9545779d88c90d70ebd2f3.png', '931aab8b46f6418d8d6710e7df410c28', 0, 1);

-- ----------------------------
-- Table structure for sys_ip
-- ----------------------------
DROP TABLE IF EXISTS `sys_ip`;
CREATE TABLE `sys_ip`  (
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `requestUri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `port` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_ip
-- ----------------------------
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 2, '2021-03-05 10:48:09', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 6, '2021-03-05 15:28:07', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 7, '2021-04-05 15:36:26', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 8, '2021-04-05 15:36:31', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 9, '2021-04-05 15:36:35', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 10, '2021-04-05 15:36:40', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 11, '2021-08-06 10:38:47', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 12, '2021-09-06 10:40:04', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 13, '2021-10-06 10:43:37', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 14, '2021-11-06 10:48:23', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 15, '2021-01-06 10:49:21', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 16, '2021-01-06 10:49:34', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.10.1', 17, '2021-01-06 10:52:56', '/payment/get/13', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.10.1', 18, '2021-01-06 15:19:02', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.10.1', 19, '2022-03-06 15:27:52', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.10.1', 20, '2022-03-06 15:27:58', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.10.1', 21, '2022-03-06 15:28:03', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 22, '2022-03-06 17:53:58', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 23, '2022-03-07 10:21:06', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 24, '2022-03-09 10:55:22', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 25, '2022-03-09 10:58:51', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 30, '2022-03-10 19:42:19', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 31, '2022-03-10 19:49:26', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 32, '2022-03-10 19:55:18', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 33, '2022-03-10 19:59:44', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 34, '2022-03-10 20:00:58', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 35, '2022-03-10 20:01:43', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 36, '2022-03-12 16:17:57', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 37, '2022-03-12 16:18:25', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 38, '2022-03-12 16:21:48', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 39, '2022-03-12 16:41:31', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 40, '2022-03-16 18:59:48', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 41, '2022-03-18 15:07:14', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 42, '2022-03-18 20:37:15', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('169.254.153.37', 43, '2022-03-19 15:41:10', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('169.254.153.37', 44, '2022-03-19 15:44:32', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('169.254.153.37', 45, '2022-03-19 15:52:24', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('169.254.153.37', 46, '2022-03-19 15:53:34', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 47, '2022-03-20 19:30:35', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 48, '2022-03-21 09:54:16', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 49, '2022-03-21 19:09:21', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 50, '2022-03-21 21:18:25', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 51, '2022-03-22 09:25:29', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 52, '2022-03-22 14:17:40', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 53, '2022-03-22 14:18:50', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 54, '2022-03-22 14:32:59', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 55, '2022-03-22 14:34:25', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 56, '2022-03-22 16:43:58', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 57, '2022-03-22 19:10:30', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 58, '2022-03-29 10:19:36', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 59, '2022-03-29 14:43:53', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 60, '2022-03-29 14:48:27', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 61, '2022-03-29 14:51:19', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 62, '2022-03-29 14:52:06', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 63, '2022-03-29 14:52:23', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 64, '2022-03-29 14:52:37', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 65, '2022-03-29 14:53:31', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 66, '2022-03-29 14:54:24', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 67, '2022-03-29 17:00:13', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 68, '2022-03-29 19:09:25', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 69, '2022-03-29 19:33:52', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 70, '2022-03-31 16:34:25', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 71, '2022-03-31 16:37:58', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 72, '2022-03-31 16:41:13', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 73, '2022-03-31 16:46:17', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 74, '2022-04-01 09:50:31', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 75, '2022-04-01 09:50:39', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 76, '2022-04-01 09:51:31', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 77, '2022-04-01 09:51:39', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 78, '2022-04-01 09:51:41', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 79, '2022-04-01 09:52:39', '/payment/get/13', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 80, '2022-04-16 16:45:22', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 81, '2022-04-17 15:04:21', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 82, '2022-04-17 15:13:57', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 83, '2022-04-17 16:36:19', '/payment/get/13', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 84, '2022-04-17 16:40:40', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 85, '2022-04-17 16:40:44', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 86, '2022-04-17 19:17:12', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 87, '2022-04-17 19:18:08', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 88, '2022-04-17 19:18:34', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 89, '2022-04-18 15:25:09', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 90, '2022-04-18 16:03:21', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 91, '2022-04-18 16:03:47', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 92, '2022-04-18 16:05:03', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 93, '2022-04-18 16:11:39', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 94, '2022-04-18 16:14:06', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 95, '2022-04-18 16:21:20', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 96, '2022-04-18 18:57:46', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 97, '2022-04-18 18:58:10', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 98, '2022-04-18 19:19:43', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 99, '2022-04-18 19:42:25', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 100, '2022-04-18 22:11:44', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 101, '2022-04-18 22:13:19', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 102, '2022-04-18 22:15:28', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 103, '2022-04-18 22:22:49', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 104, '2022-04-18 22:26:35', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 105, '2022-04-18 22:26:44', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 106, '2022-04-19 09:05:23', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 107, '2022-04-19 09:22:36', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 108, '2022-04-19 10:05:50', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 109, '2022-04-19 10:07:56', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 110, '2022-04-19 10:09:25', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 111, '2022-04-19 10:20:59', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 112, '2022-04-19 10:32:21', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 113, '2022-04-19 10:32:42', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 114, '2022-04-19 17:04:18', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 115, '2022-04-19 17:09:42', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 116, '2022-04-19 17:19:25', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 117, '2022-04-19 19:35:35', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 118, '2022-04-19 21:01:44', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 119, '2022-04-19 21:04:48', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 120, '2022-04-20 09:11:35', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 121, '2022-04-20 09:11:44', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 122, '2022-04-20 11:13:13', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 123, '2022-04-20 14:15:23', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 124, '2022-04-20 14:48:39', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 125, '2022-04-20 16:54:39', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 126, '2022-04-20 19:30:57', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 127, '2022-04-20 20:35:26', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 128, '2022-04-21 15:30:29', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 129, '2022-04-21 15:33:18', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 130, '2022-04-21 17:23:05', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 131, '2022-04-21 19:26:15', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 132, '2022-04-21 21:32:17', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 133, '2022-04-22 10:13:39', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 134, '2022-04-22 14:31:10', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 135, '2022-04-22 14:43:05', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 136, '2022-04-22 14:50:07', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 137, '2022-04-22 16:50:29', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 138, '2022-04-22 16:53:39', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 139, '2022-04-22 19:12:36', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 140, '2022-04-22 21:14:13', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 141, '2022-04-22 22:07:17', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 142, '2022-04-25 10:15:15', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 143, '2022-04-25 10:19:54', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 144, '2022-04-25 10:22:44', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 145, '2022-04-25 10:23:05', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 146, '2022-04-25 10:24:50', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 147, '2022-04-25 10:30:47', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 148, '2022-04-25 10:32:53', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 149, '2022-04-25 14:22:51', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 150, '2022-04-25 15:01:03', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 151, '2022-04-25 15:21:19', '/user/login', 8005);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 152, '2022-04-25 15:43:12', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 153, '2022-04-26 18:54:09', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 154, '2022-04-26 18:54:33', '/payment/lb', 8001);
INSERT INTO `sys_ip` VALUES ('192.168.137.1', 155, '2022-04-26 18:54:38', '/user/login', 8005);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` VALUES (11, '路由管理', '/route', 'el-icon-coffee\r\n', '附加的', NULL, 'Route', 400);
INSERT INTO `sys_menu` VALUES (12, '数据展示', '/data', 'el-icon-s-grid', NULL, NULL, 'Data', 500);
INSERT INTO `sys_menu` VALUES (13, '数据报表', '/dashbord', 'el-icon-s-marketing', '11', NULL, 'Dashbord', 600);
INSERT INTO `sys_menu` VALUES (14, '白名单管理', '/white', 'el-icon-coffee\r\n', 'IP白名单管理', NULL, 'White', 700);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (2, 11);
INSERT INTO `sys_role_menu` VALUES (2, 12);

-- ----------------------------
-- Table structure for sys_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_route`;
CREATE TABLE `sys_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'uri路径',
  `predicates` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '判定器',
  `filters` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '过滤器',
  `ordered` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_route
-- ----------------------------
INSERT INTO `sys_route` VALUES (30, 'http://192.168.174.22:8081', '[{\"args\":{\"_genkey_0\":\"/servicea/**\"},\"name\":\"Path\"}]', '[{\"args\":{\"_genkey_0\":\"0\"},\"name\":\"StripPrefix\"}]', '1', '测试服务');
INSERT INTO `sys_route` VALUES (31, 'lb://serviceb', '[{\"args\":{\"_genkey_0\":\"/serivceb/*\"},\"name\":\"Path\"}]', '[{\"args\":{\"_genkey_0\":\"1\"},\"name\":\"StripPrefix\"}]', '-1', '测试2');
INSERT INTO `sys_route` VALUES (32, '111', '111', '111', '111', '111');
INSERT INTO `sys_route` VALUES (33, '22', '22', '22', '22', '22');
INSERT INTO `sys_route` VALUES (34, '11', '11', '11', '11', '11');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'admin', '超级管理员', 'admin@qq.com', '131a81fbe3fbbcee070a462e3a81bb5349a', '山东济南', '2022-01-22 21:10:27', 'http://localhost:9090/file/8d966b0e6cf84fe191a72a58b8293b23.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (16, '2', NULL, '甄姬', '2', '2', '2', '2022-02-26 22:10:14', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (17, '333', '123', '我是三三', '3', '3', '3', '2022-02-26 22:10:18', 'http://localhost:9090/file/7737484487db47ab89e58504ddf86ac1.jpg', 'ROLE_USER');
INSERT INTO `sys_user` VALUES (18, 'nz', '123', '哪吒', '2', '2', '2', '2022-03-29 16:59:44', '', NULL);
INSERT INTO `sys_user` VALUES (19, 'ys', '123', '亚瑟', '3', '3', '3', '2022-04-29 16:59:44', '', NULL);
INSERT INTO `sys_user` VALUES (20, 'lx', '123', '李信', '2', '2', '2', '2022-05-29 17:12:04', '2', NULL);
INSERT INTO `sys_user` VALUES (25, 'sir', '123', '安琪拉', NULL, NULL, NULL, '2022-06-08 17:00:47', NULL, NULL);
INSERT INTO `sys_user` VALUES (26, 'err', NULL, '妲己', '11', '1', '1', '2022-07-08 17:20:01', NULL, NULL);
INSERT INTO `sys_user` VALUES (29, 'ffff', '123', NULL, NULL, NULL, NULL, '2022-12-10 11:53:31', NULL, 'ROLE_USER');

SET FOREIGN_KEY_CHECKS = 1;
