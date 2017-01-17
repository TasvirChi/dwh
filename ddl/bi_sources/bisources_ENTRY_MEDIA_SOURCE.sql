DROP TABLE IF EXISTS `borhandw_bisources`.`bisources_entry_media_source`;

CREATE TABLE `borhandw_bisources`.`bisources_entry_media_source` (
  `entry_media_source_id` SMALLINT NOT NULL ,
  `entry_media_source_name` VARCHAR(25) DEFAULT 'missing value',

  PRIMARY KEY (`entry_media_source_id`)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;

INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(-1,'UNKNOWN');
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(0,'OTHER');	
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(1,'FILE'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(2,'WEBCAM'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(3,'FLICKR'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(4,'YOUTUBE'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(5,'URL'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(6,'TEXT'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(7,'MYSPACE'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(8,'PHOTOBUCKET'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(9,'JAMENDO'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(10,'CCMIXTER'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(11,'NYPL'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(12,'CURRENT'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(13,'COMMONS'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(20,'BORHAN'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(21,'BORHAN_USER_CLIPS'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(22,'ARCHIVE_ORG'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(23,'BORHAN_PARTNER'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(24,'METACAFE'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(25,'BORHAN_QA'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(26,'BORHAN_KSHOW'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(27,'BORHAN_PARTNER_KSHOW'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(28,'SEARCH_PROXY'); 
INSERT INTO borhandw_bisources.bisources_entry_media_source (ENTRY_MEDIA_SOURCE_id,ENTRY_MEDIA_SOURCE_name) VALUES(29,'AKAMAI_LIVE'); 
