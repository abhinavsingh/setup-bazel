const core = require('@actions/core');
const github = require('@actions/github');

try {
    exec('./setup-bazel.sh', function(error, stdout, stderr) {
        if (error) {
            core.setFailed(error.message);
        }
    });
} catch (error) {
    core.setFailed(error.message);
}