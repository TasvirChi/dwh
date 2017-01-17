create table borhandw.ri_defaults_partner_activity_20110607 as select * FROM borhandw.ri_defaults WHERE table_name IN ('Dwh_Dim_partner_sub_activity','Dwh_Dim_partner_activity');
create table borhandw.ri_mapping_partner_activity_20110607 as select * FROM borhandw.ri_mapping WHERE table_name = 'dwh_fact_Partner_Activities';
create table borhandw.bisources_tables_20110607 as select * FROM borhandw.bisources_tables where table_name in ('partner_sub_activity', 'partner_activity');
DELETE FROM borhandw.ri_defaults WHERE table_name IN ('Dwh_Dim_partner_sub_activity','Dwh_Dim_partner_activity');
DELETE FROM borhandw.ri_mapping WHERE table_name = 'dwh_fact_Partner_Activities';
DELETE from borhandw.bisources_tables where table_name in ('partner_sub_activity', 'partner_activity');
