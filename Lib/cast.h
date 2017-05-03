//#include <stdio.h>
//#include <stdlib.h>
//#include <stdint.h>
//#include <stdbool.h>
//#include <string.h>

#ifndef TUSIMPLELIB_CAST_H
#define TUSIMPLELIB_CAST_H

#include "config.h"
#include "utils.h"

//#define INT 0
//#define FLOAT 1
//#define BOOL 2
//#define STRING 3

// Methods that convert void to other types
int32_t voidToint(void* pointer);
double voidTofloat(void* pointer);
bool voidTobool(void* pointer);
char* voidTostring(void* pointer);
struct Node* voidTonode(void* pointer);
struct Graph* voidTograph(void* pointer);


// Methods that convert other types to void
void* intTovoid(int32_t value);
void* floatTovoid(double value);
void* boolTovoid(bool value);
void* stringTovoid(char* value);
void* nodeTovoid(struct Node* value);
void* graphTovoid(struct Graph* value);

#endif //TUSIMPLELIB_CAST_H
