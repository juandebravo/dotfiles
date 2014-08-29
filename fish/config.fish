#set fish_git_dirty_color red
#set fish_git_not_dirty_color yellow

set fish_user_abbreviations $fish_user_abbreviations 'gcm=git commit -m'
set fish_user_abbreviations $fish_user_abbreviations 'giu=git add --update'
set fish_user_abbreviations $fish_user_abbreviations 'gco=git checkout'
set fish_user_abbreviations $fish_user_abbreviations 'gph=git push origin (git rev-parse --abbrev-ref HEAD)'

set --universal fish_user_paths $fish_user_paths ~/bin

. (pyenv init - | psub)
