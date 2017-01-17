CREATE TABLE `borhandw`.`dwh_dim_media_info` (
  `media_info_id` int(11) NOT NULL,
  `created_at` datetime default NULL,
  `created_date_id` int(11),
  `created_hour_id` tinyint(4),
  `updated_at` datetime default NULL,
  `updated_date_id` int(11),
  `updated_hour_id` tinyint(4),
  `flavor_asset_id` varchar(20) default NULL,
  `file_size` int(11) NOT NULL,
  `container_format` varchar(6) default NULL,
  `container_id` varchar(127) default NULL,
  `container_profile` varchar(127) default NULL,
  `container_duration` int(11) default NULL,
  `container_bit_rate` int(11) default NULL,
  `video_format` varchar(6) default NULL,
  `video_codec_id` varchar(127) default NULL,
  `video_duration` int(11) default NULL,
  `video_bit_rate` int(11) default NULL,
  `video_bit_rate_mode` tinyint(4) default NULL,
  `video_width` int(11) NOT NULL,
  `video_height` int(11) NOT NULL,
  `video_frame_rate` int(11) default NULL,
  `video_dar` float default NULL,
  `audio_format` varchar(6) default NULL,
  `audio_codec_id` varchar(127) default NULL,
  `audio_duration` int(11) default NULL,
  `audio_bit_rate` int(11) default NULL,
  `audio_bit_rate_mode` tinyint(4) default NULL,
  `audio_channels` tinyint(4) default NULL,
  `audio_sampling_rate` int(11) default NULL,
  `audio_resolution` int(11) default NULL,
  `writing_lib` varchar(127) default NULL,
  `custom_data` text,
  `raw_data` varchar(1023) default NULL,
  PRIMARY KEY  (`media_info_id`),
  KEY `flavor_asset_id_index` (`flavor_asset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8