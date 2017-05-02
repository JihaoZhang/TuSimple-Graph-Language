//#include <stdio.h>
//#include <stdlib.h>
//#include <stdint.h>
//#include <stdbool.h>
//#include <string.h>
#include "config.h"
#include "utils.h"

//#define INT 0
//#define FLOAT 1
//#define BOOL 2
//#define STRING 3


#ifndef TUSIMPLELIB_CAST_H
#define TUSIMPLELIB_CAST_H


// Methods that convert void to other types
int32_t voidToint(void* pointer);
double voidTofloat(void* pointer);
bool voidTobool(void* pointer);
char* voidTostring(void* pointer);
struct Node* voidTonode(void* pointer);


// Methods that convert other types to void
void* intTovoid(int32_t value);
void* floatTovoid(double value);
void* boolTovoid(bool value);
void* stringTovoid(char* value);
void* nodeTovoid(struct Node* value);

#endif //TUSIMPLELIB_CAST_H
