export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

HYPHEN_INSENSITIVE="true"

plugins=(
  git 
  sudo 
  archlinux 
  extract 
  zsh-autosuggestions 
  zsh-syntax-highlighting
  )

source $ZSH/oh-my-zsh.sh



#Yazi Function to keep you in the directory you exit from when in yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


eval "$(starship init zsh)" # start starship


# set Neovim as MANPAGER
if command -v nvim >/dev/null 2>&1; then
    export MANPAGER='nvim +Man!'
else
    # Fallback to 'less' if nvim isn't found 
    export MANPAGER='less'
fi

fastfetch # run fastfetch
