---
title: DE10-Lite Tutorial
layout: default
parent: Quartus
grand_parent: Software
nav_order: 2
---

# Compile and Program the DE10-Lite with Quartus

In Lab 0, you will compile a SystemVerilog design, assign its signals to pins on the DE10-Lite, and load the compiled design onto the FPGA. Start with [Quartus Prime Lite and MAX 10 device support]({% link software/quartus/quartus-installation.md %}). Use the [QuestaSim tutorial]({% link software/questa/questa-tutorial.md %}) to verify the logic in simulation.

## Create the project

1. Save [SimpleLogic.sv]({% link software/rtl/SimpleLogic.sv %}) and [top_level.sv]({% link software/rtl/top_level.sv %}) in a lab folder such as `C:\Digital_Design\Lab0`. Use letters, numbers, and underscores in folder and file names throughout the project path.
2. Open Quartus Prime Lite and select **File → New Project Wizard**. Use the lab folder as the working directory, `Lab0` as the project name, and `top_level` as the top-level entity.
3. Select **Empty project**. On **Add Files**, add both SystemVerilog files. To add them later, use **Project → Add/Remove Files in Project**. If needed, right-click `top_level.sv` in the **Files** tab of the Project Navigator and choose **Set as Top-Level Entity**.
4. On **Family, Device & Board Settings**, open the **Board** tab, select **MAX 10 DE10 - Lite**, and clear **Create top-level design file**. The supplied wrapper connects the design to the board's switches and LEDs.
5. Run the functional simulation separately in Questa. Leave the Quartus EDA simulation settings at their defaults, review the summary, and click **Finish**.

![New Project Wizard board selection for MAX 10 DE10-Lite](images/board-selection.png)

## Compile the design

Select **Processing → Start Compilation**. Review **Compilation Report → Flow Summary** and the Messages pane. Resolve errors and investigate warnings about the top-level entity, pin assignments, or electrical settings before programming.

## Assign the board pins

Open **Assignments → Pin Planner** after the first compile. Enter the five Lab 0 assignments below. The **Node Name** column lists the ports from `top_level.sv`. Use **Location** for the FPGA package pin and **I/O Standard** for the electrical standard.

| Board signal | Node Name | Location | I/O Standard |
| --- | --- | --- | --- |
| SW0 | `sw[0]` | `PIN_C10` | 3.3-V LVTTL |
| SW1 | `sw[1]` | `PIN_C11` | 3.3-V LVTTL |
| SW2 | `sw[2]` | `PIN_D12` | 3.3-V LVTTL |
| SW3 | `sw[3]` | `PIN_C12` | 3.3-V LVTTL |
| LEDR0 | `leds[0]` | `PIN_A8` | 3.3-V LVTTL |

The DE10-Lite user manual lists the board pin assignments. [Terasic DE10-Lite User Manual, tables 3-4 and 3-5](https://www.mouser.com/datasheet/2/598/DE10_Lite_User_Manual-1100361.pdf)

### Reuse pin assignments in another lab

1. In **Pin Planner**, select **File → Export** and save the assignments as `pin_assignments.tcl` in a folder shared by your lab projects.
2. In the new Quartus project, open **Tools → Tcl Scripts → Add to Project** and select the saved script.
3. Select the script and click **Run**. Open **Pin Planner** to verify that the imported assignments match the active top-level ports. A name mismatch can leave a port without its intended pin.

![Quartus Tcl Scripts dialog with the Add to Project and Run controls](images/tcl-scripts.png)

## Program the DE10-Lite

1. Go to **Assignments → Device → Device and Pin Options → Unused Pins** and select **As input tri-stated**. After checking the pin assignments, run **Processing → Start Compilation** again so the programming file includes the final assignments and settings.
2. Power the DE10-Lite and connect its USB-Blaster port to your computer. Open **Tools → Programmer** in Quartus.
3. Click **Hardware Setup**, select **USB-Blaster [USB-x]**, and use **JTAG** mode. If USB-Blaster is missing, check the USB connection and install the driver from the Quartus installation directory. [Altera USB-Blaster driver instructions](https://docs.altera.com/r/docs/683076/current/altera-fpga-download-cable-user-guide/installing-the-altera-fpga-download-cable-driver-on-windows)
4. Use `output_files/Lab0.sof` for volatile JTAG programming. If the file is missing from the list, click **Add File** and select it. Check **Program/Configure**, click **Start**, and wait for progress to reach **100%**. A `.pof` targets nonvolatile configuration memory and can replace the factory design.
5. Test the design using the [expected values from the QuestaSim tutorial]({% link software/questa/questa-tutorial.md %}#understanding-the-testbench). Start with SW0–SW3 down, then raise SW0, SW1, SW2, and SW3 in order, leaving each switch up. LEDR0 should be on, off, on, off, then on.

![Quartus Programmer with USB-Blaster, JTAG mode, Lab0.sof, and Program/Configure selected](images/programmer.png)
