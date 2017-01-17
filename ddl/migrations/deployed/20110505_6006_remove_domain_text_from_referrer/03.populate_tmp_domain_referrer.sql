TRUNCATE TABLE borhandw.tmp_domain_referrer;
insert into borhandw.tmp_domain_referrer (referrer_id, domain_id)
select referrer_id, max(domain_id) domain_id from borhandw.dwh_hourly_events_domain_referrer
group by referrer_id
