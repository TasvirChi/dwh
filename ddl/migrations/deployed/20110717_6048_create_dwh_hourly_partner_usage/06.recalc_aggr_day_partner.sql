DELIMITER $$

USE `borhandw`$$

DROP PROCEDURE IF EXISTS `recalc_aggr_day_partner`$$

CREATE PROCEDURE `recalc_aggr_day_partner`(p_date_id DATE)
BEGIN
	UPDATE aggr_managment SET is_calculated = 0 
	WHERE aggr_name = 'partner_usage' AND aggr_day_int = DATE(p_date_id)*1;
	
	DELETE FROM borhandw.dwh_hourly_partner_usage
	WHERE date_id = DATE(p_date_id)*1;
	
	CALL calc_aggr_day_partner(p_date_id);
    END$$

DELIMITER ;
