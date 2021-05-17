#!/bin/bash


function assert_existence_other_package() {

	presumable_installation_path=$1
	existence=0

	if [[ -e "$presumable_installation_path" ]]; then
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

function assert_ius_args () {

	func_for_install=$1
	func_for_uninstall=$2
	func_for_scan=$3

	case ${to_do} in
		"-i"|"--install")
			if fn_exists install_$ls ; then
				# complex_heading $ls
				eval $func_for_install
			else
				prompt -e $(simple_heading "ERROR: The process for uninstalling the language server for '${ls}' is currently under development")
			fi
			;;
		"-u"|"--uninstall")
			if fn_exists uninstall_$ls ; then
				# complex_heading $ls
				eval $func_for_uninstall
			else
				prompt -e $(simple_heading "ERROR: The process for uninstalling the language server for '${ls}' is currently under development")
			fi
			;;
		"-s"|"--scan")
			eval $func_for_scan
			;;
		*)
			:;;
	esac

}


function main_assert_node() {

	to_eval=$3
	operation=$4

	function test_if_eval { if [[ "$to_eval" != "NONE" ]]; then eval $to_eval; else : ; fi; }

	for pkg in "${node_packages[@]}"; do
		if [[ $(assert_existence_node_package $pkg) == 1 ]]; then
			prompt -i "${1/"<blank>"/"$pkg"}"
			if [[ "$to_eval" == "install_$ls" ]]; then
				# test_if_eval
				assert_file -a "${ls}"
			elif [[ "$to_eval" == "uninstall_$ls" ]]; then
				test_if_eval
				assert_file -d "${ls}"
			else
				assert_file -a "${ls}"
			fi
		else
			prompt -i "${2/"<blank>"/"$pkg"}"
			if [[ "$to_eval" == "install_$ls" ]]; then
				test_if_eval
				assert_file -a "${ls}"
			elif [[ "$to_eval" == "uninstall_$ls" ]]; then
				# test_if_eval
				assert_file -d "${ls}"
			else
				assert_file -d "${ls}"
			fi
		fi
	done

}

function main_assert_other() {

	to_eval=$3

	function test_if_eval { if [[ "$to_eval" != "NONE" ]]; then eval $to_eval; else : ; fi; }

	if [[ $(assert_existence_other_package ${installable_by_other_langs[${ls}]}) == 1 ]]; then
		prompt -i "$1"
		if [[ "$to_eval" == "install_$ls" ]]; then
			# test_if_eval
			assert_file -a "${ls}"
		elif [[ "$to_eval" == "uninstall_$ls" ]]; then
			test_if_eval
			assert_file -d "${ls}"
		else
			assert_file -a "${ls}"
		fi
	else
		prompt -i "$2"
		if [[ "$to_eval" == "install_$ls" ]]; then
			test_if_eval
			assert_file -a "${ls}"
		elif [[ "$to_eval" == "uninstall_$ls" ]]; then
			# test_if_eval
			assert_file -d "${ls}"
		else
			assert_file -d "${ls}"
		fi
	fi
}

function install_for_node () {
	main_assert_node "The package '<blank>' is already installed. Will not install again..." "The package '<blank>' is not installed. Will proceed to install..." "install_$ls"; }

function uninstall_for_node () { main_assert_node "The package '<blank>' is already installed. Will proceed to uninstall..." "The package '<blank>' is not installed. Nothing to remove..." "uninstall_$ls"; }

function scan_for_node () { main_assert_node "The package '<blank>' is installed." "The package '<blank>' is not installed." "NONE"; }

function install_for_other() { main_assert_other "The language server for '$ls' is already installed. Will not install again..." "The language server for '$ls' is not installed. Will proceed to install..." "install_$ls"; }

function uninstall_for_other() { main_assert_other "The language server '$ls' is already installed. Will proceed to uninstall..." "The language server '$ls' is not installed. Nothing to remove..." "uninstall_$ls"; }

function scan_for_other() { main_assert_other "The language server for '$ls' is already installed." "The language server '$ls' is not installed." "NONE"; }


function scan_lang_servers() {

	to_do=$1
	ls_langs=("$@")

	unset ls_langs[0]

	for ls in "${ls_langs[@]}"; do

		if [[ "$to_do" != "-s" ]]; then complex_heading $ls; fi

		__lspizza_verbose_print "Checking if '${ls}' is supported"

		if [[ " ${supported_langs[@]} " =~ " ${ls} " ]]; then		# array contains val

			__lspizza_verbose_print "Checking if '${ls}' has implementation for installing it"

			if [[ " ${!installable_by_node_langs[@]} " =~ " ${ls} " ]]; then		# array contains val

				IFS=';' read -ra node_packages <<< "${installable_by_node_langs[${ls}]}"
				assert_ius_args "install_for_node" "uninstall_for_node" "scan_for_node"

			elif [[ " ${!installable_by_other_langs[@]} " =~ " ${ls} " ]]; then		# array contains val

				assert_ius_args "install_for_other" "uninstall_for_other" "scan_for_other"

			fi

		else
			prompt -i $(simple_heading "INFO: Support for the language '${ls}' is currently under development")
		fi

	done

}

