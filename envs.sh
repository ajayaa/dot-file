if [[ $(uname) == 'Darwin' ]]; then
    export OS=mac
else
    export OS=linux
fi
export BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

