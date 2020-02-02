export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#   ==> ==> ==> ZSH Theme <== <== <==   #

# ==> ==> Font Pack <== <
POWERLEVEL9K_MODE='nerd-font'

# --> Globals
setopt auto_cd
ENABLE_CORRECTION="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
zle_highlight+=(paste:none)
export HOMEBREW_NO_AUTO_UPDATE=3
local p="$(date '+%p')"
p=$(echo "$p" | sed -e 's/AM/ᴀᴍ/' -e 's/PM/ᴘᴍ/')
local time_format="$(date '+%-I:%M')"

# ===> Truncation
# POWERLEVEL9K_SHORTEN_DELIMITER="%F{023} %f"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last

# --> Path shortcuts
	# > .oh_my_zsh directory
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
	# > .dotfiles directory
DOT="$HOME/.dotfiles/zsh"
DOT_TOOLS="$DOT/tools"
	# > .zcompdump directory
ZCOMPDUMP="$HOME/.ZCDump"
	# > alias directory
ALIASES="$DOT_TOOLS/aliases"

# --> Completions path
fpath=($HOME/zsh-completions/src $fpath)

# --> Initialize completions
autoload -U compinit && compinit

# ZSH config
setopt   INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_FIND_NO_DUPS
setopt	 HIST_EXPIRE_DUPS_FIRST
setopt   HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zhistory
DIRSTACKSIZE=20
# prefix completer
setopt COMPLETE_IN_WORD
# don't move cursor to end AFTER inserted completion
setopt NO_ALWAYS_TO_END

# --> Terminal Defaults
TERM=xterm-256color
DEFAULT_USER=$USER

# --> .zcompdump config
if [ -z "$ZSH_COMPDUMP" ]; then
	ZSH_COMPDUMP="$ZCOMPDUMP/.zcdump_$[${RANDOM}%1000]"
fi

# ===> ZPLUG <===
unset ZPLUG_CACHE_CHECK_FOR_CHANGES
source ~/.zplug/init.zsh

	# => plugins
	zplug "bhilburn/powerlevel9k", from:github
	zplug "$DOT_TOOLS/aliases", from:local
	zplug "romkatv/powerlevel10k", as:theme, depth:1
	zplug "plugins/colorize", from:oh-my-zsh
	zplug "plugins/jsontools", from:oh-my-zsh
	zplug "plugins/z", from:oh-my-zsh, use:"z.sh"
	zplug "zsh-users/zsh-completions", from:github
	zplug "mattmc3/zsh-safe-rm", from:github
	zplug "Valiev/almostontop", from:github
	zplug "zsh-users/zsh-autosuggestions", from:github
	zplug "zsh-users/zsh-history-substring-search", from:github
	zplug "bric3/nice-exit-code", from:github
	zplug "mafredri/zsh-async", from:github, use:"async.zsh"
	zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2

zplug load

# Zsh-autosuggestions config
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# --> Transient prompt config
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
# Green prompt symbol if the last command succeeded.
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=2
# Red prompt symbol if the last command failed.
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=3

# <==*=<< Left Prompt <==*=<<
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	os_icon
#   ~~> ~~> VSCode <~~ <~~
#	custom_vscode
	context
	newline
	custom_dir
	vcs
)

# >>=*=> Right Prompt >>=*=>
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
	status
	custom_wifi_signal
	time
	custom_prompt_space
	custom_battery_status
	newline
	custom_prompt_language
)

# --> Custom Git Status config
source $DOT_TOOLS/git-prompt.sh
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

# --> Remove Left Segment Default Whitespace
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=''
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=''

# --> Left Icons
POWERLEVEL9K_APPLE_ICON='  %F{07}  %F{000}%K{232}%f'
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf823"
POWERLEVEL9K_CUSTOM_VSCODE="vscode"

# --> Left Foregrounds
POWERLEVEL9K_OS_ICON_FOREGROUND='242'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='242'
POWERLEVEL9K_CUSTOM_VSCODE_FOREGROUND="016"

# --> Left Backgrounds
POWERLEVEL9K_OS_ICON_BACKGROUND='000'
POWERLEVEL9K_CUSTOM_VSCODE_BACKGROUND="016"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='240'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='236'
POWERLEVEL9K_VCS_BACKGROUND="232"

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
POWERLEVEL9K_TIME_ICON=''
POWERLEVEL9K_CUSTOM_PROMPT_SPACE='prompt_space'

# --> Right Newline Segments
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE="prompt_language"

# --> Right Newline Foreground
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_FOREGROUND='white'

# --> Right Newline Backgrounds
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_BACKGROUND=''

# --> Right Prompt Backgrounds
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND=''
POWERLEVEL9K_TIME_BACKGROUND=''
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND=''
POWERLEVEL9K_STATUS_BACKGROUND=''
POWERLEVEL9K_CUSTOM_PROMPT_SPACE_BACKGROUND=''

# --> Right Prompt Foregrounds
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND='022'
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND="001"
POWERLEVEL9K_TIME_FOREGROUND='109'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="016"
POWERLEVEL9K_CUSTOM_PROMPT_SPACE_FOREGROUND=''
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=false

# --> Prompt Prefixes
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{08}╭─"
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="%F{08}\u251C\u2500"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{08}╰ "

# --> Add Newline Config
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# -->  Segment Separators
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
typeset POWERLEVEL9K_LEFT_PROMPT_SEGMENT_END_SYMBOL=''

# --> Subsegment Separators
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{250}%f'

# --> Zsh Auto Suggestions Color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23,bg=grey"

#────────────────────────────────────╮
#  ==> ==>  SOURCE CUSTOMS  <== <==
#───────────────────────────────────╯
for item in $(ls -1 ${DOT_TOOLS}/*.sh); do
	[ -e "${item}" ] && source "${item}"
done


#───────────────────────────────────────╮
# ==> ==> NEEDED AT END OF FILE <== <==
#──────────────────────────────────────╯
# --> Iterm2 shell integration
source ~/.iterm2_shell_integration.zsh

# --> zsh syntax highlighting
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

# --> Fuzzy finder
export BAT_CONFIG_PATH=" ~/.dotfiles/zsh/bat.conf"
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500" --height 90% --layout=reverse'
