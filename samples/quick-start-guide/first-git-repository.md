# Quick start: create your first Git repository

> **Sample document.** I wrote this guide to show how I write a one-page quick
> start. I ran every command to check the results.

In about five minutes, you will create a Git repository, save your first
change and see it in the project history.

**Before you begin:** Install [Git](https://git-scm.com/downloads) and open a
terminal. On Windows, use Git Bash or PowerShell.

## 1. Check that Git is installed

```bash
git --version
```

You should see a version number, for example `git version 2.43.0`. Your number
may be different.

## 2. Tell Git who you are

Git adds your name and email address to every change you save. You only need to
do this once on each computer.

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Replace the example name and email address with your own.

## 3. Create a repository

Create a folder for your project, move into it, and start a repository:

```bash
mkdir my-first-repo
cd my-first-repo
git init -b main
```

Git confirms that it created the repository:

```text
Initialized empty Git repository in /home/you/my-first-repo/.git/
```

The folder name in your message will be different.

## 4. Add a file

Create a file named `README.md`:

```bash
echo "# My first repository" > README.md
```

Check what Git sees:

```bash
git status
```

Git lists `README.md` as an untracked file. This means Git can see the file but
is not saving it yet:

```text
On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	README.md

nothing added to commit but untracked files present (use "git add" to track)
```

## 5. Save your first commit

A commit is a saved snapshot of your files. Saving takes two steps. First, you
choose the files to include. Then you save them with a short message that says
what changed.

```bash
git add README.md
git commit -m "Add README"
```

Git shows a summary of the commit:

```text
[main (root-commit) d2be91b] Add README
 1 file changed, 1 insertion(+)
 create mode 100644 README.md
```

The code after `main (root-commit)` is the commit's ID. Yours will be different.

## 6. See your history

```bash
git log --oneline
```

```text
d2be91b Add README
```

You now have a Git repository with one saved commit.

## If something goes wrong

| Message | Cause | Fix |
| --- | --- | --- |
| `git: command not found`, or `'git' is not recognized` on Windows | Git is not installed, or the terminal was open during installation. | Install Git, then close and reopen your terminal. |
| `error: unknown switch` after `git init -b main` | Your Git version is older than 2.28. | Run `git init`, then `git branch -M main`. |
| `Author identity unknown` | You skipped step 2. | Run the two `git config` commands from step 2, then repeat the commit. |

## Next steps

- Change `README.md`, then run `git diff` to see exactly what changed.
- Save the change with `git add README.md` and `git commit -m "Describe your change"`.
- Learn how branches let you work on changes without affecting the main project.
