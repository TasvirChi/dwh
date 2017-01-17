﻿insert into borhandw_ds.processes (id,process_name, max_files_per_cycle) values (1,'events', 20);
INSERT INTO borhandw_ds.processes(id, process_name, max_files_per_cycle) VALUES (3, 'akamai_events',20);

insert into borhandw_ds.staging_areas (id,process_id,source_table,target_table_id,on_duplicate_clause,staging_partition_field,aggr_date_field,hour_id_field, post_transfer_aggregations) values
(1,1,'ds_events',1,'ON DUPLICATE KEY UPDATE borhandw.dwh_fact_events.file_id = borhandw.dwh_fact_events.file_id','cycle_id','event_date_id', 'event_hour_id','(\'country\',\'domain\',\'entry\',\'partner\',\'uid\',\'widget\',\'domain_referrer\',\'devices\',\'users\',\'context\',\'app_devices\',\'live_entry\')');

INSERT INTO borhandw_ds.staging_areas (id, process_id, source_table, target_table_id, on_duplicate_clause, staging_partition_field, post_transfer_sp, aggr_date_field, hour_id_field, post_transfer_aggregations)
VALUES (3, 3, 'ds_events', 1, NULL, 'cycle_id', NULL, 'event_date_id', 'event_hour_id', '(\'country\',\'domain\',\'entry\',\'partner\',\'uid\',\'widget\',\'domain_referrer\',\'devices\',\'users\',\'context\',\'app_devices\')');



