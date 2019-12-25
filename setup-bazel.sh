#!/bin/bash

kernelName="$(uname -s)"
case "$kernelName" in
    Darwin*)    installBazel=MacSetup;;
    Linux*)     installBazel=LinuxSetup;;
    *)          installBazel=WindowsSetup;;
esac

MacSetup() {
    curl -fsSL https://github.com/bazelbuild/bazel/releases/download/1.2.1/bazel-1.2.1-installer-darwin-x86_64.sh \
        -o bazel-installer.sh
    chmod +x bazel-installer.sh
    sudo ./bazel-installer.sh
}

LinuxSetup() {
    curl -fsSL https://github.com/bazelbuild/bazel/releases/download/1.2.1/bazel-1.2.1-installer-linux-x86_64.sh \
        -o bazel-installer.sh
    chmod +x bazel-installer.sh
    sudo ./bazel-installer.sh
}

WindowsSetup() {
    curl -fsSL https://github.com/bazelbuild/bazel/releases/download/1.2.1/bazel-1.2.1-windows-x86_64.exe \
        -o bazel.exe
}

# Invoke installation method
$installBazel
