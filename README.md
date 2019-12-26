# Setup Bazel

Cross platform [Bazel](https://bazel.build/) installation for your GitHub workflows.

# Table of Contents

- [How it works](#how-it-works)
- [Usage](#usage)
    - [Install Latest Bazel Release](#install-latest-bazel-release)
    - [Pin Bazel Release](#pin-bazel-release)
- [Notes for Windows](#notes-for-windows)
- [Changelog](#changelog)
    - [v3](#v3)
    - [v2](#v2)
    - [v1](#v1)

## How it works

- Action installs `bazel` binary for your GitHub workflows.
- It follows [official installation](https://docs.bazel.build/versions/master/install.html) instructions.
- Support for pinning to specific `bazel` version.

## Usage

### Install Latest Bazel Release

```yaml
- name: Setup Bazel
  uses: abhinavsingh/setup-bazel@v3
- name: Use Bazel (Windows only)
  if: matrix.os == 'windows'
  run: ./bazel.exe -h
- name: Use Bazel
  if: matrix.os != 'windows'
  run: bazel -h
```

### Pin Bazel Release

To install a specific version of `bazel`:

```yaml
- name: Setup Bazel
  uses: abhinavsingh/setup-bazel@v3
  with:
    version: 2.0.0
```

## Notes for Windows

- `bazel.exe` is placed in your project root
- Use as `./bazel.exe`

## Changelog

### v3

- Aborts workflow if bazel setup fails.
- Now no artifacts are left under user repository.
  - Except on `windows` where Bazel is available as `./bazel.exe`.

### v2

- Added support bazel version pinning.

### v1

- First release.