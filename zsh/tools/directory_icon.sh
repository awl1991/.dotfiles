# --> Change folder icon based on directory
prompt_folder(){
  local icon=''
  local sep='\uE0B0'
  local bg=''
  local sbg=''
  local path=`pwd | awk '{print tolower($0)}'`
  local p=`$path | awk '{print tolower($0)}'`

    [[ $path = "/" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/library" ]] && icon="" && bg="" && sbg=""
    [[ $past = "/applications" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/system" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER" ]] && icon="\uf7c9" && bg="058" && sbg="30"
    [[ $path = "/users/$USER/applications" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/downloads" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/movies" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/pictures" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/music" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/public" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/desktop" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/desktop/awl" ]] && icon="" && bg="" && sbg=""
    [[ $path = "/users/$USER/rcvpro" ]] && icon="" && bg="" && sbg=""

  segment="%K{$bg} %F{$bg}%K{$sbg} $sep"

  echo $segment

# %K{23} \uf015 %F{23}%K{30}\uE0B0

}
