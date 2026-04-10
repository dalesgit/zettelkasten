[[ReadItLater]] [[Article]]

# [3 handy Linux apps you must try this weekend (November 7 - 9)](https://www.howtogeek.com/linux-apps-to-worth-installing-this-weekend-november-7/)

[![4](https://static0.howtogeekimages.com/wordpress%2Fwp-content%2Fauthors%2F669a78f661566-Jordan%20Gloor%20500px%20Square.jpg?fit=crop&w=90&h=90)](https://www.howtogeek.com/author/jordangloor/)

Jordan started writing technology guides in 2020, but his technology and writing experience extends far and wide. As a kid, he learned object scripting through the MS-DOS game engine ZZT, and he later taught himself the basics of Python programming. He's repaired his own smartphones, hosted home cloud servers, and revived old computers with Linux.

Prior to getting started at How-To Geek, Jordan published articles for [MakeUseOf](https://www.makeuseof.com/author/jordan-gloor/) about Linux commands, free and open-source software, and online privacy. Beyond technology, he's also professionally written on agriculture business for [Ozarks Farm & Neighbor](https://ozarksfn.com/author/jordan-gloor/), edited proposals for non-profits, and presented at a writer's conference on superheroes and culture.

Jordan earned a bachelor of arts in English in 2016, and he's coached college students on writing effectively and utilizing education technology. He also wrote and edited product descriptions for an e-commerce store for four years.

These days you'll find Jordan hosting movie streaming simulcasts with his friends over Discord, building VR-ready gaming PCs, or reviewing the latest Wi-Fi routers. You can follow him on [Mastodon](https://mas.to/@jordangloor).

It's the weekend again, and that means it's time to see if you're missing out on any good software for Linux computers. While scanning databases and forum discussions, I've found a few apps I think are worth checking out.

If I had to give this weekend's list a theme, it'd be simplifying. These are all tools that make a common job a little bit more straightforward, in one way or another.

## Caligula: Write images to USB from the terminal

   ![Using Caligula to burn an ISO file to a drive.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/11/using-caligula-to-burn-an-iso-file-to-a-drive.png?q=70&fit=crop&w=825&dpr=1)

I've tried a lot of different approaches to writing image files to USB drives while preparing to install Linux distributions. They vary in quality and reliability, but sometimes I yearn for the simplicity of the terminal. The trouble is, flashing a USB drive via the command line the traditional way isn't so simple. It's a pretty involved process to identify the drive and its partitions and then overwrite it with a long, option-heavy dd command.

Enter [Caligula](https://github.com/ifd3f/caligula), which is a terminal user interface for writing images to USB disks. It's written in Rust, for those who care, and it's meant to be a lightweight option while still offering an easy-to-use experience.

I tried it out using a CachyOS ISO file I had already downloaded, simply running this command:

```
caligula burn cachyos-desktop-linux-250828.iso
```

I was impressed by the straightforward prompts it gives you before launching into the actual writing process, which showcases a write speed graph and some statistics. Before that, Caligula requires you to provide a hash for verification, which, to be honest, is something I often forget to do. The next time I need to [make a bootable Linux drive](https://www.howtogeek.com/how-to-make-a-bootable-linux-usb-drive-on-pc-or-mac/), I'll probably be opening a terminal and running Caligula.

Unfortunately, Caligula isn't widely available unless you have a Rust installer like cargo ready to go. Arch users, though, can easily install it using **sudo pacman -S caligula** command, and NixOS folks can use the **nix-env -i caligula** command. Everyone else will have to get it using one of the alternative [Caligula installation methods](https://github.com/ifd3f/caligula?tab=readme-ov-file#how-to-install).

## OpenShot: Simple linear video editing

   ![OpenShot video editor interface.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/11/openshot-video-editor-interface.png?q=70&fit=crop&w=825&dpr=1)

When folks talk about video editors for Linux, they typically bring up Kdenlive or Davinci Resolve, or maybe Shotcut. While I've [used Kdenlive quite a bit](https://www.howtogeek.com/i-install-this-open-source-video-editor-on-all-my-computers-heres-why/) and do recommend it, there's a learning curve to it that I know can be off-putting to people who aren't trying to do anything professional. That's why I was excited to find [OpenShot](https://www.openshot.org/), which is much simpler to use while still giving you a variety of handy features.

I also like OpenShot for how much it reminds me of Windows Movie Maker, a [classic Windows app I used to love](https://www.howtogeek.com/remember-these-windows-apps-i-wish-they-never-vanished/) and that I poured many hours into making goofy little short films. The layout is similar, but the individual elements have been updated for a modern era using the Qt framework.

While the interface is basic, there are many effects to choose from, including important ones like chroma key, masking, and audio equalizers. There are a ton of fun and quirky transitions as well. I also really liked the addition of a dedicated emoji insert tool.

If you work across platforms, as many creatives do, don't worry; OpenShot is available for Windows and Mac too. To install on Linux, though, you can easily do that by looking up [OpenShot on Flathub](https://flathub.org/en/apps/org.openshot.OpenShot), or by running one of these commands:

```
sudo apt install openshot-qt #Debian and Ubuntusudo dnf install openshot #Fedorasudo pacman -S openshot #Archsudo zypper install openshot-qt #openSUSE
```

## Yakuake: A quicker-access terminal

   ![The Yakuake terminal emulator with transparency over the How-To Geek website.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/11/the-yakuake-terminal-emulator-with-transparency-over-the-how-to-geek-website.png?q=70&fit=crop&w=825&dpr=1)

If you frequently open and close the terminal, you might like [Yakuake](https://apps.kde.org/yakuake/). It's a terminal emulator that lives at the top of your desktop. It stays hidden until you call it with a keyboard shortcut, which by default is F12. It drops down like the console in Quake, you run a quick command, and then send it back up like an old-fashioned pull-down blind by hitting F12 again.

I like Yakuake because it's a little bit faster and more fluid than task-switching to a regular terminal window with Alt+Tab or popping open a new one. When you open it, it remains as a top-level window until you close it, too. If you set your terminal profile to use a transparent background (like I did in the screenshot above), you can keep using your other graphical tools too while monitoring activity in Yakuake.

Yakuake has advanced functionality too. It can run multiple tabs, plus keep those sessions active while you continue to work. It's like an always-open terminal that stays out of your way, without the need to rely on workspace organization tools like virtual desktops.

Yakuake is also highly configurable. If you hit Ctrl+Shift+, (comma), you can open its configuration menu and tweak how it works. You can adjust the size and position, which Konsole profile it uses by default, how fast the drop-down animation happens, and more.

You can install Yakuake from most Linux repositories:

```
sudo apt install yakuake #Debian and Ubuntusudo dnf install yakuake #Fedorasudo pacman -S yakuake #Archsudo zypper install yakuake #openSUSE
```

You can also [install Yakuake as a Flatpak](https://flathub.org/en/apps/org.kde.yakuake).

---

That's all I've got this week. If you're checking in for the first time, be sure to have a look at [the Linux apps I recommended last week](https://www.howtogeek.com/linux-apps-to-try-this-weekend-october-31/). They covered pixel art, hardware specs, and directory trees.