USE `borhandw`;
 /* create tables */
CREATE TABLE borhandw.`dwh_hourly_plays_entry` (
  `partner_id` INT DEFAULT NULL,
  `date_id` INT DEFAULT NULL,
  `hour_id` INT DEFAULT NULL,
  `client_tag_id` INT DEFAULT NULL,
  `entry_id` VARCHAR(20) DEFAULT NULL,
  `count_plays` INT DEFAULT NULL,
   PRIMARY KEY (`partner_id`,`date_id`, `hour_id`, `client_tag_id`,`entry_id`),
   KEY (`date_id`, `hour_id`),
   KEY `entry_id` (`entry_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8
PARTITION BY RANGE (date_id)
(PARTITION p_201312 VALUES LESS THAN (20140101) ENGINE = INNODB);
 


  