#!/bin/bash
PATH=$1
/usr/bin/mysqld_safe &
sleep 5
for f in $PATH/*.sql
do
    mysql -user=FoodLineTestUser --password='foodline123!@#' -h localhost FoodLineDB < $f
done
