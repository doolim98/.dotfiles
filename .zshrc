# Environment
# ===========
export CLICOLOR=1
export DROPBOX="$HOME/Dropbox" 	# NOTE: might be linked type

secret_env_file="${DROPBOX}/secret.env"
[[ -f $secret_env_file ]] && source $secret_env_file

export PATH="$HOME/.local/bin/:$PATH"

# Prompt
# ======
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%F{yellow}[%b%c]%f'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' check-for-staged-changes true
precmd() {
    vcs_info
}
setopt prompt_subst



PROMPT='%F{green}[$USER@$HOST]%f'
PROMPT=$PROMPT'${vcs_info_msg_0_}'
PROMPT=$PROMPT'%F{cyan}[%3~]%f%B\$%f%b '

[ $TERM = "dumb" ] && unsetopt zle && PS1='$ '

[ -f ~/.zsh/fzf-key-bindings.zsh ] && source ~/.zsh/fzf-key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.my.zshrc
