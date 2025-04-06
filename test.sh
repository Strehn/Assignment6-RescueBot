#!/bin/bash

# test.sh - Advanced test runner for the RescueBot assignment

EXE=./rescuebot
MAP_DIR=maps
OUT_DIR=outputs
EXPECTED_DIR=expected

mkdir -p "$OUT_DIR"

pass=0
fail=0

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

run_test() {
    test_name=$1
    map_file=$2
    expected_output=$3

    echo "Running test: $test_name"

    "$EXE" "$MAP_DIR/$map_file" > "$OUT_DIR/${test_name}.out"

    if diff -q "$OUT_DIR/${test_name}.out" "$EXPECTED_DIR/$expected_output" > /dev/null; then
        echo "${GREEN}PASS${RESET}: $test_name"
        ((pass++))
    else
        echo "${RED}FAIL${RESET}: $test_name"
        echo "Diff:"
        diff "$OUT_DIR/${test_name}.out" "$EXPECTED_DIR/$expected_output"
        ((fail++))
    fi
}

# === BASIC TESTS ===
run_test "basic_path" "basic_map.txt" "basic_path.txt"
run_test "no_survivors" "empty_map.txt" "empty_result.txt"
run_test "multi_survivors" "multi_map.txt" "multi_result.txt"

# === ADVANCED TESTS ===

# Survivor completely surrounded by walls
run_test "blocked_survivor" "blocked_map.txt" "blocked_result.txt"

# Large map to test BFS/DFS performance
run_test "large_map" "large_map.txt" "large_result.txt"

# Map with multiple optimal paths (tests pathfinding determinism)
run_test "multiple_paths" "multi_path_map.txt" "multi_path_result.txt"

# Long corridor with survivor at the end (tests path length correctness)
run_test "long_corridor" "corridor_map.txt" "corridor_result.txt"

# Survivor at edge of the map
run_test "edge_survivor" "edge_case_map.txt" "edge_case_result.txt"

# Robot placed in corner with many open paths
run_test "corner_start" "corner_start_map.txt" "corner_result.txt"

# Robot not on the map (error case)
run_test "no_robot" "no_robot_map.txt" "no_robot_result.txt"

# Entire map is walls except robot
run_test "isolated_robot" "trapped_robot_map.txt" "trapped_robot_result.txt"

# All survivors unreachable behind walls
run_test "all_blocked" "all_blocked_map.txt" "all_blocked_result.txt"

echo ""
echo "Summary: ${GREEN}${pass} passed${RESET}, ${RED}${fail} failed${RESET}"
