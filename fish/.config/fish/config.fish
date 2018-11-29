# if test $TERM = "rxvt-unicode-256color"
#    set TERM "xterm-256color"
# end

# if status --is-login
#    ssh-agent -c | sed -e s/:/\'\ \'/g -e s/setenv/set\ -gx/ | .
# end

if status --is-login
   set -x SSH_AUTH_SOCK (systemctl --user show-environment | grep SSH_AUTH_SOCK | sed -e 's/.*=//')
end

set fish_greeting ""
