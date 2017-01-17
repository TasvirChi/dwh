insert into borhandw.temp_referrer_update (date_id, is_calculated)
select distinct aggr_day_int, 0 from borhandw.aggr_managment where aggr_day_int < DATE(now())*1;