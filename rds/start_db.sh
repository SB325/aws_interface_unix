#!/bin/bash

source rds_ids.sh

aws rds start-db-instance --db-instance-identifier %rds-id% --output table

