---
title: "Here's How I Batch Install All My Old Apps When Switching Linux Distros"
source: "https://www.howtogeek.com/how-i-batch-install-all-my-old-apps-when-switching-linux-distros/"
author:
  - "[[Jordan Gloor]]"
published: 2025-10-02
created: 2025-10-04
description: "Save yourself some time by using these simple commands."
tags:
  - "clippings"
---
Whether the year of the Linux desktop is here or not, switching distros is still a pain. If you're planning to make a move to another Linux distribution, here's how I batch-install all my old applications I was using on the previous one.

You could of course just eyeball your application launcher and hand-write a list of apps you want to install, then manually search for and install all of them on your new system. I've done that before, and it's tedious work. You also won't see most command line tools that way. Batch-installing will save you a ton of time, and fortunately Linux command shells were built for such time-saving tasks.

## Don't Fear the Terminal

If you're switching Linux distros, and you want to automate or semi-automate the installation of apps you like, you're going to need to be comfortable with the terminal. To my knowledge, none of the graphical software managers have a means of batch-installing applications.

If you haven't yet, consider reviewing [Linux terminal guidelines for beginners](https://www.howtogeek.com/never-used-the-linux-terminal-before-heres-how-to-get-started/). For this particular guide, you'll definitely want to be familiar with [installing software from the Linux terminal](https://www.howtogeek.com/how-to-install-and-remove-software-in-linux-using-the-terminal/). You might also benefit from checking out [a few beginner Bash scripts](https://www.howtogeek.com/808593/bash-script-examples/).

## Before Switching, Run These Commands

Before deleting my current Linux distro, I need to grab a list of manually installed packages. This will include every piece of software installed on my system that didn't come with it by default. Later, I'll batch-install everything on my new system using that list.

Of course, this isn't a foolproof method. Different distros—and even different versions of the same distro—can have different software installed by default. It's possible a few apps that were preinstalled on my current distro won't be present on the new one. The vast majority should be covered though.

If my current distro is Debian, Ubuntu, or one of their derivatives, I can use the apt-mark command to list all the packages I installed myself from the distro repository.

```
apt-mark showmanual
```

![Linux terminal showing the output of several applications from the apt-mark showmanual command.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-terminal-showing-the-output-of-several-applications-from-the-apt-mark-showmanual-command.png?q=70&fit=crop&w=825&dpr=1)

I also have several [Flatpaks](https://www.howtogeek.com/902275/what-is-a-flatpak-in-linux-and-how-do-you-install-one/) installed I want to use, so I ran this Flatpak command, which shows only the app name column from the list command, and pipes into [the head command](https://www.howtogeek.com/how-to-use-the-head-command-on-linux/) to cut the column heading:

```
flatpak list --app --columns=application | head -n-1
```

![Linux terminal showing the output of several applications from a flatpak list command.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-terminal-showing-the-output-of-several-applications-from-a-flatpak-list-command.png?q=70&fit=crop&w=825&dpr=1)

If you have Snap packages you want to batch-install, the best method I'm aware of for getting all their names is actually to list the directories in this location using [the ls command](https://www.howtogeek.com/448446/how-to-use-the-ls-command-on-linux/):

```
ls /snap/bin
```

It's not very elegant, and there might be some folder names that aren't software names at all. To confirm, you can compare it against the output of this command:

```
snap list
```

### Other Distro-Specific Package Managers

On Fedora and Arch systems, you can use these commands to see all installed packages:

```
dnf repoquery --userinstalled #Fedora
pacman -Qe #Arch
```

You'll notice the output shows version numbers along with package names. If the distro you're moving to may have the same packages with different version numbers, even if it uses the same package manager.

To print the list with those version numbers stripped out using [the awk command](https://www.howtogeek.com/562941/how-to-use-the-awk-command-on-linux/) on Fedora, you can run this:

```
rpm --query --all --info | awk --field-separator ': ' '/^Name/ {print $2}'
```

Or on Arch Linux, you can do the same with a simpler piping command:

```
pacman -Qe | awk '{print $1}'
```

## Save the Output Somewhere Safe

Now I need to either copy and paste or, better yet, pipe the output of those commands directly into individual files. For example, I made a file called my-packages.txt with the output on my Ubuntu device using this command:

```
apt-mark showmanual > my-packages.txt
```

![Linux terminal showing no visible output after redirecting the output of manually-installed package command to a text file.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-terminal-showing-no-visible-output-after-redirecting-the-output-of-manually-installed-package-command-to-a-text-file.png?q=70&fit=crop&w=825&dpr=1)

[The > redirect](https://www.howtogeek.com/how-to-pipe-and-redirect-like-a-pro-in-the-linux-command-line/) saves the output to the file. If you're using Fedora or Arch, you can just tack on that "> my-packages.txt" redirect exactly the same way.

I'm also going to do the same for my Flatpak applications:

```
flatpak list --app --columns=application > my-flatpaks.txt
```

Regardless of the distro, you can quickly confirm the redirect was successful with the cat command:

```
cat my-packages.txt
cat my-flatpaks.txt
```

![Linux terminal showing the output of cat commands on text files listing installed packages.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-terminal-showing-the-output-of-cat-commands-on-text-files-listing-installed-packages.png?q=70&fit=crop&w=825&dpr=1)

I *highly* recommend pruning from your lists any package names you aren't certain you want to bring over to the new machine. The first time I attempted this, I didn't bother pruning, and I ended up with weird graphical issues.

With all my application lists saved, it's time to transfer them to a thumb drive or to the cloud. Perhaps the most efficient method is to [back up your Linux device](https://www.howtogeek.com/this-open-source-app-is-my-favorite-way-to-backup-my-linux-pc/), then when you restore your files from the backup, find your package lists there.

The PNY Duo Link V3 flash drive offers both USB-C and USB-A plugs. With USB 3.2 Gen 2 speeds, you can expect up to 1,000MB/s read and 800MB/s write speeds from this flash drive. Coming in 256GB, 512GB, 1TB, and 2TB storage sizes, this all-metal flash drive makes it easy to bring large amounts of fast storage with you anywhere.

**Warranty**

2 Year

[$37 at Amazon](https://www.amazon.com/PNY-External-Compatible-Smartphone-Desktops/dp/B0FC3GCM8D?tag=hotoge-20&ascsubtag=UUhtgUeUpU2017064&asc_refurl=https%3A%2F%2Fwww.howtogeek.com%2Fhow-i-batch-install-all-my-old-apps-when-switching-linux-distros%2F&asc_campaign=Feed) [$37 at PNY](https://www.pny.com/PNY-DUO-Link-V3-USB-3-2-Gen-2-Type-C-OTG?sku=P-FDI256DULNK3TYC-GE)

## Run These Commands and Wait

Now it's time to actually do the batch installation. On my new Ubuntu computer where I copied over my pruned list of packages, I first tried running a simple APT install command with a variable. It may work for you if you're lucky.

```
sudo apt install $(cat my-packages.txt)
```

However, it threw a series of errors for me and failed to install any packages only because APT couldn't identify *some* of the package names. If you run into that too, this is the next best command I'm aware of for getting the job done:

```
for i in $(cat pkglist); do sudo apt-get install $i; done
```

This is [a Bash for loop](https://www.howtogeek.com/815778/bash-for-loops-examples/) that cycles through the entire list and attempts to install each one. If you're on Fedora or Arch, just type **dnf install** or **pacman -S** in place of "apt install".

This took quite a while for me because I didn't do much pruning. Also, be aware that it will occasionally ask you to confirm you want to install software. If you want to skip those prompts and install everything no-questions-asked, run this tweaked version of the same loop, with a -y flag on the APT command which will automatically answer "yes" to all confirmation prompts.

```
for i in $(cat my-packages.txt); do sudo apt install $ -y; done
```

![Linux terminal showing the output of a series of packages being installed.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-terminal-showing-the-output-of-a-series-of-packages-being-installed.png?q=70&fit=crop&w=815&dpr=1)

Once the main package manager script was done, it was time for my Flatpaks. I first had to install Flatpak support on Ubuntu, and then enable the Flathub repo:

```
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

I was able to install my Flatpaks using the simpler Bash command:

```
flatpak install $(cat my-flatpaks.txt)
```

![Linux terminal showing the output of a series of Flatpaks being installed.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/linux-terminal-showing-the-output-of-a-series-of-flatpaks-being-installed.png?q=70&fit=crop&w=815&dpr=1)

  

If it hadn't worked, I would have simply worked it into the for loop.

Be sure to review all the output from the installation commands you run. It's possible you'll see error messages for specific packages you installed. If that's the case, try installing them individually to figure out what the issue is.

Expect to have several issues if the distro you're hopping to uses a different package manager or repositories than the one you're switching from. Packages names are often slightly different between repositories, and your package manager may not be able to resolve those installation requests. They also may come from special repositories you'll need to find elsewhere.

---

One common type of Linux software I didn't mention here is AppImages. [I love using AppImages](https://www.howtogeek.com/i-turned-a-usb-drive-into-a-linux-app-swiss-army-knife/) because they can be transported between devices, and in a distro-hopping operation their portability will save you some time.