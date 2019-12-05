# bouncingBall

Entry-point: `MAIN.m`

Runs a simulation of a ball bouncing over hilly terrain. Simulation implemented using ode45 and event detection.

There is also a minimalistic version called `MAIN_minimaistic.m`. It attempts to be a tiny example of the same problem (albeit with significantly limited functionality) all in one file. Note that older versions of Matlab do not support function definitions inside of scripts. `MAIN_minimalistic.m` has, therefore, been defined as a function. `EventFunction_minimalistic` has to be a fully-defined function rather than an anonymous function since it is required to have 3 outputs.