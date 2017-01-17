DROP TABLE IF EXISTS `borhandw`.`dwh_dim_widget_security_policy`;

CREATE TABLE `borhandw`.`dwh_dim_widget_security_policy` (
  `widget_security_policy_id` SMALLINT NOT NULL ,
  `widget_security_policy_name` VARCHAR(50),
   dwh_creation_date TIMESTAMP NOT NULL DEFAULT 0,
   dwh_update_date TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   ri_ind TINYINT NOT NULL DEFAULT '1',
  PRIMARY KEY (`widget_security_policy_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8; 


create trigger `borhandw`.`dwh_dim_widget_security_policy_setcreationtime_oninsert` before insert
    on `borhandw`.`dwh_dim_widget_security_policy`
    for each row 
	set new.dwh_creation_date = now();
	
