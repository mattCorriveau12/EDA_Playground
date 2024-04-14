# EDA_Playground
Verilog Practice using EDA Playground

Full Adder with Test Bench
- Code generated using ChatGPT

Half Adder with Test Bench
- Code downloaded from nandland.com for practice with EDA Playground

Accumulator with TB (Output Broken) /
Accumulator with TB (Output Fixed)
- Code generated using ChatGPT. Viewing the .vcd showed that the output 'acc' was not getting the proper values. Some troubleshooting was performed to resolve the issue. After 15 minutes of not being to resolve the issue I tried to see if ChatGPT could resolve the issue for me. I entered the following into ChatGPT, "this test bench did not work. troubleshoot it" and received an updated version of the code with a note that ChapGPT realized the 'clk' was not initialized to a known state. In hindsight, this is why the clk signal appeared as a red 'X' (don't care) in the broken version vcd. Upon implementing the updated code, the 'acc' output worked as it is supposed to. So far i'm very impressed with how ChatCPT is able to help me learn Verilog.
