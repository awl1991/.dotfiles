# --> Display available disk space
prompt_space(){
  local disk_space=$(df -H / | grep '/$' | awk '{print $4}')
  local color="%F{058}"
  local icon=""
  local space="$(echo ${disk_space} | sed 's/[^0-9]*//g')"
  local indicator="ɢʙ"
  echo -e " ${color}${icon} ${space}${indicator} "
}
