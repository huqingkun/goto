LIST_DIR=`dirname $0`
case "$1" in
    -l | --list)
    cat $LIST_DIR/server-list.txt
    ;;
    * )
    ssh $(cat ${LIST_DIR}/server-list.txt | grep $1 | cut -d : -f 2)
    ;;
esac
