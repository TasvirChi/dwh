SELECT CONCAT('update borhandw_bisources.bisources_',table_name,' set ',table_name,'_name = upper(',table_name,'_name);')
FROM borhandw.bisources_tables