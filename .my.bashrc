source ~/.my.profile
eval "$(fzf --bash)"

if command -v starship &>/dev/null; then 
    eval "$(starship init bash)"
fi