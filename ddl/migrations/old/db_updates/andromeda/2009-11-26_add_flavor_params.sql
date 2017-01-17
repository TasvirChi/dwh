CREATE TABLE `borhandw`.`dwh_dim_flavor_params` (
  `flavor_params_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL default '',
  `tags` text,
  `description` varchar(1024) NOT NULL default '',
  `ready_behavior` tinyint(4) NOT NULL,
  `created_at` datetime default NULL,
  `created_date_id` int(11),
  `created_hour_id` tinyint(4),
  `updated_at` datetime default NULL,
  `updated_date_id` int(11),
  `updated_hour_id` tinyint(4),
  `deleted_at` datetime default NULL,
  `deleted_date_id` int(11),
  `deleted_hour_id` tinyint(4),
  `is_default` tinyint(4) NOT NULL default '0',
  `format` varchar(20) NOT NULL,
  `video_codec` varchar(20) NOT NULL,
  `video_bitrate` int(11) NOT NULL default '0',
  `audio_codec` varchar(20) NOT NULL,
  `audio_bitrate` int(11) NOT NULL default '0',
  `audio_channels` tinyint(4) NOT NULL default '0',
  `audio_sample_rate` int(11) default '0',
  `audio_resolution` int(11) default '0',
  `width` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '0',
  `frame_rate` int(11) NOT NULL default '0',
  `gop_size` int(11) NOT NULL default '0',
  `two_pass` tinyint default '0',
  `conversion_engines` varchar(1024) default NULL,
  `conversion_engines_extra_params` varchar(1024) default NULL,
  `custom_data` text,
  PRIMARY KEY  (`flavor_params_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8