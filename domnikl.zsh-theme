#
# A simple theme that only shows relevant information.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Dominik Liebler <liebler.dominik@googlemail.com>
#

function prompt_domnikl_precmd () {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS

  if (( $+functions[git-info] )); then
    git-info
  fi
}

function prompt_domnikl_setup() {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_domnikl_precmd

  zstyle ':omz:completion' indicator '%B%F{red}...%f%b'
  zstyle ':omz:prompt' vicmd '%F{yellow}❮%f%B%F{red}❮%f%b%F{red}❮%f'
  zstyle ':omz:plugin:git:prompt' action ':%%B%F{yellow}%s%f%%b'
  zstyle ':omz:plugin:git:prompt' added ' %%B%F{green}✚%f%%b'
  zstyle ':omz:plugin:git:prompt' ahead ' %%B%F{yellow}⬆%f%%b'
  zstyle ':omz:plugin:git:prompt' behind ' %%B%F{yellow}⬇%f%%b'
  zstyle ':omz:plugin:git:prompt' branch '%F{green}%b%f'
  zstyle ':omz:plugin:git:prompt' deleted ' %%B%F{red}✖%f%%b'
  zstyle ':omz:plugin:git:prompt' modified ' %%B%F{blue}✱%f%%b'
  zstyle ':omz:plugin:git:prompt' renamed ' %%B%F{magenta}➜%f%%b'
  zstyle ':omz:plugin:git:prompt' commit '%c'
  zstyle ':omz:plugin:git:prompt' stashed ' %%B%F{cyan}✭%f%%b'
  zstyle ':omz:plugin:git:prompt' unmerged ' %%B%F{yellow}═%f%%b'
  zstyle ':omz:plugin:git:prompt' untracked ' %%B%F{white}◼%f%%b'
  zstyle ':omz:plugin:git:prompt' prompt '%f%b%s'
  zstyle ':omz:plugin:git:prompt' rprompt '%A%B%S%a%d%m%r%U%u'

  SEPARATOR='%F{red}|'

  PROMPT='%F{yellow}${HOST}${SEPARATOR}%F{cyan}%1~${SEPARATOR}%f${git_prompt_info} %(!.%B%F{red}#%f%b.%B%F{yellow}❯%f%b) '
  RPROMPT='${VIM:+" %B%F{green}V%f%b"}${git_rprompt_info}'
  SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
}

prompt_domnikl_setup "$@"



