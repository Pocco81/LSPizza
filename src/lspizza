#!/bin/bash


# To-Do
# + change name to LSPizza
# + finish core functionalities
# + add scan functionality to check if server for x language already exists
#	+,i append to file
# + add verbosity opt
# + add parallel downloading
# + add option for printing installed lang servers
#

source config.sh
source modules/utils/scanner.sh
source modules/utils/nodejs.sh
source modules/utils/system.sh
for ls_f in modules/lang_servers/*.sh; do source $ls_f; done


script_help=$( cat << EOF

This script simplifies facilitates the process of installing language servers.

Usages:
#0: ${this_scrpt} [flag(s)] <values(?)>
Arguments:
    -h,--help                   See this help message.
    -i,--install                Install lang severs for list of languages passed
								in a string separated by commas.
    -u,--unstall                Uninstall lang severs for list of languages passed
								in a string separated by commas.

EOF
)


function complex_heading() {
    echo -e "\n\n${banner}\n\tInstalling: language server for '${1}'\n${banner}"
}

function simple_heading() {
	echo -e "\n\n${pfx} ${1}"
}

function fn_exists() { declare -F "$1" > /dev/null; }

function install_lang_servers() {

	ls_langs=("$@")

	for ls in "${ls_langs[@]}"; do

		if [[ " ${supported_langs[@]} " =~ " ${ls} " ]]; then		# array contains val
			if fn_exists install_$ls ; then
				complex_heading $ls
				install_$ls
			else
				simple_heading "ERROR: The process for installing the language server for '${ls}' is currently unsupported/under development"
			fi
		else
			simple_heading "ERROR: Support for the language '${ls}' is currently unsupported/under development"
		fi

	done

}


function uninstall_lang_servers() {

	ls_langs=("$@")

	for ls in "${ls_langs[@]}"; do

		if [[ " ${supported_langs[@]} " =~ " ${ls} " ]]; then		# array contains val
			if fn_exists uninstall_$ls ; then
				complex_heading $ls
				uninstall_$ls
			else
				simple_heading "ERROR: The process for uninstalling the language server for '${ls}' is currently unsupported/under development"
			fi
		else
			simple_heading "ERROR: Support for the language '${ls}' is currently unsupported/under development"
		fi

	done

}


function die() {
	printf '%s\n' "$1" >&2
	exit 1
}


if [[ -n "$1" ]]; then
	while :; do
		case $1 in
			-h|-\?|--help)
				echo "$script_help"
				exit 0
				;;
			-i|--install)       # Takes an option argument; ensure it has been specified.

				if [[ "$2" ]]; then
					# grab langs, remove spaces and commas
					languages=${2//[[:blank:]]/}
					IFS=',' read -ra to_install_array <<< "$languages"

					install_lang_servers "${to_install_array[@]}"
					shift
				else
					die 'ERROR: "-i" requires a non-empty option argument.'
				fi

				;;
			-u|--uninstall)

				if [[ "$2" ]]; then
					# grab langs, remove spaces and commas
					languages=${2//[[:blank:]]/}
					IFS=',' read -ra to_uninstall_array <<< "$languages"

					uninstall_lang_servers "${to_uninstall_array[@]}"

					shift
				else
					die 'ERROR: "-u" requires a non-empty option argument.'
				fi

				;;
			-s|--scan)

				;;
			--file=?*)
				file=${1#*=} # Delete everything up to "=" and assign the remainder.
				# echo "$file"
				;;
			--file=)         # Handle the case of an empty --file=
				die 'ERROR: "--file" requires a non-empty option argument.'
				;;
			-?*)
				printf 'WARNING: Unknown option (ignored): %s\n' "$1" >&2
				;;
			*)               # Default case: No more options, so break out of the loop.
				break
				;;
		esac
		shift
	done

else
    echo -e "This script needs at least one argument to work.\nType '$this_scrpt -h' or '$this_scrpt --help' for help "
fi

