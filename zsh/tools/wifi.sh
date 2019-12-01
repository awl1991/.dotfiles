# --> Custom WiFi function
zsh_wifi_signal(){
  local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)
  local signal=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep CtlRSSI | awk '{print $2}')
  local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

  if [ "$airport" = "Off" ]; then
          local officon='\uf057'
          local color='%F{239}'
          echo "%{$color%}$officon"                                                 # [ WIFI OFF ]
  else
          local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')       # [ WiFi Name ]
          local bssid=$(echo $output | grep ' BSSID' | awk -F': ' '{print $2}')
          local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}') # [ Wifi Speed ]
          local channel=$(echo $output | grep ' channel' | awk -F': ' '{print $2}') # [ Wifi TYPE ]
          local icon=''
          local color='%F{yellow}'                                                  # [ WIFI NAME COLOR ]
          local tcolor=''                                                           # [ ICON COLOR ]

          [[ $ssid ]] && icon='\uf424  '                                             # [ HOME WIFI ]
          [[ $channel = '6' || $channel = '1' ]] && icon='\uf838'                   # [ HOTSPOT ]
          [[ $bssid = 'c6:52:61:59:8b:33' ]] && icon=''
          [[ $bssid = 'c6:52:61:59:8b:33' ]] && ssid='\uf968Home'
          [[ $signal -gt -60 ]] && color='%F{2}' && tcolor='%F{2}'                   # [ WiFi FAST ]
          [[ $signal -lt -70 ]] && color='%F{10}' && tcolor='%F{059}'                # [ WiFi SLOW ]

          echo -n "%{$tcolor%} $icon%{$color%}$ssid "                                 # [ WIFI ON ]
  fi
}
