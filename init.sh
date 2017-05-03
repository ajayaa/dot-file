# (TODO) Create a system to pass name of the platform and allow to create different conf
# files for different types of platform. The easiest way to achieve that is to
# create different conf files for different platforms. If done in a single conf file
# things would become a litle clumsy. More ideas?

function help {
    echo "Usage: ./init.sh [office|personal]"
}

ENV=$1
if [[ -z $ENV ]]; then
    ENV=office
fi

echo "Setting up: $ENV environment"

source envs.sh
# Create a dict here and key -> file name in git repo, value -> file name and location in the machine
# Iterate over the dict and in a loop put everything in place.

#conf_files="

echo "OS is: $OS"
configure_aliases() {
    if [[ $OS == 'mac' ]]; then
        if [ ! -f $HOME/.bash_profile ]; then
            ln -s $BASE_DIR/rcfiles/aliasrc ~/.bash_profile
            ln -sf $BASE_DIR/rcfiles/.osxrc ~/.osxrc
            ln -sf $BASE_DIR/rcfiles/.officerc ~/.officerc
        else
            echo .bash_profile already exists! Not creating symlink.
        fi
    else
        if [ ! -f $HOME/.bash_aliases ]; then
            ln -s $BASE_DIR/rcfiles/aliasrc ~/.bash_aliases
        else
            echo .bash_aliases already exists! Not creating symlink.
        fi
    fi
    ln -sf $BASE_DIR/rcfiles/.funcrc ~/.funcrc
}

install_general_utils() {
    if [[ $OS != "mac" ]]; then
        sudo apt-get install -y git tmux xclip
        exit_status=$?
        if [ exit_status -ne 0 ]; then
            sudo yum install -y git tmux xclip
        fi
    else
        echo "Not installing any general utility"
    fi
}

configure_git() {
    if [ ! -f $HOME/.gitconfig ]; then
        if [[ $ENV == "office" ]]; then
            cat >> $HOME/.gitconfig<<EOF
[user]
        name = Ajaya Agrawal
        email = ajayaa@qubole.com

[commit]
    template = ~/.gitmessage

[core]
    editor = vim
EOF
        else
            cat >> $HOME/.gitconfig<<EOF
[user]
        name = Ajaya Agrawal
        email = ajku.agr@gmail.com 

[core]
    editor = vim
EOF
        fi
    else
        echo ".gitconfig already exists. Not configuring git"
    fi
}

configure_vim() {
    if [ ! -f $HOME/.vimrc ]; then
        git clone https://github.com/ajayaa/.vim $HOME/.vim
        cd $HOME/.vim
        ./init.sh
        cd $HOME
    else
        echo ".vimrc already exists. Not doing anything..."
    fi
}

configure_tmux() {
    if [ ! -f $HOME/.tmux.conf ]; then
        ln $BASE_DIR/conf_files/tmux.conf ~/.tmux.conf
    else
        echo ".tmux.conf already exists. Not doing anything..."
    fi
}

install_general_utils
configure_git
configure_vim
configure_tmux
configure_aliases

#Not using firefox anymore due to flash issues.
#if [ ! -f ~/.vimperatorcc ]; then
#    ln -s $current_dir/vimperatorrc ~/.vimperatorrc
#else
#    echo .vimperatorrc already exists! Not creating symlink.
#fi
