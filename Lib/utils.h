#ifndef UTILITIES_H
#define UTILITIES_H

#include "config.h"

// Define Data Structures
struct List {
    int32_t size;
    int32_t type;
    void **value;
    int32_t currPos;
};

struct hashmap_element {
    char *key;
    int used;
    void *data[2];
};

struct hashmap {
    int tableSize;
    int size;
    int32_t keyType;
    int32_t valueType;
    struct hashmap_element *data;
};

struct Set {
    int32_t type;
    int32_t size;
    struct List *data;
};

struct Node {
    int32_t type;
    void* value;

    char* name;
    struct List* nodes;
    struct List* weight;
};

struct Graph {
    char* name;
    struct List* nodes;
    // struct List* weight;
    struct hashmap* hashmap;
};

#endif