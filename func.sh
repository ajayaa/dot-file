# Swap content of two files.
swap()         
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# List PIDs for a process
list_pid(){
  pids=`ps -e | grep $1 | cut -d " " -f 2`
  echo -n "pids are "; echo $pids
}
