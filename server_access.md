---
title: Server Login Instructions
nav_order: 1
---

Make sure your OS has a working SSH client. Most modern operating systems have one built in. For MacOS, this should just be the `Terminal` app. For Linux distributions, the default terminal app should work. For Windows, use `Windows Terminal`. If your OS doesn't have a built-in SSH client, you can download one such as [PuTTY](https://www.putty.org/). 

Alternatively, you can use Visual Studio code for SSH and file management. See [the instructions below](#visual-studio-code-setup) for setup instructions. See the notes and caveats at the bottom of this page on using VS Code to access the ECE Linux servers. 

First, **make sure you are on the UF network**, e.g., connected using the UF VPN or being on the campus Wi-Fi network. 

The ECE Linux servers are all accessed through the same hostname: `linux.ece.ufl.edu`

Connect via SSH using your UFL account. E.g., from a terminal:
```bash
ssh <ufl_username>@linux.ece.ufl.edu
```

## VNC Viewer Setup (GUI)
Install a VNC viewer on your local computer. Some options are [TurboVNC Viewer](https://github.com/TurboVNC/turbovnc/releases/tag/3.2), [TigerVNC Viewer](https://sourceforge.net/projects/tigervnc/files/stable/1.14.1/) and [RealVNC Viewer](https://www.realvnc.com/en/connect/download/viewer/). For RealVNC, you may have to create an account and log in after installation.

Login to the server [as instructed above](#server-login-instructions), then run the following command: `vncpasswd`

This will ask you to create a password for your VNC session. You can ignore the “view-only” password. 

Start an instance of `vncserver` by running the following command: `vncserver`

Make a note of the hostname and display number after the command completes, e.g., `New 'ece-lnx-03:68 (username)' desktop is ece-lnx-03:68` where in this example, the hostname is `ece-lnx-03` and the display number is `68`.

Once the server is running, go back to your local machine and open your VNC viewer. If using RealVNC Viewer, navigate to File -> New Connection. Under VNC Server, put `hostname.ad.ufl.edu:N`, using the hostname you got from the output of `vncserver`, e.g., `ece-lnx-03` above, and where `N` is the display number you were assigned. Make sure you use the number provided by the output of the `vncserver` command that **you ran on the server**. Give the server a “friendly name”, e.g., Reconfig2.

For RealVNC Viewer, double click the server you just created. Enter your vncserver password when prompted. You should now see a RedHat Desktop.

> NOTE: If the resolution or screen size is awkward, I recommend trying TurboVNC Viewer or TigerVNC Viewer instead of RealVNC Viewer, as they have auto-resolution scaling as you resize the window by default and doesn't require creating an account. Another option is to pass the `-geometry` flag, e.g., `vncserver -geometry 1920x1080`. 

## Configuring Environment to Access Tools

Click on `Applications` at the top left. This will open a panel with various apps. Select `Terminal`.

From the terminal, to configure your environment, run `source /apps/reconfig/enable_pro`. You should now be able to open Questa, Vivado, and Quartus Prime Pro using the following:
```bash
quartus &
vivado &
vsim &
```

Make sure to include the “&” so you open each in the background. 

If you want to use Quartus Standard edition instead of Quartus Pro, you should source a different script instead:
```bash
source /apps/reconfig/enable_std
```

## Visual Studio Code Setup
VS Code can used to connect to remote servers via SSH which allows you to edit files remotely as if they were local, and access a terminal shell. 

To enable the remote editing functionality, you must install the `Remote-SSH` extension. Follow the [official documentation](https://code.visualstudio.com/docs/remote/ssh#_installation).

When you get to the 3rd step of the "Connect to a remote host" section, make sure to choose `Linux` as the type (since the servers are Linux-based). 

Once connected, you can open a directory to edit files, etc. You can also open a Terminal pane from `Terminal -> New Terminal` or using the hotkey ``<Ctrl+`>``
