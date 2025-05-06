 # Avoid recursive sourcing

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting web-search fzf-tab tmux macos zfm vm)
tmux -V &>/dev/null

eval "$(/opt/homebrew/bin/brew shellenv)"


source $ZSH/oh-my-zsh.sh

# User Aliases and Configurations
alias vim=nvim
alias vi=nvim
alias cc='cd $(fzf | xargs dirname)'
alias fcd='cd "$(fd --type d --exclude Library --absolute-path . $HOME | fzf)"'
alias yk='yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4] / bv*+ba/b"'
alias fp="fzf --preview='bat --color=always --style=numbers {}'"

# Add Paths
export PATH="$PATH:/Users/sathwikgade/.local/bin"
export PATH="$HOME/.cargo/bin:$PATH"

# Fzf and TheFuck
export PATH="/opt/homebrew/bin:$PATH"

eval $(thefuck --alias)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerlevel10k theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Open files/folders
openit() {
    if [ -z "$1" ]; then
        echo "Usage: openit <file|folder|URL>"
    else
        open "$1"
    fi
}
alias o=' fzf --preview="bat --color=always --style=numbers {}" | xargs -r -I {} open "{}" '

# Additional Zsh configurations
zstyle 'completion:*' menu no 
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'

# Fix C++ alias
alias g++='g++ -std=c++17'

# Add Scala to PATH
export PATH="/opt/homebrew/opt/scala@2.12/bin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

export PYSPARK_PYTHON=/usr/bin/python3.12
export PYSPARK_DRIVER_PYTHON=/usr/bin/python3.12
export CLASSPATH=".:$HOME/Downloads/mysql-connector-j-9.2.0/mysql-connector-j-9.2.0.jar:$CLASSPATH"

#assing path for java lsp sever google-java-formate
export PATH="$PATH:/Users/sathwikgade/.local/bin"


spf() {
    os=$(uname -s)

    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}
export PIP_BREAK_SYSTEM_PACKAGES=1
export PIP_BREAK_SYSTEM_PACKAGES=1
export PIP_BREAK_SYSTEM_PACKAGES=1
export FLASK_APP=main.py
export PATH="/opt/homebrew/bin:$PATH"
