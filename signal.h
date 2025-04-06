#pragma once

typedef struct {
    int *data;
    int length;
} Signal;

typedef struct {
    int x, y;
} Coordinate;

Signal* load_signal(const char *filename);
void free_signal(Signal *signal);
Coordinate locate_signal(Signal *signal);
