#!/bin/bash


function complex_heading() {
	echo -e "\n\n${banner}\n\t$(prompt -i "Language server for: '${1}'")\n${banner}"
}

function simple_heading() {
	echo -e "\n\n${pfx} ${1}"
}

