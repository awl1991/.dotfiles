# --> Custom WiFi function
zsh_wifi_signal(){
  # get OSX wifi info from airport
  local  output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)
  local  signal=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep CtlRSSI | awk '{print $2}')
  local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

  if [ "$airport" = "Off" ]; then
          # setting if wifi is off
          local officon=' \uf057 '
          local   color='%F{239}'
          echo "%{$color%}$officon"
  else
          # network info
          local       ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
          local     bssid=$(echo $output | grep ' BSSID' | awk -F': ' '{print $2}')
          local     speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
          local   channel=$(echo $output | grep ' channel' | awk -F': ' '{print $2}')

          # styling
          local   icon=''
          local  color='%F{yellow}'
          local tcolor=''

          [[ $ssid ]] && icon='\uf424  '
          [[ $channel = '6' || $channel = '1' ]]  && icon='\uf838 '
          [[ $ssid = '==> AWL Home <==' ]]      && icon=''
          [[ $ssid = '==> AWL Home <==' ]]      && ssid='  '
          [[ $signal -gt -60 ]] && color='%F{2}'  && tcolor='%F{2}'
          [[ $signal -lt -70 ]] && color='%F{10}' && tcolor='%F{059}'

        echo "%{$tcolor%} $icon%{$color%}$ssid  "
  fi
}
