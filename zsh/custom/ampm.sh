local p="$(date '+%p')"
local time_format="$(date '+%-I:%M')"

p=$(echo "$p" | sed -e 's/AM/ᴀᴍ/' -e 's/PM/ᴘᴍ/')
