#!/bin/bash
./run_sql_dba.sh create_bdsuser.sql 
./run_sql.sh create_os_cred.sql 
./run_sql.sh create_tables.sql 

