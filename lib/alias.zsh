alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias reload="exec zsh"

alias generate-password="repeat 10 {openssl rand -base64 18}"
alias co="code ."
alias ofd="open ."
alias ..='cd ..'
alias ...='cd ../..'
alias g='git'
alias nr='npm run'
alias nrd='npm run dev'

