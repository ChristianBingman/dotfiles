if [ -f /etc/zsh/zshrc ]; then
    source /etc/zsh/zshrc
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="/opt/homebrew/bin:/usr/local/bin:~/.local/bin:/opt/homebrew/opt/cyrus-sasl/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR=nvim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias vim=nvim
alias tree='/usr/bin/env git log --graph --pretty=oneline --abbrev-commit'
alias gca='git commit -a --amend'
alias gc='git commit -a'
alias dotfiles='/usr/bin/env git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias cp='/usr/bin/env rsync -avzP'
alias s="kitty +kitten ssh"

# Nix config setup
if [ -n "$HOME" ] && [ -n "$USER" ]; then

    # Set up the per-user profile.

    NIX_LINK=$HOME/.nix-profile

    # Set up environment.
    # This part should be kept in sync with nixpkgs:nixos/modules/programs/environment.nix
    export NIX_PROFILES="/nix/var/nix/profiles/default $HOME/.nix-profile"

    # Set $NIX_SSL_CERT_FILE so that Nixpkgs applications like curl work.
    if [ -e /etc/ssl/certs/ca-certificates.crt ]; then # NixOS, Ubuntu, Debian, Gentoo, Arch
        export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
    elif [ -e /etc/ssl/ca-bundle.pem ]; then # openSUSE Tumbleweed
        export NIX_SSL_CERT_FILE=/etc/ssl/ca-bundle.pem
    elif [ -e /etc/ssl/certs/ca-bundle.crt ]; then # Old NixOS
        export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
    elif [ -e /etc/pki/tls/certs/ca-bundle.crt ]; then # Fedora, CentOS
        export NIX_SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt
    elif [ -e "$NIX_LINK/etc/ssl/certs/ca-bundle.crt" ]; then # fall back to cacert in Nix profile
        export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ssl/certs/ca-bundle.crt"
    elif [ -e "$NIX_LINK/etc/ca-bundle.crt" ]; then # old cacert in Nix profile
        export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ca-bundle.crt"
    fi

    # Only use MANPATH if it is already set. In general `man` will just simply
    # pick up `.nix-profile/share/man` because is it close to `.nix-profile/bin`
    # which is in the $PATH. For more info, run `manpath -d`.
    if [ -n "${MANPATH-}" ]; then
        export MANPATH="$NIX_LINK/share/man:$MANPATH"
    fi

    export PATH="$NIX_LINK/bin:$PATH"
    unset NIX_LINK
fi

# Disable annoyingly huge prompts, kinda insecure tho
export DIRENV_LOG_FORMAT=""
# Linux locale warning
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
eval "$(direnv hook zsh)"

eval $(gpg-agent --daemon 2> /dev/null)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
fi

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
