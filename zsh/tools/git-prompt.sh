function my_git_formatter() {
    emulate -L zsh

    # ==> Use $P9K_CONTENT if !empty
    if [[ -n $P9K_CONTENT ]]; then
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    # >=> Foregrounds
    if (( $1 )); then
      # -> Normal status
      local          end='%f'  # ~> default  fg
      local      clean='%021F'  # ~> green    fg
      local   modified='%006F'  # ~> yellow   fg
      local   untracked='%39F'  # ~> blue     fg
      local conflicted='%196F'  # ~> red      fg
      local       grey='%243F'  # ~> grey     fg
      local      green='%028F'  # ~> green    fg
      local   gitcolor='%056F'  # ~> git      fg
    else
      # -> Stale/incomplete status
      local       end='%244F'  # ~> grey     fg
      local      clean='%244F'  # ~> grey     fg
      local   modified='%244F'  # ~> grey     fg
      local  untracked='%019F'  # ~> grey     fg
      local conflicted='%001F'  # ~> grey     fg
    fi

    # ==> Custom additions
    local        space=' '
    local         nums='0-1-2-3-4-5-6-7-8-9'
    local         subs='₀-₁-₂-₃-₄-₅-₆-₇-₈-₉'
    local    divider_i="${grey}⦚${end}"
    local        git_i="${gitcolor}ﯙ"
    local     branch_i="${clean}$(echo '\uf418')"
    local     staged_i="ﰖ"
    local   unstaged_i=""
    local  untracked_i="﬒"
    local   conflict_i=""
    # ==> Vcs info
    local   res
    local where

    # >=> Change branch indicator if master
    if [ $VCS_STATUS_LOCAL_BRANCH = 'master' ]; then
      branch_i="${clean}$(echo '\uf6a4')"
    fi

    ### ~~> >=> >=> Add segments from PK9 <=< <=< <~~ ###
    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      res+="$git_i $divider_i$branch_i"
      # =>  Branch
      where="$space${(V)VCS_STATUS_LOCAL_BRANCH}$space"
    elif [[ -n $VCS_STATUS_TAG ]]; then
      res+="${end}#"
      # =>    Tag
      where=${(V)VCS_STATUS_TAG}
    else
      res+="${end}@"
      # => Commit
      where=${VCS_STATUS_COMMIT[1,8]}
    fi

    # >=> Truncate branch name > 32
    (( $#where > 32 )) && where[13,-13]="…"
    # => escape %
    res+="${clean}${where//\%/%%}"

    # >=> Show tracking branch if !local branch
    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
      # => escape %
      res+="${end}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
    fi

    # ->        Behind remote
    (( VCS_STATUS_COMMITS_BEHIND )) && res+="${clean}%F{009}${VCS_STATUS_COMMITS_BEHIND} ${end}"
    # -> Clear ahead/!behind
    (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
    # ->     Ahead of remote
    (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}%F{028}${VCS_STATUS_COMMITS_AHEAD} ${end}"
    # ->   Number of Stashes
    (( VCS_STATUS_STASHES        )) && res+="${clean} ${VCS_STATUS_STASHES} ${end}"
    # ->       Unusual state
    [[ -n $VCS_STATUS_ACTION     ]] && res+="${conflicted} ${VCS_STATUS_ACTION} ${end}"
    # ->     Merge conflicts
    (( VCS_STATUS_NUM_CONFLICTED )) && res+="${conflicted}${conflict_i}$(echo ${VCS_STATUS_NUM_CONFLICTED} | tr $nums $subs) ${end}"
    # ->      Staged commits
    (( VCS_STATUS_NUM_STAGED     )) && res+="${green}${staged_i}$(echo ${VCS_STATUS_NUM_STAGED} | tr $nums $subs) ${end}"
    # ->    Unstaged commits
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+="${modified}${unstaged_i}$(echo ${VCS_STATUS_NUM_UNSTAGED} | tr $nums $subs) ${end}"
    # ->     Untracked files
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+="${untracked}${untracked_i}$(echo ${VCS_STATUS_NUM_UNTRACKED} | tr $nums $subs) ${end}"

    typeset -g my_git_format=$res
  }

  functions -M my_git_formatter 2>/dev/null
