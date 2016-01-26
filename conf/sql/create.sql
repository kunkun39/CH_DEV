SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `name` varchar(120) default NULL,
  `contactway` varchar(255) default '',
  `username` varchar(48) default '',
  `password` varchar(48) default '',
  `enabled` tinyint(1) default '0' COMMENT '1 for YES or 0 for NO',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `system_user` ADD INDEX  system_user_index_name(`name`);

DROP TABLE IF EXISTS `client_user`;
CREATE TABLE `client_user` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `username` varchar(48) default '',
  `password` varchar(48) default '',
  `contact_person` varchar(120) default NULL,
  `contact_way` varchar(255) default '',
  `active` tinyint(1) default '0' COMMENT '1 for YES or 0 for NO',
  `enabled` tinyint(1) default '0' COMMENT '1 for YES or 0 for NO',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `client_user` ADD INDEX  client_user_index_name(`username`);
ALTER TABLE `client_user` ADD INDEX  client_user_index_active(`active`);

DROP TABLE IF EXISTS `register_confirm`;
CREATE TABLE `register_confirm` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP,
  `validate_number` varchar(12) default '',
  `validate_confirm` tinyint(1) default '0' COMMENT '1 for YES or 0 for NO',
  `username` varchar(48) default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `app_category`;
CREATE TABLE `app_category` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `category_name` varchar(120) default '',
  `parent_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (`parent_id`) REFERENCES app_category (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `app_icon`;
CREATE TABLE `app_icon` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `upload_filename` varchar(100) default '',
  `actual_filename` varchar(20) default '',
  `actual_filepath` varchar(20) default '',
  `upload_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `app_file`;
CREATE TABLE `app_file` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `upload_filename` varchar(100) default '',
  `actual_filename` varchar(20) default '',
  `actual_filepath` varchar(20) default '',
  `upload_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `app_poster`;
CREATE TABLE `app_poster` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `upload_filename` varchar(100) default '',
  `actual_filename` varchar(20) default '',
  `actual_filepath` varchar(20) default '',
  `upload_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `market_app`;
CREATE TABLE `market_app` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `createtime` datetime default NULL,
  `app_key` varchar(10) default '',
  `app_name` varchar(120) default '',
  `app_description` text,
  `app_version_int` int(11) default 1,
  `app_version` varchar(48) default '',
  `app_package` varchar(120) default '',
  `app_size` varchar(48) default '',
  `app_status` varchar(10) default 'CREATED',
  `app_category_id` int(11) default NULL,
  `app_icon_id` int(11) default NULL,
  `app_file_id` int(11) default NULL,
  `app_poster_id` int(11) default NULL,
  `owner_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (`app_category_id`) REFERENCES app_category (`id`),
  FOREIGN KEY (`app_icon_id`) REFERENCES app_icon (`id`),
  FOREIGN KEY (`app_file_id`) REFERENCES app_file (`id`),
  FOREIGN KEY (`app_poster_id`) REFERENCES app_poster (`id`),
  FOREIGN KEY (`owner_id`) REFERENCES client_user (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
ALTER TABLE `market_app` ADD INDEX market_app_index_name(`app_name`);
ALTER TABLE `market_app` ADD INDEX market_app_index_status(`app_status`);

DROP TABLE IF EXISTS `app_change_history`;
CREATE TABLE `app_change_history` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` timestamp default CURRENT_TIMESTAMP,
  `change_title` varchar (255) default NULL,
  `change_details` text default null,
  `app_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (`app_id`) REFERENCES market_app (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS=1;
