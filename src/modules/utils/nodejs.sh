#!/bin/bash


function install_node_packages() {
	# npm install -g $@
	echo "installing lang servers and stuff..."
}

function uninstall_node_pkgs() {
	npm uninstall -g $@
}

function assert_node_pkg_existence() {

	exitence=0

	__lspizza_verbose_print "Checking if NodeJS is installed"

	if [[ -z $(which npm) ]]; then
		prompt -e "NodeJS is not installed in your system or it is not available in your \$PATH variable"
	else
			if [[ $(assert_existence_node_package $pkg) == 1 ]]; then echo "'$pkg' is already installed, will not install..."; else echo "'$pkg' is not installed, will install"; fi
		# for pkg in "$@"; do

		# 	__lspizza_verbose_print "Checking if '$pkg' package is already installed"

		# 	pkg_exists=$(assert_existence_node_package $pkg)
		# 	if [[ $(assert_existence_node_package $pkg) == 1 ]]; then echo "'$pkg' is already installed, will not install..."; else echo "'$pkg' is not installed, will install"; fi
		# done
		# npm install -g $@
	fi

}

function node_uninstall_if_exists() {


	return_val=$1

	__lspizza_verbose_print "Checking if NodeJS is installed"

	if [[ -z $(which npm) ]]; then
		prompt -e "NodeJS is not installed in your system or it is not available in your \$PATH variable"
	else
		for pkg in "$@"; do

			__lspizza_verbose_print "Checking if '$pkg' package is already installed"
			pkg_exists=$(assert_existence_node_package $pkg)

			if [[ $return_val == 1 ]]; then
				echo $pkg_exists; continue
			fi

			if [[ $(assert_existence_node_package $pkg) == 1 ]]; then echo "'$pkg' is already installed, will uninstall..."; else echo "'$pkg' is not installed, will not uninstall"; fi
		done
		# npm uninstall -g $@
	fi

}
