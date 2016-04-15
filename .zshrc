# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="eastwood"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*) # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/home/rramirez/bin:/opt/mongodb-linux-x86_64-2.4.6/bin:/usr/local/packer:/opt/jdk1.8.0_77/bin:$PATH"
export EDITOR=vim
export PAGER=less

alias vi='vim'


# helpful aliases
alias sl='ls'
alias lll='ls -lah'
alias ll='ls -lah'
alias lt='ls -lat'
alias tmuxa='tmux a'
alias celar='clear'
alias os='cat /etc/*release*'
alias xit='exit'
alias htop='sudo htop'
alias ports='sudo netstat -netpul'
alias rekey='killall xbindkeys; xbindkeys -f ~/.xbindkeysrc'
alias redwm='cd /usr/local/src/dwm-6.0; make clean && sudo make install'
alias visio='pencil'
alias cb='xsel --clipboard'
alias gn='geeknote'
alias curl='curl -w "\nperformance: %{time_connect} (conn) + %{time_starttransfer} (trans) = %{time_total} (total)\n"'

# playing around with the new laptop
alias evernote='wine /home/rramirez/.wine/drive_c/Program\ Files\ \(x86\)/Evernote/Evernote/Evernote.exe'
alias lowpower='sudo pm-powersave true'
alias highpower='sudo pm-powersave false'


# git related
alias gc='echo "git checkout" && git checkout'
alias gcom='echo "git commit" && git commit'
alias gcommit='echo "git commit" && git commit'
alias gbranch='echo "git branch" && git branch'
alias gbrancha='echo "git branch -a" && git branch -a'
alias gbra='echo "git branch -a" && git branch -a'
alias gbd='echo "git branch -D" && git branch -D'
alias gbrd='echo "git branch -D" && git branch -D'
alias gr='echo "git remote -v" && git remote -v'
alias gremote='echo "git remote -v" && git remote -v'
alias ghist='echo "git log -p" && git log -p'
alias gpull='echo "git pull" && git pull'
alias gpl='echo "git pull" && git pull'
alias gpom='echo "git pull origin master" && git pull origin master'
alias gpush='echo "git push" && git push'
alias gps='echo "git push" && git push'
alias gfa='echo git fetch --all && git fetch --all'
alias gs='echo "git status" && git status'
alias gstat='echo "git status" && git status'
alias gadd='echo "git add" && git add'
alias gap='echo git add -p && git add -p'
alias gdiff='echo "git diff" && git diff'
alias gdif='gdiff'
alias gd='gdiff'
alias gdc='echo "git diff --cached" && git diff --cached'

# docker related
#alias docker='sudo docker'
alias d='docker'
alias dps='docker ps -a'
alias di='docker images'
alias dat='docker attach --sig-proxy=true'
alias dci="docker images | grep none | awk '{print \$3}' | xargs sudo docker rmi -f"
alias dc="docker rm \$(docker ps -q -a)"
eval "$(docker-machine env default)"

# vpn stuffs
alias ntvpn='sudo vpnc nt.conf'
alias vpnoff='seq 2 | xargs -Iz sudo vpnc-disconnect;'
alias hop='sshuttle --dns -vvr thinkhome 0/0'
alias ntfort='sudo killall -s 3 chrome; sh /opt/forticlient-sslvpn/forticlientsslvpn.sh'
alias wifi='trayer &; nm-applet &'

# laptop display config
alias rescreen='sh ~/bin/init-display.sh'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


### Ruby dev
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


### Python dev
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

### NewTek Dev related
alias ns='cd ~/newtek/code/shop; ./run-local.sh'

# NVM related
export NVM_DIR="/home/rramirez/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
