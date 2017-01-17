ALTER TABLE borhandw_ds.LOCKS CHANGE lock_id lock_id INT(11) AUTO_INCREMENT;
DELETE FROM borhandw_ds.locks where lock_name = 'hourly_lock';
