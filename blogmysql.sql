/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : blogmysql

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-06-27 00:17:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 用户表', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 用户表', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 用户表', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can add captcha store', '8', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('23', 'Can change captcha store', '8', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete captcha store', '8', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 首页文章', '9', 'add_indexarticle');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 首页文章', '9', 'change_indexarticle');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 首页文章', '9', 'delete_indexarticle');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 课程评论', '11', 'add_articlecomments');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 课程评论', '11', 'change_articlecomments');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 课程评论', '11', 'delete_articlecomments');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 阅读书籍', '12', 'add_readarticle');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 阅读书籍', '12', 'change_readarticle');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 阅读书籍', '12', 'delete_readarticle');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('2', '2018-06-22 20:59:43', '7', 'lianxi123123123', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2018-06-22 20:59:43', '4', 'lianxi12345', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2018-06-22 20:59:43', '3', 'lianxi1234', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2018-06-22 21:37:40', '1', '我的学习路', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2018-06-22 21:43:55', '1', '我的学习路', '3', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2018-06-22 21:45:04', '1', 'lianxi', '2', '已修改 last_login，first_name，last_name，nick_name，profession，address，mobile 和 image 。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2018-06-22 21:45:40', '2', '我的学习路', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2018-06-22 22:15:56', '3', '我的啊啊', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2018-06-22 22:37:18', '1', 'lianxi', '2', '已修改 last_login 和 image 。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2018-06-23 00:45:42', '4', '心得笔记', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2018-06-23 00:48:14', '5', '笔记', '1', 'Added.', '9', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2018-06-24 16:20:58', '1', 'ArticleComments object', '1', 'Added.', '11', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2018-06-24 16:36:45', '2', 'ArticleComments object', '1', 'Added.', '11', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2018-06-24 16:39:32', '3', 'ArticleComments object', '1', 'Added.', '11', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2018-06-24 16:41:39', '2', 'lianxi123', '2', '已修改 last_login，nick_name，profession 和 address 。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2018-06-25 19:09:36', '5', 'xue', '3', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2018-06-25 19:10:43', '6', 'xiaoxue', '2', '已修改 last_login 和 nick_name 。', '7', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2018-06-26 13:05:13', '1', '平凡的世界', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2018-06-26 13:06:37', '2', '穆斯林的葬礼', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2018-06-26 13:08:29', '3', '傲慢与偏见', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2018-06-26 13:09:49', '4', 'Python从入门到实践', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2018-06-26 13:11:25', '5', '穆斯林的葬礼', '1', 'Added.', '12', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2018-06-26 16:35:23', '5', '穆斯林的葬礼', '2', '已修改 image 。', '12', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2018-06-26 16:36:13', '5', '穆斯林的葬礼', '2', '已修改 image 。', '12', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2018-06-26 16:36:20', '4', 'Python从入门到实践', '2', '已修改 image 。', '12', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2018-06-26 16:36:28', '3', '傲慢与偏见', '2', '已修改 image 。', '12', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2018-06-26 16:36:35', '2', '穆斯林的葬礼', '2', '已修改 image 。', '12', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2018-06-26 16:36:41', '1', '平凡的世界', '2', '已修改 image 。', '12', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2018-06-26 22:06:04', '2', '我的学习路', '2', '已修改 content 。', '9', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2018-06-26 22:09:00', '3', '吃一堑长一智', '2', '已修改 title，content 和 image 。', '9', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2018-06-26 22:11:01', '4', '心得笔记', '2', '已修改 content 和 image 。', '9', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2018-06-26 22:12:46', '5', '关于学习', '2', '已修改 title，content 和 image 。', '9', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2018-06-26 22:14:53', '6', '唯有努力', '1', 'Added.', '9', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('8', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('11', 'my_blog', 'articlecomments');
INSERT INTO `django_content_type` VALUES ('9', 'my_blog', 'indexarticle');
INSERT INTO `django_content_type` VALUES ('12', 'my_blog', 'readarticle');
INSERT INTO `django_content_type` VALUES ('7', 'my_users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2018-06-22 00:21:20');
INSERT INTO `django_migrations` VALUES ('13', 'my_users', '0001_initial', '2018-06-22 00:48:20');
INSERT INTO `django_migrations` VALUES ('14', 'captcha', '0001_initial', '2018-06-22 17:59:38');
INSERT INTO `django_migrations` VALUES ('15', 'my_blog', '0001_initial', '2018-06-22 21:28:20');
INSERT INTO `django_migrations` VALUES ('16', 'my_blog', '0002_remove_indexarticle_comment', '2018-06-22 21:47:00');
INSERT INTO `django_migrations` VALUES ('17', 'my_blog', '0003_auto_20180623_0002', '2018-06-23 00:02:54');
INSERT INTO `django_migrations` VALUES ('18', 'my_users', '0002_auto_20180623_0002', '2018-06-23 00:02:54');
INSERT INTO `django_migrations` VALUES ('19', 'my_users', '0003_userprofile_gender', '2018-06-24 12:37:43');
INSERT INTO `django_migrations` VALUES ('20', 'my_blog', '0004_coursecomments', '2018-06-24 15:46:23');
INSERT INTO `django_migrations` VALUES ('21', 'my_blog', '0005_auto_20180624_1546', '2018-06-24 15:47:01');
INSERT INTO `django_migrations` VALUES ('22', 'my_blog', '0006_auto_20180626_1259', '2018-06-26 12:59:26');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2jj9jwj28ld0sksfbu0e7w7xk82hqljh', 'YWI1MDQyNzNjNDIwMTNjODY2MDQzZjhmYTk4MGNmN2IxMDZjODAxYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwOWNkNDU3YjcwYWU3OTVmMjk4ZWExZjhkNzE0MmMyZTQ4NTU0YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2018-07-06 20:04:56');
INSERT INTO `django_session` VALUES ('5om616u0kechmr1k990bh4vtdvp0tp4p', 'YWI1MDQyNzNjNDIwMTNjODY2MDQzZjhmYTk4MGNmN2IxMDZjODAxYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjcwOWNkNDU3YjcwYWU3OTVmMjk4ZWExZjhkNzE0MmMyZTQ4NTU0YzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2018-07-08 18:57:48');
INSERT INTO `django_session` VALUES ('c5086qoxerv2lwa30sfhpptgdry6qd2n', 'MDQxNGEyYzhmMmI5N2VmNDAyZTgwZGQ1ZjZkN2QxMzczMWRiM2EwNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwZjg5MzAwNmVhMGMxZmI3YTc0MWViMWExZDk3Y2UyNWE5ZDAzMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-07-06 22:52:38');
INSERT INTO `django_session` VALUES ('c8ixonp2unfkm1dzb48u6aefl66307cz', 'MTUxNmIzMTU2YTgxZWVhMTI0MDYyNGZkMzUyNDg0NjZlY2E3ZGMyOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwZGViM2I5ZTdhYjhlNjAzZDU5NGJmMTJlZjFjZjI3NTczNmQ5MTQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==', '2018-07-10 23:25:52');
INSERT INTO `django_session` VALUES ('cbj7tab130f8jm48t1hoaf43n5idfyth', 'NTEyNDI5YTcxMjJiOTg0MzVkZDZjMGQ2MWYyMjQxYWE0ZGI2YzRjMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjVlYTIxNWYwYzg2MTRhNWQ5ZTRmNDQ2NGE2ODM4ZjhkNDRiNTk5NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-07-08 17:46:34');
INSERT INTO `django_session` VALUES ('i701fl215nb1da3mkycviikojl60yonz', 'YmZjMDgxZjZmYjFhZjgwMGM1YTVhMTRmYmY2N2E5OTYyZDg5NzU5Yjp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwZjg5MzAwNmVhMGMxZmI3YTc0MWViMWExZDk3Y2UyNWE5ZDAzMjAiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6Im15X3VzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQifQ==', '2018-07-06 17:53:18');
INSERT INTO `django_session` VALUES ('l4qpedggnh31r1lkuqk4klkj2hsoti4w', 'NTEyNDI5YTcxMjJiOTg0MzVkZDZjMGQ2MWYyMjQxYWE0ZGI2YzRjMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjVlYTIxNWYwYzg2MTRhNWQ5ZTRmNDQ2NGE2ODM4ZjhkNDRiNTk5NjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-07-09 13:07:37');
INSERT INTO `django_session` VALUES ('nlcrloma7xm6ikhj9a8fhd8aqmgigl4a', 'OGM0MGNmOTliZTRiN2VkYjllYTYyYjRmODgxZjA1ZDc4MGJjNDljODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBkNGUyYzg5MTk1YTkxNzBlZTA1OTcwM2I4NDA0MzE4NTZiM2EzN2UiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQifQ==', '2018-07-08 14:03:18');
INSERT INTO `django_session` VALUES ('u380w1clbb6ukxso1y2594zf0kpwj9n2', 'MDQxNGEyYzhmMmI5N2VmNDAyZTgwZGQ1ZjZkN2QxMzczMWRiM2EwNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwZjg5MzAwNmVhMGMxZmI3YTc0MWViMWExZDk3Y2UyNWE5ZDAzMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-07-07 02:20:17');
INSERT INTO `django_session` VALUES ('yh8a4zel43h7mxgrafaeqcs7yj32tbhv', 'MDQxNGEyYzhmMmI5N2VmNDAyZTgwZGQ1ZjZkN2QxMzczMWRiM2EwNTp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwZjg5MzAwNmVhMGMxZmI3YTc0MWViMWExZDk3Y2UyNWE5ZDAzMjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJteV91c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-07-07 01:28:49');

-- ----------------------------
-- Table structure for `my_blog_articlecomments`
-- ----------------------------
DROP TABLE IF EXISTS `my_blog_articlecomments`;
CREATE TABLE `my_blog_articlecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `my_blog_coursecom_article_id_c2584197_fk_my_blog_indexarticle_id` (`article_id`),
  KEY `my_blog_coursecommen_user_id_b218fd73_fk_my_users_userprofile_id` (`user_id`),
  CONSTRAINT `my_blog_coursecommen_user_id_b218fd73_fk_my_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `my_users_userprofile` (`id`),
  CONSTRAINT `my_blog_coursecom_article_id_c2584197_fk_my_blog_indexarticle_id` FOREIGN KEY (`article_id`) REFERENCES `my_blog_indexarticle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_blog_articlecomments
-- ----------------------------
INSERT INTO `my_blog_articlecomments` VALUES ('1', '非常好啊', '2018-06-24 16:20:00', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('2', '嘿嘿嘿要努力呀', '2018-06-24 16:36:00', '4', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('3', '哈哈哈哈', '2018-06-24 16:39:00', '2', '2');
INSERT INTO `my_blog_articlecomments` VALUES ('4', '阿大多数阿萨德啊', '2018-06-24 18:55:34', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('5', '撒大声地按时', '2018-06-24 18:56:41', '3', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('6', '嗯啊啊啊啊啊', '2018-06-24 18:57:10', '5', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('7', '嘿嘿嘿啊啊啊', '2018-06-24 18:58:22', '5', '2');
INSERT INTO `my_blog_articlecomments` VALUES ('8', '大声道阿达是的阿达是的阿萨德阿达是的', '2018-06-24 18:58:36', '5', '2');
INSERT INTO `my_blog_articlecomments` VALUES ('9', '说到底阿萨德啊', '2018-06-24 19:42:34', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('10', '说到底阿萨德啊', '2018-06-24 19:43:58', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('11', '说到底阿萨德啊阿萨德阿萨德阿大声道阿萨德阿萨德按时感受到法国东方个电饭锅和电话费好', '2018-06-24 19:44:06', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('12', 'sad按时阿萨德', '2018-06-25 14:21:53', '3', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('13', '萨达的阿萨德阿萨德as', '2018-06-25 14:45:22', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('14', '啊啊哈哈哈哈哈哈哈的阿萨德阿萨德阿萨德', '2018-06-25 17:16:05', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('15', '嗯呵呵阿萨德拉钩给的反光镜快递费呢电饭锅电饭锅搞定', '2018-06-25 17:17:31', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('16', '萨达撒大声地阿萨德按时阿萨德啊实打实的阿萨德阿达是的阿萨德阿萨德 ', '2018-06-25 17:19:04', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('17', '阿达是的阿萨德 阿萨德按时', '2018-06-25 17:20:32', '5', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('18', '阿萨德阿萨德阿萨德阿达发放郭德纲和托管费和见到过是否申达股份十多个大商股份电饭锅大概电饭锅', '2018-06-25 17:21:23', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('19', '哈哈哈哈哈哈哈哈哈哈', '2018-06-25 17:54:08', '4', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('20', '阿萨德阿萨德阿萨德刚大帅哥SD敢达双方各好的发过火发过火发过火规范', '2018-06-25 18:49:16', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('21', 'ad阿萨德阿萨德按时发生过水电费感受到过梵蒂冈电饭锅', '2018-06-25 19:06:39', '2', '6');
INSERT INTO `my_blog_articlecomments` VALUES ('22', '阿萨德按时', '2018-06-26 19:52:34', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('23', '阿萨德按时', '2018-06-26 19:58:11', '2', '1');
INSERT INTO `my_blog_articlecomments` VALUES ('24', '是的撒', '2018-06-26 20:23:22', '2', '1');

-- ----------------------------
-- Table structure for `my_blog_indexarticle`
-- ----------------------------
DROP TABLE IF EXISTS `my_blog_indexarticle`;
CREATE TABLE `my_blog_indexarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `classify` varchar(10) NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `my_blog_indexarticle_name_id_723debc8_fk_my_users_userprofile_id` (`name_id`),
  CONSTRAINT `my_blog_indexarticle_name_id_723debc8_fk_my_users_userprofile_id` FOREIGN KEY (`name_id`) REFERENCES `my_users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_blog_indexarticle
-- ----------------------------
INSERT INTO `my_blog_indexarticle` VALUES ('2', '我的学习路', '没有谁一生都是一帆风顺的，都会在人生的道路上遇到大大小小的挫折。而正是这些大大小小的挫折才谱就了人生那道平凡而又动听的歌。 \r\n无数历史的事实和社会的实践证明：挫折几乎伴随着人生命的全部过程，它像埋伏在人生旅途中的顽皮鬼，于不经意间绊你一个或大或小的跟头，使你陷入人生灰色的圈子从而倍感焦虑，甚至失意彷徨，难以自拔。 \r\n面对挫折，自强者终会知道这是人生路上必须搬开的绊脚石，更能从中体验到战胜困难，超越自我的快乐。奥斯特洛夫斯基说得好：“人的生命似洪水在奔腾，不遇着岛屿和暗焦，难以激起美丽的浪花。”如果我们在挫折面前是勇敢进攻，那么人生就会是一个缤纷多彩的世界。也正如巴尔扎克的比喻：“挫折就像一块石头，对弱者来说是绊脚石，使你停步不前，对强者来说却是垫脚石，它会让你站得更高。”', 'article/2018/06/1-150314142405.jpg', 'https://blog.csdn.net/weixin_41827390/', '小熙', 'bk', '397', '2018-06-22 21:45:00', '1');
INSERT INTO `my_blog_indexarticle` VALUES ('3', '吃一堑长一智', '成熟的标志不看经历的事情有多少，而是看对待事情想法和做法，在冷静里沉淀着思想 ，在冲动里制止着行动就是最好的成熟。有时候我们不能改变所有的事情，那么就让所有的事情都随时间去改变。既然我们不能改变所有人，那么我们就学会时时改变自己，看淡所有，所有就简单。简单所有，所有就自然。心很小，承受不下太多的烦恼，生命很弱经受不住太多的风霜，如果让生命多一些随意多一些自然，那么忧郁烦恼就会减少，快乐幸福就会增多。', 'article/2018/06/12.jpg', 'https://blog.csdn.net/weixin_41827390/', '小熙', 'xd', '95', '2018-06-22 22:15:00', '1');
INSERT INTO `my_blog_indexarticle` VALUES ('4', '心得笔记', '读书破万卷，下笔如有神。 —— 杜甫《奉赠韦左丞丈二十二韵》\r\n读书不觉已春深，一寸光阴一寸金。 —— 王贞白《白鹿洞二首·其一》\r\n黑发不知勤学早，白首方悔读书迟。 —— 颜真卿《劝学诗》\r\n三更灯火五更鸡，正是男儿读书时。 —— 颜真卿《劝学诗》\r\n坑灰未冷山东乱，刘项元来不读书。 —— 章碣《焚书坑》\r\n一日不读书，胸臆无佳想。 —— 萧抡谓《读书有所见作》', 'article/2018/06/20140314021652822.jpg', 'https://blog.csdn.net/weixin_41827390/', '小熙', 'xd', '54', '2018-06-23 00:45:00', '1');
INSERT INTO `my_blog_indexarticle` VALUES ('5', '关于学习', '书，是人类文化遗产的结晶，是人类智慧的仓库。读书，便能读懂历史，该明世界，于是古人语：“两耳不闻窗外事，一心只读圣贤书；秀才不出门，却知天下事”。 \r\n英国学者培根曾经说过：“读书足以冶情，足以博彩，足以长才，怡情也，最见独处幽居之时，其博彩也，最见于高谈阔论之中，其长才也，最见于处世判事之际。”于是，世人甚爱读书。 \r\n然而，我们读书时，是别人在代替我们的思想，我们只不过在重复他的思想活动的过程而已。犹如儿童启蒙习字时，用笔按照老师以铅笔所写的笔划依样画葫芦一般。我们知道，一条弹簧如久受外力压迫，会失去弹性，我们的精神也是一样，如常受别人的思想的压力，也会失去自己的思想空间。所以，读书愈多或整天沉迷读书的人，虽然可籍书以休养出神，但他的思维能力必将渐次丧失，犹如时时常以车代步的人步行能力必定较差。所以有时书呆子、文弱书生的行为真叫人哭笑不得。 \r\n书是人类的精神粮食，书不可不读。试想，如果世界上没有了出版物，人类的精神粮食得不到传播，那该是多么可怕的事情啊。那时的世界将会黯然神伤，人与人之间的一些联系线路就将中断。一个无知、多疑和彼此流通的时代就会随之而来。 \r\n然而学海天涯、书海无边，茫茫书海，如何去读，不能不令人头痛。世界名著固然是好，但未必都值得必读。因为有的作品所作的时代背景与我们相差甚巨，且缺少那种时代意义，况且名著满天飞，又何能一一细尝。 \r\n林语堂先生认为一个人发现他最爱好的作家，乃是他的知识发展上最重要的事情。世间确有一些人心灵相似的，一个人必须在古今中外无数个作家中寻找到一个和他心灵相似的作家，又何其艰难，或许耗尽其一生的年华也未必能找到。本人认为读书要选自己喜好的作品，粗读、细读亦无所谓，只要能拥有一份 “鸟在林间自查啼”的轻快闲情便是最佳。 \r\n其实，读史使人明智，读诗使人灵秀，读数使人周密，科学使人深刻，伦理学使人庄里，逻辑学使人善辩，凡有所学，皆有所获。', 'article/2018/06/13.jpg', 'https://blog.csdn.net/weixin_41827390/', '小熙', 'rj', '65', '2018-06-23 00:47:00', '1');
INSERT INTO `my_blog_indexarticle` VALUES ('6', '唯有努力', '人的生命实际上是一种能量的体现，当我们的这一能量在这一种方式受堵时，就换另一种方式，当我们的能量在这一时空受阻而不通畅时，不妨换一个地方从新开始。我们的不如意不舒服都是我们的生命能量不顺畅，没有自由流动，我们所要做的就是，遇到寻找对的地方对的时间对的人对的方式，让我们顺畅起来。\r\n\r\n　　我们没有义务也没有办法让所有人满意，但是我们最应该让自己满意，让自己幸福，而通往幸福的道路，也是我们终生奋斗的历程，我们必须努力做事，让成功证明自己的实力和价值。勤奋夯实做事，会让我们很少陷入心灵危机，会让我们成为现实主义者，当然了，也会让我们更快成功。', 'article/2018/06/20150328131207_SyL8N_ePiTaer.png', 'https://blog.csdn.net/weixin_41827390/', '小熙', 'rj', '1', '2018-06-26 22:13:00', '1');

-- ----------------------------
-- Table structure for `my_blog_readarticle`
-- ----------------------------
DROP TABLE IF EXISTS `my_blog_readarticle`;
CREATE TABLE `my_blog_readarticle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `classify` varchar(10) NOT NULL,
  `click_num` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_blog_readarticle
-- ----------------------------
INSERT INTO `my_blog_readarticle` VALUES ('1', '平凡的世界', '《平凡的世界》是中国作家路遥创作的一部百万字的小说。这是一部全景式地表现中国当代城乡社会生活的长篇小说，全书共三部。1986年12月首次出版。\r\n该书以中国70年代中期到80年代中期十年间为背景，通过复杂的矛盾纠葛，以孙少安和孙少平两兄弟为中心，刻画了当时社会各阶层众多普通人的形象；劳动与爱情、挫折与追求、痛苦与欢乐、日常生活与巨大社会冲突纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。1991年3月，《平凡的世界》获中国第三届茅盾文学奖。', 'article/2018/06/5.jpg', 'https://blog.csdn.net/weixin_41827390/', '路遥', 'xs', '24', '2018-06-26 13:04:00');
INSERT INTO `my_blog_readarticle` VALUES ('2', '穆斯林的葬礼', '《穆斯林的葬礼》[1]，是中国回族女作家霍达在1988年发行的一部畅销小说，后被原作者改编成同名电影。该书讲述了北京一个回族家庭六十余年间的兴衰历史，该小说以回族手工匠人梁亦清的玉器作坊奇珍斋升沉起伏为主线，在历史的背景下描写梁家三代人不同的命运变迁，表现了主人公为追求理想和事业，为完善自身素质所发出的蓬勃不息的命运意识，是一个爱情悲剧。1991年曾获第三届茅盾文学奖。小说塑造了多个人物形象，用中国传统的两个意象玉和月代表韩子奇和韩新月，穿插记叙前后两代人的身世，并穿插地为读者介绍了回教礼节及回族习俗。小说有英语、法语、阿拉伯语、乌尔都语等译文版本。小说中文版52万7千字，在中国青年中广受欢迎。此书还获第三届茅盾文学奖。[2]', 'article/2018/06/4.jpg', 'https://blog.csdn.net/weixin_41827390/', '霍达', 'xs', '13', '2018-06-26 13:05:00');
INSERT INTO `my_blog_readarticle` VALUES ('3', '傲慢与偏见', '这部作品以日常生活为素材，一反当时社会上流行的感伤小说的内容和矫揉造作的写作方法，生动地反映了18世纪末到19世纪初处于保守和闭塞状态下的英国乡镇生活和世态人情。主角是班纳特家的五个女儿，势利眼的母亲一见到富家公子宾利和达西前来小镇，便逼不及待安排女儿钓金龟……', 'article/2018/06/3.jpg', 'https://blog.csdn.net/weixin_41827390/', '简·奥斯汀', 'xs', '5', '2018-06-26 13:07:00');
INSERT INTO `my_blog_readarticle` VALUES ('4', 'Python从入门到实践', 'Python编程：从入门到实践 是一本针对所有层次的Python 读者而作的Python 入门书。全书分两部分：第一部分介绍用Python 编程所必须了解的基本概念...', 'article/2018/06/2.jpg', 'https://blog.csdn.net/weixin_41827390/', '小熙', 'cx', '0', '2018-06-26 13:08:00');
INSERT INTO `my_blog_readarticle` VALUES ('5', '穆斯林的葬礼', '满怀希望的人往往易于冲动，一旦失望了，反而倒冷静了。\r\n——霍达《穆斯林的葬礼》\r\n\r\n人可以失落一切，唯独不应该失落自己。\r\n——霍达《穆斯林的葬礼》\r\n\r\n分享到微信\r\n时时想到可能会被别人超越，才会用双倍的时间和精力去超越别人。\r\n——霍达《穆斯林的葬礼》\r\n\r\n只有谎言才拼命鼓吹，唯恐别人不信。\r\n——霍达《穆斯林的葬礼》\r\n\r\n真有血性的人，绝不曲意求得别人的重视，也不怕别人忽视。别人的误解偏见并不可怕，可怕的是失去了自信，如果你是自信的，就什么话都不用说了。真理从来都是最简单、最朴素的，除了它本身之外，并不需要额外地加以解释，正如一个真正美的人，任何的首饰都是多余的。\r\n——霍达《穆斯林的葬礼》\r\n\r\n爱，不是猎取和占有对方，而是发自内心的责任感，爱是一生一世的承诺，就像信仰一样永不改变，永不背叛！不要用自我牺牲这样的词藻来贬低我，我们双方都不是祭坛上的羔羊，我们付出了爱，也得到了爱，爱的深沉，爱的强烈，爱的长久，这就是一切。\r\n——霍达《穆斯林的葬礼》\r\n\r\n诗人拜伦说过：“真有血性的人，决不去以求的别人的尊重，也不怕别人的忽视。”别人的误解、偏见并不可怕，可怕的是失去了自信；如果你是自信的，就什么话都不用说了。真理从来都是最简单、最朴素的，除了它本身之外，并不需要额外地加以解释，正如一个真正美丽的人，任何附加的首饰都是多余的。', 'article/2018/06/1_rdHHN63.jpg', 'https://blog.csdn.net/weixin_41827390/', '霍达', 'jd', '0', '2018-06-26 13:10:00');

-- ----------------------------
-- Table structure for `my_users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `my_users_userprofile`;
CREATE TABLE `my_users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_users_userprofile
-- ----------------------------
INSERT INTO `my_users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$prv9RdnGhJqw$7w5flAhVC6vFsSuyB2f/iUNEloMh4J0HGG0vFLflSoE=', '2018-06-26 23:25:38', '1', 'lianxi', '连', '熙', 'lian_xi0508@163.com', '1', '1', '2018-06-22 00:52:00', '小熙', 'PythonWeb开发', '山西省长治市', '1523428083', 'image/2018/06/photos_mgiTLx5.jpg', 'male');
INSERT INTO `my_users_userprofile` VALUES ('2', 'pbkdf2_sha256$24000$Eg9ZHLR4VU0r$wgcUCAQADSXXAEVpC500MB8rtjLwo16oTPOaOf0H6g4=', '2018-06-24 18:57:48', '0', 'lianxi123', '', '', 'lian_xi0508@163.com', '0', '1', '2018-06-22 20:04:00', '嘻嘻', 'Python Web', '北京', '15234280837', 'image/2018/06/timg_2.jpg', 'female');
INSERT INTO `my_users_userprofile` VALUES ('3', 'pbkdf2_sha256$24000$D3ZciwDe1FTn$p0Nzn0kIGimQlzbG4c+bxCGSYd3nHN//BZb8m9MtIjQ=', '2018-06-24 13:58:08', '0', 'xiaoxi', '', '', 'lian_xi0508@sina.cn', '0', '1', '2018-06-24 13:57:34', '熙熙', 'Python', '山西省长治市', '18833334444', 'image/2018/06/timg_3.jpg', 'female');
INSERT INTO `my_users_userprofile` VALUES ('4', 'pbkdf2_sha256$24000$mqQyJprBI5FY$Hob+LnBrQZAfO3JAwcFyc8entrl17b6glVzDJrkkD40=', '2018-06-24 14:03:18', '0', 'lianxixi', '', '', '1537@152.com', '0', '1', '2018-06-24 14:02:55', '小熙熙', 'Python爬虫', '山西省长治市', '15555554444', 'image/2018/06/Myg.jpg', 'female');
INSERT INTO `my_users_userprofile` VALUES ('6', 'pbkdf2_sha256$24000$ciwQJZhM56kJ$7+6sPX3XLHtLJRqGNDjRWoHLiryd6JJWPgFEYDprrwQ=', '2018-06-26 23:25:52', '0', 'xiaoxue', '', '', '1@1.com', '0', '1', '2018-06-25 19:05:00', '小雪', 'Python', '北京', '12358746984', 'image/2018/06/timg_11.jpg', 'female');
INSERT INTO `my_users_userprofile` VALUES ('7', 'pbkdf2_sha256$24000$YqXyCQY3jHJU$FCD+R/8VV5g2omPnXc1L4sU71JtiboPQ6w8n8hWQ/eg=', null, '0', 'lianxi1324', '', '', '1@1.com', '0', '1', '2018-06-26 22:35:48', '', '', '', '123213', 'image/default.png', 'female');

-- ----------------------------
-- Table structure for `my_users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `my_users_userprofile_groups`;
CREATE TABLE `my_users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `my_users_userprofile_groups_userprofile_id_3734f234_uniq` (`userprofile_id`,`group_id`),
  KEY `my_users_userprofile_groups_group_id_7fc25582_fk_auth_group_id` (`group_id`),
  CONSTRAINT `my_users_userprofile_groups_group_id_7fc25582_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `my_users_user_userprofile_id_d41cfe94_fk_my_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `my_users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `my_users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `my_users_userprofile_user_permissions`;
CREATE TABLE `my_users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `my_users_userprofile_user_permissio_userprofile_id_6f805c61_uniq` (`userprofile_id`,`permission_id`),
  KEY `my_users_userprofil_permission_id_782755be_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `my_users_userprofil_permission_id_782755be_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `my_users_user_userprofile_id_fef070cb_fk_my_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `my_users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_users_userprofile_user_permissions
-- ----------------------------
