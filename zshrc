# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
plugins=(osx git adb brew python svn emoji)

source $ZSH/oh-my-zsh.sh
#add machine depend configs
if [[ -e "${HOME}/.zshmd" ]];then
    source "${HOME}/.zshmd"
fi

export LANG=en_US.UTF-8

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_SDK=${HOME}/Applications/android/sdk
export ANDROID_HOME=${ANDROID_SDK}
export ANDROID_NDK=${HOME}/Applications/android/ndk
export NDK_HOME=${ANDROID_NDK}

PATH=$PATH:$ANDROID_SDK/platform-tools:$ANDROID_NDK
PATH=$PATH:${HOME}/Applications/tools/bin/
export PATH

# soft ware config
DEFAULT_USER=young
eval "$(thefuck --alias fuck)"
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

function color {
    colordiff -U "$@" | less -RF
}
alias colordiff='colordiff -u 8'
alias diff='colordiff -u 8'
alias rm='trash'
alias pc='proxychains4 -q'
export EDITOR='vim'

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
alias addr2line=$NDK_HOME/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-addr2line
alias sss='$ANDROID_SDK/platform-tools/systrace/systrace.py -t 10 -b 40960 -a com.tencent.radio.debug -o trace-`date +%s`.html'

# customized functions
# dump droid heap
function droid_dd() {
    PACKAGE_NAME=$1
    if [[ -z $PACKAGE_NAME ]]; then
        PACKAGE_NAME="com.tencent.radio.debug"
    fi
    FILE_NAME="${PACKAGE_NAME}-heap.hprof"
    PATH_IN_PHONE="/sdcard/${FILE_NAME}"

    echo "#dump heap for ${PACKAGE_NAME}"
    adb shell am dumpheap ${PACKAGE_NAME} ${PATH_IN_PHONE}
    echo "#pull to computer"
    adb pull ${PATH_IN_PHONE} ./
    echo "#delete device copy"
    adb shell rm ${PATH_IN_PHONE}
    echo "#hprof-conv it"
    ${ANDROID_HOME}/platform-tools/hprof-conv ${FILE_NAME} droid-${FILE_NAME}
    echo "#remove tmp hprof"
    mv -f droid-${FILE_NAME} ${FILE_NAME}
}

