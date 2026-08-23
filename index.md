---
title: Home
layout: home
nav_order: 1
---

# EEL5721 Reconfigurable Computing

This site contains course documentation for EEL5721 Reconfigurable Computing at the University of Florida. There are guides to help with installation/configuration of the required software, tutorials for simulation, FPGA development, and source control (using Git).

## Initial Setup

This course uses Siemens QuestaSim for simulation and AMD Vivado for synthesis, implementation, bitstream generation, etc. If your personal computer is compatible with these tools, e.g., Windows/Linux with enough storage space and RAM, then we recommend installing them locally to make the development process faster. 

If you would like to install the tools locally, you can follow these two guides to get them installed:

- [Install Siemens QuestaSim]({% link software/questa/questa-installation.md %}) 
- [Install AMD Vivado]({% link software/vivado/vivado-installation.md %})

If, on the other hand, you cannot install the tools locally due to insufficient hardware specifications, the department also manages its own Linux servers that students can access remotely. Here are instructions for accessing them:
- [Access the UF ECE Linux servers]({% link remote-access/ece-linux-server-access.md %})


## Software Usage

- [Simulate VHDL designs using QuestaSim]({% link software/questa/questa-tutorial.md %})
- [Generate a KV260 bitstream using Vivado]({% link software/vivado/vivado-quickstart.md %})
- [Review project setup and workflow best practices]({% link best-practices/best-practices.md %})
- [Learn Git and GitHub basics]({% link git-and-github/git-and-github.md %})
