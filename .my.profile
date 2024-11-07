export CLICOLOR=1
export DROPBOX="$HOME/Dropbox" 	# NOTE: might be linked type
export PATH="$HOME/.local/bin/:$PATH"

# --no-height 
# FZF configuration
export FZF_DEFAULT_OPTS='
--pointer=">"
--prompt="> "
--highlight-line
--info=inline-right
--no-separator
--reverse 
--height=10
--bind=ctrl-i:accept,ctrl-k:kill-line
--color=16
--color=bg+:-1
'