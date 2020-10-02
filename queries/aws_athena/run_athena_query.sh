#!/bin/bash
export ATHENA_SQL=`cat $1`
export QUERY_ID=`aws athena start-query-execution  --query-string "$ATHENA_SQL" --result-configuration OutputLocation=s3://test-crawler123 --query-execution-context Database=tpcds-csv |jq .QueryExecutionId -r`
export STATE=`aws athena get-query-execution --query-execution-id $QUERY_ID|jq .QueryExecution.Status.State -r`
#echo $STATE
#while [ $STATE != "SUCCEEDED" ]
#do
#echo $STATE
#sleep 1 
#export STATE=`aws athena get-query-execution --query-execution-id $QUERY_ID|jq .QueryExecution.Status.State -r`
#done
