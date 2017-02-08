function fish_right_prompt --description 'Right prompt section'

  set -l last_status $status
  set -l prompt

  # pyenv
  set -l pyenv "$PYENV_VERSION"
  if not test -n "$pyenv"
  	set pyenv "$PYENV_LOCAL_VERSION"
  end
  if test $pyenv
    set prompt $prompt (echo -s (set_color --bold blue) 'py' (set_color normal) (set_color yellow) $pyenv)
  end

  # git
  set -l branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
  if test $branch
	  set gitprompt (set_color --bold blue) 'git' (set_color normal)

	  set -l dirty (git status --porcelain ^ /dev/null)
	  if test "$dirty" -eq ''
	    set prompt $prompt (echo -s $gitprompt (set_color --bold green) $branch)
	  else
	  	set prompt $prompt (echo -s $gitprompt (set_color red) $branch)
	  end
  end

  if test $last_status -ne 0
  	set prompt $prompt (echo -s (set_color red) "↵")
  end

  # k8s
  set k8sprompt (set_color --bold blue) 'k8s' (set_color normal)
  set -l k8s_context (kubectl config current-context)
  set prompt $prompt (echo -s $k8sprompt (set_color --bold green) $k8s_context)

  echo -n $prompt
end

if not set -q __pyenv_rprompt_initialized
	# NOTE! This seems to be triggered when cycling directory auto completion suggestions
	function __fish_update_pyenv --on-variable PWD --description "Update PYENV_LOCAL_VERSION"
	  # This will return something like "my-version (set by /path/to/.python-version)"
	  set -l ver (pyenv version)
	  if expr "$ver" : '.*\.python-version' > /dev/null
	    # NOTE: no string management in fish yet :(
		  set -g -x PYENV_LOCAL_VERSION (expr (pyenv version) : '\([^ ]*\)')
		else
		  set --erase PYENV_LOCAL_VERSION
		end
	end

	# Mark as initialized
    set -g __pyenv_rprompt_initialized
end
