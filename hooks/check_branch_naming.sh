#!/usr/bin/env bash

# Get the name of the current branch
local_branch_name="$(git rev-parse --abbrev-ref HEAD)"

valid_branch_regex='^((feat|fix|hotfix|chore|release|test|docs|refactor|revert)\/[a-zA-Z0-9\-]+)$'

# Message to display if the branch name is invalid
message="There is something wrong with your branch name.
Branch names in this project must adhere to this contract: $valid_branch_regex.
Your commit will be rejected.
You should rename your branch to a valid name and try again."

# ANSI color escape codes
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if the current branch name matches the valid branch name pattern
if [[ ! $local_branch_name =~ $valid_branch_regex ]]; then
    echo -e "${RED}$message${NC}"  # Print message in red color
    exit 1  # Exit with a non-zero status to indicate failure
fi

# Exit with zero status to indicate success
exit 0
