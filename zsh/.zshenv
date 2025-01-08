# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

export VISUAL='nvim'
export XDG_CONFIG_HOME=$HOME/.config

VIM="nvim"

. "$HOME/.cargo/env"
