DELIMITER $$

DROP PROCEDURE IF EXISTS `borhandw_ds`.`restore_file_status`$$

CREATE PROCEDURE borhandw_ds.`restore_file_status`(
	pfile_id INT(20)
    )
BEGIN
	UPDATE borhandw_ds.files f
	SET f.file_status = f.prev_status,
	    f.prev_status = f.file_status
	WHERE f.file_id = pfile_id;
    END$$

DELIMITER ;