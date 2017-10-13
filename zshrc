# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
plugins=(osx git adb brew python svn emoji)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
if [[ -z $JAVA_HOME && -x /usr/libexec/java_home ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home)
fi
export ANDROID_SDK=${HOME}/Applications/android/sdk
export ANDROID_HOME=${ANDROID_SDK}
export android_home=${ANDROID_SDK}
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
# colorls -> gem install colorls -> https://github.com/athityakumar/colorls
alias lc='colorls'
export EDITOR='vim'

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
alias addr2line=$NDK_HOME/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-addr2line
alias sss='$ANDROID_SDK/platform-tools/systrace/systrace.py -t 10 -b 40960 -a com.tencent.radio.debug -o trace-`date +%s`.html'

ADB=${ANDROID_HOME}/platform-tools/adb
HPROF_CONV=${ANDROID_HOME}/platform-tools/hprof-conv
# customized functions
# dump droid heap
function droid_hd() {
    PACKAGE_NAME=$1
    if [[ -z $PACKAGE_NAME ]]; then
        PACKAGE_NAME="com.tencent.radio.debug"
    fi

    TIME=$(date +"%Y%m%d_%H%M%S")
    FILE_NAME="${PACKAGE_NAME}-${TIME}-heap.hprof"
    PATH_IN_PHONE="/data/local/tmp/${FILE_NAME}"

    ${ADB} shell rm ${PATH_IN_PHONE} 2> /dev/null

    echo "cause GC for ${PACKAGE_NAME}"
    ${ADB} shell pkill -l 10 ${PACKAGE_NAME}

    echo "> dump heap for ${PACKAGE_NAME}"
    ${ADB} shell "am dumpheap ${PACKAGE_NAME} ${PATH_IN_PHONE}"
    if [[ $? != 0 ]]; then
        echo
        ${ADB} devices
        echo "run command:"
        echo "\e[38;5;82mexport ANDROID_SERIAL="
        return
    fi
    # I don't want to... But it smees adb shell can't block untils it's done!
    sleep 3

    echo "> list heap for ${PATH_IN_PHONE}"
    ${ADB} shell ls -lh ${PATH_IN_PHONE}

    echo "> pull to computer"
    ${ADB} pull ${PATH_IN_PHONE} ./

    echo "> delete device copy"
    ${ADB} shell rm ${PATH_IN_PHONE}

    echo "> hprof-conv it"
    ${HPROF_CONV} ${FILE_NAME} droid-${FILE_NAME}

    echo "> remove tmp hprof"
    mv -f droid-${FILE_NAME} ${FILE_NAME}
    ls -lh ${FILE_NAME}
    echo "done! file: \e[38;5;82m ${FILE_NAME}"
}

function droid_mm() {
    PACKAGE_NAME=$1
    if [[ -z $PACKAGE_NAME ]]; then
        PACKAGE_NAME="com.tencent.radio.debug"
    fi

    ${ADB} shell dumpsys meminfo ${PACKAGE_NAME}
}


#add machine depend configs
if [[ -e "${HOME}/.zshmd" ]];then
    source "${HOME}/.zshmd"
fi

