export PATH=$HOME/bin:/usr/local/cross/bin:/usr/local/bin:/opt/local/bin:/usr/local/go/bin:~/go/bin:$PATH

# ========== OMZ Config ==========
# Path to oh-my-zsh
export ZSH="/Users/matthew/.oh-my-zsh"
ZSH_THEME="mh"
# Enabling seems to make zsh so much slower
DISABLE_AUTO_UPDATE="true"
#export UPDATE_ZSH_DAYS=30
plugins=(
  git
  brew
  osx
)

# Other possible default options no one uses
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

# =========== Real ZSH Config ==========

export LANG=en_US.UTF-8
export SSH_KEY_PATH="~/.ssh/rsa_id"
export EDITOR='vim'

alias vi=vim

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/inetutils/libexec/gnuman:$MANPATH:/usr/local/man"

# ZSH Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ZSH Completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Activate suggestions for ZSH
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# ========== Paths to mask horrible mac defaults ==========
# Ncurses for ZSH
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"

# Used for GO
export GOROOT="/usr/local/go"

# Used for gnu inetutils (ftp, telnet, etc)
PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"

# Used for gnu coreutils
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# For brew's sbin binaries
export PATH="/usr/local/sbin:$PATH"

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
