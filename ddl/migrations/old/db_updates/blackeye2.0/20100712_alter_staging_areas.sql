alter table `borhandw_ds`.`staging_areas` 
   add column `aggr_date_field` varchar(45) NULL after `post_transfer_sp`;
   
UPDATE borhandw_ds.staging_areas SET aggr_date_field = 'event_date_id' WHERE id = 1;