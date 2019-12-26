const core = require('@actions/core');
const exec = require('child_process').exec;
const path = require('path');

try {
    const setupBazel = path.join(__dirname, 'setup-bazel.sh');
    const version = core.getInput('version');
    exec(setupBazel + " " + version, function(error, stdout, stderr) {
        if (error) {
            core.setFailed(error.message);
        }
    });
} catch (error) {
    core.setFailed(error.message);
}