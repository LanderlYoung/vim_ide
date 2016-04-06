#! /usr/bin/env bash

VIM_IDE_PATH=""
VIM_CONF_HOME="${HOME}/.vim"

ZSHRC_PATH=${HOME}/.zshrc

#to be compatiable with unix(OS X)
if [[ `uname` == "Darwin" ]]; then
    VIM_IDE_PATH=$(dirname $(realpath $0))
else
    VIM_IDE_PATH=$(dirname $(readlink -f $0))
fi

doInstallVim() {
    echo "installing: $VIM_IDE_PATH -> $VIM_CONF_HOME"
    ln -s $VIM_IDE_PATH $VIM_CONF_HOME
    echo "installing vundle"
    git clone $VUNDLE_GIT_URL $VIM_VUNDLE_PATH
    echo "installing plugin"
    vim -c "PluginInstall"
}

doInstalZshrc() {
    echo "${VIM_IDE_PATH}/zshrc -> ${ZSHRC_PATH}"
    ln -s ${VIM_IDE_PATH}/zshrc ${ZSHRC_PATH}
}

if [[ -e $VIM_CONF_HOME || -h $VIM_CONF_HOME ]]; then
    echo "directory \"$VIM_CONF_HOME\" existed. Delete it? (N/y)"
    read override
    if [[ $override == "y" || $override == "Y" ]]; then
        echo "removing \"$VIM_CONF_HOME\""
        rm -rf $VIM_CONF_HOME
    else
        echo "aborting"
        exit 1
    fi
    unset override
fi

if [[ -e $ZSHRC_PATH || -h $ZSHRC_PATH ]]; then
    echo "zshrc \"${ZSHRC_PATH}\" existed. Delete it? (N/y)"
    read override
    if [[ $override == "y" || $override == "Y" ]]; then
        echo "removing \"${ZSHRC_PATH}\""
        rm -rf ${ZSHRC_PATH}
    else
        echo "aborting"
        exit 2
    fi
fi

doInstalZshrc

doInstallVim


