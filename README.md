# Gate-Level-Stack-Based-Fibonacci-Implementation-Using-FPGA-Logic-Cells

The goal of this project is to implement a Fibonacci function using a stack and FPGA logic cells. The C implementation of this function is as follows:
 ```C
int fib(int n){
  if(n <= 1) 
    return 1;
  return fib(n-1) + fib(n-2);
}
 ```
 
In this project, we are allowed to design and implement gate-level datapath and controller using just four Actel programmable logic cells which are shown below:


![Screenshot (3499)](https://user-images.githubusercontent.com/69076293/195019408-04ed9e26-534c-4b4d-89bf-059b6b497552.png)
![Screenshot (3500)](https://user-images.githubusercontent.com/69076293/195019289-7aa2e789-451d-46ec-ba90-912d48ecd014.png)


We implemeneted the `fib` function recursively by a stack. The implemented stack supports 2 input signals, and 1 output signal:


* input signals:
  * Push: is used to insert an element at the top of the stack.
  * Pop: is used to get and remove the most recently inserted element.

* output signal:
  * is_empty: is true if the stack is empty.
  
  
<br></br>
\* Verilog codes for this project can be found in *trunk/src/hdl*.

\* Testbench is in *trunk/sim/tb*.

\* The controller truth table is available in the *Controller_Truth_Table.pdf*.

### How to run?
To run the tcl script file, use this command in the *trunk/sim* path (in Modelsim): 
```
do sim_top.tcl
```

<br></br>

Contributor: [Paria Khoshtab](https://github.com/Theparia/)
