---
title: SystemVerilog Simulation
layout: default
parent: QuestaSim
grand_parent: Software
nav_order: 2
---
# SystemVerilog Simulation Using QuestaSim

This guide summarizes the recommended workflow for creating a QuestaSim
project, adding SystemVerilog design and testbench files, compiling the project,
and running a functional simulation.

## Creating a Project in QuestaSim

<p><mark style="background-color: #ff0; color: #000;"><strong>Do not use spaces anywhere in the full QuestaSim project path. This includes every parent folder and the project folder itself. Use only letters, numbers, and underscores in folder names.</strong></mark></p>

1.  Start **QuestaSim**.
2.  Select **File → New → Project**.
3.  Enter a project name, for example `SimpleLogic`.
4.  For **Project Location**, select the directory containing your
    lab/project files.
5.  Leave the remaining settings at their default values and click
    **OK**.

![Creating a QuestaSim project](images/questa_create_project.png)

<p><strong style="color: #c62828;">Image needs updating for Lab 0. The Project Location field shows the old VHDL lab folder. Show the current SystemVerilog lab folder.</strong></p>

After creating the project, the **Add items to the Project** window will
appear.

### Add the Design File

Use [`SimpleLogic.sv`](https://github.com/EEL4712-Digital-Design/lab0-main/blob/main/SimpleLogic.sv) from your Lab 0 repository. Save it in your project directory if you keep your QuestaSim project in a separate folder.

1.  Click **Add Existing File**.
2.  Browse to `SimpleLogic.sv`.
3.  Select the file and add it to the project.

You normally do not need to select **Copy to project directory**.

### Add the Testbench

Use [`SimpleLogic_tb.sv`](https://github.com/EEL4712-Digital-Design/lab0-main/blob/main/SimpleLogic_tb.sv) from the same repository and add it in the same way:

1.  Click **Add Existing File**.
2.  Select `SimpleLogic_tb.sv`.
3.  Click **OK**.
4.  Click **Close** when all required files have been added.

## Understanding the Testbench

A testbench is used to apply input test signals to the **Unit Under Test
(UUT)** and observe the resulting outputs.

A typical SystemVerilog testbench must:

-   Declare the input and output test signals.
-   Instantiate the design being tested.
-   Map the testbench signals to the ports of the UUT.
-   Apply values to the input signals.
-   Wait between input changes so that the corresponding outputs can be
    observed.

The testbench starts with all four inputs low. Each `#10` waits 10 ns before setting the next input high. The final delay lets you see the last output before `$finish` ends the run.

| Time (ns) | ABCD | Expected Z |
| --- | --- | --- |
| 0–10 | `0000` | `1` |
| 10–20 | `1000` | `0` |
| 20–30 | `1100` | `1` |
| 30–40 | `1110` | `0` |
| 40–50 | `1111` | `1` |

For future designs, you may need to create or modify a testbench to
match the module being tested. Make sure that the testbench signals are
mapped to the correct ports and that the stimulus exercises the required
behavior of the design.

## Compiling the Project

Before running a simulation, compile the SystemVerilog files.

1.  Select **Compile → Compile All**.
2.  QuestaSim will compile the design file and testbench.

For the tutorial example, a successful compilation reports:

``` text
2 compiles, 0 failed with no errors.
```

The status of the compiled files should also change from `?` to a check
mark.

If compilation fails, inspect the error messages, correct the SystemVerilog
source, and compile again before attempting to simulate the design.

## Running a Functional Simulation

A **functional simulation** verifies the logical behavior of the design.
Physical timing delays in FPGA components and interconnects are not
included.

### Start the Simulation

1.  Select **Simulate → Start Simulation...**
2.  In the **Design** tab, expand the `work` library.
3.  Select the **testbench**, for example:

    ``` text
    work → SimpleLogic_tb
    ```

    > Simulate the **testbench**, not the design module directly.

4.  **BEFORE** clicking "OK", click **Optimization Options...**
5.  Select **Apply full visibility to all modules (full debug mode)**.
6.  Click **OK**, and then **OK** again to start the simulation.

### Display the Signals

The **Objects** and **Wave** windows are particularly useful during
simulation. If either is not visible, enable it from the **View** menu.

The Objects window contains the signals in the design. To inspect them
in the waveform:

1.  Select the desired signals in the **Objects** window.
2.  Drag them into the **Wave** window, or copy and paste them.

For the tutorial example, the signals are:

``` text
A
B
C
D
Z
```

### Run the Simulation

Select:

**Simulate → Run → Run -All**

The waveform window will display the input and output signals over
simulation time.


Choose **Zoom Full** and compare `Z` with the expected values above.

Use the waveform tools to:

-   Zoom in and out.
-   Scroll through simulation time.
-   Move the time cursor.
-   Compare input transitions with the expected output behavior.

## Recommended QuestaSim Workflow

For each lab, a useful workflow is:

``` text
Write/Edit SystemVerilog
      ↓
Compile in QuestaSim
      ↓
Fix compilation errors
      ↓
Start the testbench simulation
      ↓
Add signals to the Wave window
      ↓
Run -All
      ↓
Inspect waveforms
      ↓
Debug and repeat as necessary
      ↓
Proceed to Quartus
```

QuestaSim should generally be your **first tool for compilation and
functional debugging**. Once the design compiles and simulates
correctly, follow the [Quartus tutorial]({% link software/quartus/quartus-tutorial.md %}) to compile the design and program the DE10-Lite.
