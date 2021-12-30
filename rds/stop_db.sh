#!/bin/bash

source rds_ids.bat

aws rds stop-db-instance --db-instance-identifier %rds-id% --output table

