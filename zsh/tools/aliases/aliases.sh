# @@@@@ -->{ ZSH ALIASES }<-- @@@@@ #
alias 	      update="source ~/.zshrc"
alias        tmuxsrc="tmux source-file ~/.tmux/.tmux.conf"
alias 	    tmuxkill='tmux kill-server'
alias 	    tmuxlist='tmux list-sessions'
alias     vuninstall='vim +PluginInstall +qall'
alias     		 omz="code ~/.zshrc"
alias     		imgc="imgcat"
alias     	   svpng="qlmanage -t -s 1000 -o ."
alias     		tree='colorls --tree'
alias      yarnclean="rm -rf node_modules/ && yarn install"
alias     	npmclean="rm -rf node_modules/ && npm install"
alias     	 myipmap="curl http://ipinfo.io/ip | iponmap"
alias     	    code="code-insiders"
alias     	 codenew="code-insiders --new-window"
alias     		rcvp="cd ~/Desktop/rcvpro"
alias     	 tunnel8="~/ngrok http 8000"
alias     	 tunnel3="~/ngrok http 3000"
alias            cap="cd ~/Desktop/Capital\ Consultants/capital-consultants"
alias           ccap="code ~/Desktop/Capital\ Consultants/capital-consultants"
alias        codecap="code ~/Desktop/Capital\ Consultants/capital-consultants"
local         cap_id='{ "site_id": "181d8830-fd2f-445e-bec0-5624a39e3ce7"}'
alias     	 capdata="netlify api getSite --data '$cap_id' | jq '.'"
alias     rmfontfile="rm -rf ~/.dotfiles/fonts/*"
alias  reindex-finder="sudo mdutil -i on /"
alias 		    gitc="git clone"
alias 		    gits="git status"
alias 	      gitall="git add -A; git commit -m 'commit all'; git push -u origin master"
alias		    gitp="git push -u origin master"
# alias         python=python2
gitcmt() { echo "$(git commit -m ${1})" }
