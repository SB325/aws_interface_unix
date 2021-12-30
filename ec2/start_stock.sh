#!/bin/bash

source ec2_ids.sh

aws ec2 start-instances --instance-ids $stock_ec2_id --output table

source while_pending.sh
