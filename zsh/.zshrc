###
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval "$(oh-my-posh init zsh --config /home/deepak/.config/zsh/atomicBit.omp.json)"
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
