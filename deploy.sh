#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# clean up first
#echo "Deleting old publication"
#rm -rf public
#mkdir public
#git worktree prune
#rm -rf .git/worktrees/public/

# Build the project.
hugo -D -d ../mwanakijiji.github.io # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd ../mwanakijiji.github.io

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin main
