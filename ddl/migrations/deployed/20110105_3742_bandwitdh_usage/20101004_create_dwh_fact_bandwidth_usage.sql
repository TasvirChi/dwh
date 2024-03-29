/*
SQLyog Community v8.3 
MySQL - 5.1.41-3ubuntu12.6 : Database - borhandw
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

USE `borhandw`;

CREATE TABLE `dwh_fact_bandwidth_usage` (
  `cycle_id` INT(11) NOT NULL,
  `file_id` INT(11) NOT NULL,
  `partner_id` INT(11) NOT NULL DEFAULT -1,
  `activity_date` DATE DEFAULT NULL,
  `activity_date_id` INT(11) DEFAULT '-1',
  `activity_hour_id` TINYINT(4) DEFAULT '-1',
  `bandwidth_source_id` BIGINT(20) DEFAULT NULL,
  `url` VARCHAR(2000) DEFAULT NULL,
  `bandwidth_kb` BIGINT(20) DEFAULT '0',
  `user_agent_id` int(11) DEFAULT NULL
) ENGINE=MYISAM DEFAULT CHARSET=utf8
     PARTITION BY RANGE (TO_DAYS(activity_date))
	(PARTITION p_201010 VALUES LESS THAN (734442));
    
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
