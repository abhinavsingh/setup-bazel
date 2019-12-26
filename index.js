import { setFailed } from '@actions/core';
import github from '@actions/github';
import { exec } from 'child_process';
import { join } from 'path';

try {
    const setupBazel = join(__dirname, 'setup-bazel.sh');
    const version = core.getInput('version');
    exec(setupBazel + " " + version, function(error, stdout, stderr) {
        if (error) {
            setFailed(error.message);
        }
    });
} catch (error) {
    setFailed(error.message);
}