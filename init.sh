# (TODO) Create a system to pass name of the platform and allow to create different conf
# files for different types of platform. The easiest way to achieve that is to
# create different conf files for different platforms. If done in a single conf file
# things would become a litle clumsy. More ideas?

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
