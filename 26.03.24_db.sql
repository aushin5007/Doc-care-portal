/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.9 : Database - dr_patient_interaction
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dr_patient_interaction` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dr_patient_interaction`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bookings',7,'add_bookings'),(26,'Can change bookings',7,'change_bookings'),(27,'Can delete bookings',7,'delete_bookings'),(28,'Can view bookings',7,'view_bookings'),(29,'Can add chats',8,'add_chats'),(30,'Can change chats',8,'change_chats'),(31,'Can delete chats',8,'delete_chats'),(32,'Can view chats',8,'view_chats'),(33,'Can add department',9,'add_department'),(34,'Can change department',9,'change_department'),(35,'Can delete department',9,'delete_department'),(36,'Can view department',9,'view_department'),(37,'Can add doctor',10,'add_doctor'),(38,'Can change doctor',10,'change_doctor'),(39,'Can delete doctor',10,'delete_doctor'),(40,'Can view doctor',10,'view_doctor'),(41,'Can add login1',11,'add_login1'),(42,'Can change login1',11,'change_login1'),(43,'Can delete login1',11,'delete_login1'),(44,'Can view login1',11,'view_login1'),(45,'Can add patients',12,'add_patients'),(46,'Can change patients',12,'change_patients'),(47,'Can delete patients',12,'delete_patients'),(48,'Can view patients',12,'view_patients'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add schedule',14,'add_schedule'),(54,'Can change schedule',14,'change_schedule'),(55,'Can delete schedule',14,'delete_schedule'),(56,'Can view schedule',14,'view_schedule'),(57,'Can add physical_conditions',15,'add_physical_conditions'),(58,'Can change physical_conditions',15,'change_physical_conditions'),(59,'Can delete physical_conditions',15,'delete_physical_conditions'),(60,'Can view physical_conditions',15,'view_physical_conditions'),(61,'Can add pharmacy',16,'add_pharmacy'),(62,'Can change pharmacy',16,'change_pharmacy'),(63,'Can delete pharmacy',16,'delete_pharmacy'),(64,'Can view pharmacy',16,'view_pharmacy'),(65,'Can add payments',17,'add_payments'),(66,'Can change payments',17,'change_payments'),(67,'Can delete payments',17,'delete_payments'),(68,'Can view payments',17,'view_payments'),(69,'Can add medicines',18,'add_medicines'),(70,'Can change medicines',18,'change_medicines'),(71,'Can delete medicines',18,'delete_medicines'),(72,'Can view medicines',18,'view_medicines'),(73,'Can add medicine_prescriptions',19,'add_medicine_prescriptions'),(74,'Can change medicine_prescriptions',19,'change_medicine_prescriptions'),(75,'Can delete medicine_prescriptions',19,'delete_medicine_prescriptions'),(76,'Can view medicine_prescriptions',19,'view_medicine_prescriptions'),(77,'Can add medical_notes',20,'add_medical_notes'),(78,'Can change medical_notes',20,'change_medical_notes'),(79,'Can delete medical_notes',20,'delete_medical_notes'),(80,'Can view medical_notes',20,'view_medical_notes'),(81,'Can add chat',21,'add_chat'),(82,'Can change chat',21,'change_chat'),(83,'Can delete chat',21,'delete_chat'),(84,'Can view chat',21,'view_chat'),(85,'Can add labtest',22,'add_labtest'),(86,'Can change labtest',22,'change_labtest'),(87,'Can delete labtest',22,'delete_labtest'),(88,'Can view labtest',22,'view_labtest'),(89,'Can add lab',23,'add_lab'),(90,'Can change lab',23,'change_lab'),(91,'Can delete lab',23,'delete_lab'),(92,'Can view lab',23,'view_lab');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'dpapp','bookings'),(8,'dpapp','chats'),(9,'dpapp','department'),(10,'dpapp','doctor'),(11,'dpapp','login1'),(12,'dpapp','patients'),(13,'dpapp','user'),(14,'dpapp','schedule'),(15,'dpapp','physical_conditions'),(16,'dpapp','pharmacy'),(17,'dpapp','payments'),(18,'dpapp','medicines'),(19,'dpapp','medicine_prescriptions'),(20,'dpapp','medical_notes'),(21,'dpapp','chat'),(22,'dpapp','labtest'),(23,'dpapp','lab');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2024-01-22 04:30:39.828956'),(2,'auth','0001_initial','2024-01-22 04:30:40.020596'),(3,'admin','0001_initial','2024-01-22 04:30:40.076412'),(4,'admin','0002_logentry_remove_auto_add','2024-01-22 04:30:40.085583'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-22 04:30:40.097195'),(6,'contenttypes','0002_remove_content_type_name','2024-01-22 04:30:40.137121'),(7,'auth','0002_alter_permission_name_max_length','2024-01-22 04:30:40.155482'),(8,'auth','0003_alter_user_email_max_length','2024-01-22 04:30:40.174767'),(9,'auth','0004_alter_user_username_opts','2024-01-22 04:30:40.187226'),(10,'auth','0005_alter_user_last_login_null','2024-01-22 04:30:40.209587'),(11,'auth','0006_require_contenttypes_0002','2024-01-22 04:30:40.213580'),(12,'auth','0007_alter_validators_add_error_messages','2024-01-22 04:30:40.224777'),(13,'auth','0008_alter_user_username_max_length','2024-01-22 04:30:40.245626'),(14,'auth','0009_alter_user_last_name_max_length','2024-01-22 04:30:40.266234'),(15,'auth','0010_alter_group_name_max_length','2024-01-22 04:30:40.287325'),(16,'auth','0011_update_proxy_permissions','2024-01-22 04:30:40.297847'),(17,'auth','0012_alter_user_first_name_max_length','2024-01-22 04:30:40.318915'),(18,'dpapp','0001_initial','2024-01-22 04:30:40.708521'),(19,'sessions','0001_initial','2024-01-22 04:30:40.728246'),(20,'dpapp','0002_chat','2024-02-01 06:46:21.249947'),(21,'dpapp','0003_physical_conditions_report','2024-03-11 06:04:14.085981'),(22,'dpapp','0004_physical_conditions_description','2024-03-11 06:22:04.469865'),(23,'dpapp','0005_labtest','2024-03-25 17:07:24.197645'),(24,'dpapp','0006_lab_labtest_lab','2024-03-25 17:27:45.970145');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('w7e4dpalv43tyh8a160oai5ndji3dnrr','.eJyrVsrJT8_Mi89MUbIy0lFKyU8uyS8C8oqVrAx1lEqLUxGcFDBDyVCpFgDf2hDv:1rRr5i:YC_1_7iT4fs8qAyn8qEWDx6_VBjVodvPft_RIEXhT-M','2024-02-05 09:59:42.882465'),('sgr883xxz928lxd6u9d0ehi44gbeioxi','.eJyrVsrJT8_Mi89MUbIy0lFKyU8uyS8C8oqVrAx1lEqLUxGcFDBDyVBJR6kgI7EoNzG5EipXCwAygBa-:1rS7Xr:-SeJtR3lVqkkHkt3sWBXejJLE9iHxIkiEmrXE2jjvQA','2024-02-06 03:33:51.565396'),('g49gai2twzk5hvr9smplguc8chdrlbie','eyJsb2dpbl9pZCI6Mn0:1rTk2d:a7A1BR_Nz5_X0A0fx_E70-3e4v8udkNG7qizhNbBbFI','2024-02-10 14:52:19.485450'),('n0aegmx2hmqlyvf8utuvpbo5w8fztaz5','.eJyrVsrJT8_Mi89MUbIy0lEqLU4tArKLlawMdZRS8pNL8hHcgozEotzE5EqoQC0AVl4T-w:1rUYGJ:dMwRMHdauay0PzxsEBq0PDlCQt1KWA_1MFPnF-c_pNw','2024-02-12 20:29:47.592983'),('iztjy54hx43pskl96635slhqe52t3vwp','eyJsb2dpbl9pZCI6MSwidXNlcl9pZHMiOjF9:1rUn5P:klXAwPY_vdKfL8YzmAnCe7VDQzc1z5pUwmTp8R680Fo','2024-02-13 12:19:31.671644'),('648h22bnqfd3key44ydhmh5g6h5fcc58','eyJsb2dpbl9pZCI6MSwidXNlcl9pZHMiOjEsImRpZHMiOiIxIn0:1rVFeW:M4Em0NAcl4afzlzvBdzNRZruvLGN82bE4RRlk7F9fiY','2024-02-14 18:49:40.624415'),('4cptrhkfymyouze618ebs62kjkbjd376','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MX0:1rVQS1:WagLjF6_8OmY2_UKVOmZrjvzV3uT0oXoczK2Nm4qHXo','2024-02-15 06:21:29.691464'),('vvt3b2c8wvd9nl909z75kehq9msvxlj1','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MSwidXNlcl9pZHMiOiIxIn0:1rVR9p:Oi2adUVI31EpfwduDzPxphGynpOd5MoC7Atu1jsoAOM','2024-02-15 07:06:45.089541'),('ckey3766u6u762wejl1qs2osik9fwo6a','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MX0:1rVRcv:QJRLghXvW_a4wzNTzhnLeirvB2c2BoKoFlI2G2INNfs','2024-02-15 07:36:49.651826'),('vcczfxw652oapvrpd4goedb53690q9ag','eyJ1c2VyX2lkcyI6IjEifQ:1rVRe5:s1BNxjf9IncsJRIjwZKEmCw6WJnPZAifldOvKLYrYkA','2024-02-15 07:38:01.586709'),('4gstcb7so6v5xzysfg0wr3oeslptv8o0','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MSwidXNlcl9pZHMiOiIxIn0:1rVRhl:sCQQZPzriPjTFe8jptDr2glpdGnjMT-S6a-H-Re6GRQ','2024-02-15 07:41:49.428803'),('339fh042sxm80npvevnd0nqam17scpi0','eyJ1c2VyX2lkcyI6IjEifQ:1rVRqf:HmVoBg6RtoblBWp5Yjqtd_1MJFZ8B6yYmLMhtR_jrO8','2024-02-15 07:51:01.967434'),('3r9nzau8529hxbobchvj1wkxsvps6wve','eyJ1c2VyX2lkcyI6IjEifQ:1rVRxn:gb7Rawjd-34B07HR9CaU5k3YrsWy-bjM1GUJfyVHDdc','2024-02-15 07:58:23.324695'),('0v0c9wu0x8d28gh44p2b70yowept1cea','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MSwidXNlcl9pZHMiOiJib290c3RyYXAubWluLmNzcy5tYXAifQ:1rVS5U:a8xnjSFvClvdc_-qri_oZ2Nh90ZgFvYzX_wW-Coza98','2024-02-15 08:06:20.138723'),('1bay3fwj6r9fv7hsayzclzh1fkmrv4lo','.eJyrViotTi2Kz0wpVrIy1FHKyU_PzAPywJyU_OSSfIRcck5mal4JWFLJTAkoDZZQMlSqBQAfuhW9:1rVWwy:7bE-cuBh5UJJI3UalZqiBEUH8j8YCUPczyBSmj8IzBI','2024-02-15 13:17:52.829788'),('n7534xg55w6549kwmpvgsprdwpmxjrp7','.eJyrVsrJT8_Mi89MUbIy1FEqLU4tArKLwZwUMEPJUElHKTknMzWvBKxKyUypFgDeXRC4:1rVaIj:sRlxx9bGiMTWm4snmot_58dmVQJHG-mIiQT2tyqiw10','2024-02-15 16:52:33.660010'),('bumov5styakhz2fcwymjuixosmjxuqvs','.eJyrVsrJT8_Mi89MUbIy1FEqLU4tArKLwZzknMzUvBKwlJKxko5SSn5yST5MuhYANfES9w:1rVd2B:-VbODeg2F8rCBYqxSuHwXpoYF5lLr5lZJeWfbIACi6M','2024-02-15 19:47:39.125438'),('jyel1fm204klcf1c74nltgoh45qvl03m','.eJyrVsrJT8_Mi89MUbIy1FFKyU8uyS8C8orB3OSczNS8ErCkkrGSjlJpcSpMshYAOwMS9w:1rXFIR:hwxdtLm1_JUU0uDm9G5ZRXwv9sBP2mH579nwT_9A3R0','2024-02-20 06:51:07.751850'),('4qsuhe5dvgug9g10stnlsepvwm2ra97y','eyJsb2dpbl9pZCI6Mn0:1rXcer:vtQc74ibZ7-0mKnxF9gGak4IS0GWpyyY7zaxOxzn6Wg','2024-02-21 07:47:49.969013'),('3kfafox0ue4c1qnht888pinhwvyw3bc3','eyJsb2dpbl9pZCI6Mn0:1rXiXB:tdr1cL9EbjZk47iIw5C04gRW5Wcc7sHy_ycFtruSsDk','2024-02-21 14:04:17.816955'),('2zf5tly8jp9dr665whshri83w65l9hcu','.eJyrVsrJT8_Mi89MUbIy1FFKyU8uyS8C8orB3OSczNS8ErCkkrGSjlJpcSpMshYAOwMS9w:1rY4xl:ueqaQ8pVF19VUnEcGevcpsb4A5MY_0RGYy-Xsves9hU','2024-02-22 14:01:13.263391'),('2m6gb10ju4u7esv9329hq97z4ocs49qc','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MSwiY2xpZW50X2lkIjoiMSJ9:1raEcy:81vIuaiKh9JDwKHDWlhR8pOaGWKWRn-I05QuiVhDJQs','2024-02-28 12:44:40.514666'),('nkyj40cb45q4ih6yrtciciwrzyybk7o8','.eJyrVsrJT8_Mi89MUbIy1FEqLU4tArKLwZzknMzUvBKwlJKxko5SShGMXQsA-O4RFQ:1ragZD:eqFKe6u_ZVwWxZgyv8AyHS2_4Oga4HfQCI0GWXxzKSU','2024-02-29 18:34:39.047307'),('fm3g7whvhz1q65as5u3i9u32quynceox','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MSwiY2xpZW50X2lkIjoiMSJ9:1rafkR:zPLW9LBJIeH_tiHcc3Kp_YNpqkXLTkovhWBZYo2EBck','2024-02-29 17:42:11.851507'),('1vz809wqm9t6w1meudrpt9rdwayvmc4m','eyJsb2dpbl9pZCI6Mn0:1rbZVx:8WIjmqk4PR2tJWujscOYampKlzuL9VY4ZU8cNCbz7ro','2024-03-03 05:14:57.621858'),('nes3f3dl2ywrgrctifewgm6xz0i353nh','eyJsb2dpbl9pZCI6MywidXNlcl9pZHMiOjEsImRvY3Rvcl9pZHMiOjF9:1rbZe7:tFNDto_ywSBmar1ZZcfYfzFL-mirYMnpmb7beGHyT8Y','2024-03-03 05:23:23.940011'),('md0jbvq5jz5x4zubbyizlsjiks9ugbpo','eyJsb2dpbl9pZCI6Mn0:1rbjUK:XBmL5J8qUkOCE1Om2_iexUAyIJL9A0axbpFYnhFomWM','2024-03-03 15:53:56.297162'),('x0pfkc3ojswlh92q27o8yckqfqdv0d9v','eyJsb2dpbl9pZCI6MywiZG9jdG9yX2lkcyI6MSwiY2xpZW50X2lkIjoiMSJ9:1reC4v:a0ba5Vs0kmTaJQ3wDI36x32KnoqC3pTeeM_a77eqlFg','2024-03-10 10:49:53.072245'),('yzf33ubttwgbxjxmy880azx7s8ifi1b8','.eJyrVsrJT8_Mi89MUbIy1lEqLU4tArKLlawMdZRSisDCSsZKQHZ-ckk-Qio5JzM1rwQibahUCwAhNRYa:1reCDc:jD76i4ivkbX3axW6HdBpYGdP1SnFWje1Q1XekbEjhRY','2024-03-10 10:58:52.347636'),('g5i53fx1381s1rox9l49a2piso8edelr','.eJyrVsrJT8_Mi89MUbIy1FFKyU8uyS8C8orB3OSczNS8ErCkkqGSjlJpcSpCMqUIImGsVAsAMdQWGA:1rhYZA:eRVAOYLMMTK0ZM3seB05xMKHE16jtM6pWi2E3cYeGqE','2024-03-19 17:27:00.575907'),('jz7zg9zgpejtaqgcal64arhfmv7wnd18','.eJyrVsrJT8_Mi89MUbIytNBRSslPLskvAnKLlaxMdZSSczJT80rAskqGSjpKpcWpUElDoFowQ8kIKF6QkViUm5hcCZEzAcoVQTVZKNUCAFQkHyA:1rjbx6:RydwgYMrZRFerRLxBwRrp_tTPVL-gw147OCRJNZw4R8','2024-03-25 09:28:12.594530'),('jh0yspbmsbmwklkgfkxq58nbu6h46xon','.eJyrVsrJT8_Mi89MUbIyMtRRKi1OLQJyipWszHSUUsAMJXMlHaWCjMSi3MTkSoicCVAuP7kkH6rUXEcpOSczNa8EbIySkaFSLQDrBRv_:1rjhu7:QHd8mdFIj8odeQc_Z0KwBc478Y5kuBKI1Q8WdmwpdUQ','2024-03-25 15:49:31.433093'),('1gyb9m61u7cjqgtjntd2h1qjaka9rmyh','.eJyrVsrJT8_Mi89MUbIyMtRRSslPLskvAnKLlawsdJRKi1OhHDOgHJihZKGko1SQkViUm5hcCZEz0VFKzslMzSsBG6NkZAhUkVIE5Rgp1QIAfBkfVQ:1rmP1n:LxGMuEi_FYsU_9mEcyR_Rll3RVfNFMtq0Gnq1EGOVEo','2024-04-02 02:16:35.008611'),('189p4s5tbca0iw6o4o7ztwxt4eesybk2','.eJyrVsrJT8_Mi89MUbIyMtJRKi1OLQJyipWsDHWUUsAMJQslIDM_uSQfKmNRCwDdJREv:1rkf6G:SaB27Q0ge7CD5xaofoYqxmTeL1cTeRQ8rGGAs7hSvNY','2024-03-28 07:02:00.610384'),('tfu9olx028xumnxkggehk2kmvr4z96r1','.eJyrVsrJT8_Mi89MUbIyNNdRKi1OLQJyipWsLHWUUsAMJQslILMIrETJyAjEyU8uyYcqs9BRKshILMpNTK6ECJjUAgBVzhph:1rogbx:jjKF5GhDvpKQKljDhBqu4GGHtz9YPqmLMpVs6lEv_Ro','2024-04-08 09:27:21.917817'),('8mh8u3qrdonrq5v2e6m7wgol5kyvy26j','.eJyrVsrJT8_Mi89MUbIyNtZRKi1OLQJyipWsDHWUUsAMJUNDJSA7P7kkHyYFlCvISCzKTUyuhIiY6CjlJCZBZWsBh7kbAA:1rooZw:zkZOmtGxDjaqapnfvqHkwLhfdkebnPatPMTrrleO7Ao','2024-04-08 17:57:48.967710'),('1xtoh66dsmi89093z68tt37ubxruuh14','eyJsb2dpbl9pZCI6Mn0:1rp9Pr:T9MMixl2yso7NhSCF5KMWyoa-OryL8MDNLChgkii8Vc','2024-04-09 16:12:47.757741'),('gbwskjl58oqwcvs56u2eqmj4kt4v6cxs','eyJsb2dpbl9pZCI6Mn0:1rpAHc:VuHxPe-2HhMnmnr8i-0_ne_A1b6aFHDyCsEz6jw9hOw','2024-04-09 17:08:20.035121');

