# --> Output $PWD upon entering a directory
function chpwd() {
   local icon
   if [[ "${PWD##/Users/awl}" != "${PWD}" ]]; then
      icon='~  %F{236}╶┬╴'
      else icon='/  %F{236}╶┐ '
   fi
   local space='     '
   local dirs=$(ls -b1A -l | grep -c "^d")
   local files=$(ls -b1A -l | grep -c "^-")
   local nums='0-1-2-3-4-5-6-7-8-9'
   local subs='₀-₁-₂-₃-₄-₅-₆-₇-₈-₉'

   print -P "%F{244}$icon%f%f%F{244}${PWD##*/}%f\n$space%F{236}├╴%f%F{240}%f %F{242}$(echo $dirs | tr $nums $subs)%F{236}\n$space%F{236}└╴%f%F{240}%f %F{242}$(echo $files | tr $nums $subs)%f"
}
