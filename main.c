/* 
Name
Date
Course
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "map.h"
#include "signal.h"
#include "search.h"

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s terrain.map signal.dat\n", argv[0]);
        return 1;
    }

    Map *map = load_map(argv[1]);
    if (!map) {
        fprintf(stderr, "Error loading map.\n");
        return 1;
    }

    Signal *signal = load_signal(argv[2]);
    if (!signal) {
        fprintf(stderr, "Error loading signal data.\n");
        free_map(map);
        return 1;
    }

    Coordinate rescue_target = locate_signal(signal);
    printf("Signal source likely at (%d, %d)\n", rescue_target.x, rescue_target.y);

    Path *path = find_path(map, rescue_target);
    if (path) {
        printf("Rescue path calculated with %d steps.\n", path->length);
        print_path(path);
        free_path(path);
    } else {
        fprintf(stderr, "No path found to target.\n");
    }

    free_signal(signal);
    free_map(map);
    return 0;
}
