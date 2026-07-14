---
tags:
  - tech
  - terminal
_organized: true
---
[[ReadItLater]] [[Article]]

# [These fzf tricks will transform how you use the Linux terminal](https://www.howtogeek.com/these-fzf-tricks-will-transform-how-you-use-the-linux-terminal/)

[![4](https://static0.howtogeekimages.com/wordpress%2Fwp-content%2Fauthors%2F681d5801adcf2-folded_arms_1_500x500.jpg?fit=crop&w=90&h=90)](https://www.howtogeek.com/author/graeme-peacock/)

Graeme Peacock is a seasoned Linux expert with more than 15 years of hands-on experience. He has worked extensively with Ubuntu, Gentoo, Arch Linux, Qubes, and Fedora, gaining deep proficiency in everything from routine terminal operations to highly customized system builds.

Graeme began his journey with Ubuntu, quickly mastering the command line and essential system administration skills. A year later, he moved to Arch Linux, where he spent nearly a decade refining his expertise through the installation and configuration of multiple minimalist systems. After some time, he moved to Gentoo, where he configured and compiled both server and desktop environments using normal and hardened profiles and frequently compiled custom kernels. Graeme moved to Qubes in 2016, where he has remained ever since.

Graeme has extensive experience with highly configurable tools such as Vim, Neovim, and Emacs, and he maintains his own complex configurations. He is also highly proficient with Bash, Zsh, and dozens of utilities.

Graeme holds a B.S. in software engineering and has a strong passion for programming and web development. He is proficient in Golang, Python, Bash, JavaScript, TypeScript, HTML, and CSS. He also has considerable experience with Docker and is currently working on learning Kubernetes.

The terminal is clunky and inefficient without additional customizations. If you're a beginner, you may feel that this is as good as it gets, but it's not. One tool in particular stands out and can improve your experience drastically. I outline several reasons why fzf is my favorite terminal tool.

## What is fzf, and why is it amazing?

The [fzf](https://junegunn.github.io/fzf/) command is a tool for performing rapid searches over large lists of items. That may not sound very appealing, but how do you typically search through a vast number of choices on the terminal? For example, when choosing a file path from thousands of others—how do you achieve that? Do you struggle with tab completion, or do you perform some form of awkward terminal acrobatics? Neither is a suitable choice, and fzf addresses this problem directly.

   ![A terminal window shows the user searching a text file using the cat and FZF commands. First, the user uses the cat command to show there's lots of text in the text file. Then, the user pipes the file contents into the FZF command, which opens an FZF window. The user then types a word, and FZF narrows down the search result in real time.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/using_fzf_to_search_a_file-anim.gif?q=70&fit=crop&w=825&dpr=1)

## Installation

To follow along, you will need to install the fzf package.

On Debian, you should execute the following installation command.

```
        sudo apt install fzf
    
```

On Fedora, you should execute the following installation command.

```
        sudo dnf install fzf
    
```

On Arch Linux, you should execute the following installation command.

```
        sudo pacman -S fzf
    
```

Now, to enable fzf's advanced features, you need to add a line to your shell configuration file.

If you use Bash, put the following command into your [~/.bashrc](https://www.howtogeek.com/the-linux-bashrc-file-explained/) file and reload your shell with **source ~/.bashrc.**

```
        eval "$(fzf --bash)"
    
```

If you use Zsh, put this into your ~/.zshrc file and reload your shell with **source ~/.zshrc**.

```
        source <(fzf --zsh)
    
```

## Command history search

Searching your shell history in Bash—whether using the [history command](https://www.howtogeek.com/465243/how-to-use-the-history-command-on-linux/) or arrow keys—is unbearably slow. With fzf, you can instantly fuzzy search thousands of past commands in real time, which is easily my favorite terminal feature. Once you've activated fzf, just press Ctrl+R, start typing, and hit Enter to execute.

   ![A user chooses a command from a list of commands using FZF. When the FZF window is opened, the user types moo, and FZF narrows the command list down to a single cowsay command that says moo. The user then executes it.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/select_a_command_with_fzf-anim.gif?q=70&fit=crop&w=825&dpr=1)

There is a similar tool called [Atuin](https://www.howtogeek.com/this-linux-terminal-tool-supercharges-the-history-command/) that provides a very similar experience.

## Fast directory navigation

[Navigating the file system](https://www.howtogeek.com/how-to-navigate-your-file-system-using-the-linux-terminal/) can be time-consuming on the terminal, and after using it for some time, you may want a faster method. With fzf's advanced terminal features enabled, you can press Alt+C to quickly jump to any subdirectory. When you do that, fzf will present a recursive list of subdirectories, which allows you to quickly narrow them down and select one. This is helpful when you're trying to drill down into a deeply nested subdirectory.

   ![A terminal window shows the user activating the FZF command with the Alt+C keyboard shortcut. The user then types a few letters to narrow down and select a directory in real time. The user hits enter, and a CD command appears on the screen with the chosen path entered.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/fzf_directory_selection_with_the_alt-c_keyboard_shortcut-anim.gif?q=70&fit=crop&w=825&dpr=1)

## Quick file search and selection

Often, when typing out a command, you need to choose a file. Using [tab completion](https://www.howtogeek.com/linux-tab-completion-is-even-better-than-you-think/) is one approach, but it's not the best. A better approach is to use a fuzzy finder, and fzf provides a built-in file picker.

Start by typing out your command, and when it comes to choosing a file, press Ctrl+T. The fzf file picker will activate, recursively searching the current working directory. When you press Enter on a choice, it will complete your command with the chosen file.

   ![A terminal window shows a partially completed cat command. The user then activates the FZF command with the Control+T keyboard shortcut. The user then types a few letters to narrow down and select a file path in real time. The user hits enter, and the chosen path completes the cat command.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/select_a_file_with_fzf-anim.gif?q=70&fit=crop&w=825&dpr=1)

When you get the hang of it, activating fzf mid-command becomes second nature, and it drastically reduces the time to write the command.

## Easy process termination

[Killing a Linux process](https://www.howtogeek.com/how-to-manage-linux-processes-using-ps-kill-and-pkill/) can be a guessing game when you don't know its exact name. Commands like pgrep, killall, and kill all require the process name or ID, which can be difficult to remember at times. With fzf's shell integration, you can quickly search and select the process you want to terminate.

To kill processes with fzf, enter the following command and press the Tab key (do not press Enter):

```
        kill -9 **<TAB>
    
```

   ![A terminal window shows the user typing out a kill command. The command is appended with a double star. The user then hits the tab key, and an fzf window opens. The user partially types the name of a process and then hits enter.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/the_user_kills_a_process_with_fzf-anim.gif?q=70&fit=crop&w=825&dpr=1)

Using the fzf command allows you to rapidly select a process and kill it; it's much faster than the other commands, and it's forgiving when you've forgotten the exact name of the process.

## Bonus commands

The "\*\*" syntax triggers fzf's search window. The fzf commands you added to your shell configuration earlier created functions that handle this syntax and enable other fzf features.

The "\*\*" trigger works with almost any command; some commands are handled specially (like the SSH command), and the rest default to a file picker. I encourage you to try it out, keeping in mind that "\*\*" activates a file picker by default.

### SSH

SSH receives special handling. Tab-completing with \*\* lets you fuzzy search hosts from your SSH config, known hosts, and /etc/hosts.

```
        ssh **<TAB>
    
```

### Git

The fzf author provides an official [Git](http://www.howtogeek.com/git-or-github-what-is-the-difference/#so-what-is-git) script called [fzf-git.sh](https://github.com/junegunn/fzf-git.sh). If you follow the installation instructions on the repository README, you can gain access to rapid fuzzy completions over Git operations.

   ![A terminal window is split vertically. On the left side is a list of Git commits; on the right side is the information for the selected item.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/a-terminal-window-is-split-vertically-on-the-left-side-is-a-list-of-git-commits-on-the-right-side-is-the-information-for-the-selected-item.png?q=49&fit=crop&w=825&dpr=2)

### Environment Variables

Execute the following command to quickly know what the value of any [environment variable](https://www.howtogeek.com/842780/linux-list-environment-variables/) is.

```
        env | fzf
    
```

   ![A terminal window displays a list of environment variable names and values in an fzf window. The user is ready to perform a real-time fuzzy search.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/a-terminal-window-displays-a-list-of-environment-variable-names-and-values-in-an-fzf-window-the-user-is-ready-to-perform-a-real-time-fuzzy-search.png?q=49&fit=crop&w=825&dpr=2)

You can even quickly unset an environment variable with fzf:

```
        unset **<TAB>
    
```

### Systemd

Systemd is the init system for most distros; it handles the boot process, including system services. Managing systemd unit files is painful, and starting and stopping services benefits greatly from a fzf-based script. There is such a script, called [fuzzy-sys](https://github.com/NullSense/fuzzy-sys). To use it, follow the instructions in the script's repository README, then execute the following command.

```
        fuzzy-sys --status
    
```

That will show you the status of any service.

   ![A terminal window displays two window panes split vertically. On the left side is a list of services; on the right side is a preview window, which displays details about the selected service.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/a-terminal-window-displays-two-window-panes-split-vertically-on-the-left-side-is-a-list-of-services-on-the-right-side-is-a-preview-window-which-displays-details-about-the-selected-service.png?q=49&fit=crop&w=825&dpr=2)

It supports several flags, including start, stop, enable, and edit, etc. This script makes choosing a service a breeze; now you don't need to type out long and awkward service names.

---

Fzf dramatically improves terminal productivity and offers an extensive list of community scripts. Complex commands that once took minutes to write and execute now take seconds—writing and running multiple complicated commands in quick succession is now incredibly easy.