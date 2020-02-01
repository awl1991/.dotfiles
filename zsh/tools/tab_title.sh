# --> Custom tab titles

precmd () {
	local slash=""
	[[ $(ls -ld | awk '{print $3}') == 'root' ]] && slash=" 􀎡"
	print -Pn "\e]0; 𝄄  %n  𝄄  %1~$slash \a"
}


preexec () {
	local slash=""
	[[ $(ls -ld | awk '{print $3}') == 'root' ]] && slash=" 􀎡"
	print -Pn "\e]0; 𝄄  %n  𝄄  %1~$slash  𝄄  􀜟 $1 \a"
}
