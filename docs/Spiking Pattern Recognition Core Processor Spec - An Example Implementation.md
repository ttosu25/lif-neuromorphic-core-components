# 1. Design Objective

The objective of this design is to implement a digital spiking neural network (SNN) core that receives spike-based input signals,  
updates the internal state of multiple neurons, and produces spike-based output responses. Based on the resulting neuron spike pattern within a given time interval,  
the core asserts or de-asserts an event_out signal. This design demonstrates event-driven computation by integrating discrete spike inputs over time and generating output events  
only when defined spike response conditions are met.


# 2. Top Level Interface

## 2.1 Table of Inputs

| Signal   | Width | Desc                  |
|---------|------|------------------------|
| clk     | 1    | System Clock          |
| rst     | 1    | Asynchronous reset    |
| spike_in| N    | Input Spiking Patter  |


## 2.2 Table of Outputs

| Signal    | Width | Desc                |
|----------|------|----------------------|
| spike_out| N    | Output Spiking Patter|
| event_out| 1    | Event-driven action  |


# 3. Core Architecture

Number of Neurons: N  
Synapses per Neuron: N


# 4. Data width and Storage

Uses a word-size of M, where M is an even integer number.  
Will use fixed point representation of QL.L where L is half of M  


# 5. Interconnect Structure

N-bit shift register holds input spike pattern.  
current spike bit s in the cycle will be the LSB/MSB of that shift register  
Shift register, left/right shifts each cycle  

address (addr) selects neuron index.  

synapse_mem\[addr] outputs weight.  
neuron_state\[addr] outputs membrane.  

V_syn = weight if s == 1  
V_syn = 0 if s == 0  

lif takes membrane and V_syn and outputs spike and next_membrane.  

next_membrane written to neuron_state\[addr].  

addr increments each clock and wraps to 0.  

spike output is stored in a N-bit shift register  


# 6. Update Schedule

Each rising clk edge:  

read membrane = neuron_state\[addr]  
read weight = synapse_mem\[addr]  
read s = pattern_sr bit  

V_syn = weight if s==1 else 0  

lif computes spike and next_membrane  

write neuron_state\[addr] = next_membrane  

store spike result if needed  

addr = addr + 1 (wrap at N)  

shift pattern_sr by 1  

interval length = fixed number of cycles (define later)  


# 7. Event Generation

event_out depends on neuron spikes during interval.  

E.g. event out is set each time the pattern 0110 appears in the duration of the output spike pattern register  

event_out updates on clk.  

event_out pulse length = 1 cycle  


# 8. Reset State

on rst = 1 at clk edge:  

addr = 0  
event_out = 0  
all neuron_states are set to default values (To be specified in implementaton)  
all stored spike flags = 0  
input spike pattern is set to 0 or loaded externally  

normal operation resumes when rst = 0.  


# 9. Top-Level Module Structure

top_core contains:  

pattern shift register  

address counter  

synapse_mem  

neuron_state  

lif (single instance, reused each cycle)  

event logic  

testbench separate.