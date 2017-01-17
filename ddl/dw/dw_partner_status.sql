DROP TABLE IF EXISTS `borhandw`.`dwh_dim_partner_status`;

CREATE TABLE `borhandw`.`dwh_dim_partner_status` (
  `partner_status_id` SMALLINT NOT NULL ,
  `partner_status_name` VARCHAR(50),
   dwh_creation_date TIMESTAMP NOT NULL DEFAULT 0,
   dwh_update_date TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   ri_ind TINYINT NOT NULL DEFAULT '1',
  PRIMARY KEY (`partner_status_id`)
  
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;


CREATE TRIGGER `borhandw`.`dwh_dim_partner_status_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_partner_status`
    FOR EACH ROW 
	SET new.dwh_creation_date = NOW();
