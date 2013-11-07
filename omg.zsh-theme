# OMG ZSH Theme
# Help! Computers are hard! Some dude told me about something called the CLI 
# and now my computer won't start.


function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '👍 →'
}

function prompt_delimiter {
    echo "😨 OMG I don't know what I am doing! 🙏"
}

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

local user='%n'
local pwd='%{$fg[yellow]%}%~%{$reset_color%}'

# If rvm or rbenv display ruby version
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='$(rvm-prompt i v g)%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='$(rbenv version | sed -e "s/ (set.*$//")%{$reset_color%}'
  fi
fi

local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

PROMPT="$my_orange$(prompt_delimiter)%{$reset_color%}
${pwd}%{$reset_color%}
$fg[green]$(prompt_char)"
RPROMPT="${return_code} ${git_branch} ${rvm_ruby}"

# Protect the innocent! Don't display who did it
# Uncomment this line if you want full accountability for your actions
# RPROMPT="${return_code} ${git_branch} ${rvm_ruby} ${user}@$(box_name)"
