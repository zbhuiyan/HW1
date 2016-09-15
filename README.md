# HW1		
Homework 0b001: Verilog Tools and DeMorgan's Law

To be completed in class (due before Monday class)

## Install tools
For this assignment you will need the [Icarus Verilog](http://iverilog.icarus.com/) simulator (`iverilog`). If you are using the provided virtual machine, this (along with several other tools you'll need later in the class) is pre-installed. Otherwise, install it for your platform.

## Hello, Verilog!

In your favorite text editor, create a file named `hello.v` with the following contents:

```verilog
// Simple Verilog test
module hello_test ();
initial begin
    $display("Hello, CompArch!");
end
endmodule
```

We can run the test through `iverilog` with the following commands:

```
iverilog -o hello hello.v
./hello
```

`iverilog` actually creates an executable program based on your Verilog (here, `hello`), which you then run to see the simulation results. If you do not specify `-o <foo>`, the executable will be called `a.out` just like for a C compiler.

## Your first Verilog

Prove DeMorgan’s Law using the exhaustive proof method.  To do so, you will use Verilog to create truth tables for the following 4 equations:

![DeMorgan's Equations](img/eqn.jpg)

### Schematic capture
First, draw a schematic of each of the four equations (on paper is fine).  To help you get started, here is one for `(~A)*(~B)`:

![Schematic](img/schem1.jpg)

Then, give each gate and each wire a name. `A` and `B` are already named.

![Labeled schematic](img/schem2.jpg)

### Translate to Verilog
Each element becomes a line of Verilog.  Create a new Verilog file called `hw1.v` to contain your module. Here is the schematic above, captured:

```verilog
module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nAandnB     // Single bit output, (~A)*(~B)
);

  wire nA;
  wire nB;
  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB

endmodule
```

### Create a testbench
