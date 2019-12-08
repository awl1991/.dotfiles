export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# ==> ==> ==> ZSH Theme <== <== <== #
ZSH_THEME=powerlevel10k/powerlevel10k

# ==> ==> Font Pack <== <
POWERLEVEL9K_MODE='nerd-font'

# --> Globals
ENABLE_CORRECTION=true
DISABLE_AUTO_TITLE=true
zle_highlight+=(paste:none)
export HOMEBREW_NO_AUTO_UPDATE=1
local p="$(date '+%p')"
	  p=$(echo "$p" | sed -e 's/AM/ᴀᴍ/' -e 's/PM/ᴘᴍ/')
local time_format="$(date '+%-I:%M')"

# Zsh-autosuggestions config
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# --> Terminal Defaults
TERM=xterm-256color
POWERLEVEL9K_IGNORE_TERM_LANG=false
POWERLEVEL9K_IGNORE_TERM_COLORS=false
POWERLEVEL9K_IGNORE_TERM_COLORS=true
DEFAULT_USER=$USER

# --> Path shortcuts
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
MY_ZSH="$HOME/.dotfiles/zsh"
MY_ZSH_TOOLS="$MY_ZSH/tools"
ALIASES="$MY_ZSH_TOOLS/aliases"

# --> Completions path
fpath=($HOME/zsh-completions/src $fpath)

# --> Initialize completions
autoload -U compinit && compinit

# --> Zsh plugins
plugins=(
 osx
 zsh-nvm
 cd-reminder
 zsh_reload
 macos
 copyfile
 zsh-completions
 zsh-safe-rm
 zsh-syntax-highlighting
 zsh-history-substring-search
 zsh-autosuggestions
 jsontools
 web-search
#  npm
 screen
 colorize
 iterm2
 almostontop
 nice-exit-code
 z
 k
)

# <==*=<< Left Prompt <==*=<<
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
 os_icon
 custom_vscode
 context
 newline
 dir
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
source $MY_ZSH_TOOLS/git-prompt.sh
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244
typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=same-dir

# --> Path display
POWERLEVEL9K_SHORTEN_DIR_LENGTH='3'
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

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
POWERLEVEL9K_APPLE_ICON=' '
POWERLEVEL9K_CONTEXT_TEMPLATE="\uf823"
POWERLEVEL9K_CUSTOM_VSCODE="vscode"

# --> Left Foregrounds
POWERLEVEL9K_OS_ICON_FOREGROUND='242'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='242'
POWERLEVEL9K_CUSTOM_VSCODE_FOREGROUND="237"

# --> Left Backgrounds
POWERLEVEL9K_OS_ICON_BACKGROUND='000'
POWERLEVEL9K_CUSTOM_VSCODE_BACKGROUND="0"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='240'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='236'
POWERLEVEL9K_VCS_BACKGROUND="016"

# --> Left Newline Icons
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION="%F{000}~"
local home_i="\ue31f" #
POWERLEVEL9K_HOME_ICON="%K{23} /$home_i  "
POWERLEVEL9K_HOME_SUB_ICON='%F{023} \ue32c %f'
POWERLEVEL9K_FOLDER_ICON=' \ue32c '
POWERLEVEL9K_ETC_ICON='  '
POWERLEVEL9K_DIR_PATH_SEPARATOR=""

# --> Left Newline Backgrounds
POWERLEVEL9K_DIR_HOME_BACKGROUND='23'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='30'

# Left Newline Foregrounds
POWERLEVEL9K_DIR_HOME_FOREGROUND='0'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='22'

# --> Right Prompt Icons
POWERLEVEL9K_STATUS_OK_ICON="  "
POWERLEVEL9K_STATUS_FAIL_ICON="  "
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"
POWERLEVEL9K_TIME_FORMAT="  $time_format$p "
POWERLEVEL9K_TIME_ICON=''

# --> Right Prompt Backgrounds
POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND=''
POWERLEVEL9K_TIME_BACKGROUND=''
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND=''
POWERLEVEL9K_STATUS_BACKGROUND=''


# --> Right Prompt Foregrounds
POWERLEVEL9K_STATUS_OK_FOREGROUND='022'
POWERLEVEL9K_STATUS_FAIL_FOREGROUND="001"
POWERLEVEL9K_TIME_FOREGROUND='109'

# --> Prompt Prefixes
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{015}╭─"
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="%F{015}\u251C\u2500"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{015}╰ "

# --> Add Newline Config
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# -->  Segment Separators

POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''

# --> Subsegment Separators
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{250}%f'

# --> Zsh Auto Suggestions Color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23,bg=grey"
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND="016"
POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=false
POWERLEVEL9K_DIR_PATH_SEPARATOR_FOREGROUND="234"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="23"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="237"
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE="prompt_language"
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_BACKGROUND=''
POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_FOREGROUND='white'
POWERLEVEL9K_CUSTOM_PROMPT_SPACE='prompt_space'
POWERLEVEL9K_CUSTOM_PROMPT_SPACE_BACKGROUND=''
POWERLEVEL9K_CUSTOM_PROMPT_SPACE_FOREGROUND='white'



# ----------------------------------------------- #
#        ==> ==> FUNCTION SEGMENTS <== <==        #
# ----------------------------------------------- #
source ~/.bash_profile
# --> Custom WiFi function
source $MY_ZSH_TOOLS/wifi.sh
# --> Custom battery function
source $MY_ZSH_TOOLS/battery.sh
# --> Display available disk space
source $MY_ZSH_TOOLS/disk_space.sh
# --> Display icons based on directory context
source $MY_ZSH_TOOLS/context_files.sh
# --> Vscode windows open
source $MY_ZSH_TOOLS/vscode.sh

# -----------------------------------------#
#     ==> ==> USEFUL COMMANDS <== <==      #
# -----------------------------------------#
# --> Output $PWD upon entering a directory
source $MY_ZSH_TOOLS/echo_path.sh
# --> Extra line after command
source $MY_ZSH_TOOLS/newline.sh
# --> colorls shortcuts
source $MY_ZSH_TOOLS/colorls_shortcuts.sh
# --> Show color palette
source $MY_ZSH_TOOLS/showcolors.sh
# --> Fix permission for directory
source $MY_ZSH_TOOLS/permission.sh
# --> Create custom glyph palette
source $MY_ZSH_TOOLS/font_forge.sh
# --> Colorls tab completion
source $(dirname $(gem which colorls))/tab_complete.sh

# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
#      ==> ==> ALIASES <== <==     #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
source $ALIASES/aliases.sh

# -----------------------------------------#
#  ==> ==> NEEDED AT END OF FILE <== <==   #
# ---------------------------------------- #
# --> P10K
source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme
# --> Oh My Zsh
source $ZSH/oh-my-zsh.sh
# --> Iterm2 shell integration
source ~/.iterm2_shell_integration.zsh
# --> Zsh-async
source $ZSH_CUSTOM/plugins/zsh-async/async.zsh
# --> z
. $ZSH/plugins/z/z.sh
# --> Zsh-syntax-highlighting config
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
# ==> MUST BE FINAL SOURCE -- Zsh-syntax-highlighting <== #
source /Users/awl/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
