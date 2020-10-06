#!/bin/bash
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql_dba.sh create_bdsuser.sql 
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql.sh drop_tables.sql 
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql.sh create_os_cred.sql 
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql.sh create_tables.sql 

