#!/bin/bash
sql="$(cat $1)"
echo -e "SET PAGESIZE 0\n SET FEEDBACK OFF\n $sql" | \
sqlplus -S -L "BDSQL/"Welcome1234567890#"@BDSQLUSR"
