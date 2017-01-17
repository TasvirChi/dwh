ALTER TABLE borhandw_ds.fms_stale_sessions ADD bandwidth_source_id INT(11) NOT NULL DEFAULT 5;
ALTER TABLE borhandw_ds.fms_stale_sessions CHANGE bandwidth_source_id bandwidth_source_id INT(11) NOT NULL;
