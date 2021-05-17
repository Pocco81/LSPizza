#!/bin/bash

__lspizza_completions() {
  COMPREPLY=($(compgen -W "-h --help -i --install -u --uninstall -l --list -v --verbose -s --scan" "${COMP_WORDS[1]}"))
}

complete -F __lspizza_completions $HOME/code/github_p/LSPizza/src/lspizza
