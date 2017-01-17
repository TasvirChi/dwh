DROP TABLE IF EXISTS `borhandw`.`dwh_dim_gender`;

CREATE TABLE `borhandw`.`dwh_dim_gender` (
  `gender_id` SMALLINT NOT NULL ,
  `gender_name` VARCHAR(50),
   dwh_creation_date TIMESTAMP NOT NULL DEFAULT 0,
   dwh_update_date TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   ri_ind TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`gender_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;


CREATE TRIGGER `borhandw`.`dwh_dim_gender_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_gender`
    FOR EACH ROW 
	SET new.dwh_creation_date = NOW();
	
