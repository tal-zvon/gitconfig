#!/bin/bash

GITCONFIG_TEMPLATE_NAME=gitconfig.template
GITCONFIG_PATH=~/.gitconfig
GITCONFIG_BACKUP_PATH=${GITCONFIG_PATH}.bkp

read -p 'Username: ' username
read -p 'Email: ' email

if [[ -e "$GITCONFIG_PATH" ]]
then
    if [[ ! -e "$GITCONFIG_BACKUP_PATH" ]]
    then
        cp -v "$GITCONFIG_PATH" "$GITCONFIG_BACKUP_PATH"
    fi
fi

cp -v "$GITCONFIG_TEMPLATE_NAME" "$GITCONFIG_PATH"
sed -i "s/{name}/$username/g" "$GITCONFIG_PATH"
sed -i "s/{email}/$email/g" "$GITCONFIG_PATH"
