ZSH_THEME=""
autoload -U promptinit; promptinit
zstyle :prompt:pure:path color yellow
zstyle :prompt:pure:git:arrow color blue
zstyle :prompt:pure:git:branch color cyan
prompt pure


if [ -s ~/.bashrc ]; then source ~/.bashrc; fi

