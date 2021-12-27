#!/bin/bash

source ec2_ids.sh

cmdstring="aws ec2 describe-instances --query Reservations[*].Instances[*].[State.Name,Tags[].Value] --output text"
# Wait for ec2 state to go from pending to running
command_=$(eval $cmdstring)

echo Waiting for status to go from pending to running...

while (command_) == running (
	# Wait for ec2 state to go from pending to running
	command_=$(eval $cmdstring)
	# Wait
)

echo $main-ec2-id has successfully STARTED.

get_status () {
	declare -A output_map
	command_=$(eval $1)
	if [[ ! -z "$1" ]] ; then
		while IFS= read -r line; do 
			if output_map["$line"]!="Stock(RHEL8)"; do
				if output_map["$line"-1]!="pending"; do
					break
	done <<< "$1";	

}
