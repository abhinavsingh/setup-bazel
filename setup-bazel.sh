#!/bin/bash

VERSION=$1
ARCH="x86_64"
BAZEL_DOWNLOAD_PREFIX="https://github.com/bazelbuild/bazel/releases/download"

kernelName="$(uname -s)"
case "$kernelName" in
    Darwin*)    installBazel=CommonSetup;;
    Linux*)     installBazel=CommonSetup;;
    *)          installBazel=WindowsSetup;;
esac

CommonSetup() {
    curl -fsSL ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-installer-darwin-${ARCH}.sh \
        -o bazel-installer.sh
    if [[ $? != 0 ]]; then
        echo "Failed to download bazel installer"
        exit 1
    fi
    chmod +x bazel-installer.sh
    sudo ./bazel-installer.sh
    rm bazel-installer.sh
}

WindowsSetup() {
    curl -fsSL ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-windows-${ARCH}.exe \
        -o bazel.exe
    if [[ $? != 0 ]]; then
        echo "Failed to download bazel exe"
        exit 1
    fi
}

$installBazel
