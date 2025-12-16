[[ReadItLater]] [[Article]]

# [Syncthing and Tailscale gave me the private cloud experience I always wanted Dropbox to be](https://www.xda-developers.com/syncthing-and-tailscale-gave-me-a-private-cloud/)

[![4](https://static0.xdaimages.com/wordpress%2Fwp-content%2Fauthors%2F66963136cc077-ayush-pande.jpg?fit=crop&w=90&h=90)](https://www.xda-developers.com/author/ayush-pande/)

Ayush Pande is a PC hardware and gaming writer. When he's not working on a new article, you can find him with his head stuck inside a PC or tinkering with a server operating system. Besides computing, his interests include spending hours in long RPGs, yelling at his friends in co-op games, and practicing guitar.

Online cloud platforms like Dropbox offer the convenience of letting you access important files from any system, though their utility comes to a standstill the moment you run out of space. After that, it’s either a game of eliminating the least useful files to continue using the platform or paying regular subscription fees to upgrade to a higher capacity storage plan. And if you’re anything like me, you’ll have to begrudgingly deal with the privacy issues of a third-party platform.

Luckily, my deep dive into the home server landscape helped me tinker with a variety of services. [Syncthing](https://www.xda-developers.com/i-self-host-syncthing-to-sync-files-between-my-pc-mac-nas-and-other-devices/) is one of them, and while it’s not exactly a cloud platform on its own, combining it with [Tailscale](https://www.xda-developers.com/tailscale-guide/) helped me create an automated file sync workflow and kick Dropbox out of my systems.

For the folks wondering whether Syncthing can double as a backup service, then no, it’s far from something that can generate redundant copies. At its core, it’s a file-synchronization tool that can overwrite files on the client machine, server rig, or even both, depending on the configuration. If you’re not careful, you can easily end up losing precious files by accidentally overwriting them. So, it’s a good idea to familiarize yourself with Syncthing before you go around creating multi-directional links for essential documents.

## Syncthing is responsible for auto-syncing my documents

### I configured the remote node as an introducer

   ![Creating a Syncthing share on Windows](https://static0.xdaimages.com/wordpress/wp-content/uploads/wm/2025/11/syncthing-windows-1.jpg?q=49&fit=crop&w=825&dpr=2)

Just to keep things simple in the beginning, I planned a rudimentary version of my automatic file synchronization workflow that would initially involve just two devices. Since I work on my Windows 11 system every day, it would act as the “client,” while my Proxmox home would double as the “server.” Whenever I make changes to a certain folder on the client, I’d expect them to be written to another folder on the server (and vice versa).

Once I add more devices to the mix, I’d want them to synchronize files with my local system, even when the remote node is unreachable. I could technically create links between every device, but doing so will be a royal pain once the number of nodes exceeds single digits. Considering all the virtual guests and devices in my computing arsenal, that’s bound to happen sooner or later.

Syncthing solves this conundrum by allowing me to specify a device as the Introducer, which would allow other systems to connect to a specific shared folder within the mesh setup. This facility makes Syncthing perfect for my makeshift private cloud.

Anyway, deploying Syncthing was a breeze on both the client and the server. On my Windows 11 system, I simply installed the executable file from the official [Syncthing GitHub repo](https://github.com/syncthing/syncthing) before using the *https:*//*127.0.0.1:8384* IP address to log into the local web UI. Inside, I used the **Add Folder** button to create a new directory for my shared files.

Since I was using a Proxmox node as the server, I used the ultra-useful Proxmox VE Helper-Scripts repo to spin up a Syncthing LXC. All I had to do was head to the **Shell** section of the node and enter the *bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/syncthing.sh)"* command into the terminal. Since I’ve got enough space on the host, I edited the configuration of the Syncthing container to increase its disk size and waited for the script to do its magic.

Once the Syncthing LXC was up and running, I switched back to the web UI of the instance running on my Windows 11 machine and added it as the **Introducer** node. I could add my shared folder as is, but I wanted to enable another neat feature to make my life easier…

   ![Enabling file versioning on Syncthing](https://static0.xdaimages.com/wordpress/wp-content/uploads/wm/2025/11/syncthing-proxmox-8.jpg?q=49&fit=crop&w=825&dpr=2)

Let’s say I accidentally edited a file within a shared folder. Since Syncthing is configured to share it with my PVE instance, it would overwrite the file, and I’d have no way of recovering the original, untainted document. That’s where the **File Versioning** options come in handy, as they let me create redundant copies of data for a couple of overwrites. Sure, it would end up increasing disk space, but I wouldn’t have to worry about accidental edits messing up my carefully-planned workflow.

## Tailscale connects my Syncthing instances

### Long live Tailscale subnet routers

Before I could go about incorporating other devices into my workflow, I had to figure out a way to allow remote machines to communicate with the Syncthing setup. Since my home lab is afflicted with the malady called CGNAT, I couldn’t use a fully self-hosted setup. Tailscale offers a reasonable solution by allowing me to use the company’s relay nodes to establish a secure connection between my local devices and those paired with an external network.

On my Windows 11 system, installing Tailscale was as simple as running the .exe file from its [official website](https://tailscale.com/). After that, I simply logged into Tailscale’s web UI to add the machine to my Tailnet Control Plane.

I keep my Proxmox nodes running 24/7, so I can deploy a Tailscale subnet router within an LXC. That way, I can log into any service on my home LAN – including the Syncthing instance – from any device on the same Tailnet. The caveat is that an unprivileged LXC requires a couple of extra modifications for subnet-based routing.

After creating an unprivileged LXC for Tailscale using a Debian template, I switched to the **Shell** tab within my [Proxmox](https://www.xda-developers.com/proxmox-guide/) node and used the *nano /etc/pve/lxc/vm\_id.conf* command to open the container’s config file, with *vm\_id* being its numerical identifier (*103* in my case). Since unprivileged containers have certain networking restrictions, I had to append the following code at the end of the file to grant network tunneling permissions to the LXC:

```
lxc.cgroup2.devices.allow: c 10:200 rwmlxc.mount.entry: /dev/net/tun dev/net/tun none bind,create=file
```

Switching back to the container, I used the *nano /etc/sysctl.conf* command to open the file containing the kernel parameters and uncommented the *net.ipv4.ip\_forward=1* and *net.ipv6.conf.all.forwarding=1* lines to enable IP forwarding. Then, I updated the container with the latest packages, installed curl using *apt install curl -y*, and ran *curl -fsSL https://tailscale.com/install.sh | sh* to install Tailscale. Once the script had finished grabbing the Tailscale files, I ran the *tailscale up --advertise-exit-node --ssh --advertise-routes=192.168.0.0/24* command to start Tailscale and generate a link that would let me connect my freshly-spun up LXC with the rest of my Tailnet.

### Adding more nodes to the private cloud

   ![The Syncthing tab in TrueNAS Scale](https://static0.xdaimages.com/wordpress/wp-content/uploads/wm/2025/07/syncthing-2.jpg?q=49&fit=crop&w=825&dpr=2)

Now that I’d finished setting up the client-server pair, it was time to bring the other devices in my home lab into the mix. Since I wanted the PVE Syncthing instance to be the introducer for each node, I followed the same process as my Windows 11 machine to connect them to this setup. Just to add some extra protection to my private cloud, I scheduled weekly backup tasks for my Proxmox-based LXC to my PBS instance. That way, I’d have some backup files to fall back on in case something goes wrong.