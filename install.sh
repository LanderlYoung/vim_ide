#! /usr/bin/env bash

VIM_CONF_HOME="${HOME}/.vim"
VIM_IDE_PATH=$(dirname $(readlink -f $0))

VUNDLE_GIT_URL="https://github.com/gmarik/Vundle.vim.git"
VIM_VUNDLE_PATH=${VIM_CONF_HOME}/bundle/Vundle.vim

doInstall() {
    echo "installing: $VIM_IDE_PATH -> $VIM_CONF_HOME"
    ln -s $VIM_IDE_PATH $VIM_CONF_HOME
    echo "installing vundle"
    git clone $VUNDLE_GIT_URL $VIM_VUNDLE_PATH
    echo "installing plugin"
    vim -c "PluginInstall"
}

if [[ -e $VIM_CONF_HOME ]]; then
    echo "directory \"$VIM_CONF_HOME\" existed. Delete it? (N/y)"
    read override
    if [[ $override == "y" || $override == "Y" ]]; then
        echo "removing \"$VIM_CONF_HOME\""
        rm -rf $VIM_CONF_HOME
    else
        echo "aborting"
        exit 1
    fi
fi

doInstall

