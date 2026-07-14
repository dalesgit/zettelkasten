---
_organized: true
---
[[ReadItLater]] [[Article]]

# [Daily driving Linux for 3 years taught me these 6 habits](https://www.howtogeek.com/daily-driving-linux-for-3-years-taught-me-these-6-habits/)

[![4](https://static0.howtogeekimages.com/wordpress%2Fwp-content%2Fauthors%2F663287d7024b6-avatar.png?fit=crop&w=90&h=90)](https://www.howtogeek.com/author/faisal-rasool/)

Faisal Rasool has been a feature writer at How-to Geek since early 2024. He brings five years of professional experience in simplifying technology for his readers on topics like mobile devices, PCs, and online privacy. He tries to help people get the most out of their gadgets and software with the least effort.

In his teenage years, he spent hours every day tinkering with Android phones and Linux builds. Faisal started his career at WhatMobile in 2019 (mostly out of his obsession with Android) where he published over 2,000 news stories. Currently, he contributes to the news section over at AndroidHeadlines.

He also authored more than 100 feature articles for SlashGear, covering Android, iOS, Web, Chromebooks, online privacy/security, and PC content. 

Faisal is also pursuing a Bachelor's in English literature to build up his writing chops. He enjoys watercolors, classic video games, animated films, and conversations with strangers.

### Summary

-   I now live in the terminal — comfortable with CLI, TUIs, and doing much work without a GUI.
-   I control updates — I decide when to upgrade; rolling-release keeps my system always current.
-   I favor tiling WMs, keyboard workflows, open-source apps, and regular backups to protect my setup.

I had used Windows since its XP days, and most of my life I stuck with it. Occasionally, I would dual-boot with a Linux distribution, but I always went back to Windows. About three years ago, I deleted Windows off my work computer and permanently switched to Linux. Here's how that decision slowly reshaped my tech habits.

## 1 Learned to use the terminal

The one thing Linux taught me more than anything is getting comfortable with the terminal. Growing up with Windows, I used to think the command-line was a (mostly) useless piece of legacy tech. I might use the Command Prompt, if a tutorial wanted me to, but that was the extent of my familiarity with it.

When I switched to Linux, it slowly grew on me to the point that I basically live in the terminal now. I often prefer a TUI (terminal user interface) over GUIs. I even get my writing [work done in the terminal](https://www.howtogeek.com/the-terminal-is-the-last-place-you-can-work-in-peace-heres-how-you-can-set-it-up/).

   ![The btop app in a Konsole window, with the default theme.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/07/the-btop-app-in-a-konsole-window-with-the-default-theme.png?q=70&fit=crop&w=825&dpr=1)

Early on, I would just blindly copy and paste commands into the terminal to install software. I didn't know what "apt" or "sudo" meant. It was just an alien language to me, but over time I built up an intuition for the command-line.

   ![Type sudo apt upgrade and hit Enter in the terminal to begin updating any installed packages.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/09/sudo-apt-upgrade-ubuntu.png?q=70&fit=crop&w=777&dpr=1)

For example, I learned that I was interacting with an app inside the terminal. Instead of using a mouse and clicking on things, I was using text to interact with it. I could call the APT app and access its many options by typing them next to its name. When that clicked for me, I no longer needed to hunt for installer commands online. I could just call "apt" and append it with "search" to look through the repositories for my target app. It seems trivial now, but it was a revelation back then.

   ![10_aptcache_using_search_option](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2015/09/10_aptcache_using_search_option.png?q=70&fit=crop&w=650&dpr=1)

I work with CLI tools all the time now. Instead of opening a website for certain tasks, I [open the terminal](https://www.howtogeek.com/8-things-you-should-with-terminal-commands-instead-of-opening-a-website/). I can comfortably navigate the file system, work with files, and make system changes without leaving the terminal. I have a terminal emulator installed on my phone, and [it can do some awesome things](https://www.howtogeek.com/4-awesome-and-practical-things-you-can-do-with-a-terminal-on-android/). I even use a [command-line package manager on my Windows devices](https://www.howtogeek.com/how-to-actually-use-the-windows-package-manager/).

![A terminal window with a weather report with ASCII art](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2021/07/WttrIn.png?q=70&fit=crop&w=650&dpr=1)Credit: Wttr.in delivers weather to your terminal.

## 2 Took control of system updates

Like most people, I was at the mercy of Microsoft for system updates before I switched to Linux. In fact, I didn't even know that there was an alternative. It just seemed like a fact of life that your computer can randomly decide to update and interrupt your work. I'm happy to report that I haven't had a frustrating system update experience in the past three years.

Linux takes an entirely different approach to system updates. The biggest difference is that you, not the software company, decide when to update. Most of the time, installing updates is as simple as running a single command in the terminal.

```
sudo pacman -Syu
```

   ![Screenshot showing upgrading CachyOS via the pacman command.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/03/screenshot-showing-upgrading-cachyos-via-the-pacman-command.png?q=70&fit=crop&w=825&dpr=1)

Some Linux distros follow the "[rolling release](https://www.howtogeek.com/what-are-rolling-release-linux-distros-continuous-updates-explained/)" model, which means there's just one version of the operating system, and it's always the latest one. I started with atomic release distros based on Debian and Ubuntu, but last year, I switched to Arch, which follows the "rolling release" style of system updates. I've picked up a habit of running its update command at least once a day. That way, I don't have to waste bandwidth or time and my computer is always up-to-date.

A Linux machine will never update without your explicit permission and the updates won't reboot the computer. You can also keep doing your work while the updates are installed in the background. You'll never see a black screen with the 'Don't turn off your computer' message.

## 3 Switched to a tiling window manager

It's genuinely shocking just how much of a difference a window manager can make. Traditional window managers spawn windows anywhere, and you have to use the mouse to drag them around or snap them in place. It feels like yet another fact of life, but there are other kinds of window managers too.

When I switched to CatchyOS, I also installed Hyprland with it. Hyprland is a [tiling window manager](https://www.howtogeek.com/what-is-a-tiling-window-manager/). What that means is that new windows don't just spawn anywhere. The first window takes up the whole screen. When you launch another app, the window manager automatically slices it down the middle. The same window is divided in half again when you open another app, and so on. Your windows are snapped in place for you, and you always know where the next one will show up.

You can rearrange windows, switch between them, close them, enter full screen, and so on with your keyboard.

## 4 Favoring the keyboard

A happy side effect of regularly using a tiling window manager and terminal is that I prefer to work with the keyboard now. I try to get things done without touching the mouse at all. It saves time and keeps me more focused. I've learned to launch apps, switch between desktops and apps, create custom shortcuts, and I'm even trying to switch to an entirely keyboard-driven browser called Qutebrowser. I'm also trying to learn Vim bindings these days, but I'm having trouble building muscle memory for it.

   ![An animation shows a menu appearing on the right side of a Neovim window. It displays over a dozen keymaps within it. The user selects one keymap, and another menu appears. The user selects another keymap. A search window finally appears.-anim](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/11/an-animation-shows-a-menu-appearing-on-the-right-side-of-a-neovim-window-it-displays-over-a-dozen-keymaps-within-it-the-user-selects-one-keymap-and-another-menu-appears-the-user-selects-another-keymap-a-search-window-finally-appears-anim.gif?q=49&fit=crop&w=825&dpr=2)

## 5 Prioritizing open source software

Installing Linux also brought me to the wonderful world of open-source software. Over the years, I've slowly replaced a lot of closed-source software with open-source alternatives. It used to hate following links to GitHub because the installation instructions there would be so complicated. I never feel that way anymore. I can flip through the documentation and get a good idea of what to do next right away.

   ![Some open source apps open in Garuda Linux sharing the same theme and design consistency.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/06/some-open-source-apps-open-in-garuda-linux-sharing-the-same-theme-and-design-consistency.png?q=70&fit=crop&w=825&dpr=1)

I [ditched Chrome for Firefox last year](https://www.howtogeek.com/why-i-switched-to-firefox-and-never-looked-back/), and I haven't gone back to it since. I use KSnip every day, and [it saves me hours of work](https://www.howtogeek.com/how-an-open-source-app-saves-me-hours-of-work-every-week/). Most of the [apps on my phone are open-source](https://www.howtogeek.com/7-open-source-android-apps-id-use-even-if-they-werent-free/), including the open-source app store, F-Droid. I've even started replacing my subscription services with self-hosted, open-source alternatives, and I'm loving it.

## 6 Started creating regular backups

On Windows, I never really cared much to back things up. If I lost some data or borked the system, I could just reset it and go about my day. However, since switching to Linux and putting in time to get my system looking and functioning exactly how I want, I would hate to lose it. So I've started making regular backups of stuff (mostly my config files for Hyprland and a few apps).

   ![Using rsync to move files from one server to another while showing the progress and speed.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/08/image.png?q=70&fit=crop&w=825&dpr=1)

---

My computing habits have changed in many meaningful ways after adopting Linux. I think Linux, and the open-source community as a whole, has made computing fun again for me. So I'm always happy to learn and adapt.