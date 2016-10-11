#!/bin/bash

PATH=$1
/usr/bin/mysqld_safe &
sleep 5

cd $PATH;
for f in *.sql
do
    mysql -user=FoodLineTestUser --password='foodline123!@#' -h localhost FoodLineDB < $f
done
