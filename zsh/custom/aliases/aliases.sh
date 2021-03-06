# ===> Aliases
alias       update="source ~/.zshrc"
#  --> ZPlug
alias       zupdate="sleep 1;zplug update;revolver start ' ﲖ Reloading .zshrc';sleep 1;source ~/.zshrc;revolver stop;print -P %F{green}'\n Updated & sourced  '"
alias       zclean="zplug clean --force; zplug clear"
# --> Git
alias       gitc="git clone"
alias       gits="git status"
alias       gita="git add -A"
alias       gitp="git push -u origin main"
alias       gitall="git add -A; git commit -m 'commit all'; git push -u origin master"
gitcmt() {
    git commit -m "${1}"
}
#  --> Tmux
alias       tmuxsrc="tmux source-file ~/.tmux/.tmux.conf"
alias       tmuxkill='tmux kill-server'
alias       tmuxlist='tmux list-sessions'
alias       vuninstall='vim +PluginInstall +qall'
alias       imgc="imgcat"
alias       svpng="qlmanage -t -s 1000 -o ."
alias       tree='colorls --tree'
alias       yarnclean="rm -rf node_modules/ && yarn install"
alias       npmclean="rm -rf node_modules/ && npm install"
# --> VScode
alias       omz="code ~/.dotfiles/.zshrc"
alias       codenew="code --new-window"
# --> RCV Pro
alias       rcvp="cd ~/Desktop/rcvpro"
# --> Capital Consultants
alias       cap="cd ~/Desktop/Capital\ Consultants/capital-consultants"
alias       ccap="code ~/Desktop/Capital\ Consultants/capital-consultants"
alias       codecap="code ~/Desktop/Capital\ Consultants/capital-consultants"
# --> OHM Restoration
alias       ohmdev="code ~/desktop/ohm/website"
alias       ohmroot="cd ~/desktop/ohm/website"
alias       ohmweb="cd ~/desktop/ohm/website/packages/common"
alias       ohmgat="cd ~/desktop/ohm/website/packages/landing-gatsby"
# --> Font Forge
alias       rmfontfile="rm -rf ~/.dotfiles/fonts/*"
# --> OSX
alias       reindex-finder="sudo mdutil -i on /"
# --> Python
# alias        python=python2
# --> Miscellaneous
alias       tabcolors="code /Applications/iTerm.app/Contents/Resources/graphic_colors.json"
alias       dirs="k -a -h"
# --> Gatsby JS
alias       gd="gatsby develop"
alias       gc="gatsby clean"
alias       gcd="gatsby clean;gatsby develop"



#writetofile() {
#  echo $(cat > "${1}" << END)
#}
