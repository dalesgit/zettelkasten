---
created: 2026-01-15T10:37:42 (UTC -05:00)
tags: []
source: https://www.howtogeek.com/ive-been-using-these-core-linux-commands-wrong/
author: Bobby Jack
_organized: true
---

# I've been using these 8 core Linux commands wrong for years

> ## Excerpt
> You've probably been using them wrong, too.

---
[![4](https://static0.howtogeekimages.com/wordpress%2Fwp-content%2Fauthors%2F66d846911d127-IMG-20230907-WA0003.jpg?fit=crop&w=90&h=90)](https://www.howtogeek.com/author/bobby-jack/)

A technology enthusiast, Bobby studied Computer Science at the University of Southampton before working in a number of roles across industries, from the private sector to the charitable one, at multinationals and startups. He’s helped maintain backend Java servers, designed databases and front-end interfaces, and created a bespoke content management system.

Bobby also enjoys video gaming, and has written for several outlets, including a stint as Editor-in-Chief at [Switch Player Magazine](https://switchplayer.net/) and contributions to online magazine, [SUPERJUMP](https://www.superjumpmagazine.com/). Bobby uses a Mac for day-to-day work and an Android phone for distractions.

Like all longtime Linux users, I've memorized various terminal shortcuts and commands that I use over and over again. But I've also realized that I don't always use these tools to their full potential. So, here's the right way to use them.

Hidden files on Linux are powerful and convenient, mainly because they are so simple. A file beginning with a period (.) is a hidden file. It won't show up, by default, in terminal listings and file managers.

When you need to see hidden files, just use the **\-a** option, and all is good, right?

```bash
ls -a
```

   ![Terminal output of the ls -a command showing the special files . and ..](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/ls-a-hidden-1.png?q=70&fit=crop&w=825&dpr=1)

Fortunately, there's an easy solution: the -a option has a corresponding -A, which shows hidden files but hides these shortcuts:

```bash
ls -A
```

   ![Terminal output of the ls -A command showing a hidden file but not the special files . and ..](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/ls-a-hidden-2.png?q=70&fit=crop&w=825&dpr=1)

You'll probably want to [set up an alias for this command](https://www.howtogeek.com/439736/how-to-create-aliases-and-shell-functions-on-linux/), or any of the others covered here. You can then continue using ls as before, safe in the knowledge that you’ll never need to see "." or ".." again.

## Grep recursively without a pipe

Very often, I will use find's **exec** option to grep for something. This is a basic way of emulating a "find in files" task:

```perl
find . -exec grep 'hello' {} \;
```

But this command is lengthy, and it sure wasn't fun learning find's obscure syntax. I felt foolish when I discovered that grep has built-in support for recursive searches, but I'm still glad I did! This command is much more convenient, and it’s easy to learn:

```perl
grep -r 'hello'
```

## Make deep directories with one command

Now and then, you'll find yourself wanting to create a deep directory hierarchy like this:

```bash
mkdir blog/2024/09/16
```

   ![An error from mkdir showing that a file or directory does not exist.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/mkdir.png?q=70&fit=crop&w=825&dpr=1)

The error message doesn't even clearly explain what the problem is! Helpfully, a simple option will create any missing directories, although you may be left wondering why it isn't the default. To create a directory, including any intermediate directories that do not already exist, just use **\-p**:

```bash
mkdir -p blog/2024/09/16
```

   ![The Linux mkdir-p command which creates a set of nested directories in one step.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/mkdir-p.png?q=70&fit=crop&w=825&dpr=1)

You can remember this by thinking of "p" as an abbreviation for either "path" or "parents."

## Switch between two directories instantly

If you use the command line regularly, you'll be used to navigating directories using cd. You're probably also used to toggling between two directories, going back and forth to run a command in one, inspect files in another, and so on. Maybe you even [use the history command to repeat yourself](https://www.howtogeek.com/465243/how-to-use-the-history-command-on-linux/).

By now, you won't be surprised to learn there's a better way. The cd has several secrets, but one of the most useful shortcuts is the "cd -" form:

   ![The cd - command which toggles between two directories.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/cd.png?q=70&fit=crop&w=825&dpr=1)

Each time you run "cd -" it will flip between the previous two directories you navigated to, making it very fast and easy to move back and forth.

"cd -" will print the path of the directory it changes to, even if you have the current directory in your prompt.

## Copy directories with maximum fidelity

You may already know about copying directories with cp -R:

```bash
cp -R docs backup-docs
```

However, you might notice that the copies aren't exactly the same as the originals. Their modification times, owners, and permissions may all be different. For example, in the following case, the copy has a different modification time than the original:

   ![The cp -R command which copies a directory recursively.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/cp-r.png?q=70&fit=crop&w=825&dpr=1)

These times only differ by a minute, but the problem can be much greater. The fix is simple: use -a (for "archive") instead of -R:

   ![The cp -a command which copies a directory recursively in archive mode, preserving file attributes.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/cp-a.png?q=70&fit=crop&w=825&dpr=1)

## Extract tar.gz files with a single command

[Tarfiles are still one of the most popular](https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/) ways to distribute collections of files on Linux, especially source code. They are usually gzipped to reduce size during download or storage. If you've used these two programs your entire Linux life, you may be used to doing this kind of thing with your eyes closed:

```
gunzip archive.tar.gz
tar xvf archive.tar
```

Which will first uncompress the gzip file, and then unpack the tar file inside it. But, thanks to modern sensibilities, tar can do both in a single step, using the z flag instead of x:

```
tar zvf archive.tar.gz
```

This approach is more convenient and less prone to error. What's more, recent versions of tar will auto-detect gzip files and uncompress them automatically! So you can skip straight to:

```
tar xvf archive.tar.gz
```

## Use cat to inspect files quickly

The cat command is so-called because it concatenates—joins—files together. But you may be used to using it simply to view the contents of files. If so, you're probably unaware of a couple of useful options that make file viewing with cat just a little bit more pleasant.

First, **cat -s** will squeeze several blank lines together, making certain file formats easier to view in a terminal.

Use them both together, as **cat -sb**, and you can use cat as a simple file viewer without reaching for [a pager like less](https://www.howtogeek.com/444233/how-to-use-the-less-command-on-linux/).

   ![Sample output from the cat -sb command which compresses empty lines and numbers non-empty lines.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/cat-sb.png?q=70&fit=crop&w=825&dpr=1)

## Get concise disk usage

Finding out how much space a directory occupies is useful when you're spring-cleaning. But du's default behavior produces a lot of output as it reports the size of each and every directory down the complete hierarchy. As a result, you may find yourself running the command several times, piping its output to grep, redirecting it to temporary files, and so on.

```bash
du --max-depth 1
```

You'll see results for the current directory, and its immediate sub-directories, without seeing the size of each and every directory below them in the hierarchy:

   ![The du --max-depth command showing total sizes of immediate sub-directories only.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/du-max-depth.png?q=70&fit=crop&w=825&dpr=1)

___

If you want to learn more about mastering the command line, check out our guide to [terminal typos you should avoid at all costs](https://www.howtogeek.com/856515/typos-you-really-need-to-avoid-on-linux/).
