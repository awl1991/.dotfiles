# ~/.zshrc - Zsh Configuration
# Theme: Powerlevel10k on top of Powerlevel9k
# Font: Custom Patched FiraCode

# === PATH Configuration ===
# Avoid duplicating PATH entries
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
typeset -U PATH  # Ensure PATH is unique

# === User Configuration ===
# Set default user for prompts
DEFAULT_USER=$USER

# === Conditional Theme/Configuration Loading ===
# Switch to Pure Theme for IDE-integrated terminals (e.g., VS Code, JetBrains)
if [[ "$TERM_PROGRAM" == "vscode" || "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
    source "/Users/$DEFAULT_USER/ide.zshrc"
else
    # === General Zsh Settings ===
    # Highlighting and corrections
    zle_highlight+=(paste:none)
    ENABLE_CORRECTION=true
    DISABLE_AUTO_TITLE=true

    # History settings
    HISTSIZE=1000
    SAVEHIST=1000
    HISTFILE=~/.zhistory
    DIRSTACKSIZE=20

    # Terminal and options
    TERM=xterm-256color
    setopt auto_cd
    setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS HIST_FIND_NO_DUPS
    setopt HIST_EXPIRE_DUPS_FIRST HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS
    setopt COMPLETE_IN_WORD NO_ALWAYS_TO_END

    # Disable Homebrew auto-updates for performance
    export HOMEBREW_NO_AUTO_UPDATE=1

    # === Directory and File Paths ===
    DOT="$HOME/.dotfiles/zsh"
    CUSTOMS="$HOME/.dotfiles/zsh/custom"
    ALIASES="$CUSTOMS/aliases"
    ZCOMPDUMP="$HOME/.ZCDump"
    ZPLUG="$HOME/.dotfiles/zsh/zplug"

    # === Completions Setup ===
    fpath=($HOME/.zplug/repos/zsh-users/zsh-completions/src $fpath)
    autoload -U compinit && compinit

    # Clean up old completion dump files
    if [ -z "$ZSH_COMPDUMP" ]; then
        ZSH_COMPDUMP="$ZCOMPDUMP/.zcdump_$[${RANDOM}%1000]"
    fi

    # === Plugin Management with Zplug ===
    unset ZPLUG_CACHE_CHECK_FOR_CHANGES
    source ~/.zplug/init.zsh

    # Install and load plugins
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
    zplug "mattmc3/zsh-safe-rm", from:github
    zplug "Valiev/almostontop", from:github
    zplug "bric3/nice-exit-code", from:github
    zplug "molovo/revolver", as:command, use:revolver, from:github
    zplug "mafredri/zsh-async", from:github, use:"async.zsh"

    # Load plugins
    zplug load

    # === Aliases and Custom Scripts ===
    # Source aliases
    [ -f "$ALIASES/aliases.sh" ] && source "$ALIASES/aliases.sh"

    # Source custom scripts dynamically
    for script in "$CUSTOMS"/*.sh; do
        [ -e "$script" ] && source "$script"
    done

    # === Powerlevel10k Theme Configuration ===
    # Transient prompt settings
    typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
    typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=2  # Success
    typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=1  # Error

    # Left Prompt Elements
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
        os_icon
        context
        newline
        dir
        vcs
    )

    # Right Prompt Elements
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
        status
        custom_wifi_signal
        time
        custom_prompt_space
        custom_battery_status
        newline
        custom_prompt_language
    )

    # Git Status Configuration
    typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
    typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
    typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
    typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1
    typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244
    typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

    # Directory and Lock Settings
    POWERLEVEL9K_DIR_SHOW_WRITABLE=true
    POWERLEVEL9K_DIR_LOCK_ICON=""

    # User and Root Icons
    POWERLEVEL9K_USER_ICON=" "
    POWERLEVEL9K_ROOT_ICON=''
    POWERLEVEL9K_USER_ROOT_BACKGROUND="52"

    # Segment and Subsegment Separators
    POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0bc'  # Use Unicode arrow (optional, adjust as needed)
    POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0ba'
    POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0b9'
    POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='%F{250}%f'

    # Remove default whitespace between segments
    POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=""
    POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=""

    # Left Prompt Styling
    POWERLEVEL9K_OS_ICON_FOREGROUND='242'
    POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='242'
    POWERLEVEL9K_OS_ICON_BACKGROUND='000'
    POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='240'
    POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='236'
    POWERLEVEL9K_VCS_BACKGROUND='016'

    # Directory Styling
    POWERLEVEL9K_DIR_HOME_BACKGROUND='23'
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='30'
    POWERLEVEL9K_DIR_PATH_SEPARATOR="/"

    # Right Prompt Styling
    POWERLEVEL9K_STATUS_OK_ICON="  "
    POWERLEVEL9K_STATUS_FAIL_ICON="  "
    POWERLEVEL9K_STATUS_VERBOSE=false
    POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
    POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
    POWERLEVEL9K_CUSTOM_BATTERY_STATUS="prompt_zsh_battery_level"
    POWERLEVEL9K_TIME_FORMAT="  %T "
    POWERLEVEL9K_TIME_ICON=""
    POWERLEVEL9K_CUSTOM_PROMPT_SPACE='prompt_space'

    # Custom Language Prompt
    POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE="prompt_language"
    POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_FOREGROUND='white'
    POWERLEVEL9K_CUSTOM_PROMPT_LANGUAGE_BACKGROUND=''

    # Backgrounds for Right Prompt
    POWERLEVEL9K_CUSTOM_BATTERY_STATUS_BACKGROUND=''
    POWERLEVEL9K_TIME_BACKGROUND=''
    POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND=''
    POWERLEVEL9K_STATUS_BACKGROUND=''
    POWERLEVEL9K_CUSTOM_PROMPT_SPACE_BACKGROUND=''

    # Foregrounds for Right Prompt
    POWERLEVEL9K_STATUS_OK_FOREGROUND='022'
    POWERLEVEL9K_STATUS_ERROR_FOREGROUND='001'
    POWERLEVEL9K_TIME_FOREGROUND='109'
    POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND='016'
    POWERLEVEL9K_DIR_PATH_HIGHLIGHT_BOLD=false

    # Prompt Prefixes and Newlines
    POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{08}╭─"
    POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="%F{08}├─"
    POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{08}╰ "
    POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true
    POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

    # === Additional Zsh Enhancements ===
    # Zsh Autosuggestions
    ZSH_AUTOSUGGEST_USE_ASYNC=true
    ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=23,bg=grey"

    # iTerm2 Shell Integration
    [ -f "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"

    # Zsh Syntax Highlighting
    typeset -gA ZSH_HIGHLIGHT_STYLES
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
    ZSH_HIGHLIGHT_STYLES=(
        default:015
        unknown-token:fg=009
        reserved-word:fg=006
        alias:fg=029
        builtin:fg=028
        function:fg=027
        command:fg=015
        precommand:fg=214,underline
        commandseparator:none
        hashed-command:fg=014
        path:fg=004
        globbing:fg=063
        history-expansion:fg=white,underline
        single-hyphen-option:fg=209
        double-hyphen-option:fg=209
        back-quoted-argument:fg=209
        single-quoted-argument:fg=063
        double-quoted-argument:fg=063
        dollar-double-quoted-argument:fg=138
        back-double-quoted-argument:fg=138
    )

    # === Fuzzy Finder (fzf) Configuration ===
    export BAT_CONFIG_PATH="$DOT/zsh/bat.conf"
    export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500" --height 90% --layout=reverse'
fi
