DROP TABLE IF EXISTS `borhandw_bisources`.`bisources_partner_type`;

CREATE TABLE `borhandw_bisources`.`bisources_partner_type` (
  `partner_type_id` SMALLINT NOT NULL ,
  `partner_type_name` VARCHAR(50),
  PRIMARY KEY (`partner_type_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;


INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(1,'BMC_SIGNUP');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(2,'OTHER');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(100,'WIKI');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(101,'WORDPRESS');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(102,'DRUPAL');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(103,'MIND_TOUCH');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(104,'MOODLE');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(105,'COMMUNITY_EDITION');
INSERT INTO `borhandw_bisources`.`bisources_partner_type`  VALUES(106,'JOOMLA ');

