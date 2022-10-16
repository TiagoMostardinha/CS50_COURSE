# setup git information
autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt prompt_subst
# %b: branch
# %u: unstaged changes
############################

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='T'
    fi

    hook_com[staged]+=${hook_com[unstaged]}
    

    hook_com[staged]=$(sed 's/T/*/g' <<<${hook_com[staged]})
    hook_com[staged]=$(sed 's/U/*/g' <<<${hook_com[staged]})
    hook_com[staged]=$(echo ${hook_com[staged]} | tr -s '*' '*')

    hook_com[staged]=$(sed 's/S/%F{green}*%F{red}/g' <<<${hook_com[staged]})
}

##################
zstyle ':vcs_info:git:*' formats '%F{#56334B}origin/%b %F{red}%a%c%f%F{#FFFFFF}'
# this makes %u work, but also the prompt is clearly slower in git dirs when this is on
zstyle ':vcs_info:*' check-for-changes true
# what string to use for %u when there are unstaged changes
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# vcs_info supports multiple version control systems, but I need just git
zstyle ':vcs_info:*' enable git

# Explaining prompt:
#
# %B / %F{n}: begin bold / color
# %b / %f: end bold / color
# %n~: display n latest directories of current directory
# %#: display a '%' (or '#' when root)
# %(..): conditional expression (see docs)
# %?: exit code of last process
# %n@%m: user@host
PROMPT='%B%F{green}%n %b%F{#56334B}in %B%F{blue}%~ %b%F{#FFFFFF}> '

# rprompt is located on the right side of the terminal
RPROMPT='%B${vcs_info_msg_0_}%(?..%F{red} %f)%b%F{#FFFFFF}'

