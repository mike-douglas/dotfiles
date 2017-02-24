[core]
    excludesFile = ${HOME}/.home/git/global_ignore
    editor = vim '+:set tw=76'
[branch]
    autosetuprebase = always
[color]
    grep = true
[merge]
    tool = vimdiff
[pull]
    rebase = true
[push]
    default = tracking
[rerere]
    enabled = 1
[grep]
    lineNumber = true
    extendedRegexp = true
[alias]
    st = status -sb
    ci = commit
    hist = log --pretty=format:'%C(yellow)%h%Creset | %Cblue%ad%Creset | %Cgreen%an%Creset: %s%d' --date=short
[user]
    name = ${NAME}
    email = ${EMAIL}
