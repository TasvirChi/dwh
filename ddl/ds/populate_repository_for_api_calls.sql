INSERT INTO borhandw_ds.processes(id, process_name, max_files_per_cycle) VALUES (8, 'api_calls',20);
INSERT INTO borhandw_ds.staging_areas (id, process_id, source_table, target_table_id, on_duplicate_clause, staging_partition_field, post_transfer_sp, aggr_date_field, hour_id_field, post_transfer_aggregations, ignore_duplicates_on_transfer)
VALUES  (9, 8, 'ds_api_calls', 4, NULL, 'cycle_id', NULL, 'api_call_date_id', 'api_call_hour_id', '(\'api_calls\')', 1), 
        (10, 8, 'ds_incomplete_api_calls', 5, NULL, 'cycle_id', 'unify_incomplete_api_calls', 'api_call_date_id', 'api_call_hour_id', '', 1),
	(11, 8, 'ds_errors', 6, NULL, 'cycle_id', NULL, 'error_date_id', 'error_hour_id', '(\'errors\')', 1);
