#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdarg.h>
#include "list.h"


#ifndef TUSIMPLELIB_HASHMAP_H
#define TUSIMPLELIB_HASHMAP_H


#define MAP_MISSING -3  /* No such element */
#define MAP_FULL -2    /* Hashmap is full */
#define MAP_OMEM -1    /* Out of Memory */
#define MAP_OK 0    /* OK */


// Define data structure
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


typedef int (*Func)(void *, void *, void *);


// Define functions
struct hashmap *create_hashmap(int32_t keyType, int32_t valueType);

struct hashmap *hashmap_put(struct hashmap *map, ...);

int hashmap_length(struct hashmap *map);

int32_t hashmap_keytype(struct hashmap *map);

int32_t hashmap_valuetype(struct hashmap *map);

bool hashmap_haskey(struct hashmap *map, ...);

void *hashmap_get(struct hashmap *map, ...);

struct hashmap *hashmap_remove(struct hashmap *map, ...);

struct List *hashmap_keys(struct hashmap *map);

int hashmap_iterate(struct hashmap *map, Func f);

#endif //TUSIMPLELIB_HASHMAP_H
