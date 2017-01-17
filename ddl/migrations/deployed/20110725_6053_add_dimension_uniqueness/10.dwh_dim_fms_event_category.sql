/*
SELECT d.* FROM borhandw.dwh_dim_fms_event_category d, 
		(SELECT event_category, COUNT(*) FROM borhandw.dwh_dim_fms_event_category
			GROUP BY event_category
			HAVING COUNT(*) > 1) dup
WHERE d.event_category = dup.event_category;

DELETE FROM dwh_dim_fms_event_category WHERE 0=1;
*/

ALTER TABLE borhandw.dwh_dim_fms_event_category ADD UNIQUE KEY (event_category);
