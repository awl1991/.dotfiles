# --> Display icons based on certain file extensions in directory
prompt_language() {
    local vscode='' docker='' react='' node=''
    npm=''    git=''   vim='' tmux='' zshrc=''

    local bin="%F{001}%{\e[5m%}\ufb27%f"
    term="%F{006}\uf489%f" icon=''

    local args=(
        '\.zshrc \b' '\.tmux.conf \b' '.vimrc \b' 'package.json'
        '\.vscode \b' 'node_modules \b' '\.js \b' '\.json \b'
        '\.html \b' '\.css \b' '\.scss \b' '\.php \b' 'less.js \b'
        'less \b' '\.py \b' '\.tsx \b' '\.c \b' '\.cpp \b' '\.java \b'
        '\.dart \b' '\.lhs' '\.MD' '\.mysql' '\.rbw' 'require.js' '\.rs'
        '\.txt \b' 'sqlite \b' '\.swift \b' '\.expo \b' 'dockerfile \b'
        'docker-compose.yml \b' '.gitignore \b' '\.db \b' '\.app \b'
        '\.dylib \b' 'yarn.lock \b'
    )

    local icons=(
        "%F{04}ⓩ" "%F{026}ⓣ" "%F{064}" "%F{244}" "%F{045}﬏"
        "%F{064}" "%F{142}" "%F{244}" "%F{244}ﬥ" "%F{009}"
        "%F{026}" "%F{133}" "%F{061}" "%F{051}" "%F{051}"
        "%F{024}" "%F{032}ﯤ" "%F{012}" "%F{010}ﭱ" "%F{124}"
        "%F{029}" "%F{130}" "%F{240}" "%F{025}" "%F{160}"
        "%F{184}" "%F{058}" "%F{007}" "%F{080}" "%F{202}"
        "%F{074}ﰆ" "%F{039}" "%F{039}" "%F{166}" "%F{230}"
        "%F{004}" "%F{250}" "%F{244}"
    )

    local pattern=$(echo ${args[@]} | tr " " "|")

     for file in $(ls -a | grep -iEo $pattern | less | sort -u);
        do
            [[ $file = '.vscode' && $PWD != '/Users/awl' ]]            && vscode="  %F{045}\ue70c%f"
            [[ $file = 'node_modules' ]]                               && node="  %F{064}\uf2b8%f"
            [[ $file = '.expo' && $PWD != '/Users/awl' ]]              && react="  %F{074}\ufc06%f"
            [[ $file = '.gitignore' ]]                                 && git="  %F{166}\uf113%f"
            [[ $file = 'dockerfile' || $file = 'docker-compose.yml' ]] && docker="  %F{039}\uf308%f"
            [[ $file = '.js' ]]                                        && icon="${icon}  %F{142}\uf81d%f"
            [[ $file = 'require.js' ]]                                 && icon="${icon}  %F{184}\ue770%f"
            [[ $file = '.json' ]]                                      && icon="${icon}  %F{244}\ufb25%f"
            [[ $file = 'package.json' || $file = 'yarn.lock' ]]                && npm="  %F{112}\uf898%f"
            [[ $file = '.php' ]]                                       && icon="${icon}  %F{061}\uf81e%f"
            [[ $file = '.css' ]]                                       && icon="${icon}  %F{026}\ue749%f"
            [[ $file = '.scss' ]]                                      && icon="${icon}  %F{133}\ue74b%f"
            [[ $file = 'less.js' ]]                                    && icon="${icon}  %F{051}\ue758%f"
            [[ $file = 'less' ]]                                       && icon="${icon}  %F{024}\ue758%f"
            [[ $file = '.html' ]]                                      && icon="${icon}  %F{009}\uf13b%f"
            [[ $file = '.py' ]]                                        && icon="${icon}  %F{024}\ue606%f"
            [[ $file = '.tsx' ]]                                       && icon="${icon}  %F{032}\ufbe4%f"
            # [[ $file = '.c' ]]                                       && icon="${icon}  %F{012}\ue61e%f"
            [[ $file = '.cpp' ]]                                       && icon="${icon}  %F{010}\ufb71%f"
            [[ $file = '.java' ]]                                      && icon="${icon}  %F{124}\ue256%f"
            [[ $file = '.rbw' ]]                                       && icon="${icon}  %F{160}\ue739%f"
            [[ $file = '.lhs' ]]                                       && icon="${icon}  %F{130}\ue777%f"
            [[ $file = '.dart' ]]                                      && icon="${icon}  %F{029}\ue798%f"
            [[ $file = '.swift' ]]                                     && icon="${icon}  %F{202}\ue755%f"
            [[ $file = '.MD' ]]                                        && icon="${icon}  %F{240}\uf48a%f"
            [[ $file = '.mysql' ]]                                     && icon="${icon}  %F{025}\ue704"
            [[ $file = '.rs' ]]                                        && icon="${icon}  %F{058}\ue7a8%f"
            [[ $file = '.txt' ]]                                       && icon="${icon}  %F{007}\uf89d%f"
            [[ $file = 'sqlite' ]]                                     && icon="${icon}  %F{80}\ue7c4%f"
            [[ $file = '.db' ]]                                        && icon="${icon}  %F{230}\ue706%f"
            [[ $file = '.vimrc' ]]                                     && vim="  %F{64}\ue7c5%f"
            [[ $file = '.tmux.conf' ]]                                 && tmux="%F{026}  ⓣ%f"
            [[ $file = '.app' ]]                                       && icon="  %F{004}\ue713%f"
            [[ $file = '.dylib' ]]                                     && icon="  %F{014}\uf302%f"
            [[ $file = '.zshrc' ]]                                     && zshrc="  %F{004}ⓩ%f"
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

        if [ "$vim" != '' ]; then
            icon="$vim${icon}"
        fi

        if [ "$tmux" != '' ]; then
            icon="$tmux${icon}"
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



    # echo "$icon%F{240}"
