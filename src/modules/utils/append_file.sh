#!/bin/bash


function assert_file () {

	# operations can be either r(ead), d(elete), a(ppend)
	operation=$1
	to_assert=$2
	amount_lines_file=`wc -l $PATH_TO_LIST_FILE | awk '{ print $1 }'`

	if [[ "$operation" == "-r" ]]; then
		n=1
		while read line; do
			if [[ "$line" == "default_lang" ]]; then
				:
			else
				prompt -i "Lang #$((n-1)): $line"
			fi
			n=$((n+1))
		done < $PATH_TO_LIST_FILE

		echo ""
		prompt -i "You have: '$((n-1))' languages with servers."

	elif [[ "$operation" == "-d" ]]; then
		n=1
		while read line; do
			if [[ "$line" == "$to_assert" ]]; then
				local to_eval="sed -i '${n}d' $PATH_TO_LIST_FILE"
				eval $to_eval
			else
				if [[ $n == $amount_lines_file ]]; then
					break
				fi
			fi
			n=$((n+1))
		done < $PATH_TO_LIST_FILE
	elif [[ "$operation" == "-a" ]]; then
		n=1
		while read line; do
			if [[ "$line" == "$to_assert" ]]; then
				break
			else
				if [[ $n == $amount_lines_file ]]; then
					echo "$to_assert" >> $PATH_TO_LIST_FILE
				fi
			fi
			n=$((n+1))
		done < $PATH_TO_LIST_FILE

	fi
}




