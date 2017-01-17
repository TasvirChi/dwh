UPDATE borhandw.aggr_managment SET aggr_name = 'bandwidth_usage' where aggr_name = 'partner_usage';
UPDATE borhandw_ds.staging_areas SET post_transfer_aggregations = '(\'bandwidth_usage\')' where post_transfer_aggregations = '(\'partner_usage\')';
