USE `borhandw`;
 /* create tables */
CREATE TABLE borhandw.`dwh_hourly_plays_country` (
  `partner_id` INT DEFAULT NULL,
  `date_id` INT DEFAULT NULL,
  `hour_id` INT DEFAULT NULL,
  `client_tag_id` INT DEFAULT NULL,
  `country_id` INT DEFAULT NULL,
  `location_id` INT DEFAULT NULL,
  `count_plays` INT DEFAULT NULL,
   PRIMARY KEY (`partner_id`,`date_id`, `hour_id`, `client_tag_id`,`country_id`,location_id),
  KEY (`date_id`, `hour_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8
PARTITION BY RANGE (date_id)
(PARTITION p_201312 VALUES LESS THAN (20140101) ENGINE = INNODB);
 
CALL borhandw.add_monthly_partition_for_table('dwh_hourly_plays_country');

  