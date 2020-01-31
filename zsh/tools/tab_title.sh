	local slash=""

	[[ $(ls -ld | awk '{print $3}') == 'root' ]] && slash=" 􀎡"
	[[ $PWD == "/Users/awl" ]] && slash="/"


	precmd () {

		print -Pn "\e]0;⋮  %n  ⋮  %1~$slash\a"

	}


	preexec () {

		print -Pn "\e]0;⋮  %n  ⋮  %1~$slash 􀜟 $1\a"

	}
