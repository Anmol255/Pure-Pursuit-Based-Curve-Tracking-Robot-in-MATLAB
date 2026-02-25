# Pure-Pursuit-Based-Curve-Tracking-Robot-in-MATLAB
Developed a MATLAB-based autonomous curve tracking robot using a Pure Pursuit steering control algorithm. The robot dynamically identifies the nearest point on a predefined sinusoidal trajectory and selects a look-ahead target point to compute steering corrections.

## Project Overview
This project implements a curve-following mobile robot simulation in MATLAB using a Pure Pursuit steering control algorithm.

The robot tracks a sinusoidal reference trajectory by selecting a look-ahead target point and applying proportional steering correction to minimize heading error.

## Algorithm Used
- Nearest point detection on reference path
- Look-ahead target selection
- Heading error calculation using atan2
- Angle normalization using wrapToPi
- Proportional steering control
- Trajectory and error logging

## Results
- Stable tracking of curved reference path
- Converging heading error over time
- Trajectory comparison visualization

## Concepts Demonstrated
- Path tracking algorithms
- Closed-loop feedback control
- Mobile robot kinematics
- Pure Pursuit control logic
- MATLAB simulation modeling

## How to Run
1. Open MATLAB.
2. Run the main script file.
3. The simulation will display:
   - Reference path
   - Robot trajectory
   - Heading error plot
