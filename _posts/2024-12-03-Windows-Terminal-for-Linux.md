---
title: Windows Terminal for Linux
date: 2024-12-03 5:53
categories: [Ubuntu]
tags: [portfolio, ubuntu] # TAG names should always be lowercase
image: assets/lib/images/images.jpg
---

# To Use Linux Commands on Windows 

* Install Windows Terminal (Mac user)
* Install the Windows Subsystem For Linux
(This gets you Linux on top of Windows)

![img-description](/assets/lib/images/2024-12-03.png)
* Install Ubuntu (Up to you)
* Go to the setting and into JSON File, Copy Ubuntu ID and Paste to Default Profile 
* Install "Z Shell"
 ```Powershell
 sudo apt update
 sudo apt install zsh
 sudo apt install powerline fonts-powerline
 ```
* Install "Oh My Zsh"
```Powershell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### All your copy paste from documentation will work on Mac Windows and Linux