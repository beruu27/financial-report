#!/bin/bash
# Bash completion for bankfin command

_bankfin_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    opts="--help --version --demo --output -o -v -h"
    
    case "${prev}" in
        -o|--output)
            # Complete with xlsx files
            COMPREPLY=( $(compgen -f -X '!*.xlsx' -- "${cur}") )
            return 0
            ;;
        *)
            ;;
    esac
    
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
}

complete -F _bankfin_completions bankfin
