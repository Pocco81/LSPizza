#!/bin/bash


PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PATH_TO_SYSTEM=${PARENT_PATH/"lang_servers"/"utils/system.sh"}

source $PATH_TO_SYSTEM


function install_lua() {

	#git clone https://github.com/sumneko/lua-language-server $installation_dir
	#( cd ~/.config/lua-language-server/ && git submodule update --init --recursive )

	__lspizza_verbose_print "Checking if Linux is the current platform"
	if [[ $(get_platform) == "Linux" ]]; then
		#(cd ~/.config/lua-language-server/3rd/luamake/ && compile/install.sh)
		#(cd ~/.config/lua-language-server/ &&  ./3rd/luamake/luamake rebuild)
		:
	fi

}

