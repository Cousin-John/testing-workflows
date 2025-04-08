# Branch and Command Executor Workflow Testing Guide

This document provides instructions for testing the Branch and Command Executor workflow, which creates a new branch, runs a specified command, and creates a PR with the changes.

## Prerequisites

- Access to the GitHub repository
- Permissions to run workflows
- The repository must have the `build-runner` runner configured (or modify the workflow to use `ubuntu-latest`)

## How to Test

### 1. Manual Trigger

1. Go to the repository's "Actions" tab
2. Select "Branch and Command Executor" from the workflows list
3. Click "Run workflow"
4. Fill in the required inputs:
   - `baseBranch`: The branch to create the new branch from (e.g., "dev")
   - `newBranch`: Name for the new branch (e.g., "test/auto-gen-123")
   - `workingDir`: Directory to execute the command in (e.g., "./")
   - `bashCommand`: The command to execute (e.g., "echo 'test' > test.txt")

### 2. Test Scenarios

#### Basic Test (Simple File Creation)
```
baseBranch: dev
newBranch: test/simple-file
workingDir: ./
bashCommand: echo "test content" > test.txt
```
**Expected Result**: Creates a new branch, adds a file, and creates a PR with the changes.

#### No Changes Test
```
baseBranch: dev
newBranch: test/no-changes
workingDir: ./
bashCommand: echo "just a test"
```
**Expected Result**: Creates a new branch, runs the command, but doesn't create a PR since no files were changed.

#### Multiple Files Test
```
baseBranch: dev
newBranch: test/multiple-files
workingDir: ./
bashCommand: |
  mkdir -p test-dir
  echo "file1" > test-dir/file1.txt
  echo "file2" > test-dir/file2.txt
```
**Expected Result**: Creates a new branch, creates a directory with multiple files, and creates a PR with all changes.

#### Invalid Directory Test
```
baseBranch: dev
newBranch: test/invalid-dir
workingDir: ./non-existent-directory
bashCommand: echo "test" > test.txt
```
**Expected Result**: Workflow should fail with an error about the working directory not existing.

#### Existing Branch Test
```
baseBranch: dev
newBranch: test/simple-file  # Use a branch name that already exists
workingDir: ./
bashCommand: echo "test" > test.txt
```
**Expected Result**: Workflow should fail with an error about the branch already existing.

## Troubleshooting

### Common Issues

1. **Permission Errors**
   - Ensure the `GITHUB_TOKEN` has the required permissions:
     - `contents: write`
     - `pull-requests: write`

2. **Runner Issues**
   - If using `build-runner`, ensure it's properly configured
   - For testing, you can modify the workflow to use `ubuntu-latest` instead

3. **Command Timeout**
   - Commands have a 25-minute timeout
   - For long-running commands, consider breaking them into smaller steps

4. **Output Truncation**
   - Command output is truncated at 65,000 characters
   - Check the PR description for truncation notices

### Debugging Tips

- Check the workflow run logs for detailed information
- Look for the "Command Output" group in the logs to see the command's output
- Verify the PR description contains the expected information
- Check that the branch was created with the correct name

## Next Steps

After successful testing, consider:

1. Adding more specific test cases for your use case
2. Documenting common commands for your team
3. Setting up automated testing for the workflow itself 