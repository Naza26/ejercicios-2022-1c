## What is Git?

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

## What is Github?

GitHub is a code hosting platform for version control and collaboration. It lets you and others work together on projects from anywhere.

## So, what's the difference between Git and Github?

In summary, Git is a version control system, while GitHub is a web-based platform that provides hosting for Git repositories, as well as additional collaboration and project management features.

## Branching

1. **Create a new branch:** In GitHub, you can create a new branch by clicking on the "Branch" dropdown menu and typing in a name for your new branch. This will create a new branch that is identical to the current branch (usually the main branch, also called "master" or "main").

![Github Interface]()

If you want to use the command line you can do:

```
git branch new-feature
```

When you run this command, a new branch called new-feature is created, based off the current branch that you have checked out at that time.

For example, if you have the main branch checked out when you run this command, the new new-feature branch will be based off the main branch. If you have a different branch checked out, the new new-feature branch will be based off that branch instead.

To create a new branch based off a specific branch, you can use the git checkout command with the -b flag. The -b flag tells Git to create a new branch and switch to it at the same time. Here's an example:

```
git checkout -b new-feature existing-branch
```
In this example, new-feature is the name of the new branch you want to create, and existing-branch is the name of the branch you want to base it on. This command creates a new branch called new-feature that is identical to existing-branch, and switches to it so you can start making changes.


2. **Make changes:** Once you've created your new branch, you can start making changes to the code. These changes will only affect the new branch, and will not be visible in the main branch until you merge the two branches together. You can use any text editor or IDE to make these changes.

3. **Commit changes:** As you make changes, you'll need to commit them to the new branch using Git. You can do this either through the command line or through the GitHub user interface.

When using the command line you can do: 

```
git add .
git commit -m "Added new feature"
```

This will add all the changed files to the staging area, and then commit them with a message explaining what you've changed.

If you wanna make changes to specific files instead of staging all at once, you can do:

- Use the git status command to see which files have been modified.

- Identify the specific files you want to include in your commit.

- Use the git add command with the specific file names to add them to the staging area. For example:

```
git add file1.txt file2.txt
```

This will stage the changes made to file1.txt and file2.txt for the next commit.

```
git commit -m "Added new feature to file1.txt and file2.txt"
```

This will commit the changes you staged in previous step, along with a message that describes the changes you made.


4. **Merge changes:** Once you're ready to merge the changes from your new branch back into the main branch, you can do so through the GitHub interface. This will bring up a "pull request", which allows you to review the changes and make sure everything looks good before merging.

In the command line you can do:

```
git merge new-feature
```

This will merge the changes you made in the new-feature branch into the main branch.


5. **Resolve conflicts:** Sometimes, when you merge two branches together, there may be conflicts between the changes made in each branch. GitHub provides tools to help you resolve these conflicts and merge the changes together in a way that makes sense.

Overall, branching in GitHub allows you to experiment with new ideas and make changes to your code without affecting the main branch of development. It's an essential feature for collaborative development, as it allows multiple people to work on different parts of the codebase at the same time without stepping on each other's toes.

## Cloud VS Local


A local repository in Git is a copy of a repository that is stored on your own computer. It contains all the files, branches, and commits of the repository, and you can use Git commands to make changes, commit them, and track the history of the changes you've made. Local repositories are useful for working on a project when you don't have an internet connection, or for making changes without affecting the main repository until you're ready to merge your changes.

A cloud repository, on the other hand, is a repository that is stored on a remote server, such as GitHub. Cloud repositories allow you to store your code in the cloud, access it from anywhere with an internet connection, collaborate with others, and use additional features such as issue tracking, pull requests, and continuous integration. Cloud repositories are useful for collaborating on a project with others, sharing your code with the world, and backing up your code in case your local copy is lost or damaged.

For example, git clone is a Git command that allows you to create a local copy of a remote repository that is hosted on a cloud repository service, such as GitHub. When you run the git clone command, Git creates a copy of the repository on your local machine, including all the files, branches, and commit history.

```
git clone https://github.com/username/repo.git
```

In this example, https://github.com/username/repo.git is the URL of the remote repository you want to clone. When you run this command, Git creates a copy of the repository on your local machine, with the same directory structure as the remote repository.

Once you have cloned the repository, you can use Git commands to make changes, commit them, and push them back to the remote repository. When you push changes to the remote repository, Git automatically synchronizes your changes with the cloud repository, making them available to others who have access to the repository.

