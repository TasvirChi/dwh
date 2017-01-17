DROP TABLE IF EXISTS `borhandw_bisources`.`bisources_ui_conf_type`;

CREATE TABLE `borhandw_bisources`.`bisources_ui_conf_type` (
  `ui_conf_type_id` SMALLINT NOT NULL ,
  `ui_conf_type_name` VARCHAR(50) DEFAULT 'missing value',

  PRIMARY KEY (`ui_conf_type_id`)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;


INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(0, 'GENERIC');	
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(1,'BDP'); 
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(2,'CW'); 
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(3,'EDITOR'); 
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(4,'ADVANCED_EDITOR'); 
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(5,'PLAYLIST'); 
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(6,'APP_STUDIO'); 
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(7, 'KRecord');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(8, 'BDP3'); 
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(9, 'BMC_ACCOUNT');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(10, 'BMC_ANALYTICS');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(11, 'BMC_CONTENT');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(12, 'BMC_DASHBOARD');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(14, 'Silverlight player');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(15, 'CLIENTSIDE_ENCODER');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(16, 'BMC_GENERAL');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(17, 'BMC_ROLES_AND_PERMISSIONS');
INSERT INTO borhandw_bisources.bisources_ui_conf_type (ui_conf_type_id,ui_conf_type_name) VALUES(18, 'Clipper');