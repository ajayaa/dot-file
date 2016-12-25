ENV=SERVER
if $EN

current_dir=`pwd`

if [ ! -f ~/.bash_aliases ]; then
    ln -s $current_dir/aliasrc ~/.bash_aliases
else
    echo .bash_aliases already exists! Not creating symlink.
fi

source install.sh
source func.sh

# Not using firefox anymore due to flash issues.
#if [ ! -f ~/.vimperatorcc ]; then
#    ln -s $current_dir/vimperatorrc ~/.vimperatorrc
#else
#    echo .vimperatorrc already exists! Not creating symlink.
#fi
