#include "cast.h"


int32_t voidToint(void* pointer) {
    return *((int32_t*) pointer);
}

double voidTofloat(void* pointer) {
    return *((double*) pointer);
}

bool voidTobool(void* pointer) {
    return *((bool*) pointer);
}

char* voidTostring(void* pointer) {
    return (char*) pointer;
}

struct Node* voidTonode(void* pointer) {
    return (struct Node*) pointer;
}

struct Graph* voidTograph(void* pointer) {
    return (struct Graph*) pointer;
}


void* intTovoid(int32_t value) {
    int* value_pointer = (int*)malloc(sizeof(int32_t));
    *value_pointer = value;
    return (void*)value_pointer;
}

void* floatTovoid(double value) {
    double* value_pointer = (double*)malloc(sizeof(double));
    *value_pointer = value;
    return (void*)value_pointer;
}

void* boolTovoid(bool value) {
    bool* value_pointer = (bool*)malloc(sizeof(bool));
    *value_pointer = value;
    return (void*)value_pointer;
}

void* stringTovoid(char* value) {
    return (void*) value;
}

void* nodeTovoid(struct Node* value) {
    return (void*) value;
}

void* graphTovoid(struct Graph* value) {
    return (void*) value;
}