# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias zsc="code ~/.zshrc"
alias zs="source ~/.zshrc"
alias c="code ~/projects/cp && exit"
alias f="cd ~/projects/cp && source utils/cleanup.sh && find problems -type f | wc -l"
alias showip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias fin="cd ~/projects/jstack/fincheck/api && docker start pg && npm run start:dev"

# Environment Variables
export NODE_ENV=development
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=spaceship
export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${ANDROID_HOME}/tools:${PATH}
export PATH=${ANDROID_HOME}/emulator:${PATH}
export PATH=${ANDROID_HOME}/platform-tools:${PATH}

# ZSH Plugins
plugins=(asdf git zsh-autosuggestions zsh-completions F-Sy-H)
autoload -U compinit && compinit
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Spaceship Theme Configuration
SPACESHIP_PROMPT_ORDER=(
  time      # Time section
  user      # Username section
  battery   # Battery level and status
  dir       # Current directory section
  host      # Hostname section
  git       # Git section (git_branch + git_status)
  node      # Node section
  python    # Python section
  elixir    # Elixir section
  # exec_time # Execution time
  line_sep  # Line break
  jobs      # Background jobs indicator
  exit_code # Exit code section
  char      # Prompt character
)
SPACESHIP_DIR_PREFIX=''
# SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT='%D{%H:%M}'
SPACESHIP_BATTERY_SHOW=true
SPACESHIP_BATTERY_THRESHOLD=50
SPACESHIP_BATTERY_SYMBOL_FULL=''
SPACESHIP_PROMPT_SEPARATE_LINE=false

source $ZSH/oh-my-zsh.sh
