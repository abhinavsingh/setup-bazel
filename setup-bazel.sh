#!/bin/bash

BAZEL_DOWNLOAD_PREFIX="https://github.com/bazelbuild/bazel/releases/download"
ARCH="x86_64"
VERSION=$1

kernelName="$(uname -s)"
case "$kernelName" in
    Darwin*)    installBazel=MacSetup;;
    Linux*)     installBazel=LinuxSetup;;
    *)          installBazel=WindowsSetup;;
esac

MacSetup() {
    curl -fsSL ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-installer-darwin-${ARCH}.sh \
        -o bazel-installer.sh
    chmod +x bazel-installer.sh
    sudo ./bazel-installer.sh
}

LinuxSetup() {
    curl -fsSL ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-installer-linux-${ARCH}.sh \
        -o bazel-installer.sh
    chmod +x bazel-installer.sh
    sudo ./bazel-installer.sh
}

WindowsSetup() {
    curl -fsSL ${BAZEL_DOWNLOAD_PREFIX}/${VERSION}/bazel-${VERSION}-windows-${ARCH}.exe \
        -o bazel.exe
}

# Invoke installation method
$installBazel
