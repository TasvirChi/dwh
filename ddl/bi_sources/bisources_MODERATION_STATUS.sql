DROP TABLE IF EXISTS `borhandw_bisources`.`bisources_moderation_status`;

CREATE TABLE `borhandw_bisources`.`bisources_moderation_status` (
  `moderation_status_id` SMALLINT NOT NULL ,
  `moderation_status_name` VARCHAR(50),
  PRIMARY KEY (`moderation_status_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;

INSERT INTO borhandw_bisources.bisources_moderation_status (moderation_status_id,moderation_status_name) VALUES(1,'PENDING'); 
INSERT INTO borhandw_bisources.bisources_moderation_status (moderation_status_id,moderation_status_name) VALUES(2,'APROVED'); 
INSERT INTO borhandw_bisources.bisources_moderation_status (moderation_status_id,moderation_status_name) VALUES(3,'BLOCK'); 
INSERT INTO borhandw_bisources.bisources_moderation_status (moderation_status_id,moderation_status_name) VALUES(4,'DELETE'); 
INSERT INTO borhandw_bisources.bisources_moderation_status (moderation_status_id,moderation_status_name) VALUES(5,'REVIEW'); 
INSERT INTO borhandw_bisources.bisources_moderation_status (moderation_status_id,moderation_status_name) VALUES(6,'AUTO_APPROVED'); 
