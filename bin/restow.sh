#!/bin/sh

GIT=$(command -v git)
STOW=$(command -v stow)
CHMOD=$(command -v chmod)
HOSTNAME=$(hostname)

# Enter directory
pushd $HOME/.dotfiles

# Update directory
$GIT pull

# Set ssh config permissions
$CHMOD 600 ssh-work/.ssh/authorized_keys
$CHMOD 600 ssh-home/.ssh/authorized_keys

case $HOSTNAME in
    "natani")
        $STOW -R bin emacs fish screen
        ;;
    
    "flora")
        $STOW -R bin emacs fish screen
        ;;

    "raine")
        $STOW -R bin emacs fish screen ssh-home
        ;;

    "hactar")
        $STOW -R bin emacs fish screen ssh-irc weechat
        ;;

    "xlnserver")
	$STOW -R bin emacs fish screen ssh-work
	;;

    "xlnbackup")
	$STOW -R bin emacs fish screen ssh-work
	;;
    
    *)
        echo "This computer is not recognized by restow."
        ;;
esac
