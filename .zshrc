#set -x
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

export LANG=en_US.UTF-8

BREWPATH=/usr/local/bin
export PATH=$BREWPATH:$PATH

ZSH_THEME="powerlevel10k/powerlevel10k"

COMPLETION_WAITING_DOTS="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias settings="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias home="~/"
alias code="~/Code"
alias dipper="~/Code/web/little-dipper"
alias leet="~/Code/alg/LEET/python-code"
alias vsettings="nvim ~/.config/nvim/init.vim"
alias classes="~/MIT/SP2023"
alias linalg="~/MIT/F2022/1806"
alias personal="~/Personal"
alias note="~/Personal/notes & nvim"
alias learnC="~/Code/C/syntax"

alias 1LN="nvim ~/MIT/SP2023/6033/6033LN.tex"
alias 2LN="nvim ~/MIT/SP2023/18650/18650LN.tex"

# tex
alias ct="rm *.aux & rm *.fls & rm *.log & rm *.synctex.gz & rm *.fdb_latexmk & rm *.xdv & rm *.toc & rm *.out"

alias l='lsd'
alias ls='lsd'
alias la='lsd -a'
alias lla='lsd -la'
alias ll='lsd -l'




# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/chanwooyoon/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ 1 -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/chanwooyoon/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/chanwooyoon/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/chanwooyoon/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ~/.zshrc

# eval "$(starship init zsh)"

#source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/lsd/lscolors.sh
#export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
#PATH=$PATH:$(ruby -e 'puts Gem.bindir')

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.2



export PATH="/Users/chanwooyoon/CodeDependency/ltex-ls/bin:$PATH"
export PATH="/Users/chanwooyoon/CodeDependency/texlab-master/target/release:$PATH"

export PATH="/usr/local/opt/llvm/bin:$PATH"
#export PATH="/Users/chanwooyoon/CodeDependency/jdtls/bin:$PATH"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# tmux session
#set +x

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_351.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"



# temporary commands
alias lamode="source ~/Code/python_environment/009_env/bin/activate"
alias ml="source ~/CodeDependency/python_env/ml/bin/activate"
