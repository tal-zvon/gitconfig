#!/bin/bash

GITCONFIG_TEMPLATE_NAME=gitconfig.template
GITCONFIG_PATH=~/.gitconfig
GITCONFIG_BACKUP_PATH=${GITCONFIG_PATH}.bkp

read -p 'Git Username to Set: ' username
read -p 'Git Email to Set: ' email

if [[ -e "$GITCONFIG_PATH" ]]
then
    if [[ ! -e "$GITCONFIG_BACKUP_PATH" ]]
    then
        cp -v "$GITCONFIG_PATH" "$GITCONFIG_BACKUP_PATH"
    fi
fi

if [[ -e "$GITCONFIG_TEMPLATE_NAME" ]]
then
    cp -v "$GITCONFIG_TEMPLATE_NAME" "$GITCONFIG_PATH"
else
    curl -fsSL "https://raw.githubusercontent.com/tal-zvon/gitconfig/master/$GITCONFIG_TEMPLATE_NAME" > "$GITCONFIG_PATH"
    if [[ $? != 0 ]]
    then
        echo "ERROR: Failed to download gitconfig.template" >&2
        exit 1
    fi
fi

sed -i "s/{name}/$username/g" "$GITCONFIG_PATH"
sed -i "s/{email}/$email/g" "$GITCONFIG_PATH"
