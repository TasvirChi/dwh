DROP TABLE IF EXISTS `borhandw`.`dwh_dim_widget_security_type`;

CREATE TABLE `borhandw`.`dwh_dim_widget_security_type` (
  `widget_security_type_id` SMALLINT NOT NULL ,
  `widget_security_type_name` VARCHAR(50),
   dwh_creation_date TIMESTAMP NOT NULL DEFAULT 0,
   dwh_update_date TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   ri_ind TINYINT NOT NULL DEFAULT '1',
  PRIMARY KEY (`widget_security_type_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8; 


CREATE TRIGGER `borhandw`.`dwh_dim_widget_security_type_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_widget_security_type`
    FOR EACH ROW 
	set new.dwh_creation_date = now();
	
