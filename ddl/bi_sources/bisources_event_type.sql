DROP TABLE IF EXISTS `borhandw_bisources`.`bisources_event_type`;

CREATE TABLE `borhandw_bisources`.`bisources_event_type` (
  `event_type_id` SMALLINT NOT NULL ,
  `event_type_name` VARCHAR(50) DEFAULT 'missing value',
  PRIMARY KEY (`event_type_id`)
) ENGINE=MYISAM  DEFAULT CHARSET=utf8;



INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(1,'Widget Loaded'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(2,'Media Loaded (view)'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(3,'Play'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(4,'Play reached 25%'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(5,'Play reached 50%'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(6,'Play reached 75%'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(7,'Play reached 100%'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(8,'Open Edit'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(9,'Open Viral'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(10,'Open Download'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(11,'Open Report'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(12,'Buffer Start'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(13,'Buffer End'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(14,'Open Full Screen'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(15,'Close Full Screen'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(16,'Replay'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(17,'Seek'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(18,'Open Upload'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(19,'Save & Publish'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(20,'Close Edtior'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(21,'Pre Bumper Played');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(22,'Post Bumper Played');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(23,'Bumper Clicked');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(24,'Preroll Started'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(25,'Midroll Started'); 
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(26,'Postroll Started');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(27,'Overlay Started');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(28,'Preroll Clicked');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(29,'Midroll Clicked');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(30,'Postroll Clicked');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(31,'Overlay Clicked');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(32,'Preroll 25');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(33,'Preroll 50');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(34,'Preroll 75');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(35,'Midroll 25');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(36,'Midroll 50');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(37,'Midroll 75');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(38,'Postroll 25');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(39,'Postroll 50');
INSERT INTO borhandw_bisources.bisources_event_type (event_type_id,event_type_name) VALUES(40,'Postroll 75');