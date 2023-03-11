export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

plugins=(
    git
    bundler
    dotenv
    python
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
    docker
    celery
    docker-compose
    poetry
)

bindkey '^H' backward-kill-word

export PATH="$HOME/.poetry/bin:$PATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

fpath+=${ZDOTDIR:-~}/.zsh_functions

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

zstyle ':autocomplete:*' default-context history-incremental-search-backward

fzbat() {
    fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'
}

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat
}

fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

source ${ZSH}/oh-my-zsh.sh
