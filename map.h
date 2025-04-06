#pragma once

typedef struct {
    int width, height;
    char **tiles;
} Map;

Map* load_map(const char *filename);
void free_map(Map *map);
void print_map(Map *map);
int is_passable(Map *map, int x, int y);
