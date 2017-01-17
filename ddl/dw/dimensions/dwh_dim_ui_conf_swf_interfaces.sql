USE borhandw;

DROP TABLE IF EXISTS borhandw.dwh_dim_ui_conf_swf_interfaces;
CREATE TABLE borhandw.dwh_dim_ui_conf_swf_interfaces (
	id INT NOT NULL AUTO_INCREMENT,
	swf_file varchar(255) NOT NULL,
	tags_search_string varchar(255) NOT NULL DEFAULT '',
	display_name varchar(255),
	PRIMARY KEY (id),
	UNIQUE KEY (swf_file,tags_search_string)) ENGINE=MYISAM CHARSET=latin1;

INSERT INTO dwh_dim_ui_conf_swf_interfaces (id, swf_file, tags_search_string, display_name) VALUES (-1,'','','Unknown');

INSERT INTO dwh_dim_ui_conf_swf_interfaces (swf_file, tags_search_string, display_name)
VALUES ('ContributionWizard.swf', '', 'BCW (Borhan Contribution Wizard)'),
 ('KUpload.swf', '', 'KSU (Borhan Simple Uploader)'),
 ('KRecord.swf', '', 'KRecord (Webcam recorder)'),
 ('simpleeditor.swf', '', 'KSE (Borhan Simple Editor)'),
 ('BorhanAdvancedVideoEditor.swf', '', 'BAE (Borhan Advanced Editor)'),
 ('KClip.swf', '', 'Clipping tool'),
 ('bdp.swf', 'Playlist', 'BDP – single video player'),
 ('bdp.swf', 'Player', 'BDP – playlist player'),
 ('bdp3.swf', 'Playlist', 'BDP3 – single video player'),
 ('bdp3.swf', 'Player', 'BDP3 – playlist player');
