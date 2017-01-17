/*
SQLyog Community v8.7 
MySQL - 5.1.47 : Database - borhandw
*********************************************************************
*/

use `borhandw`;

DROP TABLE IF EXISTS `dwh_dim_category_status`;

CREATE TABLE `dwh_dim_category_status` (
  `category_status_id` int(11) NOT NULL,
  `category_status_name` VARCHAR(100) DEFAULT 'missing value',
  `dwh_creation_date` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dwh_update_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ri_ind` TINYINT(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`category_status_id`)
) ENGINE=MYISAM;

CREATE TRIGGER `borhandw`.`dwh_dim_category_status_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_category_status`
    FOR EACH ROW 
	SET new.dwh_creation_date = NOW();
