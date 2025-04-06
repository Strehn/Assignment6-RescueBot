## Homework 6: RescueBot – Autonomous Search and Signal Detection in a Disaster Scenario

# Background
Imagine a post-disaster scenario: buildings have collapsed, and a small robot is deployed to navigate a digital representation of the area. Your job is to help this robot autonomously explore a map, collect sensor data, and identify survivors based on signal strength encoded in a file.

This final assignment brings together C programming, file I/O, data structures, simulation, and algorithmic thinking—all the tools you've developed in this course.

# Scenario Overview
You are given a 2D map of a collapsed area in a text file.

Each cell in the grid can be:

' ' (open space)

'#' (rubble/impassable)

'S' (survivor signal source)

'R' (robot starting position)

You are also given a signal log file that encodes signal strength detected at each position in the map.

Your robot must traverse the map, record where signals are detected, and determine the most likely survivor locations based on signal patterns.

# Objectives
Your program must:

Load and parse a 2D map from a file.

Read signal values from a separate binary file and associate them with corresponding map positions.

Perform a breadth-first or depth-first traversal from the robot's starting point, skipping over obstacles (#).

Record locations where signal strength exceeds a given threshold.

Output a new map file marking likely survivor locations (X).

Free all dynamically allocated memory.

# Deliverables
Your program must be split into at least the following files:

main.c: Entry point and coordination of the program.

map.c / map.h: Reading, storing, printing, and modifying the map.

signal.c / signal.h: Reading signal values, applying thresholds.

search.c / search.h: Robot traversal logic.

utils.c / utils.h: Bit manipulation, threshold helpers, logging, etc.

# Command-line Interface
./rescuebot map.txt signals.bin threshold output.txt
map.txt: ASCII map of the disaster zone.

signals.bin: Binary file of signal strengths, stored row-major.

threshold: Integer threshold to consider a signal strong enough.

output.txt: Updated map with X marking detected survivor zones.
```
Example Input:

map.txt

#######
#R   S#
# ### #
#     #
#######
signals.bin
Contains row-major 8-bit signal strength values for each open cell. (You can generate your own with a helper function.)

Expected Output:
output.txt

#######
#X   X#
# ### #
#     #
#######
```
# Requirements and Constraints
Dynamic memory allocation for map and signal grid.

Use modular and well-commented code.

Use fopen, fscanf, fread, and related functions appropriately.

Your traversal must avoid revisiting and not enter rubble cells.

Must compile with provided Makefile and run tests via test.sh.

Learning Goals and Real-World Tie-in
Systems Thinking: Integrates multiple subsystems: file I/O, map representation, search algorithms.

Security/Resilience Awareness: Signal analysis mimics real-world sensor data processing.

Simulation & Planning: Real-world applications in robotics, search-and-rescue, and data inference.
Testing: Test the grid using known patterns (e.g., gliders, blinkers) to verify that your implementation correctly simulates the Game of Life.

# Test Files
basic_map.txt - A simple map with one survivor

empty_map.txt - An empty map with no survivors

multi_map.txt - A map with multiple survivors

blocked_map.txt - A map with a survivor completely surrounded by walls

large_map.txt - A large map to test performance

multi_path_map.txt - A map with multiple possible optimal paths

corridor_map.txt - A long corridor with a survivor at the end

edge_case_map.txt - A map with the survivor at the edge

corner_start_map.txt - A map with the robot starting in the corner

no_robot_map.txt - A map where the robot is not on the map

trapped_robot_map.txt - A map where the robot is trapped with no survivors

all_blocked_map.txt - A map where all survivors are unreachable
