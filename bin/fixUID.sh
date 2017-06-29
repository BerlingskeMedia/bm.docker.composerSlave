#!/bin/bash

composeFile="build.yml"

if [ "${1}" == "revert" ]
then
    sed -i "s/USER_ID=[[:digit:]]\+/USER_ID=1502/g" ${composeFile}
    sed -i "s/USER_NAME=[[:alnum:]]\+/USER_NAME=development/g" ${composeFile}
else
    userId=`id -u`
    userName=`whoami`

    sed -i "s/USER_ID=[[:digit:]]\+/USER_ID=${userId}/g" ${composeFile}
    sed -i "s/USER_NAME=[[:alnum:]]\+/USER_NAME=${userName}/g" ${composeFile}
fi