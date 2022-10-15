fill_git(){
  if [ -z "$(git_prompt_info)" ]; then
        echo ""
  else
        echo "origin/$(echo $(git_prompt_info)| cut -d' ' -f 2)"
  fi
}

local user_color='green'; [ $UID -eq 0 ] && user_color='red'
PROMPT='%B%F{green}%n %b%F{#505050}in %B%F{cyan}%~%b%F{white} > '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"
RPROMPT="${RPROMPT}"'${return_status}%F{#505050}$(fill_git) $(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[red]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[red]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}*"


