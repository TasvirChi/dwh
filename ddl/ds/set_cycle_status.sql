DELIMITER $$

USE `borhandw_ds`$$

DROP PROCEDURE IF EXISTS `set_cycle_status`$$

CREATE PROCEDURE `set_cycle_status`(
	p_cycle_id INT(20),
	new_cycle_status VARCHAR(20)
    )
BEGIN
	UPDATE borhandw_ds.cycles c
	SET c.prev_status = c.status
	    ,c.status = new_cycle_status
	WHERE c.cycle_id = p_cycle_id;
	
	IF new_cycle_status = 'RUNNING'
	THEN 
		UPDATE borhandw_ds.cycles c
		SET c.run_time = NOW()
		WHERE c.cycle_id = p_cycle_id;
	ELSEIF new_cycle_status = 'TRANSFERING'
	THEN 
		UPDATE borhandw_ds.cycles c
		SET c.transfer_time = NOW()
		WHERE c.cycle_id = p_cycle_id;
	END IF;
    END$$

DELIMITER ;