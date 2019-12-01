# --> Custom battery function
prompt_zsh_battery_level() {
  local percentage1=`pmset -g ps | sed -n 's/.*[[:blank:]]+*\(.*%\).*/\1/p'`
  local percentage=`echo "${percentage1//\%}"`
  local color='%F{red}'
  local symbol='\uf00d'
  local charging=''
  pmset -g ps | grep "discharging" > /dev/null
  if [ $? -eq 0 ]; then
    charging="false";
  else
    charging="true";
  fi
  if [ $percentage -le 20 ]
  then symbol='\uf244' ; color='%F{red}' ;
    #10%
  elif [ $percentage -gt 19 ] && [ $percentage -le 30 ]
  then symbol="\uf243" ; color='%F{red}' ;
    #20%
  elif [ $percentage -gt 29 ] && [ $percentage -le 40 ]
  then symbol="\uf243" ; color='%F{yellow}' ;
    #35%
  elif [ $percentage -gt 39 ] && [ $percentage -le 50 ]
  then symbol="\uf243" ; color='%F{216}' ;
    #45%
  elif [ $percentage -gt 49 ] && [ $percentage -le 60 ]
  then symbol="\uf242" ; color='%F{216}' ;
    #55%
  elif [ $percentage -gt 59 ] && [ $percentage -le 70 ]
  then symbol="\uf241" ; color='%F{blue}' ;
    #65%
  elif [ $percentage -gt 69 ] && [ $percentage -le 80 ]
  then symbol="\uf241" ; color='%F{71}' ;
    #75%
  elif [ $percentage -gt 79 ] && [ $percentage -le 90 ]
  then symbol="\uf241" ; color='%F{71}' ;
    #85%
  elif [ $percentage -gt 89 ] && [ $percentage -le 100 ]
  then symbol="\uf240" ; color='%F{71}' ;
    #85%
  elif [ $percentage = 100 ]
  then symbol="\uf240p" ; color='%F{71}' ;
    #100%
  fi
  [[ $charging = "true" ]] && color='%F{143}' && symbol='\uf242'
  [[ $charging = "true" && $percentage = 100 ]] && color='%F{green}' && symbol="\uf240"
  echo -n " %{$color%}${symbol} " ;
}
