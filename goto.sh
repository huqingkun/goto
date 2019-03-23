LIST_DIR=`dirname $0`
SERVER_LIST_FILE="${LIST_DIR}/.server-list"

function init()
{
    echo "Start init method"
    echo $SHELL
    shname=$(echo $SHELL | awk -F/ '{print $NF}')
    awk -v file=${SERVER_LIST_FILE} -F' ' '{if($1=="ssh") print ":"$2 > file}' ~/.${shname}_history
    sort ${SERVER_LIST_FILE} | uniq | tee ${SERVER_LIST_FILE}
    echo "End init method"
}

if [[ -f "${SERVER_LIST_FILE}" ]]
then
    echo ${SERVER_LIST_FILE}
else
    touch "${SERVER_LIST_FILE}"
    init
fi

case "$1" in
    -l | --list)
    cat ${SERVER_LIST_FILE}
    ;;
    * )
    svc=$(cat ${SERVER_LIST_FILE} | grep $1 | cut -d : -f 2)
    svc=$(echo $svc | cut -d ' ' -f 1)
    echo $svc
    ssh $svc
    ;;
esac

