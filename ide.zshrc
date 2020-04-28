fpath+=/Users/awl/.dotfiles/pure
autoload -U promptinit; promptinit
prompt pure
# --> Shortcuts
DOT="$HOME/.dotfiles/zsh"
CUSTOMS="$HOME/.dotfiles/zsh/custom"
ALIASES="$CUSTOMS/aliases"
ZCOMPDUMP="$HOME/.ZCDump"
ZPLUG="$HOME/.dotfiles/zsh/zplug"
# --> Completions path
fpath=($HOME/.zplug/repos/zsh-users/zsh-completions/src $fpath)
# --> ZPlug
unset ZPLUG_CACHE_CHECK_FOR_CHANGES
source ~/.zplug/init.zsh
	zplug "plugins/colorize", from:oh-my-zsh
	zplug "plugins/jsontools", from:oh-my-zsh
	zplug "plugins/colored-man-pages", from:oh-my-zsh
	zplug "plugins/z", from:oh-my-zsh, use:"z.sh"
	zplug "zsh-users/zsh-autosuggestions", from:github
	zplug "zsh-users/zsh-history-substring-search", from:github
	zplug "zsh-users/zsh-completions", from:github
	zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
	zplug "zsh-users/zsh-completions", from:github
	zplug "mattmc3/zsh-safe-rm", from:github
	zplug "Valiev/almostontop", from:github
	zplug "bric3/nice-exit-code", from:github
	zplug "molovo/revolver", as:command, use:revolver, from:github
	zplug "mafredri/zsh-async", from:github, use:"async.zsh"
zplug load
# --> Aliases
source "${CUSTOMS}/aliases/aliases.sh"
source "${CUSTOMS}/colorls_shortcuts.sh"
source "${CUSTOMS}/k.sh"
# --> Iterm2 shell integration
source "$HOME/.iterm2_shell_integration.zsh"

