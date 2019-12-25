# Setup Bazel

Cross platform [Bazel](https://bazel.build/) installation for your GitHub workflows.

## How it works?

- Action will install `bazel` binary for your GitHub workflows.
- It follows [official installation](https://docs.bazel.build/versions/master/install.html) instructions.

## Usage

```yaml
- name: Setup Bazel
  uses: abhinavsingh/setup-bazel@master
- name: Use Bazel (Windows only)
  if: matrix.os == 'windows'
  run: ./bazel.exe -h
- name: Use Bazel
  if: matrix.os != 'windows'
  run: bazel -h
```

## Current Limitations

- Only supports installation of `bazel-1.2.1`
- On windows, `bazel.exe` is placed in project root.
  - Use as `./bazel.exe`

If there is enough interest in this repo will be happy to extend support
for multiple bazel versions and move bazel.exe under windows PATH.
