DROP TABLE IF EXISTS `borhandw`.`dwh_dim_partner_vertical`;

CREATE TABLE `borhandw`.`dwh_dim_partner_vertical` (
  `partner_vertical_id` SMALLINT NOT NULL ,
  `partner_vertical_name` VARCHAR(50) DEFAULT 'missing value',
   dwh_creation_date TIMESTAMP NOT NULL DEFAULT 0,
   dwh_update_date TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   ri_ind TINYINT NOT NULL DEFAULT '1',
  PRIMARY KEY (`partner_vertical_id`)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;

CREATE TRIGGER `borhandw`.`dwh_dim_partner_vertical_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_partner_vertical`
    FOR EACH ROW 
	SET new.dwh_creation_date = NOW();
