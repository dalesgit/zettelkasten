---
title: My new favorite note-taking app for MacOS and Linux checks this crucial box - and it's free
source: https://www.zdnet.com/home-and-office/work-life/my-new-favorite-note-taking-app-for-macos-and-linux-checks-this-crucial-box-and-its-free/
author:
  - "[[Jack Wallen]]"
published: 2025-09-11
created: 2025-09-11
description: I've used a lot of note-taking apps over the years, but Trilium has reset the bar for what I expect in such tools.
tags:
  - clippings
  - tech
  - linux
  - notetaking
---


![gettyimages-1369310962](https://www.zdnet.com/a/img/resize/3e6a6416df8ccba2b21bf93eb3c1385c4d87894c/2025/09/10/e2bf8fb6-9f6e-4e63-bbcf-8a92370f8d37/gettyimages-1369310962.jpg?auto=webp&width=768)

D3Damon/iStock / Getty Images Plus

*Follow ZDNET: [Add us as a preferred source](https://cc.zdnet.com/v1/otc/00hQi47eqnEWQ6T9d4QLBUc?element=BODY&element_label=Add+us+as+a+preferred+Google+source&module=LINK&object_type=text-link&object_uuid=5e5d2e64-4b30-43e6-8555-26eac7e449f3&position=1&template=article&track_code=__COM_CLICK_ID__&url=https%3A%2F%2Fwww.google.com%2Fpreferences%2Fsource%3Fq%3Dzdnet.com&view_instance_uuid=379e95d2-6b56-476b-a90b-043a8dd63bd3) on Google.*

---

### ZDNET's key takeaways

- Trilum is a note-taking app for Linux and MacOS.
- This note-taking apps has tons of features, including local sync.
- Trillium is free to install and use.

---

Note-taking apps are a dime a dozen. Go to your device's app store and you'll find myriad apps for this purpose; some of them are good and some of them are not.

Many [note-taking apps](https://www.zdnet.com/article/these-5-android-note-taking-apps-are-the-best-ive-tested-and-theyre-all-free/) check almost every box, but there's one feature I want that only a select few offer: local sync.

**Also: [The best smart notebooks: Expert tested and reviewed](https://www.zdnet.com/article/best-smart-notebook/)**

Most note-taking apps offer remote sync by way of cloud or [third-party storage](https://www.zdnet.com/home-and-office/work-life/5-ways-i-use-google-keep-for-maximum-productivity-and-you-should-too/). Although I'm not taking notes of a terribly sensitive nature, I do have some notes that I'd rather a third party not have access to. For example, I have an important project I launched a few months ago, and I keep several notes (along with a Kanban board) about that project to keep me moving forward.

![The Trilium note-taking app on Pop!_OS Linux.]()

I use the Trilium note-taking app to help organize a very large project. Jack Wallen/ZDNET

It's important to me that those notes remain private. So, I'd prefer a local sync as opposed to a cloud or third-party sync.

Yes, I realize that means I cannot sync my notes when I'm away from my LAN, but as soon as I return to my LAN, those notes will sync.

The note-taking app that accomplishes this is Trilium, and it's available for [Linux](https://www.zdnet.com/article/this-linux-distro-is-so-windows-like-it-even-comes-with-microsoft-apps/) and MacOS. There is a Windows port coming, and there's also an Android app that is available outside of the Google Play Store. Unfortunately, Google is making it next to impossible to sideload apps, so the developer of [TriliumDroid](https://apt.izzysoft.de/fdroid/index/apk/eu.fliegendewurst.triliumdroid) will have to somehow get the app onto the official store, or it will soon be unusable.

Both the Linux and MacOS Trillium apps are outstanding and include plenty of features, such as:

- Notes can be arranged into a deep tree, and single notes can be placed into several locations within the tree
- A well-designed WYSIWYG note editor that supports tables, images, and math
- Note editing notes with source code
- Syntax highlighting
- Full text search
- Note versioning
- Note attributes
- OpenID and TOTP integration
- Synchronization with a self-hosted server
- Sharing notes via the public internet
- Strong per-note encryption
- Sketching diagrams
- Relation maps, link maps, and mind maps
- Geo maps, including location pins and GPX tracks
- Touch-optimized
- Built-in dark theme and user themes
- Evernote and Markdown import and export
- Web Clipper
- Customizable UI
- Built-in calendar

The big reason I adopted Trilium is the local sync server, which isn't hard to set up, but it does take some Linux magic to make it work. Essentially, you install the sync server, create a systemd file for it, and enable/start the service. Once that's taken care of, you link your clients to the server and you're good to go.

**Also: [How to use Google's AI-powered NotebookLM to organize your research](https://www.zdnet.com/article/how-to-use-notebooklm/)**

Then there's the AI chat feature, which is currently in beta. I've tried to get this to work with my local Ollama instance (which purportedly supports it), but have had no luck with it. There is a clear warning that the feature is in beta, so I expected this.

Another feature that I like about Trilium is that it uses a tabbed interface, which means I can have as many notes open as needed. Add to that the ability to link notes with attributes (think tags), and Trilium becomes a seriously impressive note-taking tool.

Another outstanding feature is the protected session option, which allows users to encrypt notes, ensuring that only those with the correct password can access them. To encrypt a note, you first start a protected session (clicking the shield icon in the left sidebar), type the password you set when you installed Trilium, open the note's basic properties, and click "Protect note."

![The Trilum notes basic properties feature.]()

Protecting a note with encryption is simple using Trilum. Jack Wallen/ZDNET

Once you're done with the protected session, click the shield icon, and the protected note will only be accessible by typing the password.

**Also: [Standard Notes might be the best note-taking app on the market](https://www.zdnet.com/article/standard-notes-might-be-the-best-note-taking-app-on-the-market/)**

## As good as it gets

I've tried so many note-taking apps and, for me, Trillium tops them all. And when you combine all of the features with the fact that it's open-source, it's as good as it gets for note-taking.

If you want to give Trilium a try, you'll find binary installers for Linux (.deb and.rpm) and MacOS on the .

Keep in mind that if you want to add the sync server, you have to ensure that the server and client apps are all the same release number. Currently, the most up-to-date release is 0.98.1. If those release numbers don't match, the sync functionality will not work.

I would highly recommend that you give Trilum (and the sync server) a try. I'm confident that you'll adopt it as your default.

#### Featured[Apple iPhone 17 Pro Max vs. Samsung Galaxy S25 Ultra: I compared both, and here's the winner](https://www.zdnet.com/article/apple-iphone-17-pro-max-vs-samsung-galaxy-s25-ultra-i-compared-both-and-heres-the-winner/ "Apple iPhone 17 Pro Max vs. Samsung Galaxy S25 Ultra: I compared both, and here's the winner")[How to undo OneDrive Backup and restore your personal files to your Windows 11 PC](https://www.zdnet.com/article/how-to-undo-onedrive-backup-and-restore-your-personal-files-to-your-windows-11-pc/ "How to undo OneDrive Backup and restore your personal files to your Windows 11 PC")[Why I'm breaking the 5-year iPhone upgrade cycle - and I'm not alone](https://www.zdnet.com/article/why-im-breaking-the-5-year-iphone-upgrade-cycle-and-im-not-alone/ "Why I'm breaking the 5-year iPhone upgrade cycle - and I'm not alone")[Slow Roku TV? This 30-second routine will keep your device running like new](https://www.zdnet.com/article/slow-roku-tv-this-30-second-routine-will-keep-your-device-running-like-new/ "Slow Roku TV? This 30-second routine will keep your device running like new")

[Editorial standards](https://www.zdnet.com/editorial-guidelines/)