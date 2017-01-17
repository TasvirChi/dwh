RENAME TABLE borhandw.dwh_dim_api_error_codes TO borhandw.dwh_dim_error_codes;

ALTER TABLE borhandw.dwh_dim_error_codes
        CHANGE api_error_code_id error_code_id INT(11) AUTO_INCREMENT,
        CHANGE api_error_code_name error_code_name VARCHAR(165) NOT NULL,
        ADD sub_error_code_name VARCHAR(165) NOT NULL DEFAULT 'unknown' AFTER error_code_name,
        DROP KEY api_error_code_name,
        ADD UNIQUE KEY (error_code_name, sub_error_code_name);

DROP TRIGGER IF EXISTS `borhandw`.`dwh_dim_api_error_code_setcreationtime_oninsert`;

CREATE TRIGGER `borhandw`.`dwh_dim_error_code_setcreationtime_oninsert` BEFORE INSERT
    ON `borhandw`.`dwh_dim_error_codes`
    FOR EACH ROW
        SET new.dwh_creation_date = NOW();
