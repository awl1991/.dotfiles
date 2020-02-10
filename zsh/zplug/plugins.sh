# ===> ZPLUG <===
CUSTOMS="$HOME/.dotfiles/zsh/custom"
source ~/.zplug/init.zsh

	zplug "${CUSTOMS}/aliases", from:local
	zplug "bhilburn/powerlevel9k", from:github
	zplug "molovo/revolver", as:command, use:revolver, from:github
	zplug "romkatv/powerlevel10k", as:theme, depth:1
	zplug "plugins/colorize", from:oh-my-zsh
	zplug "plugins/jsontools", from:oh-my-zsh
	zplug "plugins/z", from:oh-my-zsh, use:"z.sh"
	zplug "mattmc3/zsh-safe-rm", from:github
	zplug "Valiev/almostontop", from:github
	zplug "bric3/nice-exit-code", from:github
	zplug "mafredri/zsh-async", from:github, use:"async.zsh"
	zplug "zsh-users/zsh-autosuggestions", from:github
	zplug "zsh-users/zsh-history-substring-search", from:github
	zplug "zsh-users/zsh-completions", from:github
	zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
	zplug "zsh-users/zsh-completions", from:github

zplug load
