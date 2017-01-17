DROP TABLE IF EXISTS `borhandw_bisources`.`bisources_widget_security_policy`;

CREATE TABLE `borhandw_bisources`.`bisources_widget_security_policy` (
  `widget_security_policy_id` SMALLINT NOT NULL ,
  `widget_security_policy_name` VARCHAR(50),
  PRIMARY KEY (`widget_security_policy_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;

INSERT INTO borhandw_bisources.bisources_widget_security_policy (widget_security_policy_id,widget_security_policy_name) VALUES(1,'NONE'); 
INSERT INTO borhandw_bisources.bisources_widget_security_policy (widget_security_policy_id,widget_security_policy_name) VALUES(2,'ROOT'); 
