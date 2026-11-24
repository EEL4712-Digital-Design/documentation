---
title: ECE Linux Server Access
layout: default
nav_order: 3
---
# ECE Linux Server Access

This guide explains how to remotely access the UF ECE Linux servers and use the software tools required for EEL 4712 Digital Design.

## 1. Connect to the UF Network

Before connecting to the ECE Linux servers, your computer must be connected to the UF network.

You can do this by either:

- Connecting to the **UF campus network**, or
- Connecting remotely using the **GatorLink VPN**.

## 2. Connect to the ECE Linux Server using SSH

Most operating systems include an SSH client:

- **macOS:** Terminal
- **Linux:** Terminal (depending on your distribution, other options are Ghostty, Alacritty, Konsole, kitty, etc.)
- **Windows:** Windows Terminal

The ECE Linux servers are accessed using:

```text
linux.ece.ufl.edu
```

Open a terminal and run:

```bash
ssh <ufl_username>@linux.ece.ufl.edu
```

Replace `<ufl_username>` with your GatorLink username.

For example:

```bash
ssh jsmith@linux.ece.ufl.edu
```

Enter your GatorLink password when prompted.

If your computer does not have an SSH client, you can also use an SSH application such as PuTTY.

---

# Graphical Access Using VNC

Some course tools, including Quartus and QuestaSim, have graphical interfaces. You can access the graphical desktop of the ECE Linux server using VNC.

## 3. Install a VNC Viewer

Install a VNC viewer on your local computer. Common options include:

- TurboVNC Viewer
- TigerVNC Viewer
- RealVNC Viewer

TurboVNC or TigerVNC are recommended because they provide convenient automatic resolution scaling.

## 4. Create a VNC Password

First, SSH into the ECE Linux server:

```bash
ssh <ufl_username>@linux.ece.ufl.edu
```

Then create a VNC password:

```bash
vncpasswd
```

You will be prompted to create a password for your VNC session.

You can ignore the option to create a **view-only password**.

## 5. Start a VNC Session

Start the VNC server:

```bash
vncserver
```

The command will return a hostname and display number similar to:

```text
New 'ece-lnx-03:68 (username)' desktop is ece-lnx-03:68
```

In this example:

```text
Hostname:       ece-lnx-03
Display number: 68
```

**Make note of both values.** Your hostname and display number may be different each time you create a session.

## 6. Connect Using the VNC Viewer

Open your VNC viewer and create a new connection.

For the server address, enter:

```text
<hostname>.ad.ufl.edu:<display-number>
```

For example:

```text
ece-lnx-03.ad.ufl.edu:68
```

Enter the VNC password that you created with:

```bash
vncpasswd
```

You should now see the Red Hat Linux desktop.

### Adjusting the Screen Resolution

If the desktop resolution is inconvenient, you can specify the resolution when starting the VNC server:

```bash
vncserver -geometry 1920x1080
```

TurboVNC and TigerVNC also support automatic scaling when the viewer window is resized.

---

# Configuring the Course Software Environment

After connecting to the Linux desktop, open a terminal:

**Applications → Terminal**

Before launching the course software, configure your environment by running:

```bash
source /apps/reconfig/enable
```

This configures access to the engineering software used in the course.

You can then launch the tools from the terminal.

### QuestaSim

```bash
vsim &
```

### Quartus Prime Pro

```bash
quartus &
```

For the DE10-Lite labs, follow the [Quartus Prime Lite installation guide]({% link software/quartus/quartus-installation.md %}) to install MAX 10 device support.

The `&` runs the application in the background so that you can continue using the terminal.

> **Important:** You must run
>
> ```bash
> source /apps/reconfig/enable
> ```
>
> in each new terminal session before using these tools.

<!-- ## Quartus Standard

If you specifically need Quartus Standard rather than Quartus Prime Pro, use:

```bash
source /apps/reconfig/enable_std
```

instead. -->

---

# Optional: Visual Studio Code Remote Access

Visual Studio Code can also connect directly to the ECE Linux servers using SSH. This allows you to:

- Edit files on the ECE server using VS Code
- Browse remote directories
- Open a terminal on the remote server
- Compile and simulate designs without manually transferring files

## 7. Install Remote-SSH

Install the **Remote - SSH** extension in Visual Studio Code. To add a connection, follow the [official documentation](https://code.visualstudio.com/docs/remote/ssh#_installation).

Configure the connection using:

```text
<ufl_username>@linux.ece.ufl.edu
```

When VS Code asks for the remote operating system, select:

```text
Linux
```

Once connected, you can open folders on the ECE server and open a remote terminal using:

```text
Terminal → New Terminal
```

<!-- ## VS Code Compatibility Note

The ECE Linux servers currently run an older Linux environment. Recent versions of VS Code may no longer support connecting to these systems.

If Remote-SSH fails because the remote operating system is unsupported, an older VS Code release may be required. VS Code version **1.98** has previously worked with the ECE Linux servers, although it may display warnings about the older operating system. -->

---

# Quick Reference

### Connect to ECE Linux

```bash
ssh <ufl_username>@linux.ece.ufl.edu
```

### Configure course tools

```bash
source /apps/reconfig/enable
```

### Start QuestaSim

```bash
vsim &
```

### Start Quartus

```bash
quartus &
```

### Start a VNC session

```bash
vncserver
```

### Start a VNC session at 1920×1080

```bash
vncserver -geometry 1920x1080
```
