#!/bin/bash
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql_dba.sh /home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/create_bdsuser.sql 
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql.sh /home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/drop_tables.sql 
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql.sh /home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/create_os_cred.sql 
/home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/run_sql.sh /home/oracle/Spark-SQL-test/SQL_DataLake/CloudSQL/create_tables.sql 

