ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=ja_JP.UTF-8

if [ -z "$STY" ]
then
	screen -xR
fi
