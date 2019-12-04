# --> Battery segment
prompt_zsh_battery_level() {
  local percentage1=`pmset -g ps | sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local color='%F{red}'
  local symbol='\uf00d'
  local charging=''
  pmset -g ps | grep "discharging" > /dev/null

  # check if charging
  if [ $? -eq 0 ]; then
    charging="false"
  else
    charging="true"
  fi

  # ==> check battery percentage
  if [ $percentage -le 20 ]
  then symbol='􀛪' ; color='%F{red}'
    # == 10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="􀛩" ; color='%F{red}'
    # == 20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="􀛩" ; color='%F{yellow}'
    # == 35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="􀛩" ; color='%F{216}'
    # == 45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="􀛩" ; color='%F{216}'
    # == 55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="􀛨" ; color='%F{blue}'
    # == 65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="􀛨" ; color='%F{71}'
    # == 75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="􀛨" ; color='%F{71}'
    # == 85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 100 ]
  then symbol="􀛨" ; color='%F{71}'
    # == 85%
  elif [ $percentage = 100 ]
  then symbol="􀛨" ; color='%F{71}'
    # == 100%
  fi

    # ~~> device charging
  [[ $charging = "true" ]] && color='%F{143}' && symbol='\uf0e7 \uf242'
    # ~~> fully charged
  [[ $charging = "true" && $percentage = 100 ]] && color='%F{green}' && symbol="􀛨"

  # >=> display <=< #
  echo -n " %{$color%}${symbol} "
}
