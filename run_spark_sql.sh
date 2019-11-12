#!/bin/bash
export AWS_ACCESS_KEY_ID=a41054a9260d40f63a514d5a4f7f269c7caffee5
export AWS_SECRET_ACCESS_KEY=eu8RhfWF9YV8BnQjlWaA9tAw14RQ/mv8QUeQNrDK2rM=
nohup time spark-shell -i spark-sql-tpcds-short.scala  --master yarn &
#nohup time spark2-shell -i spark-sql-tpcds-short.scala --properties-file ./spark-defaults_v2.conf &
#nohup time spark2-shell -i spark-sql-tpcds-full.scala --properties-file ./spark-defaults_v2.conf &
