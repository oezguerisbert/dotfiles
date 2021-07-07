# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/oezguerisbert/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
DISABLE_UPDATE_PROMPT="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.zplug/init.zsh

zplug "YannickFricke/yarn-completion", from:github
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/docker",   from:oh-my-zsh
zplug "plugins/docker-compose",   from:oh-my-zsh
zplug "zsh-users/zsh-completions", depth:1
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:1
zplug "hlissner/zsh-autopair", defer:2
zplug "YannickFricke/NodeAliases", use:"aliases.sh"
zplug "code-stats/code-stats-zsh", from:gitlab, use:"codestats.plugin.zsh"
zplug "jerguslejko/zsh-symfony-completion", use:"symfony-console.plugin.zsh"
zplug "lukechilds/zsh-nvm"
zplug "agkozak/zsh-z"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# zplug load --verbose

zplug load

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh
#
# echo 'export NVM_DIR=~/.nvm' >> ~/.zshrc
# echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.zshrc

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

mkd() {
        mkdir -p -- "$1" &&
    cd -P -- "$1" && clear
}

diary() {
	export DIARY_GIT_FOLDER=~/Documents/GitHub/my-diary
	export DIARY_DAYS=${1:-0}
	export DIARY_FOLDER="$DIARY_GIT_FOLDER/"$(date -d "$(date) $DIARY_DAYS days" +'%d-%m-%Y')
	[[ ! -d $DIARY_GIT_FOLDER ]] && cd -P ~/Documents/GitHub && git clone git@github.com:oezguerisbert/my-diary.git
	[[ -d $DIARY_FOLDER ]] && cd -P -- "$DIARY_FOLDER" && nvim README.md
	[[ ! -d $DIARY_FOLDER ]] && mkdir -p -- "$DIARY_FOLDER" && cd -P -- "$DIARY_FOLDER" && touch README.md && nvim README.md
}
dfb() {
	cp -r ~/.vim/** ~/Documents/GitHub/dotfiles/.vim
	cp -r ~/.local/share/konsole ~/Documents/GitHub/dotfiles/.local/share/
	cp ~/.config/nvim/init.vim ~/Documents/GitHub/dotfiles/.config/nvim/init.vim
	cp ~/.zshrc ~/Documents/GitHub/dotfiles/.zshrc
	cd -P -- ~/Documents/GitHub/dotfiles
	echo "Backuped to GitHub(oezguerisbert/dotfiles)"
}
dfr() {
	mkdir ~/restore-files
	rsync -a ~/Documents/GitHub/dotfiles ~/restore-files/
	mv ~/restore-files/dotfiles/** ~/
	rm -rf ~/restore-files
	echo "Restored the backup from GitHub(oezguerisbert/dotfiles)"
}
# cd ~
clear
