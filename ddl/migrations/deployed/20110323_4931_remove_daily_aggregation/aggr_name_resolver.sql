use borhandw_ds;
UPDATE borhandw_ds.aggr_name_resolver SET aggr_table = hourly_aggr_table;
alter table aggr_name_resolver drop column hourly_aggr_table;