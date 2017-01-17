DELIMITER $$

USE `borhandw`$$

DROP PROCEDURE IF EXISTS `populate_new_aggrs`$$

CREATE PROCEDURE `populate_new_aggrs`()
BEGIN
	DECLARE v_start_date_id INT;
	DECLARE v_end_date_id INT;
	DECLARE done INT DEFAULT 0;	
	DECLARE populate_new_aggr_cursor CURSOR FOR SELECT day_id start_date_id, LAST_DAY(DATE(day_id))*1 end_date_id FROM borhandw.dwh_dim_time WHERE day_of_month = 1;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	OPEN populate_new_aggr_cursor;
	
	read_loop: LOOP
		FETCH populate_new_aggr_cursor INTO v_start_date_id, v_end_date_id;
		IF done THEN
			LEAVE read_loop;
		END IF;
		
		INSERT INTO borhandw.dwh_hourly_events_country_innodb
		select * from borhandw.dwh_hourly_events_country
		WHERE date_id between v_start_date_id AND v_end_date_id;
		
		INSERT INTO borhandw.dwh_hourly_events_domain_innodb
                select * from borhandw.dwh_hourly_events_domain
                WHERE date_id between v_start_date_id AND v_end_date_id;

		INSERT INTO borhandw.dwh_hourly_events_domain_referrer_innodb
                select * from borhandw.dwh_hourly_events_domain_referrer
                WHERE date_id between v_start_date_id AND v_end_date_id;

		INSERT INTO borhandw.dwh_hourly_events_entry_innodb
                select * from borhandw.dwh_hourly_events_entry
                WHERE date_id between v_start_date_id AND v_end_date_id;

		INSERT INTO borhandw.dwh_hourly_events_uid_innodb
                select * from borhandw.dwh_hourly_events_uid
                WHERE date_id between v_start_date_id AND v_end_date_id;

		INSERT INTO borhandw.dwh_hourly_events_widget_innodb
                select * from borhandw.dwh_hourly_events_widget
                WHERE date_id between v_start_date_id AND v_end_date_id;

		INSERT INTO borhandw.dwh_hourly_partner_innodb
                select * from borhandw.dwh_hourly_partner
                WHERE date_id between v_start_date_id AND v_end_date_id;
	END LOOP;
	CLOSE populate_new_aggr_cursor;
	
	ALTER TABLE borhandw.dwh_hourly_events_country_innodb
	  	ADD PRIMARY KEY (`partner_id`,`date_id`,`hour_id`,`country_id`,`location_id`);

	ALTER TABLE borhandw.dwh_hourly_events_domain_innodb
		ADD PRIMARY KEY (`partner_id`,`date_id`,`hour_id`,`domain_id`);

	ALTER TABLE borhandw.dwh_hourly_events_domain_referrer_innodb
	  	ADD PRIMARY KEY (`partner_id`,`date_id`,`hour_id`,`domain_id`,`referrer_id`);

	ALTER TABLE borhandw.dwh_hourly_events_entry_innodb
	  	ADD PRIMARY KEY (`partner_id`,`date_id`,`hour_id`,`entry_id`),
		ADD KEY `entry_id` (`entry_id`);

	ALTER TABLE borhandw.dwh_hourly_events_uid_innodb
		ADD PRIMARY KEY (`partner_id`,`date_id`,`hour_id`,`kuser_id`);

	ALTER TABLE borhandw.dwh_hourly_events_widget_innodb
		ADD PRIMARY KEY (`partner_id`,`date_id`,`hour_id`,`widget_id`);

	ALTER TABLE borhandw.dwh_hourly_partner_innodb
  		ADD PRIMARY KEY (`partner_id`,`date_id`,`hour_id`);

	RENAME TABLE borhandw.dwh_hourly_events_country TO borhandw.dwh_hourly_events_country_myisam;
	RENAME TABLE borhandw.dwh_hourly_events_country_innodb TO borhandw.dwh_hourly_events_country;
	RENAME TABLE borhandw.dwh_hourly_events_domain TO borhandw.dwh_hourly_events_domain_myisam;
	RENAME TABLE borhandw.dwh_hourly_events_domain_innodb TO borhandw.dwh_hourly_events_domain;
	RENAME TABLE borhandw.dwh_hourly_events_domain_referrer TO borhandw.dwh_hourly_events_domain_referrer_myisam;
	RENAME TABLE borhandw.dwh_hourly_events_domain_referrer_innodb TO borhandw.dwh_hourly_events_domain_referrer;
	RENAME TABLE borhandw.dwh_hourly_events_entry TO borhandw.dwh_hourly_events_entry_myisam;
	RENAME TABLE borhandw.dwh_hourly_events_entry_innodb TO borhandw.dwh_hourly_events_entry;
	RENAME TABLE borhandw.dwh_hourly_events_uid TO borhandw.dwh_hourly_events_uid_myisam;
	RENAME TABLE borhandw.dwh_hourly_events_uid_innodb TO borhandw.dwh_hourly_events_uid;
	RENAME TABLE borhandw.dwh_hourly_events_widget TO borhandw.dwh_hourly_events_widget_myisam;
	RENAME TABLE borhandw.dwh_hourly_events_widget_innodb TO borhandw.dwh_hourly_events_widget;
	RENAME TABLE borhandw.dwh_hourly_partner TO borhandw.dwh_hourly_partner_myisam;
	RENAME TABLE borhandw.dwh_hourly_partner_innodb TO borhandw.dwh_hourly_partner;
    END$$

DELIMITER ;

CALL borhandw.populate_new_aggrs();
DROP PROCEDURE IF EXISTS borhandw.populate_new_aggrs;
