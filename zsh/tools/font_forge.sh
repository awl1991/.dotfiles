local fira='/Users/awl/nerd-fonts/src/unpatched-fonts/FiraCode/Retina/FiraCode-Retina.ttf'
local dotfont='/Users/awl/.dotfiles/fonts/'

forge_font() {
	$(echo fontforge -script '/Users/awl/nerd-fonts/font-patcher' -c $fira -out $dotfont)
	$(echo open $dotfont)
}

move_icons() {
	local glyphdir="/Users/awl/nerd-fonts/src/glyphs/"
	local oldfont="/Users/awl/nerd-fonts/src/glyphs/weathericons-regular-webfont.ttf"
	local newfont="/Users/awl/Desktop/AWL/Fonts/Weather Icons.ttf"
	local htmlfile="/Users/awl/Desktop/AWL/Fonts/Weather Icons.html"
	local rename="/Users/awl/nerd-fonts/src/glyphs/Weather Icons.ttf"
	local macfont="/Users/awl/Desktop/AWL/Fonts/Weather Icons Mac.ttf"
	# check if
	if [ ! -f $newfont ]
		then print -P "%F{01}  %F{14}No New Font in Directory %F{01}"
	else
		print -P $(rm "$oldfont")
		print -P '%F{07} 1. --> %F{14}...Removed old Icon Font %F{07}﯊ %F{10}'
		print -P $(mv "$newfont" "$glyphdir")
		print -P '%F{07} 2. --> %F{14}...Moved Icon Font to Source %F{07} %F{10}'
		print -P $(mv $rename $oldfont)
		print -P '%F{07} 3. --> %F{14}...Renamed New Font %F{07} %F{10}'
		print -P $(rm $macfont)
		print -P '%F{07} 4. --> %F{14}...Removed generated Mac Font %F{07}﯊ %F{10}'
	fi

	if [ ! -f $htmlfile ]
		then print -P '\n\n%F{07}-- >=> %F{14}Done %F{034}\n'
	else
		print -P $(rm $htmlfile)
		print -P '%F{07}5. --> %F{14}...Removed generated html file %F{07} %F{10}\n\n%F{07}-- >=> %F{14}Done %F{034}\n'
	fi
}
