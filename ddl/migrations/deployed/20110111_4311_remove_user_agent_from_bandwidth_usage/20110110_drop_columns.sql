ALTER TABLE borhandw_ds.ds_bandwidth_usage DROP COLUMN user_agent_id; 
ALTER TABLE borhandw.dwh_fact_bandwidth_usage DROP COLUMN user_agent_id;
TRUNCATE TABLE borhandw.dwh_dim_user_agent;