vscode() {
	local nums='0-1-2-3-4-5-6-7-8-9'
    local subs='₀-₁-₂-₃-₄-₅-₆-₇-₈-₉'

	echo "%F{030} \ue37d $(code-insiders --status | grep -c '|  Window (~/' | tr $nums $subs)"

}
