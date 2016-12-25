function help {
    echo "Usage: ./init.sh [remote|local]"
}

ENV=$1
if [[ -z $ENV ]]; then
    help
fi

echo "Setting up: $ENV environment"

current_dir=`pwd`

# Create a dict here and key -> file name in git repo, value -> file name and location in the machine
# Iterate over the dict and in a loop put everything in place.

#conf_files="

if [ ! -f $HOME/.bash_aliases ]; then
    ln -s $current_dir/aliasrc ~/.bash_aliases
else
    echo .bash_aliases already exists! Not creating symlink.
fi

source install.sh
source func.sh

#Not using firefox anymore due to flash issues.
#if [ ! -f ~/.vimperatorcc ]; then
#    ln -s $current_dir/vimperatorrc ~/.vimperatorrc
#else
#    echo .vimperatorrc already exists! Not creating symlink.
#fi
