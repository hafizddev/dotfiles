set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -g fish_color_autosuggestion green
set -g fish_color_command white
fish_vi_key_bindings
#https://github.com/fish-shell/fish-shell/issues/3310
#https://fishshell.com/docs/3.3/interactive.html
#set -g fish_color_normal normal
#set -g fish_color_command blue
#set -g fish_color_quote blue
#set -g fish_color_redirection normal
#set -g fish_color_end yellow
#set -g fish_color_error red
#set -g fish_color_param cyan
#set -g fish_color_comment red
#set -g fish_color_match cyan
#set -g fish_color_operator cyan
#set -g fish_color_escape cyan
#set -g fish_color_cwd green
#set -g fish_color_autosuggestion cyan
#set -g fish_color_user green
#set -g fish_color_host normal
#set -g fish_color_history_current cyan
#set -g fish_color_selection blue
#set -g fish_color_status magenta
#set -g fish_pager_color_prefix cyan
#set -g fish_pager_color_completion magenta
#set -g fish_pager_color_description normal
#set -g fish_pager_color_progress green

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
