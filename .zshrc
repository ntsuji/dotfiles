zshrcDir="$(dirname "$(readlink "$HOME/.zshrc")")"

ZSH="$zshrcDir/oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

. "$zshrcDir/z/z.sh"

export LANG=ja_JP.UTF-8

if [ -z "$STY" ]
then
	screen -xR
fi
