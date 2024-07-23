# /etc/zsh/zshenv

# Set the path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"

# Set the locale
export LANG="en_IN.UTF-8"
export LC_ALL="en_IN.UTF-8"

# Any other environment variables
# export VARIABLE_NAME="value"

if [[ -z "$XDG_CONFIG_HOME" ]] 
then
	export XDG_CONFIG_HOME="$HOME/.config/"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]] 
then
	export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
fi
