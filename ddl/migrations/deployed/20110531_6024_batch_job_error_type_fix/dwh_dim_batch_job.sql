ALTER TABLE borhandw.dwh_dim_batch_job_error_type change ri_ind ri_ind tinyint(11) default 0;
update borhandw.dwh_dim_batch_job_error_type set ri_ind = 0;
