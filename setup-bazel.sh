#!/bin/bash

VERSION=$1
ARCH="x86_64"
BAZEL_DOWNLOAD_PREFIX="https://github.com/bazelbuild/bazel/releases/download"

kernelName="$(uname -s)"
case "$kernelName" in
    Darwin*)
        installBazel=CommonSetup
        OS="darwin"
        ;;
    Linux*)
        installBazel=CommonSetup
        OS="linux"
        ;;
    *)
        installBazel=WindowsSetup
        OS="windows"
        ;;
esac

CommonSetup() {
    curl -fsSL ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-installer-${OS}-${ARCH}.sh \
        -o bazel-installer.sh
    if [[ $? != 0 ]]; then
        echo "Failed to download bazel installer: ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-installer-${OS}-${ARCH}.sh"
        exit 1
    fi
    chmod +x bazel-installer.sh
    sudo ./bazel-installer.sh
    rm bazel-installer.sh
}

WindowsSetup() {
    curl -fsSL ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-${OS}-${ARCH}.exe \
        -o bazel.exe
    if [[ $? != 0 ]]; then
        echo "Failed to download bazel exe: ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-${OS}-${ARCH}.exe"
        exit 1
    fi
}

$installBazel
