#ifndef TUSIMPLELIB_SET_H
#define TUSIMPLELIB_SET_H

#include "config.h"
#include "list.h"

#define SET_MISSING -1
#define SET_OK 1

// struct Set {
//     int32_t type;
//     int32_t size;
//     struct List *data;
// };

typedef int (*Func2)(void **);

struct Set *create_set(int type);

bool check_set_element(struct Set *set, ...);

struct Set *put_set(struct Set *set, ...);

int32_t get_set_element_index(struct Set *set, ...);

struct Set *remove_set_element(struct Set *set, ...);

struct List *get_set_elements(struct Set *set);

int set_iterate(struct Set *set, Func2 f);

int32_t get_set_type(struct Set *set);

int32_t get_set_size(struct Set *set);

struct Set *put_set_from_list(struct Set *set, struct List * list);


#endif //TUSIMPLELIB_SET_H
