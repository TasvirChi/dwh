DROP TABLE IF EXISTS `borhandw`.`dwh_dim_domain`;

CREATE TABLE `borhandw`.`dwh_dim_domain` (
  `domain_id` INT AUTO_INCREMENT NOT NULL ,
  `domain_name` VARCHAR(255) DEFAULT 'missing value',
   dwh_creation_date TIMESTAMP NOT NULL DEFAULT 0,
   dwh_update_date TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   ri_ind TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`domain_id`),
  UNIQUE KEY (domain_name)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;

CREATE TRIGGER `borhandw`.`dwh_dim_domain_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_domain`
    FOR EACH ROW 
	SET new.dwh_creation_date = NOW();
