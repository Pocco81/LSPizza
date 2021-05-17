#!/bin/bash


PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PATH_TO_SYSTEM=${PARENT_PATH/"lang_servers"/"utils/system.sh"}

source $PATH_TO_SYSTEM

function install_rust() {

		# mkdir -p ${LSP_BIN_PATH}
		# curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-$(get_platform) -o ~/.local/bin/rust-analyzer
		# chmod +x ~/.local/bin/rust-analyzer
	:
}

