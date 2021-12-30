#!/bin/bash

source ec2_ids.sh

commandstring="aws ec2 describe-instances --query Reservations[*].Instances[*].[State.Name,Tags[].Value] --output text"
# Wait for ec2 state to go from pending to running

get_status () {
	count=0
	command_=$(eval $1)
	for word in $command_
	do
	    (( count++ ))
	    if [ $count -eq 3 ] 
	    then
		status=$word
	    fi
	done
}


get_status "$commandstring"
echo $status
while [ "$status" != "stopped" ]
do
	# Wait
	sleep 1
	get_status "$commandstring"
	echo $status
done
