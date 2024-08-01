# Git Commands

## Initialization and Configuration

# Initialize a new Git repository
git init

# Clone an existing repository
git clone <repository_url>

# Configure Git user information
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# View all configuration settings
git config --list

# Set a configuration setting (local or global)
git config <key> <value>
git config --global <key> <value>

## Working with Repositories

# Check the status of the working directory and staging area
git status

# Add files to the staging area
git add <file>
git add .

# Commit changes to the repository
git commit -m "Commit message"

# View commit history
git log
git log --oneline
git log --graph --oneline --decorate --all

# Show changes between commits or working directory
git diff
git diff <commit> <file>
git diff --cached

# Remove a file from the repository and working directory
git rm <file>

# Rename or move a file
git mv <old_name> <new_name>

## Branching and Merging

# Create a new branch
git branch <branch_name>

# List all branches
git branch

# Switch to another branch
git checkout <branch_name>

# Create and switch to a new branch
git checkout -b <branch_name>

# Merge a branch into the current branch
git merge <branch_name>

# Delete a branch
git branch -d <branch_name>
git branch -D <branch_name> # Force delete

## Remote Repositories

# Add a new remote repository
git remote add <remote_name> <remote_url>

# List remote repositories
git remote -v

# Fetch changes from a remote repository
git fetch <remote_name>

# Push changes to a remote repository
git push <remote_name> <branch_name>

# Pull changes from a remote repository
git pull <remote_name> <branch_name>

# Remove a remote repository
git remote remove <remote_name>

# Show information about a remote
git remote show <remote_name>

## Stashing and Cleaning

# Save changes to a stash
git stash

# List stashes
git stash list

# Apply the most recent stash
git stash apply

# Apply and remove the most recent stash
git stash pop

# Remove a specific stash
git stash drop <stash_name>

# Remove untracked files
git clean -f

# Remove untracked directories
git clean -fd

## Viewing and Comparing

# Show a specific commit
git show <commit_hash>

# Compare branches or commits
git diff <branch1>..<branch2>
git diff <commit1> <commit2>

## Undoing Changes

# Undo changes in the working directory
git checkout -- <file>

# Unstage a file from the staging area
git reset <file>

# Reset to a previous commit (soft, mixed, hard)
git reset --soft <commit>
git reset --mixed <commit>
git reset --hard <commit>

# Revert a commit
git revert <commit>

# Amend the last commit
git commit --amend

# Rebase a branch
git rebase <branch_name>

# Cherry-pick a commit
git cherry-pick <commit_hash>

# View the current branch name
git branch --show-current

# Show the current status of submodules
git submodule status

# Update submodules
git submodule update --init --recursive

## Tagging

# List all tags
git tag

# Create a new tag
git tag <tag_name>

# Create a new annotated tag
git tag -a <tag_name> -m "Tag message"

# Delete a tag
git tag -d <tag_name>

# Push a tag to a remote repository
git push <remote_name> <tag_name>

# Delete a tag from a remote repository
git push <remote_name> :refs/tags/<tag_name>