/*Table structure for table `dpapp_bookings` */

DROP TABLE IF EXISTS `dpapp_bookings`;

CREATE TABLE `dpapp_bookings` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_date_time` varchar(225) NOT NULL,
  `Booking_status` varchar(225) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `dpapp_bookings_patient_id_69ff9c10` (`patient_id`),
  KEY `dpapp_bookings_schedule_id_9cf32a62` (`schedule_id`),
  KEY `dpapp_bookings_user_id_d8734ec8` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_bookings` */

insert  into `dpapp_bookings`(`booking_id`,`booking_date_time`,`Booking_status`,`patient_id`,`schedule_id`,`user_id`) values (11,'2024-03-19','paid',5,6,6),(9,'2024-03-14','paid',5,6,6),(10,'2024-03-14','paid',2,6,1),(12,'2024-03-25','paid',6,6,9),(13,'2024-03-25','pending',2,7,1);

/*Table structure for table `dpapp_chat` */

DROP TABLE IF EXISTS `dpapp_chat`;

CREATE TABLE `dpapp_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` varchar(225) NOT NULL,
  `date_time` varchar(225) NOT NULL,
  `from_id_id` int(11) NOT NULL,
  `to_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dpapp_chat_from_id_id_de8168f2` (`from_id_id`),
  KEY `dpapp_chat_to_id_id_4bfbf659` (`to_id_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_chat` */

insert  into `dpapp_chat`(`id`,`message`,`date_time`,`from_id_id`,`to_id_id`) values (24,'hiii','2024-03-18 11:20:39.508000',21,22),(23,'haii doctor','2024-03-14 07:39:51.291358',22,21),(22,'haiii','2024-03-14 07:23:15.635719',22,21),(25,'hi doctor how are you doing','2024-03-25 14:45:08.902768',28,22);

/*Table structure for table `dpapp_chats` */

DROP TABLE IF EXISTS `dpapp_chats`;

CREATE TABLE `dpapp_chats` (
  `chat_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `sender_type` varchar(225) NOT NULL,
  `receiver` int(11) NOT NULL,
  `reciver_type` varchar(225) NOT NULL,
  `message` varchar(225) NOT NULL,
  `date_time` varchar(225) NOT NULL,
  PRIMARY KEY (`chat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_chats` */

/*Table structure for table `dpapp_department` */

DROP TABLE IF EXISTS `dpapp_department`;

CREATE TABLE `dpapp_department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(225) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_department` */

insert  into `dpapp_department`(`department_id`,`dept_name`) values (7,'oncologist'),(13,'ENT'),(4,'surgeon'),(8,'Gynecologist'),(9,'pediatrician'),(11,'Anaesthesiology');

/*Table structure for table `dpapp_doctor` */

DROP TABLE IF EXISTS `dpapp_doctor`;

CREATE TABLE `dpapp_doctor` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(225) NOT NULL,
  `lname` varchar(225) NOT NULL,
  `place` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `qualification` varchar(225) NOT NULL,
  `image` varchar(2000) NOT NULL,
  `department_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `dpapp_doctor_department_id_3c7499a7` (`department_id`),
  KEY `dpapp_doctor_login_id_2ed80059` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_doctor` */

insert  into `dpapp_doctor`(`doctor_id`,`fname`,`lname`,`place`,`phone`,`email`,`qualification`,`image`,`department_id`,`login_id`) values (8,'Samatha','Deines','kochi','9078564327','sama@gmail.com','mbbs','doclisc.jpg',9,22),(11,'hari','priya','kochi','8765786543','hari@gmail.com','mbbs','doclisc_ls3xzSu.jpg',4,27);

/*Table structure for table `dpapp_lab` */

DROP TABLE IF EXISTS `dpapp_lab`;

CREATE TABLE `dpapp_lab` (
  `lab_id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(225) NOT NULL,
  `lab_phone` varchar(225) NOT NULL,
  `lab_email` varchar(225) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`lab_id`),
  KEY `dpapp_lab_login_id_b38bc3ee` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_lab` */

insert  into `dpapp_lab`(`lab_id`,`lab_name`,`lab_phone`,`lab_email`,`login_id`) values (1,'labA','6666666666','lab@gmail.com',33);

/*Table structure for table `dpapp_labtest` */

DROP TABLE IF EXISTS `dpapp_labtest`;

CREATE TABLE `dpapp_labtest` (
  `labtest_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_date` varchar(225) NOT NULL,
  `test_name` varchar(225) NOT NULL,
  `test_description` varchar(225) NOT NULL,
  `test_amount` varchar(225) NOT NULL,
  `test_status` varchar(225) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `lab_id` int(11) NOT NULL,
  PRIMARY KEY (`labtest_id`),
  KEY `dpapp_labtest_booking_id_e8f1bd78` (`booking_id`),
  KEY `dpapp_labtest_lab_id_99e6cb5d` (`lab_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_labtest` */

insert  into `dpapp_labtest`(`labtest_id`,`test_date`,`test_name`,`test_description`,`test_amount`,`test_status`,`booking_id`,`lab_id`) values (1,'2024-03-25','shbbhc ','bxsbb','500','paid',10,1),(2,'2024-03-25','snb','sbbs','pending','Forwarded',10,1);

/*Table structure for table `dpapp_login1` */

DROP TABLE IF EXISTS `dpapp_login1`;

CREATE TABLE `dpapp_login1` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `usertype` varchar(225) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_login1` */

insert  into `dpapp_login1`(`login_id`,`username`,`password`,`usertype`) values (1,'akhila','akhila','user'),(2,'admin','admin','admin'),(21,'anami','anami','user'),(25,'dddd','dddd','user'),(6,'ss','sss','doctor'),(7,'appu','apuu','user'),(10,'ph','ph','pharmacy'),(27,'hari','hari','doctor'),(13,'appu','apuu','user'),(14,'appu','apuu','user'),(16,'sree','sree123','user'),(17,'anu','anu','doctor'),(22,'samatha','sama','doctor'),(23,'arya','arya','user'),(24,'helen','helen','doctor'),(28,'joby123','joby123','user'),(29,'vis','Vis','user'),(30,'asha','Asha123456','user'),(31,'anju','Anju@gmai.com','user'),(32,'ridhu','Ridhu','user'),(33,'lab','lab','lab');

/*Table structure for table `dpapp_medical_notes` */

DROP TABLE IF EXISTS `dpapp_medical_notes`;

CREATE TABLE `dpapp_medical_notes` (
  `medical_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(225) NOT NULL,
  `date_time` varchar(225) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`medical_note_id`),
  KEY `dpapp_medical_notes_booking_id_9145cd47` (`booking_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_medical_notes` */

insert  into `dpapp_medical_notes`(`medical_note_id`,`description`,`date_time`,`booking_id`) values (3,'bbbbb','2024-03-14',10),(4,'asdfghjkiuytr','2024-03-14',9),(5,'asdfghjmnbvc','2024-03-19',9),(6,'wedfvg vbb','2024-03-19',10),(7,'rplokiujjj','2024-03-19',9),(8,'skhkshbkqs','2024-03-25',10);

/*Table structure for table `dpapp_medicine_prescriptions` */

DROP TABLE IF EXISTS `dpapp_medicine_prescriptions`;

CREATE TABLE `dpapp_medicine_prescriptions` (
  `med_pres_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` varchar(225) NOT NULL,
  `pres_description` varchar(225) NOT NULL,
  `p_amount` varchar(225) NOT NULL,
  `pres_status` varchar(225) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  PRIMARY KEY (`med_pres_id`),
  KEY `dpapp_medicine_prescriptions_booking_id_0e142a2b` (`booking_id`),
  KEY `dpapp_medicine_prescriptions_medicine_id_aa5510ca` (`medicine_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_medicine_prescriptions` */

insert  into `dpapp_medicine_prescriptions`(`med_pres_id`,`date_time`,`pres_description`,`p_amount`,`pres_status`,`booking_id`,`medicine_id`) values (2,'2024-03-14','shhshs','600','accept',10,6),(3,'2024-03-14','pain killer','pending','Forwarded',9,8),(4,'2024-03-14','wertyui','pending','pending',9,6),(5,'2024-03-19','sdfghj','pending','Forwarded',10,8),(6,'2024-03-19','werfvbhu','pending','Forwarded',10,9),(7,'2024-03-19','qwertguikkkkn','pending','pending',9,8),(8,'2024-03-25','sdfghtrertyh','pending','pending',9,6),(9,'2024-03-25','gvgvjj','pending','pending',10,8);

/*Table structure for table `dpapp_medicines` */

DROP TABLE IF EXISTS `dpapp_medicines`;

CREATE TABLE `dpapp_medicines` (
  `medicine_id` int(11) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  `available_qty` varchar(225) NOT NULL,
  `expiry_date` varchar(225) NOT NULL,
  `rate` varchar(225) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  PRIMARY KEY (`medicine_id`),
  KEY `dpapp_medicines_pharmacy_id_1304246e` (`pharmacy_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_medicines` */

insert  into `dpapp_medicines`(`medicine_id`,`medicine_name`,`description`,`available_qty`,`expiry_date`,`rate`,`pharmacy_id`) values (6,'paracetamol','pain killer','6 pac','2025-03-29','30',4),(8,'Desprine','Headache','3 box','2025-09-05','40',4),(9,'silicazib','for leg and back pain','7 pac','2026-03-27','50',4);

/*Table structure for table `dpapp_patients` */

DROP TABLE IF EXISTS `dpapp_patients`;

CREATE TABLE `dpapp_patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_fname` varchar(225) NOT NULL,
  `patient_lname` varchar(225) NOT NULL,
  `place` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `housename` varchar(225) NOT NULL,
  `gender` varchar(225) NOT NULL,
  `blood_group` varchar(225) NOT NULL,
  `dob` varchar(225) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `dpapp_patients_user_id_b304e63f` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_patients` */

insert  into `dpapp_patients`(`patient_id`,`patient_fname`,`patient_lname`,`place`,`phone`,`email`,`housename`,`gender`,`blood_group`,`dob`,`user_id`) values (5,'anil','kumar','kochi','8976543245','anil@gmail.com','anilnivas','male','ab+','1980-03-05',6),(2,'ammu','nkl','mkd','05555555555','akhilaraveeendran@gmail.com','ugkj','femal','b+','2024-02-21',1),(3,'anu','priya','udayanapuram','9878654323','anu123@gmail.com','anunivas','female','o+','2002-05-16',5),(6,'p','k','mkd','8978786676','a@gmail.com','hgdghskh','male','b+','2024-03-20',9);

/*Table structure for table `dpapp_payments` */

DROP TABLE IF EXISTS `dpapp_payments`;

CREATE TABLE `dpapp_payments` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(225) NOT NULL,
  `payment_date` varchar(225) NOT NULL,
  `payment_type` varchar(225) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `dpapp_payments_booking_id_7c86e6b5` (`booking_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_payments` */

insert  into `dpapp_payments`(`pay_id`,`amount`,`payment_date`,`payment_type`,`booking_id`) values (8,'400','2024-03-19','doctor',11),(7,'400','2024-03-14','doctor',10),(6,'400','2024-03-14','doctor',9),(9,'400','2024-03-25','doctor',12),(10,'1000','2024-03-25','subscription',13),(11,'500','2024-03-25','lab',1),(12,'500','2024-03-25','lab',1);

/*Table structure for table `dpapp_pharmacy` */

DROP TABLE IF EXISTS `dpapp_pharmacy`;

CREATE TABLE `dpapp_pharmacy` (
  `pharmacy_id` int(11) NOT NULL AUTO_INCREMENT,
  `pharmacy_name` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`pharmacy_id`),
  KEY `dpapp_pharmacy_login_id_907c9077` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_pharmacy` */

insert  into `dpapp_pharmacy`(`pharmacy_id`,`pharmacy_name`,`phone`,`email`,`login_id`) values (4,'anugraha','13456788','anugara@gmail.com',10);

/*Table structure for table `dpapp_physical_conditions` */

DROP TABLE IF EXISTS `dpapp_physical_conditions`;

CREATE TABLE `dpapp_physical_conditions` (
  `physical_condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `blood_pressure` varchar(225) NOT NULL,
  `sugar` varchar(225) NOT NULL,
  `cholesterol` varchar(225) NOT NULL,
  `height` varchar(225) NOT NULL,
  `weight` varchar(225) NOT NULL,
  `date_time` varchar(225) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `report` varchar(225) NOT NULL,
  `description` varchar(225) NOT NULL,
  PRIMARY KEY (`physical_condition_id`),
  KEY `dpapp_physical_conditions_patient_id_914ea073` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_physical_conditions` */

insert  into `dpapp_physical_conditions`(`physical_condition_id`,`blood_pressure`,`sugar`,`cholesterol`,`height`,`weight`,`date_time`,`patient_id`,`report`,`description`) values (10,'78','79','80','155','60','2024-03-14',6,'medicalreport_aV2ZCSV.jpg','asdfghjk'),(9,'78','75','70','155','60','2024-03-14',8,'medicalreport.jpg','sdfghjkl'),(11,'78','33','33','123','33','2024-03-25',2,'law2.jpg','bjsncbn ');

/*Table structure for table `dpapp_schedule` */

DROP TABLE IF EXISTS `dpapp_schedule`;

CREATE TABLE `dpapp_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(225) NOT NULL,
  `end_time` varchar(225) NOT NULL,
  `schedule_date` varchar(225) NOT NULL,
  `fee_amount` varchar(225) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `dpapp_schedule_doctor_id_6bc0d157` (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_schedule` */

insert  into `dpapp_schedule`(`schedule_id`,`start_time`,`end_time`,`schedule_date`,`fee_amount`,`doctor_id`) values (6,'15:00','18:00','2024-03-16','400',8),(7,'23:23','00:24','2024-03-26','1000',11);

/*Table structure for table `dpapp_user` */

DROP TABLE IF EXISTS `dpapp_user`;

CREATE TABLE `dpapp_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(225) NOT NULL,
  `user_lname` varchar(225) NOT NULL,
  `place` varchar(225) NOT NULL,
  `phone` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `dpapp_user_login_id_7839093e` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `dpapp_user` */

insert  into `dpapp_user`(`user_id`,`user_fname`,`user_lname`,`place`,`phone`,`email`,`login_id`) values (1,'akhila','kr','mkd','88888888888','Akhila@gmail.com',1),(2,'appu','m','mkd','6337333','appu@gmail.com',7),(3,'anu','dfvd','dgh','234567','zfbftnm@gmail.com',13),(4,'errr','bgnc','fvju','3456785789','nandi2@gmail.com',14),(5,'sree','priya','vaikom','9876543213','sree@gmail.com',16),(6,'Anamika','A','chottanikkara','9812097654','ana@gmail.com',21),(7,'Arya','ks','vaikom','8790654378','arya@gmail.com',23),(9,'joby','varghese','TVLA','9090309895','joby@gmail.com',28),(10,'vismaya','a','parappuram','7890567899','vis@gmail.com',29),(11,'Ashaaaa','kr','atpd','9944444999','as@gmail.com',30),(12,'Anjuu','K','mkd','8989767880','anju@gmail.com',31),(13,'ridhu','r','pkd','9999999999','ridhu@gmail.com',32);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
