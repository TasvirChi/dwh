# add lines & err_lines to borhandw_ds.files
ALTER TABLE borhandw_ds.files ADD 	`lines` INT DEFAULT NULL,ADD  `err_lines` INT DEFAULT NULL;
ALTER TABLE borhandw_ds.files ADD 	`file_size` INT DEFAULT NULL;


