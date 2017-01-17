INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name)
VALUES (8, 'BDP3'), (14, 'Silverlight player'), (15, 'CLIENTSIDE_ENCODER'), (0, 'GENERIC'), 
(7, 'KRecord'), (11, 'BMC_CONTENT'), (12, 'BMC_DASHBOARD'), (9, 'BMC_ACCOUNT'), (10, 'BMC_ANALYTICS'), (17, 'BMC_ROLES_AND_PERMISSIONS'), (16, 'BMC_GENERAL'), (18, 'Clipper');
	
UPDATE borhandw_bisources.bisources_ui_conf_type 
SET ui_conf_type_name = 'BDP'
WHERE ui_conf_type_id = 1;
