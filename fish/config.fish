#set fish_git_dirty_color red
#set fish_git_not_dirty_color yellow

abbr gcm 'git commit -m'
abbr gca 'git commit --amend'
abbr gco 'git checkout'
abbr gph 'git push origin (git rev-parse --abbrev-ref HEAD) --force-with-lease'

abbr kgd 'kubectl get deployments'
abbr kgp 'kubectl get pods'
abbr kgs 'kubectl get services'
abbr kl  'kubectl logs -f '

set -gx  LC_ALL en_US.UTF-8
set -gx  EDITOR vi


set PYENV_ROOT $HOME/.pyenv
set -x PATH ~/.local/bin $PYENV_ROOT/shims $PYENV_ROOT/bin $PYENV_ROOT/versions $PATH
pyenv rehash

. (pyenv init - | psub)

rvm default

set fish_user_paths ~/bin /usr/local/bin $fish_user_paths

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/juan/google-cloud-sdk/path.fish.inc' ]; . '/Users/juan/google-cloud-sdk/path.fish.inc'; end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/juan/projects/ommnio/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/juan/projects/ommnio/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/juan/projects/ommnio/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/juan/projects/ommnio/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/juan/projects/ommnio/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /Users/juan/projects/ommnio/serverless/node_modules/tabtab/.completions/slss.fish

function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
