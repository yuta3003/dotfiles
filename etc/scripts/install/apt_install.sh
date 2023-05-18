#!/bin/bash
#=====================================================
# apt-get install at once from package list file
#=====================================================
TARGET="$@"

#if [ -z ${TARGET} ]; then
if [ "${#}" -eq 0 ]; then
    echo "Usage:"
    echo "apt-install [package name | package list file]"
    exit
fi

if [ -f ${1} ]; then
    for line in `cat ${1}`
    do
        if [ -n "${line}" ]; then
            ret=`dpkg -l ${line} | egrep "i\s*?${line}"`
            if [ -z "${ret}" ]; then
                sudo apt-get install ${line} -y
            fi
        fi
    done
else
    for i in `seq 1 ${#}`; do
        sudo apt-get install ${1} -y
        shift
    done
fi
