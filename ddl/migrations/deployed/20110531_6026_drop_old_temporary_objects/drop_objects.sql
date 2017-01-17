DROP TABLE borhandw.dwh_fact_bandwidth_usage_old;
DROP TABLE borhandw.dwh_fact_fms_session_events_old;
DROP TABLE borhandw.dwh_fact_fms_sessions_old;
DROP PROCEDURE IF EXISTS borhandw.populate_new_bandwidth_fact;
DROP PROCEDURE IF EXISTS borhandw.populate_new_fms_facts;
DROP PROCEDURE IF EXISTS borhandw.populate_new_facts;
DROP PROCEDURE IF EXISTS borhandw_ds.update_referrers;
