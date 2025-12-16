---
title: "Stop opening your browser for these 8 tasks, the terminal does them better"
source: "https://www.howtogeek.com/8-things-you-should-with-terminal-commands-instead-of-opening-a-website/"
author:
  - "[[Faisal Rasool]]"
published: 2025-12-11
created: 2025-12-12
description: "These productivity hacks that will make you question your browser habits."
tags:
  - "clippings"
---
### Summary

- Terminal is approachable, faster, and ad-free—learn it to get things done.
- Use built-in CLI tools for passwords, weather, IP, speed tests, conversions, translations, and downloads.
- Install tools (openssl, yt-dlp, ffmpeg, qalc, speedtest-cli) to supercharge workflows on Linux or Windows.

The terminal looks like an unassuming (sometimes intimidating) black box and feels like it’s only meant for pros or experts. It’s not as inscrutable as it seems though. Anybody can learn to use it and get stuff done. Once you get the hang of it, you’ll often find yourself launching a terminal instead of opening a new browser tab. That’s because the terminal is faster, reliable, and never shows ads.

Wherever possible, I’ve included tools that are available on Windows, so you can run them directly within the [Windows Powershell terminal](https://www.howtogeek.com/831728/7-ways-to-open-windows-terminal-on-windows-11/) or Command Prompt. However, Linux has much wider support for command-line tools, which is why I recommend following along on a Linux desktop or [setting up a WSL box on your Windows](https://www.howtogeek.com/744328/how-to-install-the-windows-subsystem-for-linux-on-windows-11/) machine.

![Screenshot of a Welcome to WSL window with tips.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2024/11/wsl-getting-started.png?q=49&fit=crop&w=500&dpr=2)

Credit: Microsoft

## Generate secure passwords

On Linux, you can generate secure passwords of any length with one command. You can replace the ‘16’ with a number of your choice to dictate the length of the password.

```
openssl rand -base64 16
```

![Generating a secure password in Linux using the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764878139.png?q=70&fit=crop&w=825&dpr=1)

Windows has a solution for generating secure passwords too, but the built-in method is a handful. You need to run two lengthy commands back to back.

```
[Reflection.Assembly]::LoadWithPartialName("System.Web")
[System.Web.Security.Membership]::GeneratePassword(16, 3)
```

![Using Windows Powershell to generate secure passwords.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/ksnip_20251205-011023.png?q=70&fit=crop&w=825&dpr=1)

To make this process easier and faster, we can install a dedicated password generation tool. Run this command once to [install the app using winget](https://www.howtogeek.com/how-to-actually-use-the-windows-package-manager/).

```
winget install strongpasswordcli
```

![Using winget to install a password generation utility.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/ksnip_20251205-011208.png?q=70&fit=crop&w=825&dpr=1)

Once it’s installed, you don’t need to re-run the installation command. Just open a terminal and type ‘passcli.exe’ followed by the desired password length.

```
passcli.exe 20
```

![Generating secure passwords locally using Windows Powershell.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/ksnip_20251205-011340.png?q=70&fit=crop&w=812&dpr=1)

The password will be automatically copied to your clipboard, and you can paste it right away.

## Check the weather

This command is universal and works on macOS, Linux, and Windows the same way. Enter this command to get the weather for your current location.

```
curl wttr.in
```

- ![Using a curl command to load weather forecasts in the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879305.png?q=49&fit=contain&w=750&h=422&dpr=2)

- ![Using a curl command to load weather forecasts in the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879305.png?q=49&fit=crop&w=167&h=93&dpr=2)
- ![Loading weather forecasts for particular cities within the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879291.png?q=49&fit=crop&w=167&h=93&dpr=2)

You can get weather reports for a particular location using this command:

```
curl wttr.in/newyork
```

## Look up your IP address

You can find the local IP addresses of all [connected network interfaces](https://www.howtogeek.com/764894/what-is-a-network-adapter/) with a single command. On Windows, enter this command.

```
ipconfig
```

![Looking up the private IP addresses using the Windows terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/ksnip_20251205-011638.png?q=70&fit=crop&w=825&dpr=1)

On Linux, use the following command.

```
ip a
```

![Looking up the private IP addresses on Linux.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764950155.png?q=70&fit=crop&w=825&dpr=1)

You can also [find your public IP address](https://www.howtogeek.com/117371/how-to-find-your-computers-private-public-ip-addresses/) on either desktop platform using a curl command.

```
curl -4 icanhazip.com
```

![Using a curl command to find the public IP address of a Linux machine.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764950375.png?q=70&fit=crop&w=825&dpr=1)

## Run a speed test

Running an [internet speed test](https://www.howtogeek.com/426757/how-do-internet-speed-tests-work-and-how-accurate-are-they/) within the terminal is faster and just as functional. All you need to do is install the command-line app and run a simple command.

On Windows, you can install the app using winget.

```
winget install speedtest-cli
```

![Using winget to install a command-line tool for running internet speed tests.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/ksnip_20251205-011942.png?q=70&fit=crop&w=825&dpr=1)

The installation is a one-time process and after that you just need to enter the following command to test your internet speed.

```
speedtest
```

![Running an internet speed test within the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/ksnip_20251205-012012.png?q=70&fit=crop&w=825&dpr=1)

On Linux, you can use the [native package manager](https://www.howtogeek.com/apt-vs-dnf-vs-pacman-linux-package-managers-compared/) to install the same app. I’m using Arch for this demo, so I can install the app using the pacman package manager.

```
sudo pacman -S speedtest-cli
```

The following command triggers the speed test.

```
speedtest
```

![Running an internet speed test within the Linux terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879811.png?q=70&fit=crop&w=825&dpr=1)

## Convert files

[FFmpeg](https://www.howtogeek.com/tricks-you-can-do-with-ffmpeg-on-linux/) is an incredibly sophisticated and powerful tool for handling audio and video files. You can install it on Windows by opening a terminal and running the following command.

```
winget install ffmpeg
```

![Installing FFmpeg on Windows.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/ksnip_20251205-020235.png?q=70&fit=crop&w=825&dpr=1)

On Linux, you can install it using whatever package manager comes with your distribution.

```
sudo pacman -S ffmpeg
```

You only need to run the installation command once. FFmpeg can convert between virtually any video and audio format as long as you enter the file names and extensions correctly. The first file name will be your input file and its extension, and the second one is the output you want to get.

```
ffmpeg -i input.wav converted.mp3
```

- ![Converting a WAV file into MP3 using FFmpeg.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879990.png?q=49&fit=contain&w=567&h=319&dpr=2)

- ![Converting a WAV file into MP3 using FFmpeg.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879990.png?q=49&fit=crop&w=167&h=93&dpr=2)
- ![A file converted into MP3 format using FFmpeg.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879998.png?q=49&fit=crop&w=167&h=93&dpr=2)

- ![Converting a WAV file into MP3 using FFmpeg.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879990.png?q=49&fit=contain&w=1134&h=902&dpr=2)
- ![A file converted into MP3 format using FFmpeg.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879998.png?q=49&fit=contain&w=1432&h=1055&dpr=2)

- ![Converting a WAV file into MP3 using FFmpeg.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879990.png?q=49&fit=crop&w=145&h=85&dpr=2)
- ![A file converted into MP3 format using FFmpeg.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764879998.png?q=49&fit=crop&w=145&h=85&dpr=2)

## Do calculations and unit conversions

Qalculate is my favorite tool for doing calculations and conversions within the terminal. It can solve math problems, do unit conversions, and currency conversions, but the best part is that it displays the results as you type. On Windows, you can install Qalc using the following command:

```
winget install qalculate.qalculate
```

On Arch Linux, try this:

```
sudo pacman -S qalc
```

Then just type ‘qalc’ and hit Enter to get started. Simply type a mathematical expression to solve it instantly. To convert between currencies and units, type the numeral along with its unit or currency sign, followed by a ‘to’ and the target unit or currency.

- ![Using Qalc to run currency conversions.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764882906.png?q=70&fit=contain&w=705&h=396&dpr=1)

- ![Using Qalc to run currency conversions.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764882906.png?q=49&fit=crop&w=167&h=93&dpr=2)
- ![Using Qalc to run unit conversions.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764883023.png?q=49&fit=crop&w=167&h=93&dpr=2)
- ![Solving a mathematical expression in the terminal using Qalc.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764882842.png?q=49&fit=crop&w=167&h=93&dpr=2)

- ![Using Qalc to run currency conversions.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764882906.png?q=49&fit=contain&w=705&h=396&dpr=2)
- ![Using Qalc to run unit conversions.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764883023.png?q=49&fit=contain&w=888&h=475&dpr=2)
- ![Solving a mathematical expression in the terminal using Qalc.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764882842.png?q=49&fit=contain&w=973&h=609&dpr=2)

- ![Using Qalc to run currency conversions.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764882906.png?q=49&fit=crop&w=145&h=85&dpr=2)
- ![Using Qalc to run unit conversions.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764883023.png?q=49&fit=crop&w=145&h=85&dpr=2)
- ![Solving a mathematical expression in the terminal using Qalc.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764882842.png?q=49&fit=crop&w=145&h=85&dpr=2)

## Get dictionary definitions and translations

You can pull the dictionary definition for any word using the TranslateShell tool. The tool is only available on Linux, but you can always run it within a WSL box on Windows.

On Arch, you can use the following command, but the target package name is the same for all popular package managers.

```
sudo pacman -S translate-shell
```

![Installing Translate Shell on Arch Linux.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764945962.png?q=70&fit=crop&w=825&dpr=1)

To look up a dictionary definition, use this command, followed by the word you’re trying to search for.

```
trans -d repertoire
```

- ![Looking up dictionary defintions in the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764946010.png?q=70&fit=contain&w=750&h=422&dpr=1)

- ![Looking up dictionary defintions in the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764946010.png?q=49&fit=crop&w=167&h=93&dpr=2)
- ![Translating an English word into French using the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764945989.png?q=49&fit=crop&w=167&h=93&dpr=2)

- ![Looking up dictionary defintions in the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764946010.png?q=49&fit=contain&w=1386&h=453&dpr=2)
- ![Translating an English word into French using the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764945989.png?q=49&fit=contain&w=1176&h=878&dpr=2)

- ![Looking up dictionary defintions in the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764946010.png?q=49&fit=crop&w=145&h=85&dpr=2)
- ![Translating an English word into French using the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764945989.png?q=49&fit=crop&w=145&h=85&dpr=2)

For translations, type ‘trans’ followed by the specific languages you’re translating between and your target phrase or word.

```
trans -d en:fr “hello”
```

## Download media

I saved the best for last. A lot of websites designed for downloading or converting media files from platforms like YouTube or Twitter are riddled with ads. Even if you pay for some of these services, they can be slow or rate limit your downloads. The best way to download media files from the internet is arguably through the terminal using a tool called Yt-dlp.

You can install it on Windows using winget.

```
winget install yt-dlp
```

You might have to close the Terminal and reopen it for the changes to take effect.

On Linux, you can install the ‘yt-dlp’ package using the package manager of your choice.

```
sudo pacman -S yt-dlp
```

With that, you can simply type 'yt-dlp', followed by the URL of the video, audio, or GIF you’re trying to download.

```
yt-dlp https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

![Using Yt-dlp to download a video in the terminal.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/11/screenshot_1763112918.png?q=70&fit=crop&w=825&dpr=1)

The tool will download the file to whatever directory you’re currently in. Run the following command to figure out the current directory if you need to.

```
pwd
```

![Looking up the current directory using the 'pwd' command.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/12/screenshot_1764950933.png?q=70&fit=crop&w=825&dpr=1)

The yt-dlp command-line provides you with a ton of customization and conversion features too. Plus, it supports over 700 websites, including the most popular ones.

---

The terminal can be a little intimidating at first, but once you learn it, you’ll never look back. I’ve even [set up an entire distraction-free workspace in the terminal](https://www.howtogeek.com/the-terminal-is-the-last-place-you-can-work-in-peace-heres-how-you-can-set-it-up/).