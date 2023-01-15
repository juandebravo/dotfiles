#set fish_git_dirty_color red
#set fish_git_not_dirty_color yellow

abbr gcm 'git commit -m'
abbr gca 'git commit --amend'
abbr gco 'git checkout'
abbr gph 'git push -u origin (git rev-parse --abbrev-ref HEAD) --force-with-lease'
abbr gp  'git pull'
abbr gl 'git log --format=%B -n 1 HEAD'
abbr gs 'git status'
abbr ts 'tig status'

abbr kgd 'kubectl get deployments'
abbr kgp 'kubectl get pods'
abbr kgs 'kubectl get services'
abbr kl  'kubectl logs -f '

set -gx  LC_ALL en_US.UTF-8
set -gx  EDITOR vi
set -x LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/opt/openssl/lib/

set -x MFA_DEVICE arn:aws:iam::148890269452:mfa/juan.debravo


set PYENV_ROOT $HOME/.pyenv
set -x PATH $HOME/projects/third-parties/webrtc/depot_tools ~/.local/bin $PYENV_ROOT/shims $PYENV_ROOT/bin $PYENV_ROOT/versions $HOME/.cargo/bin $PATH
pyenv rehash

rvm default

set fish_user_paths ~/bin /usr/local/bin $fish_user_paths

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
rvm default

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/juan/bin/google-cloud-sdk/path.fish.inc' ]; . '/Users/juan/bin/google-cloud-sdk/path.fish.inc'; end

. (pyenv init - | psub)
set -g fish_user_paths "/usr/local/opt/mysql@5.7/bin" $fish_user_paths
fish_add_path /usr/local/opt/openssl@3/bin
