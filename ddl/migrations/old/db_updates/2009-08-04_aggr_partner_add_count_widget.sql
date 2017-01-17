# add field on borhandw.dwh_aggr_partner
ALTER TABLE borhandw.dwh_aggr_partner ADD COLUMN count_storage BIGINT after count_bandwidth;
ALTER TABLE borhandw.dwh_aggr_partner ADD COLUMN count_users INT after count_storage;
ALTER TABLE borhandw.dwh_aggr_partner ADD COLUMN count_widgets INT after count_users;
ALTER TABLE borhandw.dwh_aggr_partner ADD COLUMN count_media INT after count_report;

