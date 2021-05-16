#!/bin/bash


function node_install_if_exists() {

	if [[ -z $(which npm) ]]; then
		echo "NodeJS is not installed in your system or it is not available in your \$PATH variable"
	else
		for pkg in "$@"; do
			pkg_exists=$(assert_existence_node_package $pkg)
			if [[ $(assert_existence_node_package $pkg) == 1 ]]; then echo "'$pkg' is already installed, will not install..."; else echo "'$pkg' is not installed, will install"; fi
		done
		# npm install -g $@
	fi

}

function node_uninstall_if_exists() {

	if [[ -z $(which npm) ]]; then
		echo "NodeJS is not installed in your system or it is not available in your \$PATH variable"
	else
		for pkg in "$@"; do
			pkg_exists=$(assert_existence_node_package $pkg)
			if [[ $(assert_existence_node_package $pkg) == 1 ]]; then echo "'$pkg' is already installed, will uninstall..."; else echo "'$pkg' is not installed, will not uninstall"; fi
		done
		# npm uninstall -g $@
	fi

}
