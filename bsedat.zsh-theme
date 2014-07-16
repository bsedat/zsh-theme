# Based on lukerandall and gallois

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  GIT_DIR=$(git rev-parse --show-toplevel)
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$GIT_DIR: ${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

local_dir() {
  echo "%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})"
}

user_host() {
  echo "%{$fg_bold[green]%}%n@%m%{$reset_color%}"
}

PROMPT='
$(user_host) $(my_git_prompt_info)%{$reset_color%}
$(local_dir) %B$%b '
