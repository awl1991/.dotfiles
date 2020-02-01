export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#   ==> ==> ==> ZSH Theme <== <== <==   #
ZSH_THEME=powerlevel10k/powerlevel10k

# ==> ==> Font Pack <== <
POWERLEVEL9K_MODE='nerd-font'

# --> Globals
ENABLE_CORRECTION=true
DISABLE_AUTO_TITLE=true
zle_highlight+=(paste:none)
export HOMEBREW_NO_AUTO_UPDATE=3
local p="$(date '+%p')"
p=$(echo "$p" | sed -e 's/AM/ᴀᴍ/' -e 's/PM/ᴘᴍ/')
local time_format="$(date '+%-I:%M')"
local string="$PWD"

# ===> Truncation
POWERLEVEL9K_SHORTEN_DELIMITER="%F{023} %f"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last

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

# Zsh-autosuggestions config
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# --> Terminal Defaults
TERM=xterm-256color
DEFAULT_USER=$USER

# --> .zcompdump config
if [ -z "$ZSH_COMPDUMP" ]; then
	ZSH_COMPDUMP="$ZCOMPDUMP/.zcdump_$[${RANDOM}%1000]"
fi

# --> Zsh plugins
plugins+=(
	zsh_reload
	copyfile
	zsh-completions
	zsh-safe-rm
	zsh-syntax-highlighting
	zsh-history-substring-search
	zsh-autosuggestions
	jsontools
	screen
	colorize
	iterm2
	almostontop
	nice-exit-code
	z
)

# <==*=<< Left Prompt <==*=<<
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	os_icon
#   ~~> ~~> VSCode <~~ <~~
#	custom_vscode
	context
	newline
	dir
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

# --> Transient prompt config
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='%F{02} %f'

# --> Show lock if directory is !writable
POWERLEVEL9K_DIR_SHOW_WRITABLE="true"
POWERLEVEL9K_DIR_LOCK_ICON=""

# --> User icon
POWERLEVEL9K_USER_ICON=" "

# --> User context
POWERLEVEL9K_ROOT_ICON=''
POWERLEVEL9K_USER_ROOT_BACKGROUND="52"

# --> Remove Left Segment Default Whitespace
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=' '
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=''

# --> Left Icons
POWERLEVEL9K_APPLE_ICON=' %F{07} %f'
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf823"
typeset -g POWERLEVEL9K_CUSTOM_VSCODE="vscode"

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
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION='%F{0}~'
POWERLEVEL9K_HOME_ICON="%K{23} "
POWERLEVEL9K_HOME_SUB_ICON='%F{023}\ue32c '
POWERLEVEL9K_FOLDER_ICON=' \ue32c '
POWERLEVEL9K_ETC_ICON='  '
POWERLEVEL9K_DIR_PATH_SEPARATOR="/"

# --> Left Newline Backgrounds
POWERLEVEL9K_DIR_HOME_BACKGROUND='23'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='30'

# Left Newline Foregrounds
POWERLEVEL9K_DIR_HOME_FOREGROUND='0'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='22'
POWERLEVEL9K_DIR_PATH_SEPARATOR_FOREGROUND="234"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="23"

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
POWERLEVEL9K_STATUS_OK_FOREGROUND='022'
POWERLEVEL9K_STATUS_FAIL_FOREGROUND="001"
POWERLEVEL9K_TIME_FOREGROUND='109'
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="016"
POWERLEVEL9K_CUSTOM_PROMPT_SPACE_FOREGROUND='white'
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
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

# --> Subsegment Separators
typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{250}%f'

# --> Zsh Auto Suggestions Color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23,bg=grey"

#────────────────────────────────────╮
#  ==> ==> FUNCTION SEGMENTS <== <==
#───────────────────────────────────╯
# --> Custom WiFi function
source $DOT_TOOLS/wifi.sh

# --> Custom battery function
source $DOT_TOOLS/battery.sh

# --> Display available disk space
source $DOT_TOOLS/disk_space.sh

# --> Contextual icons
source $DOT_TOOLS/context_files.sh

# --> Vscode windows open  ~~> ~~> VSCode <~~ <~~
# source $DOT_TOOLS/vscode.sh

#───────────────────────────────────╮
#  ==> ==> USEFUL COMMANDS <== <==
#──────────────────────────────────╯
# --> Output $PWD
source $DOT_TOOLS/echo_path.sh

# --> Extra line after command
source $DOT_TOOLS/newline.sh

# --> Show color palette
source $DOT_TOOLS/showcolors.sh

# --> Fix permission for directory
source $DOT_TOOLS/permission.sh

# --> Create custom glyph palette
source $DOT_TOOLS/font_forge.sh

# --> Colorls shortcuts
source $DOT_TOOLS/colorls_shortcuts.sh

# --> Tab title
source $DOT_TOOLS/tab_title.sh

# -> K eadable directory listings
source $DOT_TOOLS/k.sh

# --> colorls tab completion
source $(dirname $(gem which colorls))/tab_complete.sh

#═════════════════════════╗
# ==> ==> ALIASES <== <==
#════════════════════════╝
source $ALIASES/aliases.sh

#───────────────────────────────────────╮
# ==> ==> NEEDED AT END OF FILE <== <==
#──────────────────────────────────────╯
# --> Oh My Zsh
source $ZSH/oh-my-zsh.sh

# --> Iterm2 shell integration
source ~/.iterm2_shell_integration.zsh

# --> Zsh-async
source $ZSH_CUSTOM/plugins/zsh-async/async.zsh

# --> z
. $ZSH/plugins/z/z.sh

# --> Iterm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# --> zsh syntax highlighting
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=015
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
