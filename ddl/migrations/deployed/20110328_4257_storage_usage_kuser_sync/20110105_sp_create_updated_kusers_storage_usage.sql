DELIMITER $$

USE `borhandw_ds`$$

DROP PROCEDURE IF EXISTS `create_updated_kusers_storage_usage`$$

CREATE PROCEDURE `create_updated_kusers_storage_usage`(max_date DATE)
BEGIN
	TRUNCATE TABLE borhandw_ds.updated_kusers_storage_usage;
	
	UPDATE borhandw.aggr_managment SET start_time = NOW() WHERE is_calculated = 0 AND aggr_day < DATE(max_date) AND aggr_name = 'storage_usage_kuser_sync';
	
	INSERT INTO borhandw_ds.updated_kusers_storage_usage 
	SELECT u.kuser_id , SUM(s.entry_additional_size_kb) storage_kb FROM 
		(SELECT DISTINCT entry_id FROM borhandw.dwh_fact_entries_sizes s, borhandw.aggr_managment m
			WHERE s.entry_size_date_id = m.aggr_day_int
			AND m.aggr_name = 'storage_usage_kuser_sync'
			AND m.aggr_day < max_date 
			AND m.is_calculated = 0) updated_entries, 
		borhandw.dwh_fact_entries_sizes s, 
		borhandw.dwh_dim_entries u
	WHERE s.entry_id = u.entry_id 
	AND u.entry_id = updated_entries.entry_id
	GROUP BY u.kuser_id;
END$$
DELIMITER ;