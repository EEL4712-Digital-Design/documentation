---
title: Base KV260 Project
layout: default
parent: Vivado
grand_parent: Software
nav_order: 3
---

# Create a base KV260 Vivado project

These steps create the common Vivado project and block diagram used for the
course's Kria KV260 designs. They stop immediately before adding a custom AXI
slave IP.

The required version of Vivado is **2025.2.1**.

## 1. Create the project

1. Start **Vivado 2025.2.1**.
2. On the **Getting Started** page, select **Create Project**.
3. Select **Next**.

    ![Start the Vivado New Project wizard](images/vivado-create-project.png)

4. Enter a project name and select a project location.
5. Leave **Create project subdirectory** selected, then select **Next**.

    It's generally recommended to use a path without spaces or special characters.

    ![Choose the Vivado project name and location](images/vivado-project-name.png)

6. Select **RTL Project**.
7. Select **Do not specify sources at this time**, then select **Next**.

    ![Create an RTL project without specifying sources](images/vivado-project-type.png)

8. On the **Default Part** page, select the **Boards** tab.
9. Search for `KV260`.
10. Select **Kria KV260 Vision AI Starter Kit**, then select **Next**.

    ![Select the Kria KV260 board](images/vivado-board.png)

11. On the project summary, select **Finish**.

    ![Review the KV260 project summary](images/vivado-project-summary.png)

## 2. Configure project settings

### Set project language as VHDL

1. In the **Flow Navigator**, under **Project Manager**, select **Settings**.
2. Select **General** in the left pane.
3. Set **Target language** to **VHDL**.
4. Select **Apply**.

    ![Set the Vivado target language to VHDL](images/vivado-target-language.png)

### Enable `.bin` bitstream output type

Vivado normally generates a `.bit` bitstream file. The KV260 software stack that
configures the Programmable Logic (PL) region requires the bitstream .

1. In the **Settings** window, select **Bitstream** in the left pane.
2. Enable **-bin_file** option.
3. Select **OK**.

    > **Important**: Vivado may generate both `.bit` and `.bin` files when the completed design's
bitstream is generated. You will have to submit the `.bin` file to the course's KV260 scheduler;
`.bit` files will NOT work.

    ![Enable binary bitstream file generation](images/vivado-bin-file.png)



## 3. Create the block design

1. In the **Flow Navigator**, expand **IP Integrator**.
2. Select **Create Block Design**.
3. Keep the default design name, `design_1`, and select **OK**.

    ![Create the design_1 block design](images/vivado-create-block-design.png)

4. In the block-design toolbar, select **Add IP**.
5. Search for `Zynq UltraScale+ MPSoC`.
6. Double-click **Zynq UltraScale+ MPSoC** to add it to the diagram.

    ![Add the Zynq UltraScale+ MPSoC IP](images/vivado-add-zynq.png)

7. Select **Run Block Automation**.
8. Leave **Apply Board Preset** selected and accept any remaining defaults.
9. Select **OK**.

    ![Apply the KV260 board preset with block automation](images/vivado-board-preset.png)

The board preset configures the processing system for the KV260 hardware.

## Base project complete

At this point, the base project is complete. The next design-specific step is to add the
lab's AXI slave IP to the `design_1` block design. Connection automation, address assignment,
block-design validation, HDL-wrapper creation, and bitstream generation happen
after that slave IP has been added.

Instructions for adding AXI slave IP in the form of custom accelerators will be
provided starting with Lab 2.
