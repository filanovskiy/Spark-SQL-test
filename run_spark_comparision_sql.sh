#!/bin/bash
#nohup spark2-shell -i spark-sql-tpcds.scala.short --properties-file /root/fil/spark-sql/spark-defaults_v2.conf &
#sleep 5400
nohup spark2-shell -i spark-sql-tpcds.scala.short --properties-file /root/fil/spark-sql/spark-defaults_v1.conf & 
