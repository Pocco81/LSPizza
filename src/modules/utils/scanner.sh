#!/bin/bash


# PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
# PATH_TO_CONFIG=${PARENT_PATH/"modules/utils"/"config.sh"}

# source $PATH_TO_CONFIG


# 0 = exists
# 1 = does not exists

function assert_existence_other_package() {

	presumable_installation_path=$1
	existence=0

	if [[ -d "$presumable_installation_path" ]]; then
		existence=1
	fi

	echo $existence
}

function assert_existence_node_package() {

	node_package="${1}@"
	existence=0

	if [[ `npm list -g | grep -c $node_package` -eq 1 ]]; then
		existence=1
	fi

	echo $existence

}

