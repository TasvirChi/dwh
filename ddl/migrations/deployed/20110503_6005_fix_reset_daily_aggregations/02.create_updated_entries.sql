DELIMITER $$

USE `borhandw_ds`$$

DROP PROCEDURE IF EXISTS `create_updated_entries`$$

CREATE PROCEDURE `create_updated_entries`(max_date DATE)
BEGIN
	TRUNCATE TABLE borhandw_ds.updated_entries;
	
	UPDATE borhandw.aggr_managment SET start_time = NOW() WHERE is_calculated = 0 AND aggr_day < max_date AND aggr_name = 'plays_views';
	
	INSERT INTO borhandw_ds.updated_entries SELECT entries.entry_id, SUM(count_loads)+IFNULL(old_entries.views,0) views, SUM(count_plays)+IFNULL(old_entries.plays,0) plays FROM 
	(SELECT DISTINCT entry_id 
		FROM borhandw.dwh_hourly_events_entry e
		INNER JOIN (SELECT DISTINCT aggr_day_int FROM borhandw.aggr_managment WHERE is_calculated = 0 AND aggr_day < max_date AND aggr_name = 'plays_views') aggr_managment
		ON (e.date_id = aggr_managment.aggr_day_int)) entries
	INNER JOIN
	borhandw.dwh_hourly_events_entry
	ON (dwh_hourly_events_entry.entry_id = entries.entry_id)
	LEFT OUTER JOIN
	borhandw.entry_plays_views_before_08_2009 AS old_entries
	ON (entries.entry_id = old_entries.entry_id)
	GROUP BY entries.entry_id;
    END$$

DELIMITER ;
