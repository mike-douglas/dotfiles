function host_info {
    if [ ${#SSH_CONNECTION} != 0 ]; then
        echo "%{$FG[126]%}@%m%{$reset_color%} "
    fi
}

function jobs_info {
    num=$(jobs | wc -l)
    if [[ $num -gt 0 ]]; then
        suffix="jobs"

        if [[ $num -eq 1 ]]; then
            suffix="job"
        fi

        echo "(%j ${suffix})"
    fi
}

function precmd {
    gprompt=$(git_prompt_info)

    if [ ${#gprompt} != 0 ]; then
        print -rP '${gprompt}'
    fi
}

PROMPT="$(host_info)%~ ⚡  "
RPROMPT="%{$(echo "\e[2;37m")%}$(jobs_info) (%!)%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[074]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} %{$FG[090]%}m%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX="%{$FG[076]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_colors%} "