---
title: "Stop Using Docker and Try One of These 4 Alternatives Instead"
source: "https://www.howtogeek.com/stop-using-docker-and-try-one-of-these-alternatives-instead/"
author:
  - "[[Patrick Campanale]]"
published: 2025-10-19
created: 2025-10-19
description: "Don't put all your chips on Docker just yet."
tags:
  - "clippings"
---
Are you looking for an alternative to Docker that’s fully open source and doesn’t have any vendor-lock in? Well, there are four tools that you can use which are completely free of Docker’s influence.

Each tool has its own pros and cons, but thanks to the open source community and the Open Container Initiative (OCI), you’ll still have a large pool of containers to use, even without direct Docker integration.

## Podman

![Two screenshots of Podman showing running containers.](https://static0.howtogeekimages.com/wordpress/wp-content/uploads/2025/10/two-screenshots-of-podman-showing-running-containers.png?q=49&fit=crop&w=500&dpr=2)

Credit: Podman

[Podman](https://podman.io/) is probably one of the best Docker replacements around. The overall experience is quite similar to Docker at the top-level, but the core of Podman is very different. It uses libpod instead of containerd, and there’s no background service like dockerd that has to run for Podman to work.

With Podman, you’ll find an easy-to-use user interface that brings everything you need right to the front. You’ll be able to create your own containers, download containers from others, and manage running containers with ease. Podman works with most existing containers, as it’s OCI-compliant, and you can even run Docker Compose scripts for added versatility. You’ll also be able to use Podman in existing Kubernetes deployments, making it even more useful.

Podman’s containers run rootless and contain privileges for each individual container for added security. A few more notable features of Podman is that it is officially supported by Visual Studio Code and GitHub Actions.

Podman is completely free and open source, making it a fantastic alternative to Docker if you’re looking for something different to use.

Podman is a free and open-source container management platform built on libpod. It's an alternative to Docker and other container systems, allowing you to run rootless and containerized applications on your system.

[Get Started With Podman](https://podman.io/)

## Containerd + Nerdctl

If you don’t need a full graphical user interface, then opting for [containerd](https://github.com/containerd/containerd) and [nerdctl](https://github.com/containerd/nerdctl) is a great alternative to Docker. In fact, containerd is the backend of Docker, making it extremely familiar if you’re already used to using Docker. Nerdctl is a replacement for Docker-CLI, bringing familiar commands to a fully open source standard.

Pairing containerd and nerdctl gives you a CLI-only Docker experience, which is where Docker started after all. Of course, just like Docker and Podman, containerd and nerdctl are both OCI-compliant and can utilize most existing containers that you find. This setup will also allow you to create your own containers if you want.

The main thing to keep in mind when going this route is you’ll be living in the command line. However, you’ll have a full-featured Docker-like experience, with support for Docker Compose and an optional rootless mode if that’s something that you’re after.

If you’re after a completely command-line based replacement for Docker, then you can’t get much better than containerd and nerdctl.

## Rancher Desktop

Now, if you want to use containerd and nerdctl but still have a graphical user interface, then [Rancher Desktop](https://rancherdesktop.io/) is exactly what you’re looking for. Developed by SUSE, the same team behind openSUSE, Rancher Desktop gives the Docker Desktop experience but free of the Docker engine.

Compatible with macOS (both Apple Silicon and Intel), Windows, and Linux, Rancher Desktop lets you build, pull, and push containers with ease. It also is the full management system for managing your existing and running containers.

Of course, since Rancher Desktop utilizes containerd and nerdctl, you’ll have the full command line suite of tools offered by those services at your disposal as well. Since Rancher Desktop utilizes containerd and nerdctl, it’s compatible with all OCI-compliant containers, as well as many Docker containers too.

For those who don’t want to use Podman but also don’t want to use Docker, Rancher Desktop offers the best desktop-class experience to get you out of the terminal for container management.

Rancher Desktop is a free and open-source container management platform built on containerd and nerdctl. It's an alternative to Docker and other container systems, allowing you to run rootless and containerized applications on your system.

[Get Started With Rancher Desktop](https://rancherdesktop.io/)

## LXC

While [LXC](https://linuxcontainers.org/) (short for Linux Containers) aren’t necessarily a full-on Docker replacement, many people do look to LXC for handling containerized applications. A Linux Container is more akin to a lightweight virtual machine than to a traditional application container that you’d find with Docker, containerd, or Podman.

Linux containers talk directly with your system’s kernel, and you won’t be relying on imaging for it to work. Instead, you’ll have far more control than Docker, Podman, or containerd offers. This does come at the expense of being not as lightweight as a container, but a Linux Container is definitely more lightweight than a full-fledged virtual machine.

You’ll find that Linux containers can be a great place to run things like Plex, an isolated Linux development environment, or anything that needs systemd functionality. Linux containers can sometimes be a bit more cumbersome to set up, especially as there can simply be more configuration and upkeep required. If you want to get away from Docker and aren’t a fan of traditional containers, though, Linux containers can be a great choice.

---

Since all but LXC containers support just about every Docker container out there already thanks to the Open Container Initiative, check out [my favorite Docker containers](https://www.howtogeek.com/10-docker-containers-every-homelabber-should-run/) that I think every homelabber should run. Each container should work just fine in both containerd or Podman, making the list a great resource even if you don’t use Docker directly.