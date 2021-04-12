function fish_prompt --description 'Write out the prompt'
        set retstatus $status

        if not set -q __fish_prompt_hostname
                set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
        end

        if not [ -n "$PWD" ]
                cd $HOME
        end

        if [ $retstatus = 0 ]
                set smiley (set_color green)"^^"
        else
                set smiley (set_color red)"-.-\""
        end

        if [ $TERM = screen-256color ]
           set screen_title_escape "\033k$argv\033\\"
        else
           set screen_title_escape ""
        end

	printf '( %s  %s@%s  %s  %s %s %b) ' (set_color magenta)(prompt_pwd) (set_color green)$USER $__fish_prompt_hostname (set_color blue)$retstatus $smiley (set_color normal) $screen_title_escape
end
