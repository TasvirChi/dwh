DROP TABLE IF EXISTS `borhandw`.`dwh_dim_entry_type`;

CREATE TABLE `borhandw`.`dwh_dim_entry_type` (
  `entry_type_id` SMALLINT NOT NULL ,
  `entry_type_name` VARCHAR(50) DEFAULT 'missing value',
   dwh_creation_date TIMESTAMP NOT NULL DEFAULT 0,
   dwh_update_date TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   ri_ind TINYINT NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry_type_id`)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;

CREATE TRIGGER `borhandw`.`dwh_dim_entry_type_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_entry_type`
    FOR EACH ROW 
	SET new.dwh_creation_date = NOW();
	
