# update index on borhandw.dwh_dim_entries
ALTER TABLE borhandw.dwh_dim_entries ADD KEY `entry_id_media_type` (entry_id,entry_media_type_id);

# add field on borhandw.dwh_fact_events
ALTER TABLE borhandw.dwh_fact_events ADD COLUMN entry_media_type_id INT after referrer;

# add field on borhandw_ds.DS_Events
ALTER TABLE borhandw_ds.DS_Events ADD COLUMN entry_media_type_id INT after referrer;

#update procedure transfer_file_partition 
DELIMITER $$

DROP PROCEDURE IF EXISTS `borhandw_ds`.`transfer_file_partition`$$

CREATE PROCEDURE `borhandw_ds`.`transfer_file_partition`(
	partition_number VARCHAR(10)
    )
BEGIN
	SET @s = CONCAT('insert into borhandw.dwh_fact_events
			 select file_id,event_id,event_type_id,client_version,
			 event_time, event_date_id, event_hour_id, session_id, partner_id, entry_id,
			 unique_viewer, widget_id, ui_conf_id, uid, current_point, duration, user_ip,user_ip_number,country_id,location_id,
			 process_duration, control_id, seek, new_point, domain_id, referrer , entry_media_type_id from borhandw_ds.ds_events 
			 where file_id = ',partition_number,' 
			 ON DUPLICATE KEY UPDATE 
			 borhandw.dwh_fact_events.file_id = borhandw.dwh_fact_events.file_id' ); 
	PREPARE stmt FROM  @s;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
    END$$

DELIMITER ;
