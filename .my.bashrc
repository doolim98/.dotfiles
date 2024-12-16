source ~/.my.profile
eval "$(fzf --bash)"
eval "$(direnv hook bash)"

if command -v starship &>/dev/null; then 
    eval "$(starship init bash)"
fi