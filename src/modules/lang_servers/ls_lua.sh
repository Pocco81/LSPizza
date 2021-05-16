#!/bin/bash


PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PATH_TO_SYSTEM=${PARENT_PATH/"lang_servers"/"utils/system.sh"}

source $PATH_TO_SYSTEM


function install_lua() {

	local installation_dir="$HOME/.config/lua-language-server"

	if [[ $(assert_existence_other_package $installation_dir) == 1 ]]; then
		echo "is already installed, will not install..."
	else
		echo "is not installed, will install..."
		#git clone https://github.com/sumneko/lua-language-server $installation_dir
		#( cd ~/.config/lua-language-server/ && git submodule update --init --recursive )
		if [[ $(get_platform) == "Linux" ]]; then
			#(cd ~/.config/lua-language-server/3rd/luamake/ && compile/install.sh)
			#(cd ~/.config/lua-language-server/ &&  ./3rd/luamake/luamake rebuild)
			:
		fi
	fi


}

