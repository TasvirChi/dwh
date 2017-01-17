/*
SQLyog Community v8.7 
MySQL - 5.1.37-log 
*********************************************************************
*/

use borhandw;

drop table if exists `dwh_dim_flavor_asset`;

create table `dwh_dim_flavor_asset` (
	`id` varchar (60) NOT NULL DEFAULT '',
	`int_id` int (11),
	`partner_id` int (11),
	`created_at` datetime ,
	`updated_at` datetime ,
	`deleted_at` datetime ,
	`entry_id` varchar (60),
	`flavor_params_id` int (11),
	`status` tinyint (4),
	`version` varchar (60) NOT NULL,
	`description` varchar (765),
	`width` int (11),
	`height` int (11),
	`bitrate` int (11),
	`frame_rate` float ,
	`size` int (11),
	`is_original` int (11),
	`file_ext_id` int (11),
	`container_format_id` int(11),
	`video_codec_id` int (11),
	`dwh_creation_date` TIMESTAMP  NOT NULL DEFAULT '0000-00-00 00:00:00',
	`dwh_update_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`ri_ind` TINYINT(4)  NOT NULL DEFAULT 0 ,
	PRIMARY KEY (`id`) ,
	KEY deleted_at (deleted_at),
	KEY dwh_update_date (dwh_update_date),
	KEY updated_at (updated_at)
) ENGINE=MYISAM; 
