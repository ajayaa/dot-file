install_general_utils() {
    # (TODO) Make it platform independent.
    sudo apt-get install -y git tmux xclip
}

configure_git() {
    git config --global push.default simple
    git config --global user.email "ajku.agr@gmail.com"
    git config --global user.name "Ajaya Agrawal"
}

configure_vim() {
    git clone https://github.com/ajayaa/.vim $HOME/.vim
    cd $HOME/.vim
    ./init.sh
    cd $HOME
}

install_general_utils
configure_git
configure_vim
