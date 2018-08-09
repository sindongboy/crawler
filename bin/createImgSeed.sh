#!/bin/bash


function usage() {
    echo "usage: $0 [option]"
    echo "-s    source directory"
    echo "-d    destination directory"
    exit 1
}

SRC=""
DST=""
while : ; do
    case "$1" in
        -s)
            [ -n "$SRC" ] && usage
            SRC=$2
            shift 2 ;;
        -d)
            [ -n "$DST" ] && usage
            DST=$2
            shift 2 ;;
        *)
            break ;;
    esac
done

find $SRC -type f -name "*" > ./tmp

while read line 
do
    id=`echo "${line}" | grep -o "[0-9][0-9]*"`
    url=`./extractImg.sh ${line}`
    echo -e "${url} -O ${DST}/${id}.jpg"
done < ./tmp
rm -f ./tmp
