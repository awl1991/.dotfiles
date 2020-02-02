# --> Change folder icon based on directory






dir_icon() {
    local dir="${PWD##*/}"
    local bg=""
    local fg=""

    if [[ "${PWD##/Users/awl}" != "${PWD}" ]]; then
      bg="%K{23}"
      fg="%F{23}"
    else
      bg="%K{59}"
      fg="%F{59}"
    fi

    if [[ $(echo "$PWD" | tr '[:upper:]' '[:lower:]') == *desktop* ]]; then
      bg="%K{66}"
      fg="%F{66}"
    fi

    local icon="􀈖 "
    case $dir in
      "library")
        icon=""
      ;;
      "system")
        icon=" "
      ;;
      "applications")
        icon=" "
      ;;
      "awl")
        icon=" "
      ;;
      "downloads")
        icon=" "
      ;;
      "movies")
        icon="ﳜ "
      ;;
      "Users")
        icon=" "
      ;;
      "desktop")
        icon=" "
      ;;
      "public")
        icon="􀙲 "
      ;;
      "local")
        icon="ﲳ "
      ;;
      '')
       icon=" "
     ;;
    *)
  esac

  if [[ $(echo "$PWD" | tr '[:upper:]' '[:lower:]') == *'capital consultants'* ]]; then
    icon=" "
    bg="%K{30}"
    fg="%F{30}"
  fi

  if [[ $(echo "$PWD" | tr '[:upper:]' '[:lower:]') == *'peril'* ]]; then
    icon=" "
    bg="%K{06}"
    fg="%F{06}"
  fi

  if [[ $(echo "$PWD" | tr '[:upper:]' '[:lower:]') == *'caches'* ||  \
        $(echo "$PWD" | tr '[:upper:]' '[:lower:]') == *'.cache'*  \
     ]]; then
    icon="􀋨 "
    bg="%K{101}"
    fg="%F{101}"
  fi

  echo "$bg $icon %~ $fg%K{232}"
}
