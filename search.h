#pragma once

#include "map.h"
#include "signal.h"

typedef struct {
    int length;
    Coordinate *steps;
} Path;

Path* find_path(Map *map, Coordinate goal);
void free_path(Path *path);
void print_path(Path *path);
