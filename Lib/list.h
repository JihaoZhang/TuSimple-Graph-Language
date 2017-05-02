//#include <stdio.h>
//#include <stdlib.h>
//#include <stdint.h>
//#include <stdarg.h>
//#include <stdbool.h>
#include "config.h"

#ifndef TUSIMPLELIB_LIST_H
#define TUSIMPLELIB_LIST_H


struct List {
    int32_t size;
    int32_t type;
    void **value;
    int32_t currPos;
};



// Functions for list
struct List *create_list(int32_t type);

struct List *plus_list_helper(struct List *list, void *data);

struct List *plus_list(struct List *list, ...);

struct List *concat_list(struct List *list1, struct List *list2);

void *get_list_element(struct List *list, int index);

void *pop_list_element(struct List *list);

void *remove_list_element(struct List *list, int index);

int get_list_size(struct List *list);

bool check_list_element(struct List *list, ...);

#endif //TUSIMPLELIB_LIST_H
