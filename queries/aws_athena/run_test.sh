#!/bin/bash
for i in `ls|grep sql`; do ./run_athena_query.sh $i; done;
