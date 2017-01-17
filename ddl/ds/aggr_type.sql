CREATE TABLE borhandw_ds.aggr_type (
	`aggr_name` varchar(20) NOT NULL,
    `aggr_order` int(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO borhandw_ds.aggr_type 
	(aggr_name,
	aggr_order)
VALUES
	('events', 1),
	('bandwidth' , 2),
	('plays' , 3);
