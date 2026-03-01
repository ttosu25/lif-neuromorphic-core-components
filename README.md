# lif-neuromorphic-core-components
A SystemVerilog library containing modular units to enable the developement of 8-bit neuromorphic processor cores using a Leaky-Integrate-and-Fire model.

## Overview

This project provides modular hardware building blocks for implementing neuromorphic processor cores in digital logic. The focus is on scalable, synthesizable designs suitable for FPGA and ASIC implementation.

The library enables the construction of neuron arrays, synapse memory systems, and complete neuromorphic processing pipelines.

---

## Objectives

- Design modular neuron and synapse hardware units
- Implement an 8-bit fixed-point Leaky Integrate-and-Fire neuron model
- Enable scalable neuromorphic processor architectures
- Provide synthesizable SystemVerilog RTL
- Verify functionality using simulation testbenches



## Architecture

Core components include:

- Neuron unit (membrane integration, leak, threshold, reset)
- Synapse memory unit (weight storage and retrieval)
- Synapse compute unit (spike-dependent weight contribution)
- Neuron state storage
- Control and scheduling logic


## Numeric Representation

- Word length: 8-bit signed fixed-point
- Arithmetic: saturating
- Neuron model: Leaky Integrate-and-Fire (LIF)



## Repository Structure


rtl/ — synthesizable SystemVerilog modules
tb/ — verification testbenches
docs/ — diagrams and supporting documentation
sim/ — simulation scripts


## Status

 modular component development in progress.

---

## Future Work

- Multi-neuron core integration
- Event-driven spike routing
- FPGA implementation and testing
- ASIC implementation (TinyTapeout target)

