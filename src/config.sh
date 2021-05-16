#!/bin/bash


LSP_BIN_PATH=$HOME/.local/bin

installable_by_node_langs=(
	"bash"
	"typescript"
	"html"
	"css"
	"json"
	"python"
)

installable_by_other_langs=(
	"rust"
	"lua"
)


supported_langs=()

for lang in "${installable_by_node_langs[@]}"; do
	supported_langs+=($lang)
done

for lang in "${installable_by_other_langs[@]}"; do
	supported_langs+=($lang)
done

pfx="~~~~~~~~~~~~~~~~~→"
banner="-----------------------------↓↓---------------------------------"

