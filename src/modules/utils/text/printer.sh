#!/bin/bash

function __lspizza_verbose_print() {
    if [[ ! $__lspizza_verbosity = 0 ]]; then
        tput bold
        echo -e "~~> ${1}"
        tput sgr0
    fi
}

function prompt () {
	case ${1} in
		"-s"|"--success")
			echo -e "${b_CGSC}${@/-s/}${CDEF}";;          # print success message
		"-e"|"--error")
			echo -e "${b_CRER}${@/-e/}${CDEF}";;          # print error message
		"-w"|"--warning")
			echo -e "${b_CWAR}${@/-w/}${CDEF}";;          # print warning message
		"-i"|"--info")
			echo -e "${b_CCIN}${@/-i/}${CDEF}";;          # print info message
		*)
			echo -e "$@"
		;;
	esac
}

