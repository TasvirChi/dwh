
# add field on borhandw.dwh_fact_events
ALTER TABLE borhandw.dwh_fact_events MODIFY entry_id VARCHAR(20);

# add field on borhandw_ds.DS_Events
ALTER TABLE borhandw_ds.DS_Events MODIFY entry_id VARCHAR(20);

# add field on borhandw_ds.dwh_aggr_events_entry
ALTER TABLE borhandw.dwh_aggr_events_entry MODIFY entry_id VARCHAR(20);

# fix entries
ALTER TABLE borhandw.dwh_dim_entries MODIFY entry_id VARCHAR(20), MODIFY kshow_id VARCHAR(20);

# fix widgets
ALTER TABLE borhandw.dwh_dim_widget MODIFY entry_id VARCHAR(20), MODIFY kshow_id VARCHAR(20);




