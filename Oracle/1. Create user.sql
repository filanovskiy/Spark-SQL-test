drop user PARQ_USER cascade;
create user PARQ_USER;
ALTER USER PARQ_USER IDENTIFIED BY Welcome12345 ACCOUNT UNLOCK;
GRANT CREATE SESSION TO PARQ_USER;
GRANT DWROLE to PARQ_USER;
GRANT UNLIMITED TABLESPACE TO PARQ_USER;
BEGIN
   ORDS_ADMIN.ENABLE_SCHEMA(
     p_enabled => TRUE,
     p_schema => 'PARQ_USER',
     p_url_mapping_type => 'BASE_PATH',
     p_url_mapping_pattern => 'PARQ_USER',
     p_auto_rest_auth => TRUE
   );
   COMMIT;
END;
/

drop user PARQ_USER_EXT;
create user PARQ_USER_EXT;
ALTER USER PARQ_USER_EXT IDENTIFIED BY Welcome123456 ACCOUNT UNLOCK;
GRANT CREATE SESSION TO PARQ_USER_EXT;
GRANT DWROLE to PARQ_USER_EXT;
GRANT UNLIMITED TABLESPACE TO PARQ_USER_EXT;
BEGIN
   ORDS_ADMIN.ENABLE_SCHEMA(
     p_enabled => TRUE,
     p_schema => 'PARQ_USER_EXT',
     p_url_mapping_type => 'BASE_PATH',
     p_url_mapping_pattern => 'PARQ_USER_EXT',
     p_auto_rest_auth => TRUE
   );
   COMMIT;
END;
/
	