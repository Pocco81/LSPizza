#!/bin/bash


LSP_BIN_PATH=$HOME/.local/bin
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
PATH_TO_LIST_FILE=${PARENT_PATH/"src"/"usr/control_list.txt"}

__lspizza_verbosity=0
pfx="~~~~~~~~~~~~~~~~~→"
banner="-----------------------------↓↓---------------------------------"

#COLORS
CDEF=" \033[0m"                              # default color
CCIN=" \033[0;36m"                           # info color
CGSC=" \033[0;32m"                           # success color
CRER=" \033[0;31m"                           # error color
CWAR=" \033[0;33m"                           # waring color
b_CDEF=" \033[1;37m"                         # bold default color
b_CCIN=" \033[1;36m"                         # bold info color
b_CGSC=" \033[1;32m"                         # bold success color
b_CRER=" \033[1;31m"                         # bold error color
b_CWAR=" \033[1;33m"                         # bold warning color


supported_langs=()

declare -A installable_by_node_langs=(
    ["bash"]="bash-language-server"
    ["typescript"]="typescript;typescript-language-server;prettier"
    ["html"]="vscode-html-languageserver-bin"
    ["css"]="vscode-css-languageserver-bin"
    ["json"]="vscode-json-languageserver"
    ["python"]="pyright"
)


declare -A installable_by_other_langs=(
    ["rust"]="$HOME/.local/bin/rust-analyzer"
    ["lua"]="$HOME/.config/lua-language-server"
)


for key in ${!installable_by_other_langs[@]}; do
	supported_langs+=($key)
done


for key in ${!installable_by_node_langs[@]}; do
	supported_langs+=($key)
done








