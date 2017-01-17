DROP TABLE IF EXISTS `borhandw_bisources`.`bisources_user_status`;

CREATE TABLE `borhandw_bisources`.`bisources_user_status` (
  `user_status_id` SMALLINT NOT NULL ,
  `user_status_name` VARCHAR(50),
  PRIMARY KEY (`user_status_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;

INSERT INTO `borhandw_bisources`.`bisources_user_status` VALUES(0,'BLOCKED');
INSERT INTO `borhandw_bisources`.`bisources_user_status` VALUES(1,'ACTIVE'); 
INSERT INTO `borhandw_bisources`.`bisources_user_status`  VALUES(2,'DELETED');
