USE borhandw;

TRUNCATE TABLE dwh_dim_ui_conf_swf_interfaces;
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

UPDATE borhandw.dwh_dim_ui_conf ui_conf LEFT OUTER JOIN borhandw.dwh_dim_ui_conf_swf_interfaces swf_interfaces
ON (SUBSTRING_INDEX(ui_conf.swf_url, '/', -1) = swf_interfaces.swf_file AND tags LIKE CONCAT('%',tags_search_string,'%'))
SET ui_conf.VERSION = SUBSTRING_INDEX(SUBSTRING_INDEX(swf_url, '/', -2),'/',1),
ui_conf.swf_interface_id = IFNULL(swf_interfaces.id, -1);
