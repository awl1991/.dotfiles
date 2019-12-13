vscode() {
	emulate -L zsh
	local nums='0-1-2-3-4-5-6-7-8-9'
    local subs='₀-₁-₂-₃-₄-₅-₆-₇-₈-₉'
	local ws="$(code-insiders --status | grep -c '|  Window (~/')"
	local ws_num=$(($ws>0))
	local vs_i=" \ue37d "

	if [ $ws_num = 1 ]
		then echo "%F{030}$vs_i$(echo $ws | tr $nums $subs)"
	else
		echo "%F{237}$vs_i "
	fi
}
functions -M vscode >/dev/null
