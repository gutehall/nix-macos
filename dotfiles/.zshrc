export ZSH="/Users/mathias/.oh-my-zsh"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

ZSH_THEME="bullet-train"

DISABLE_UPDATE_PROMPT="true"

plugins=(
  git
  #exa-zsh
  aws
  brew
  minikube
  colored-man-pages
  colorize
  terraform
  vagrant
  #zsh-syntax-highlighting
  zsh-autosuggestions
)

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nano'
fi

alias docker="podman"

alias ld="eza -lD"
alias lf="eza -lF --color=always | grep -v /"
alias lh="eza -dl .* --group-directories-first"
alias ll="eza -al --group-directories-first"
alias ls="eza -alF --color=always --sort=size | grep -v /"
alias lt="eza -al --sort=modified"

# Terraform
alias tfi="terraform init"
alias tfv="terraform validate"
alias tfc="terraform console"
alias tfp="terraform plan"
alias tff="terraform fmt"
alias tfa="terraform apply"
alias tfd="terraform destroy"

# Git
alias gi="git init"
alias gs="git status -sbu"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias ga="git add ."
alias gcm="git commit -m"
alias gpl="git pull"
alias gst="git stash"
alias gstl="git stash list"
alias glg='git log --graph --oneline --decorate --all'

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
  fi

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

BULLETTRAIN_PROMPT_ORDER=(
  time
  git
  dir
  status
   aws
)

precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# Create new Terraform
tf-new() {
    mkdir modules
    touch main.tf
    touch variables.tf
    touch output.tf
    touch README.md
    touch .gitignore
    echo -e "*.tfstate\n*.tfstate.backup\n.terraform.tfstate.*\ntfplan\n.DS_Store\n*.hcl\n.terraform/" > .gitignore
}

tf-files() {
    touch main.tf
    touch variables.tf
    touch output.tf
    touch version.tf
    echo -e "terraform {\nrequired_version = \">= 0.12\"\n}" > version.tf
}

autoload -Uz compinit
  compinit

# Load Angular CLI autocompletion.
# source <(ng completion script)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/packer packer

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi
