import { setFailed } from '@actions/core';
import github from '@actions/github';
import { exec } from 'child_process';
import { join } from 'path';

try {
    exec(join(__dirname, 'setup-bazel.sh'), function(error, stdout, stderr) {
        if (error) {
            setFailed(error.message);
        }
    });
} catch (error) {
    setFailed(error.message);
}