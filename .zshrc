#    ==> Theme - Powerlevel10k on top of Powerlevel9k
#    ==> Font - Custom Patched Firacode
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
# --> Set default User
DEFAULT_USER=$USER

if [ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ]; then
   source "/Users/awl/ide.zshrc"
else

# --> Globals & Zsh
zle_highlight+=(paste:none)
ENABLE_CORRECTION=true
DISABLE_AUTO_TITLE=true
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory
DIRSTACKSIZE=20
TERM=xterm-256color
setopt auto_cd
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS
setopt COMPLETE_IN_WORD
setopt NO_ALWAYS_TO_END
export HOMEBREW_NO_AUTO_UPDATE=1

# --> Shortcuts
DOT="$HOME/.dotfiles/zsh"
CUSTOMS="$HOME/.dotfiles/zsh/custom"
ALIASES="$CUSTOMS/aliases"
ZCOMPDUMP="$HOME/.ZCDump"
ZPLUG="$HOME/.dotfiles/zsh/zplug"
none=$none

# --> Completions path
fpath=($HOME/.zplug/repos/zsh-users/zsh-completions/src $fpath)

# --> Initialize completions
autoload -U compinit && compinit

# --> ZPlug
unset ZPLUG_CACHE_CHECK_FOR_CHANGES
source ~/.zplug/init.zsh
	zplug "bhilburn/powerlevel9k", from:github
	zplug "romkatv/powerlevel10k", as:theme, depth:1
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

# --> SOURCE CUSTOMS
for item in $(ls -1 ${CUSTOMS}/*.sh); do
	[ -e "${item}" ] && source "${item}"
done

# --> Transient Prompt
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=2 	# succeeded
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=0 	# failed

# <==*=<< Left Prompt <==*=<<
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	os_icon
	context
	newline
	custom_dir
	vcs
)

# >>=*=> Right Prompt >>=*=>
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
	status
	custom_wifi_signal
	time
	custom_prompt_space
	custom_battery_status
	newline
	custom_prompt_language
)

# --> Custom Git Status config
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244
typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

# --> Show lock if directory is !writable
POWERLEVEL9K_DIR_SHOW_WRITABLE="true"
POWERLEVEL9K_DIR_LOCK_ICON=""

# --> User icon
POWERLEVEL9K_USER_ICON=" "

# --> User context
POWERLEVEL9K_ROOT_ICON=''
POWERLEVEL9K_USER_ROOT_BACKGROUND="52"

# -->  Segment Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$none
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$none
POWERLEVEL9K_LEFT_PROMPT_SEGMENT_END_SYMBOL=$none

# --> Subsegment Separators
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$none
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{250}%f'

# --> Remove Left Segment Default Whitespace
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=$none
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=$none

# --> Left Icons
POWERLEVEL9K_APPLE_ICON='  %F{07}  %F{000}%K{016}%f'
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf823"

# --> Left Foregrounds
POWERLEVEL9K_OS_ICON_FOREGROUND='242'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='242'

# --> Left Backgrounds
POWERLEVEL9K_OS_ICON_BACKGROUND='000'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='240'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='236'
POWERLEVEL9K_VCS_BACKGROUND="016"

# --> Left Newline Icons
POWERLEVEL9K_CUSTOM_DIR="dir_icon"
POWERLEVEL9K_DIR_PATH_SEPARATOR="/"

# --> Left Newline Backgrounds
POWERLEVEL9K_DIR_HOME_BACKGROUND='23'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='30'

# --> Right Prompt Icons
POWERLEVEL9K_STATUS_OK_ICON="  "
POWERLEVEL9K_STATUS_FAIL_ICON="  "
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"
POWERLEVEL9K_TIME_FORMAT="  $time_format$p "
POWERLEVEL9K_TIME_ICON=$none
POWERLEVEL9K_CUSTOM_PROMPT_SPACE='prompt_space'

# --> Right Newline Segments
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE="prompt_language"

# --> Right Newline Foreground
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_FOREGROUND='white'

# --> Right Newline Backgrounds
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_BACKGROUND=$none

# --> Right Prompt Backgrounds
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND=$none
POWERLEVEL9K_TIME_BACKGROUND=$none
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND=$none
POWERLEVEL9K_STATUS_BACKGROUND=$none
POWERLEVEL9K_CUSTOM_PROMPT_SPACE_BACKGROUND=$none

# --> Right Prompt Foregrounds
POWERLEVEL9K_STATUS_OK_FOREGROUND='022'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="001"
POWERLEVEL9K_TIME_FOREGROUND='109'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="016"
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD="false"

# --> Prompt Prefixes
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{08}╭─"
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="%F{08}\u251C\u2500"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{08}╰ "

# --> Add Newline Config
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE="false"

# ==> NEEDED AT END OF FILE <== #
# --> Zsh Autosuggestions
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23,bg=grey"

# --> Iterm2 shell integration
source "$HOME/.iterm2_shell_integration.zsh"

# --> Zsh Syntax Highlighting
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=015
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=006
ZSH_HIGHLIGHT_STYLES[alias]=fg=029
ZSH_HIGHLIGHT_STYLES[builtin]=fg=028
ZSH_HIGHLIGHT_STYLES[function]=fg=027
ZSH_HIGHLIGHT_STYLES[command]=fg=015
ZSH_HIGHLIGHT_STYLES[precommand]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=014
ZSH_HIGHLIGHT_STYLES[path]=fg=004
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=209
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=209
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=fg=209
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=138
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=138

# --> .zcompdump config
if [ -z "$ZSH_COMPDUMP" ]; then
	ZSH_COMPDUMP="$ZCOMPDUMP/.zcdump_$[${RANDOM}%1000]"
fi

# --> Fuzzy finder
export BAT_CONFIG_PATH="$DOT/zsh/bat.conf"
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500" --height 90% --layout=reverse'
fi