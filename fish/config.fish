#set fish_git_dirty_color red
#set fish_git_not_dirty_color yellow

set fish_user_abbreviations $fish_user_abbreviations 'gcm=git commit -m'
set fish_user_abbreviations $fish_user_abbreviations 'giu=git add --update'
set fish_user_abbreviations $fish_user_abbreviations 'gco=git checkout'

# https://hackernoon.com/mastering-git-why-rebase-is-amazing-a954485b128a#.kjjw2li8x
set fish_user_abbreviations $fish_user_abbreviations 'gph=git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease'

set fish_user_paths ~/bin /usr/local/bin $fish_user_paths

set -gx  LC_ALL en_US.UTF-8
set -gx  EDITOR vi

. (pyenv init - | psub)
