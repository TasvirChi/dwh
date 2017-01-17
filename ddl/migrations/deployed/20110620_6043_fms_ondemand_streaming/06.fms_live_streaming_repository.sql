UPDATE borhandw_ds.staging_areas 
SET on_duplicate_clause = NULL
WHERE process_id = 2;

UPDATE borhandw_ds.processes SET process_name = 'fms_live_streaming' WHERE id = 2;
