bindkey \^U backward-kill-line
bindkey "^X\\x7f" backward-kill-line

alias xbrew="arch -x86_64 /usr/local/bin/brew"

function gb {
    if [ "$#" -eq 0 ]; then
        git branch | awk '{print $0 " (" NR ")"}'
    else
        git branch ${@}
    fi
}
function gck {
    pattern="^[0-9]+$"
    if [[ $1 =~ $pattern ]] && [ "$#" -eq 1 ]; then
        branchName=$(git branch | sed -n $1p | sed 's/\*/ /' | xargs)
        git checkout $branchName
    else
        git checkout ${@}
    fi
}

function cddir {
		cd $(dirname $1)
}

alias ll='ls -lAFh'
alias gs='git status'
alias gsu='git status -uno'
alias gsp='git stash pop'
alias ga='git add'
alias gau='git add -u :/'
alias gbd='git branch | grep -v "main" | xargs git branch -D'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gc='git commit'
alias gca='git commit -am "it aint much but its honest work"'
alias gmm='git merge main'
alias gp='git push --set-upstream origin $(git branch --show-current) --no-verify'
alias gcap='git commit -am "it aint much but its honest work" && gp'
alias gpush='git push'
alias gpu='git pull'
alias gpull='git pull'
alias gpom='git pull origin main --no-edit && gp'
alias gd='git diff'
alias gg='git grep'
alias gr='git reset'
alias grpo='git remote prune origin'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias grhh='git reset --hard HEAD^'
alias grsh='git reset --soft HEAD^'
alias grep='grep --color=auto'
alias sdr='screen -dr'
alias sls='screen -ls'

alias bb='bazel build'
alias br='bazel run'
alias bt='bazel test'
alias yrd='yarn run dev'
alias gls='gsutil ls'

alias gist='gist -pc'

git config --global pager.branch false
