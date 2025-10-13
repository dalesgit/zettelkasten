---
tags:
  - file-sharing
  - server
  - python
---
# [How to transfer and share files over a network without a USB flash drive — and with just one line of code | Tom's Hardware](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)
Transferring files is something that we take for granted thanks to super-cheap USB storage and fast network connections. Every single reader has had an occasion where they needed to transfer files, and I bet most of us have just reached for a USB flash drive (perhaps one of the [best flash drives](https://www.tomshardware.com/best-picks/best-flash-drives)).

That tried-and-trusted method is just one way to transfer files, but what if there were alternatives? I’m not talking about Iomega Zip drives (I miss those!) or floppy disks (those too!) I’m talking about direct file transfer between machines on the same network.

[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Lets start with one of the most useful and simple methods. Luckily, it's baked directly into Python, which you can run on your OS of choice – but we’ll be focusing on Windows for this tutorial.

[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Running a Python File Server
----------

Yes, Python has its own web / file server baked into the standard Python library. Best of all, it is really easy to use.

You will need to have Python installed on your computer. Linux users will have this by default, and Windows users should follow our [guide on how to install Python.](https://www.tomshardware.com/how-to/install-python-on-windows-10-and-11)

1. **Find your IP address by first going to Settings >> Network & Internet, and click on Properties.**

![File Transfer](https://cdn.mos.cms.futurecdn.net/ZKvWyThFNjpp3RdMzDar8P.jpg)

(Image credit: Tom's Hardware)

2. **Scroll down to the Properties section and make a note of your IP address.**

![File Transfer](https://cdn.mos.cms.futurecdn.net/yzbiyR4DoMhhd5LeBYzb5P.jpg)

(Image credit: Tom's Hardware)

3. **Click on the Windows logo and search for Command prompt and press Enter to open.**

![File Transfer](https://cdn.mos.cms.futurecdn.net/i4Ag25VbXufSxunH5EPn9P.jpg)

(Image credit: Tom's Hardware)

4. **Navigate to the directory from which you wish to share files. I’ve put a load of test files in the folder.**

![File Transfer](https://cdn.mos.cms.futurecdn.net/7M6dHLqbejAcnid4xE8r8P.jpg)

(Image credit: Tom's Hardware)

5. **Run the command to start the server. Rather than starting an interactive Python session, this will start the Python interpreter and run the web server module from the standard Python library.**

```
python -m http.server
```

![File Transfer](https://cdn.mos.cms.futurecdn.net/p9oWEYB494zGhRBRZ83s8P.jpg)

(Image credit: Tom's Hardware)

6. **When prompted, allow access through your firewall.**

![File Transfer](https://cdn.mos.cms.futurecdn.net/zMLfhGe6Ky4c87rYA5Br8P.jpg)

(Image credit: Tom's Hardware)

7. **On another device, open a web browser and visit the IP address, add :8000 to the end.** You will see the files in the directory, and the Command Prompt will update to show the HTTP requests made as files are downloaded.

![File Transfer](https://cdn.mos.cms.futurecdn.net/mTyuC6YThgzfxPew3VkAAP.jpg)

(Image credit: Tom's Hardware)

8. To end the session, on the “server” press CTRL+C to stop the running command.

![File Transfer](https://cdn.mos.cms.futurecdn.net/ZiPgNvaVvPFr6xBjP2qt8P.jpg)

(Image credit: Tom's Hardware)[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Host a server using Copyparty
----------

Created by [9001](https://github.com/9001), Copyparty is a rather wonderful tool that turns almost any device capable of running Python into a file server. I’m not just talking about a simple file server here (though it does that too); it can also serve video to your devices directly from the browser, shrink downloads into ZIPs, create RSS feeds to track folder changes, and become an FTP or TFTP server. All you need is one file to make it happen, but Copyparty can be tweaked with an external config file should you want to perform more advanced tasks.

You will need to have Python installed on your computer. Linux users will have this by default, and Windows users should follow our [guide on how to install Python.](https://www.tomshardware.com/how-to/install-python-on-windows-10-and-11)

[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Getting started with Copyparty
----------

We’ll start with the most basic Copyparty setup: dropping one Python file in the directory that we want to share, and then running the file.

1. **Download** [**copyparty-sfx.py**](https://github.com/9001/copyparty/releases/latest/download/copyparty-sfx.py) **[direct download] from the Github repository.**

2. **Copy the file to the directory that you wish to share.**

3. **Open a Command Prompt / Terminal and run the Python file using the Python interpreter.**

```
python copyparty-sfx.py
```

4. **Check the output for the IP address of the server, and make a note of it and the port number**, typically 3923.

5. **On another computer, open a web browser and enter the IP address and port number for the Copyparty server. Mobile users can use the QR code to quickly open the Copyparty interface.**

![File Transfer](https://cdn.mos.cms.futurecdn.net/F7CYYZAVh34vGZ6Vx7PnFP.jpg)

(Image credit: Tom's Hardware)[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

The Copyparty Web Interface
----------

Copyparty, at its most basic level, is accessed from any web browser (even Netscape 4.0, it claims!) and it provides a list of the files and directories inside the directory that you are sharing. You cannot go into any directories that are outside of the shared directory.

Lets take a look at the interface.

![File Transfer](https://cdn.mos.cms.futurecdn.net/G4RhFybUwzTWhXFnFUCmCP.jpg)

(Image credit: Tom's Hardware)

1. **Toolbar submenu:** Here, we can see the icons for

* **Unpost:** Delete / abort uploads.
* **Up2k Uploads:** Upload tool that supports resuming.
* **Bup:** Basic Uploader that supports Netscape 4.0.
* **Mkdir:** Make a new directory.
* **New-md:** Make a new markdown file.
* **Msg:** Send a message to the server log. (I love the pager icon!)
* **Media Player Options:** Yes, Copyparty can play media in the browser, more on that later.
* **Configuration Options:** Clicking on this opens a tool to change how Copyparty is displayed, how files are downloaded and configuration for resumable uploads.

2. **Directory Tree:** Show the directory structure where the Copyparty server is running from.

3. **File Manager:** Shows the files and directories hosted by the Copyparty server. Note that column C refers to the filetype. Directories appear as Zip archives in the file manager.

[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Downloading from the Copyparty Server
----------

To open a file, simply click on it. This mostly triggers the browser to download the file, but for PDF, Images etc, the file will open in the browser. To directly download the file, right click and select Save As.

![File Transfer](https://cdn.mos.cms.futurecdn.net/RjL2EZceuodb5j3zpZU5UR.gif)

(Image credit: Tom's Hardware)

Media files can be played / previewed directly in the browser. So if you want to watch a movie or listen to music without installing any players, Copyparty will handle serving the media, and your browser will do the rest.

[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Uploading to the Copyparty Server
----------

You’ll have full read/write permissions for the Copyparty server, and that means you can upload directly to the server from the browser.

1. **Using your OS file manager, locate the files/directories that you wish to upload and drag them into the Copyparty browser window.**

2. **Drop the files/directories onto Upload, and click OK to confirm.**

![File Transfer](https://cdn.mos.cms.futurecdn.net/jAxdv72Gq9JyfXuC2nGqiP.gif)

(Image credit: Tom's Hardware)[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Stopping the Copyparty Server
----------

1. **On the machine running Copyparty, press CTRL + C to end the running command.** Alternatively, closing the terminal window will stop the server.

[](https://www.tomshardware.com/software/how-to-transfer-and-share-files-over-a-network-without-a-usb-flash-drive-and-with-just-one-line-of-code)

Taking Copyparty Further
----------

Copyparty is insanely useful and powerful. It could easily be used as the basis of a simple home server or used externally via a service such as Cloudflare.   
With Copyparty you can build the following servers.

You just need an old, beat-up laptop (or any system) and some USB storage to make your own server. To take advantage of these features, you’ll need to delve into the extensive, well-written [Copyparty documentation](https://github.com/9001/copyparty) and follow the path for the server that you wish to create.