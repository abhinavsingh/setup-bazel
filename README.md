# Setup Bazel

Cross platform [Bazel](https://bazel.build/) installation for your GitHub workflows.

## How it works?

- Action will install `bazel` binary for your GitHub workflows.
- It follows [official installation](https://docs.bazel.build/versions/master/install.html) instructions.

## Usage

```yaml
- name: Setup Bazel
  uses: abhinavsingh/setup-bazel@v2
  with:
    version: 2.0.0
- name: Use Bazel (Windows only)
  if: matrix.os == 'windows'
  run: ./bazel.exe -h
- name: Use Bazel
  if: matrix.os != 'windows'
  run: bazel -h
```

## Current Limitations

- On windows, `bazel.exe` is placed in project root.
  - Use as `./bazel.exe`