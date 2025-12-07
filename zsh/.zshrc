###
#add code to bash
export PATH=/usr/local/apps/VSCode/bin:$PATH

eval "$(oh-my-posh init zsh --config /home/deepak/.config/zsh/atomicBit.omp.json)"

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:$JAVA_HOME/bin
export PATH="/usr/local/apps/flutter/bin:$PATH"
export CHROME_EXECUTABLE=google-chrome-stable
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

alias ls='ls --color=auto'
