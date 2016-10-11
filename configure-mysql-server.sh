#!/bin/bash

PATH=$1

cd $PATH;
for f in *.sql
do
    mysql -user=FoodLineTestUser --password='foodline123!@#' -h localhost FoodLineDB < f
done
