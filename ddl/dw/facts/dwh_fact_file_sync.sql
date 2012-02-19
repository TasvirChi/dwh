USE kalturadw;

DROP TABLE IF EXISTS dwh_fact_file_sync;

CREATE TABLE `dwh_fact_file_sync` (
  `id` int(11) NOT NULL DEFAULT '0',
  `partner_id` int(11) DEFAULT NULL,
  `object_type` int(4) DEFAULT NULL,
  `object_id` varchar(60) DEFAULT NULL,
  `version` varchar(60) DEFAULT NULL,
  `object_sub_type` tinyint(4) DEFAULT NULL,
  `ready_at` datetime NOT NULL,
  `ready_at_id` INT(11) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `dwh_creation_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dwh_update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `unique_key` (`id`,`partner_id`,`object_type`,`object_id`,`object_sub_type`,`version`,`ready_at_id`),
  KEY `partner_id` (`partner_id`),
  KEY `deleted_at` (`deleted_at`),
  KEY `dwh_update_date` (`dwh_update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
        /*!50100 PARTITION BY RANGE (ready_at_id)
	(PARTITION p_20080531 VALUES LESS THAN (20080601) ENGINE = INNODB,
        PARTITION p_20080630 VALUES LESS THAN (20080701) ENGINE = INNODB,
        PARTITION p_20080731 VALUES LESS THAN (20080801) ENGINE = INNODB,
        PARTITION p_20080831 VALUES LESS THAN (20080901) ENGINE = INNODB,
        PARTITION p_20080930 VALUES LESS THAN (20081001) ENGINE = INNODB,
        PARTITION p_20081031 VALUES LESS THAN (20081101) ENGINE = INNODB,
        PARTITION p_20081130 VALUES LESS THAN (20081201) ENGINE = INNODB,
        PARTITION p_20081231 VALUES LESS THAN (20090101) ENGINE = INNODB,
        PARTITION p_20090131 VALUES LESS THAN (20090201) ENGINE = INNODB,
        PARTITION p_20090228 VALUES LESS THAN (20090301) ENGINE = INNODB,
        PARTITION p_20090331 VALUES LESS THAN (20090401) ENGINE = INNODB,
        PARTITION p_20090430 VALUES LESS THAN (20090501) ENGINE = INNODB,
        PARTITION p_20090531 VALUES LESS THAN (20090601) ENGINE = INNODB,
        PARTITION p_20090630 VALUES LESS THAN (20090701) ENGINE = INNODB,
        PARTITION p_20090731 VALUES LESS THAN (20090801) ENGINE = INNODB,
        PARTITION p_20090831 VALUES LESS THAN (20090901) ENGINE = INNODB,
        PARTITION p_20090930 VALUES LESS THAN (20091001) ENGINE = INNODB,
        PARTITION p_20091031 VALUES LESS THAN (20091101) ENGINE = INNODB,
        PARTITION p_20091130 VALUES LESS THAN (20091201) ENGINE = INNODB,
        PARTITION p_20091231 VALUES LESS THAN (20100101) ENGINE = INNODB,
        PARTITION p_20100131 VALUES LESS THAN (20100201) ENGINE = INNODB,
        PARTITION p_20100228 VALUES LESS THAN (20100301) ENGINE = INNODB,
        PARTITION p_20100331 VALUES LESS THAN (20100401) ENGINE = INNODB,
        PARTITION p_20100430 VALUES LESS THAN (20100501) ENGINE = INNODB,
        PARTITION p_20100531 VALUES LESS THAN (20100601) ENGINE = INNODB,
        PARTITION p_20100630 VALUES LESS THAN (20100701) ENGINE = INNODB,
        PARTITION p_20100731 VALUES LESS THAN (20100801) ENGINE = INNODB,
        PARTITION p_20100831 VALUES LESS THAN (20100901) ENGINE = INNODB,
        PARTITION p_20100930 VALUES LESS THAN (20101001) ENGINE = INNODB,
        PARTITION p_20101031 VALUES LESS THAN (20101101) ENGINE = INNODB,
        PARTITION p_20101130 VALUES LESS THAN (20101201) ENGINE = INNODB,
        PARTITION p_20101231 VALUES LESS THAN (20110101) ENGINE = INNODB)*/;

CREATE TRIGGER `kalturadw`.`dwh_fact_file_sync_setcreationtime_oninsert` BEFORE INSERT
    ON `kalturadw`.`dwh_fact_file_sync`
    FOR EACH ROW 
	SET new.dwh_creation_date = NOW();

