---
_organized: true
---
[[ReadItLater]] [[Article]]

# [6 reasons Syncthing is still the best peer-to-peer file sync tool](https://www.xda-developers.com/reasons-syncthing-best-peer-to-peer-file-sync-tool/)

Making files accessible between devices, while convenient, sometimes comes with privacy trade-offs or additional costs. Free [cloud storage](https://www.xda-developers.com/best-online-services-for-long-term-data-backups/) quotas run out too quickly and not everyone has the skills to self-host their own servers.

However, Syncthing offers plenty of benefits and functionality, while still remaining user-friendly and convenient to use for people are aren't super technical. For these and other reasons, I think it's the best peer-to-peer file syncing tool to use for most people.

## Syncthing is free, but also private and secure

### Privacy is paramount

   ![Syncthing Windows Installation Step 1](https://static0.xdaimages.com/wordpress/wp-content/uploads/wm/2025/08/syncthing-windows-installation-01.jpg?q=49&fit=crop&w=825&dpr=2)

Usually, when it comes to free tools, there's a privacy trade-off. However, all communication in Syncthing is secured using TLS, and only devices you have approved can connect to your machine, each identified by a cryptographic certificate. There is also no central server that your data passes through, which ensures your privacy and reduces the number of points of exposure for your files.

The developers also state that protecting user data is a top priority. This includes protection from eavesdropping through perfect forward secrecy. For those who want additional protection, you can also enable GUI authentication in Syncthing using a username and password.

The fact that Syncthing is open-source also means that its code is open to scrutiny by other developers. In fact, Syncthing has a dedicated email address where others can report any potential security vulnerabilities.

## It supports a variety of platforms

### All major computing operating systems are supported

   ![syncthing downloads page](https://static0.xdaimages.com/wordpress/wp-content/uploads/2025/10/syncthing-downloads-page.png?q=49&fit=crop&w=825&dpr=2)

Sometimes I find a great app I want to try, only to find that it's limited to a certain platform. This is especially true for open-source software, since the available versions often depend on the devices developers have access to.

But Syncthing works across all major computing operating systems, and even has community Android apps that you can use to sync files with your phone. In terms of computing platforms, Syncthing has versions available for Linux, Windows, macOS, FreeBSD, OpenBSD, and illumos. You can also [self-host Syncthing](https://www.xda-developers.com/i-self-host-syncthing-to-sync-files-between-my-pc-mac-nas-and-other-devices/) in a container, which makes it useful for use on your NAS. For iOS, the Mobius app can be used with Syncthing.

## It works even if the internet is down

   ![Hand holding a Toshiba external drive in front of a windows screen showing no internet connection](https://static0.xdaimages.com/wordpress/wp-content/uploads/wm/2025/08/no-internet-external-storage-1.jpg?q=49&fit=crop&w=825&dpr=2)

One of the things that really impressed me about Syncthing is its offline functionality. As long as your devices are connected to the same local network, your files will still sync even if the internet is not working.

I tested this out on my own home network to confirm that syncing still works. My desktop is connected to my router by Ethernet, while my phone and laptop are connected by Wi-Fi. I unplugged my router from my CPE and disconnected my phone from mobile data to make sure there was no internet access for any of my devices.

I then opened Syncthing in my browser. It showed both my phone and laptop as connected to my desktop. I was able to create a new file in the shared folder on my desktop, and it synced to both my phone and my laptop. This offline functionality makes it useful if you have spotty internet or frequent outages.

## Setup is relatively simple

### Different installers for different needs

While some people might choose to install Syncthing using the [command line](https://www.xda-developers.com/basic-command-line-entries-everyone-should-know/), the software also provides installers for Mac and Windows for users who prefer a graphical interface. This also lets you set a shortcut to the configuration page so you don't have to remember the service's local IP address and port.

I wouldn't say it's as easy to use as something like OneDrive, but it's also not too complicated. Once you know the basics of how to add a device and folder, it's incredibly easy to use. I watched a short video to figure out what I should do once I had accessed the web interface—mainly how to add a device. Once I understood the flow, I was able to easily keep adding devices and new folders.

   ![adding a device in syncthing](https://static0.xdaimages.com/wordpress/wp-content/uploads/wm/2025/10/adding-a-device-in-syncthing.png?q=49&fit=crop&w=825&dpr=2)

When you want to add a device, you simply need to select **Add Remote Device**. You can then enter the device ID. To find this ID, you can select the code next to **Identification** and copy the code, or scan the QR code. You will then need to accept the prompt to add a device on the hardware you're connecting to. However, you only need to go through this process if Syncthing doesn't automatically discover the device on your network.

When you share a folder, you will need to select or create a folder locally on your device. Once you share the folder, you will need to create a folder on the secondary device where the files will sync. These folders can have different names, but will share a folder ID.

It's important to note that in order to link devices, they will all need Syncthing installed.

## Syncthing is decentralized

### This has a few benefits

   ![multiple devices and folders in syncthing](https://static0.xdaimages.com/wordpress/wp-content/uploads/wm/2025/10/multiple-devices-and-folders-in-syncthing.png?q=49&fit=crop&w=825&dpr=2)

Since Syncthing uses peer-to-peer file sharing, it's decentralized. This means that there is no central server for sharing files. This enhances privacy compared to other file-sharing services, where a third-party server handles the data. It also means that there are fewer concerns about outages.

It also means that even on your own network, there is no central device. Rather, each device acts as a node and can contribute to synced files. For example, my desktop computer doesn't need to be online for me to make changes to the folder that is shared across my desktop, laptop, and smartphone.

To test this, while my laptop was offline, I created a new file on my smartphone. This was made available on my desktop within seconds. Once I switched on my laptop, the file synced there too. This is despite the folder originally being created on my desktop.

However, this decentralized nature means that there's an important caveat to take into account. Syncthing is not a backup service by default. Since changes on one device affect the shared folder on all devices, this means that deleting or altering a file on one node affects all folders.

You can use file versioning to protect against data loss, as well as set up send-only or receive-only folders and devices. However, I recommend setting up additional safeguards if you want to back up files rather than just syncing them.

### No paid or online tools needed

Besides sharing and syncing files across devices on your local network, Syncthing is also useful for syncing certain apps that are primarily local-first. Obsidian is a great use case, since you can share a folder and open it as a vault in Obsidian.

For example, I took my existing Obsidian vault on my desktop and set it up as a Syncthing shared folder. After adding the folder to my laptop via Syncthing, I used the **Open folder as vault** option in Obsidian. This created a synced vault that updated when I made changes on either my laptop or desktop. It even synced my plugins between the two devices.

However, the caveat is that it can create sync conflicts. While I didn't notice this on my laptop or desktop, it was an occasional issue on my Android device.

Another use is syncing your save games from various emulators, as you can create a folder shared between devices specifically for these saves. This makes it easier to switch between devices without manually copying your progress.

### Syncthing is simple yet powerful

It's easy to get started with Syncthing, but its functionality is incredibly powerful. There are built-in file-sharing tools you can use with your devices at home, but things get a bit more complicated when you want to add encryption, authentication, or syncing across different platforms. However, with Syncthing, you can get all this functionality without hassle.

   ![The Syncthing icon](https://static0.xdaimages.com/wordpress/wp-content/uploads/2024/09/syncthing.png?q=70&fit=contain&w=420&dpr=1)

##### Syncthing