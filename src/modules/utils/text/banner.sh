#!/bin/bash


function complex_heading() {
	# echo -e "\n\n${banner}\n\t$(prompt -i "Language server for: '${1}'")\n${banner}"
	echo -e "\n\n"
	prompt -w "${banner}"
	echo -e "\t$(prompt -i "Language server for: '${1}'")"
	prompt -w "${banner}"
}

function simple_heading() {
	echo -e "\n\n${pfx} ${1}"
}

