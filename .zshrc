# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias zsc="code ~/.zshrc"
alias zs="source ~/.zshrc"
alias c="code ~/Projects/cp && exit"
alias f="cd ~/Projects/cp && source cleanup.sh && find problems -type f | wc -l"

# Environment Variables
export NODE_ENV=development
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME=spaceship

# ZSH Plugins
plugins=(asdf git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)
autoload -U compinit && compinit
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# Spaceship Theme Configuration
SPACESHIP_PROMPT_ORDER=(
  user      # Username section
  battery   # Battery level and status
  dir       # Current directory section
  host      # Hostname section
  git       # Git section (git_branch + git_status)
  exec_time # Execution time
  line_sep  # Line break
  jobs      # Background jobs indicator
  exit_code # Exit code section
  char      # Prompt character
)
# SPACESHIP_USER_SHOW=always
# SPACESHIP_BATTERY_SHOW=always
SPACESHIP_BATTERY_THRESHOLD=50
SPACESHIP_PROMPT_SEPARATE_LINE=false
