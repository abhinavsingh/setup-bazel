const core = require('@actions/core');
const github = require('@actions/github');
const exec = require('child_process').exec;

try {
    exec('./setup-bazel.sh', function(error, stdout, stderr) {
        if (error) {
            core.setFailed(error.message);
        }
    });
} catch (error) {
    core.setFailed(error.message);
}