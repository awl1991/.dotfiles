# --> Display icons based on certain file extensions in directory
prompt_language() {

    local vscode='' docker='' react='' node=''
          npm='' git='' vim='' tmux='' zshrc=''

    local bin="%F{001}%{\e[5m%}\ufb27%f"
          term="%F{006}\uf489%f" icon=''

    local args=(
        '\.zshrc' '\.tmux.conf' '.vimrc' 'package.json'
        '\.vscode' 'node_modules' '\.js' '\.json' '\.html'
        '\.css' '\.scss' '\.php' 'less.js' 'less' '\.py'
        '\.tsx' '\.html' '\.c' '\.cpp' '\.java' '\.dart'
        '\.lhs' '\.MD' '\.mysql' '\.rbw' 'require.js' '\.rs'
        '\.txt' 'sqlite' '\.swift' '\.expo' 'dockerfile'
        'docker-compose.yml' '.gitignore' '\.db' '\.app'
        '\.dylib'
    )
    local pattern=$(echo ${args[@]} | tr " " "|")

    for file in $(ls -a | grep -iEo $pattern | less | sort -u);
        do
        if
            [[ $file = '.vscode' && $PWD != '/Users/awl' ]] && vscode="  %F{045}\ue70c%f"
            [[ $file = 'node_modules' ]] && node="  %F{064}\uf898%f"
            [[ $file = '.expo' && $PWD != '/Users/awl' ]] && react="  %F{074}\ufc06%f"
            [[ $file = '.gitignore' ]] && git="  %F{166}\uf113%f"
            [[
            $file = 'dockerfile' ||
            $file = 'docker-compose.yml'
            ]] && docker="  %F{039}\uf308%f"
            [[ $file = '.js' ]] && icon="${icon}  %F{142}\uf81d%f"
            [[ $file = 'require.js' ]] && icon="${icon}  %F{184}\ue770%f"
            [[ $file = '.json' ]] && icon="${icon}  %F{244}\ufb25%f"
            [[ $file = 'package.json' ]] && npm="  %F{124}\ue71e%f"
            [[ $file = '.php' ]] && icon="${icon}  %F{061}\uf81e%f"
            [[ $file = '.css' ]] && icon="${icon}  %F{026}\ue749%f"
            [[ $file = '.scss' ]] && icon="${icon}  %F{133}\ue74b%f"
            [[ $file = 'less.js' ]] && icon="${icon}  %F{051}\ue758%f"
            [[ $file = 'less' ]] && icon="${icon}  %F{024}\ue758%f"
            [[ $file = '.html' ]] && icon="${icon}  %F{009}\uf13b%f"
            [[ $file = '.py' ]] && icon="${icon}  %F{024}\uf81f%f"
            [[ $file = '.tsx' ]] && icon="${icon}  %F{032}\ufbe4%f"
            # [[ $file = '.c' ]] && icon="${icon}  %F{012}\ue61e%f"
            [[ $file = '.cpp' ]] && icon="${icon}  %F{010}\ufb71%f"
            [[ $file = '.java' ]] && icon="${icon}  %F{124}\ue256%f"
            [[ $file = '.rbw' ]] && icon="${icon}  %F{160}\ue739%f"
            [[ $file = '.lhs' ]] && icon="${icon}  %F{130}\ue777%f"
            [[ $file = '.dart' ]] && icon="${icon}  %F{029}\ue798%f"
            [[ $file = '.swift' ]] && icon="${icon}  %F{202}\ue755%f"
            [[ $file = '.MD' ]] && icon="${icon}  %F{240}\uf48a%f"
            [[ $file = '.mysql' ]] && icon="${icon}  %F{025}\ue704"
            [[ $file = '.rs' ]] && icon="${icon}  %F{058}\ue7a8%f"
            [[ $file = '.txt' ]] && icon="${icon}  %F{007}\uf89d%f"
            [[ $file = 'sqlite' ]] && icon="${icon}  %F{80}\ue7c4%f"
            [[ $file = '.db' ]] && icon="${icon}  %F{230}\ue706%f"
            [[ $file = '.vimrc' ]] && vim="  %F{64}\ue62b%f"
            [[ $file = '.tmux.conf' ]] && tmux=" %F{026} \uf0db%f"
            [[ $file = '.app' ]] && icon="  %F{004}\ue713%f"
            [[ $file = '.dylib' ]] && icon="  %F{014}\uf302%f"
            [[ $file = '.zshrc' ]] && zshrc="  %F{004}\uf489%f"
        done

        if [ $PWD = '/bin' ]; then
            icon="$bin"
        fi

        if [ "$react" != '' ]; then
            icon="$react${icon}"
        fi

        if [ "$npm" != '' ]; then
            icon="$npm${icon}"
        fi

        if [ "$node" != '' ]; then
            icon="$node${icon}"
        fi

        if [ "$git" != '' ]; then
            icon="$git${icon}"
        fi

        if [ "$docker" != '' ]; then
            icon="$docker${icon}"
        fi

        if [ "$vscode" != '' ]; then
            icon="$vscode${icon}"
        fi

        if [ "$tmux" != '' ]; then
            icon="$tmux${icon}"
        fi

        if [ "$vim" != '' ]; then
            icon="$vim${icon}"
        fi

        if [ "$zshrc" != '' ]; then
            icon="$zshrc${icon}"
        fi

        if [ "$icon" != '' ]; then
            icon="$icon"
        else
            icon="$term"
        fi
    echo "$icon"
}


# local icons=(
    #     "%F{004}\uf489%f" "%F{026}\uf0db%f" "%F{64}\ue62b%f" "%F{244}\ufb25%f"
    #     "%F{045}\ue70c%f" "%F{064}\uf898%f" "%F{142}\uf81d%f" "%F{244}\ufb25%f" "%F{009}\uf13b%f"
    #     "%F{026}\ue749%f" "%F{133}\ue74b%f" "%F{061}\uf81e%f" "%F{051}\ue758%f" "%F{051}\ue758%f" "%F{024}\uf81f%f"
    #     "%F{032}\ufbe4%f" "\.html" "%F{012}\ue61e%f" "%F{010}\ufb71%f" "%F{124}\ue256%f" "%F{029}\ue798%f"
    #     "%F{130}\ue777%f" "%F{240}\uf48a%f" "%F{025}\ue704" "%F{160}\ue739%f" "%F{184}\ue770%f" "%F{058}\ue7a8%f"
    #     "%F{007}\uf89d%f" "%F{80}\ue7c4%f" "%F{202}\ue755%f" "%F{074}\ufc06%f" "%F{039}\uf308%f"
    #     "%F{039}\uf308%f" "%F{166}\uf113%f" "%F{230}\ue706%f" "%F{004}\ue713%f"
    #     "%F{014}\uf302%f"
    # )
