TRUNCATE TABLE borhandw.dwh_dim_domain_referrer;
INSERT IGNORE INTO borhandw.dwh_dim_domain_referrer (referrer_id, domain_id, referrer, dwh_insertion_time)
SELECT r.referrer_id, d.domain_id, SUBSTR(r.referrer, INSTR(r.referrer, d.domain_name) +LENGTH(d.domain_name) + 1) referrer, r.dwh_insertion_time FROM borhandw.dwh_dim_referrer r, borhandw.tmp_domain_referrer dr, borhandw.dwh_dim_domain d
WHERE r.referrer_id = dr.referrer_id AND dr.domain_id = d.domain_id;
