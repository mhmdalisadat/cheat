# Bash completion for cheat-smart command
# Smart Suggestion Engine completion

_cheat_smart_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    CHEATS_DIR="${HOME}/.cheats"
    
    opts="fzf"
    
    case "${prev}" in
        cheat-smart)
            COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
            ;;
        *)
            # Complete with common keywords from history if available
            if [ -f "${CHEATS_DIR}/history.db" ]; then
                local keywords=$(cut -d'|' -f2 "${CHEATS_DIR}/history.db" 2>/dev/null | \
                    grep -v "^#" | sort -u | head -20)
                COMPREPLY=($(compgen -W "${keywords}" -- ${cur}))
            fi
            ;;
    esac
}

complete -F _cheat_smart_completion cheat-smart

