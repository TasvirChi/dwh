DELIMITER $$

DROP FUNCTION IF EXISTS `borhandw_ds`.`get_ip_country_location`$$

CREATE  FUNCTION borhandw_ds.`get_ip_country_location`(ip BIGINT) RETURNS VARCHAR(30)
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE res VARCHAR(30);
	SELECT CONCAT(country_id,",",location_id)
	INTO res
	FROM borhandw.dwh_dim_ip_ranges
	WHERE ip_from = (
	SELECT MAX(ip_from) 
	FROM borhandw.dwh_dim_ip_ranges
	WHERE ip >= ip_from
	) ;
	RETURN res;
    END$$

DELIMITER ;