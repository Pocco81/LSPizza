#!/bin/bash


function install_lang_servers() {

	ls_langs=("$@")

	for ls in "${ls_langs[@]}"; do

		__lspizza_verbose_print "Checking if '${ls}' is supported"

		if [[ " ${supported_langs[@]} " =~ " ${ls} " ]]; then		# array contains val

			__lspizza_verbose_print "Checking if '${ls}' has implementation for installing it"

			if fn_exists install_$ls; then
				complex_heading $ls
				install_$ls
			else
				prompt -i $(simple_heading "ERROR: The process for installing the language server for '${ls}' is currently under development")
			fi
		else
			prompt -i $(simple_heading "INFO: Support for the language '${ls}' is currently under development")
		fi

	done

}


function uninstall_lang_servers() {

	ls_langs=("$@")

	for ls in "${ls_langs[@]}"; do

		__lspizza_verbose_print "Checking if '${ls}' is supported"

		if [[ " ${supported_langs[@]} " =~ " ${ls} " ]]; then		# array contains val

			__lspizza_verbose_print "Checking if '${ls}' has implementation for uninstalling it"

			if fn_exists uninstall_$ls ; then
				complex_heading $ls
				uninstall_$ls
			else
				simple_heading "ERROR: The process for uninstalling the language server for '${ls}' is currently under development"
			fi
		else
			simple_heading "ERROR: Support for the language '${ls}' is currently under development"
		fi

	done

}
