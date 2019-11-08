#!/bin/bash
nohup time spark2-shell -i spark-sql-tpcds-short.scala --properties-file ./spark-defaults_v2.conf &
#nohup time spark2-shell -i spark-sql-tpcds-full.scala --properties-file ./spark-defaults_v2.conf &
