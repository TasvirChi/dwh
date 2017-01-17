# add lines & err_lines to borhandw_ds.files
ALTER TABLE borhandw.`dwh_aggr_events_country` ADD `count_buf_start` INT DEFAULT NULL,ADD  `count_buf_end` INT DEFAULT NULL;
ALTER TABLE borhandw.`dwh_aggr_events_domain` ADD `count_buf_start` INT DEFAULT NULL,ADD  `count_buf_end` INT DEFAULT NULL;
ALTER TABLE borhandw.`dwh_aggr_events_entry` ADD `count_buf_start` INT DEFAULT NULL,ADD  `count_buf_end` INT DEFAULT NULL;
ALTER TABLE borhandw.`dwh_aggr_events_widget` ADD `count_buf_start` INT DEFAULT NULL,ADD  `count_buf_end` INT DEFAULT NULL;
ALTER TABLE borhandw.`dwh_aggr_partner` ADD `count_buf_start` INT DEFAULT NULL,ADD  `count_buf_end` INT DEFAULT NULL;


