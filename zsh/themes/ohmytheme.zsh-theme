function host_info {
    if [ ${#SSH_CONNECTION} != 0 ]; then
        echo "%{$FG[126]%}@%m%{$reset_color%} "
    fi
}

function precmd {
    gprompt=$(git_prompt_info)

    if [ ${#gprompt} != 0 ]; then
        print -rP '${gprompt}'
    fi
}

PROMPT="$(host_info)%{$FG[068]%}%~%{$reset_color%} %{$FG[132]%}»%{$reset_color%} "
RPROMPT="%{$FG[239]%}%(2j.jobs: %j.%(1j.job: %j.)) (%!)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[074]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} %{$FG[090]%}m%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX="%{$FG[076]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_colors%} "
