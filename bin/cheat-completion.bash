# Bash completion for cheat command
# PHASE 3 Implementation

_cheat_completion() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    CHEATS_DIR="${HOME}/.cheats"
    
    opts="init list search fzf exec execute git-init git-remote git-push git-pull export export-pdf dashboard serve smart"
    
    case "${prev}" in
        cheat)
            # Get available categories
            if [ -d "$CHEATS_DIR" ]; then
                local categories=$(ls -1 "$CHEATS_DIR"/*.md 2>/dev/null | \
                    sed "s|${CHEATS_DIR}/||g" | \
                    sed "s|\.md||g")
                COMPREPLY=($(compgen -W "${opts} ${categories}" -- ${cur}))
            else
                COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
            fi
            ;;
        search|git-remote)
            # No completion for these
            return 0
            ;;
        *)
            # Default: complete with categories
            if [ -d "$CHEATS_DIR" ]; then
                local categories=$(ls -1 "$CHEATS_DIR"/*.md 2>/dev/null | \
                    sed "s|${CHEATS_DIR}/||g" | \
                    sed "s|\.md||g")
                COMPREPLY=($(compgen -W "${categories}" -- ${cur}))
            fi
            ;;
    esac
}

complete -F _cheat_completion cheat

