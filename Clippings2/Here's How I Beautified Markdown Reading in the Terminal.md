---
title: "Here's How I Beautified Markdown Reading in the Terminal"
source: "https://www.howtogeek.com/heres-how-i-beautified-markdown-reading-in-the-terminal/"
author:
  - "[[Bobby Jack]]"
published: 2025-10-21
created: 2025-10-22
description: "Now I'm glowing with pride."
tags:
  - "clippings"
---
Markdown has become nearly ubiquitous as the language of choice for simple text files with a smattering of formatting. With a subset of HTML semantics coupled to friendlier syntax, you’ll see Markdown in README files, other documentation, and rudimentary forms of structured data.

Thanks to its pared-down syntax, Markdown is human-readable, but that doesn’t mean plain text is its best form. Various editors and viewers format Markdown, but Glow does this in the terminal, with spectacular results.

## What Is Glow?

Glow is one of those simple utilities that you might not seek out, but when you encounter it, you cannot imagine a world without it. The program uses color for syntax highlighting and special characters to render Markdown lists, tables, and more:

![A black page with white text showing the contents of a Markdown file with color highlighting, underlines, links, and bullet points.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/glow.png?q=49&fit=crop&w=500&dpr=2)

Credit: charmbracelet/glow

Glow has a narrow but comprehensive feature set that supports reading Markdown in a terminal as a pleasant experience. Even if you just install it and use it as a drop-in replacement for cat or less, it’s a decent upgrade. But it’s also worth your time exploring the TUI, the many configuration options, and ways of customizing Glow’s look.

## How to Install and Launch Glow

Glow supports many package managers, so to install it, simply run **brew install glow**, **pacman -S glow**, **pkg install glow**, or the appropriate alternative for your system. The [Glow README file](https://github.com/charmbracelet/glow?tab=readme-ov-file#package-manager) has instructions for Linux, Mac, and Windows, with binaries and build instructions also available.

Once you’ve installed it, the glow program should be available in a relevant directory that belongs to your PATH; on my macOS system, it’s in /opt/homebrew/bin, and on Ubuntu, it’s /snap/bin. So you should be able to run Glow simply by typing its name on your command line:

![Glow's TUI showing a list of Markdown files with a date underneath each one.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/glow-file-list.png?q=70&fit=crop&w=825&dpr=1)

Running Glow without any arguments will open the interactive TUI version, which displays Markdown files in your current directory and below. With a single file argument, Glow will send formatted output directly to your command line:

![The glow program displaying a formatted Markdown file on the command line.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-glow-cli.png?q=70&fit=crop&w=825&dpr=1)

You can also run glow and pass it a directory path, in which case it will open the TUI and show files within that directory.

## What Are Glow’s Best Features?

Glow is a simple app to use, so you don’t need to drill down deep into everything it offers to get a lot of benefit. Still, the following features are some of my personal highlights.

### File Browsing

Start glow without any arguments, and you’ll see a list of markdown files from the current directory and its sub-directories. A total count is displayed at the top, and you can navigate between pages using the left and right arrow keys.

This feature makes the program particularly good for browsing sets of markdown files. If you have a journal with one file per day, a book with each chapter as a markdown file, or lots of repositories with README.md files, you’ll appreciate this feature.

### Themes

Glow’s main appeal is its attractive visuals, and themes are an unsurprising part of that. Mostly, they change the specific color scheme used to render a markdown file, but they can also apply other formatting, including bold, underline, inverse, and generated content like heading markers.

Use the --style option to specify a named theme. For example, to use the “Tokyo Night” theme:

```xml
glow --style "Tokyo Night" README.me
```

![A Markdown file displayed using glow and the Tokyo Night theme.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-glow-theme.png?q=70&fit=crop&w=825&dpr=1)

### Keyboard Shortcuts

Keyboard shortcuts are vital for a terminal-based file reader, and Glow’s TUI reuses many key combos from [the less pager](https://www.howtogeek.com/444233/how-to-use-the-less-command-on-linux/).

As in less, the up and down arrows move by one line at a time, and b/f move backward and forward through your file, one page at a time. You can also use g and G to move to the start of the file or the end of it, respectively.

Possibly my favorite shortcut is the e key, which edits the current file, opening it immediately in your text editor using the EDITOR variable. Most of the time I use Glow, it’s for reading, but if I spot a typo or decide I need to make any other kind of quick edit, this feature is very convenient.

### Pager

Talking of pagers, you can also bring your preferred one to Glow when it’s running in CLI mode. By default, glow will print the full file to your terminal in this mode, but you can use the -p option to instruct it to use a pager instead:

```xml
glow -p README.md
```

With -p, glow will use your PAGER or “less -r” [if that environment variable isn't set](https://www.howtogeek.com/668503/how-to-set-environment-variables-in-bash-on-linux/). Frustratingly, the option doesn’t let you override PAGER, but you can do that by prefixing the glow command:

```xml
PAGER=bat glow -p README.md
```

The [bat](https://www.howtogeek.com/facts-that-make-bat-better-than-cat/) and [ov](https://github.com/noborus/ov) pagers both work well with glow, but I received an error when I tried the [most](https://www.jedsoft.org/most/) pager.

### Settings and the Glow Config File

Most config settings are mirrors of command-line options, so the config file is really a convenience. If you find yourself running glow with the same command-line options a lot, consider setting them in the config file to change the default behavior.

Editing Glow’s config file is a straightforward process thanks to the config command:

```xml
glow config
```

This will open Glow’s config file in your EDITOR. The file’s location will depend on your environment—on my macOS system, it’s at /Users/bobby/Library/Preferences/glow/glow.yml—but this command means you don’t need to worry about the specific path, which is a great touch.

For example, if you tend to use the --all=false option to suppress hidden files, you can run **glow config** and ensure the following line is in your file:

```javascript
all: false
```