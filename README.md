# Setup Bazel

Cross platform [Bazel](https://bazel.build/) installation for your GitHub workflows.

## Example Usage

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
