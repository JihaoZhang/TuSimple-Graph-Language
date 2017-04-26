#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdarg.h>
#include <string.h>
#include <assert.h>
#include <math.h>
#include "list.h"
#include "cast.c"


struct List *create_list(int32_t type) {
    struct List *newList = (struct List *) malloc(sizeof(struct List));

    // Init value of newly created list
    newList->type = type;
    newList->size = 1;
    newList->currPos = 0;
    newList->value = (void *) malloc(newList->size * sizeof(void *));
    return newList;
}


struct List *plus_list_helper(struct List *list, void *value) {
    if (list->currPos >= list->size) {
        // Double list size
        list->size = list->size * 2;
        list->value = (void **) realloc(list->value, list->size * sizeof(void *));
    }

    // Add element and reset size
    *(list->value + list->currPos) = value;
    list->currPos++;
    return list;
}


struct List *plus_list(struct List *list, ...) {
    if (list == NULL) {
        printf("Error! plus_list() : List does not exist. \n");
        exit(1);
    }

    // Extract data using variable-argument
    va_list arg_ptr;
    va_start(arg_ptr, list);

    void *data;
    switch (list->type) {
        case INT:
            data = intTovoid(va_arg(arg_ptr, int));
            break;

        case FLOAT:
            data = floatTovoid(va_arg(arg_ptr, double));
            break;

        case BOOL:
            data = boolTovoid(va_arg(arg_ptr, bool));
            break;

        case STRING:
            data = stringTovoid(va_arg(arg_ptr, char*));
            break;

        default:
            break;
    }

    va_end(arg_ptr);

    return plus_list_helper(list, data);
}


void *get_list_element(struct List *list, int index) {
    // Corner case
    if (list == NULL) {
        printf("Error! get_list_element() : List does not exist. \n");
        exit(1);
    } else if (list->size == 0 || list->size <= index || list->size <= -index) {
        printf("Error! get_list_element() : Index out of range. \n");
        exit(1);
    } else if (index < 0) {
        index += list->size;
    }

    return *(list->value + index);
}


int get_list_size(struct List *list) {
    // Corner case
    if (list == NULL) {
        printf("Error! get_list_size() : List does not exist. \n");
        exit(1);
    }

    return list->currPos;
}


struct List *concat_list(struct List *list1, struct List *list2) {
    int size2 = list2->currPos;
    int i;

    switch (list1->type) {
        case INT:
            for (i = 0; i < size2; i++) {
                list1 = plus_list(list1, voidToint(list2->value + i));
            }
            break;

        case BOOL:
            for (i = 0; i < size2; i++) {
                list1 = plus_list(list1, voidTobool(list2->value + i));
            }
            break;

        case FLOAT:
            for (i = 0; i < size2; i++) {
                list1 = plus_list(list1, voidTofloat(list2->value + i));
            }
            break;

        case STRING:
            for (i = 0; i < size2; i++) {
                list1 = plus_list(list1, voidTostring(list2->value + i));
            }
            break;

        default:
            break;
    }

    return list1;
}

void *pop_list_element(struct List *list) {
    if (list == NULL) {
        printf("Error! pop_list_element() : List does not exist.\n");
        exit(1);
    } else if (list->currPos < 1) {
        printf("Error! pop_list_element() : No element to pop.\n");
        exit(1);
    }

    void *value = *(list->value + list->currPos - 1);
    list->currPos--;

    return value;
}


void *remove_list_element(struct List *list, int index) {
    if (list == NULL) {
        printf("Error! remove_list_element() : List does not exist.\n");
        exit(1);
    } else if (list->size <= index || list->size == 0) {
        printf("Error! remove_list_element() : Index out of range.\n");
        exit(1);
    }

    void *elementToRemove = *(list->value + index);

    for (int i = index; i < list->currPos; i++) {
        *(list->value + i) = *(list->value + i + 1);
    }

    // decrease size
    list->currPos--;

    return elementToRemove;
}


bool check_list_element(struct List *list, ...) {
    if (list == NULL) {
        printf("%s\n", "Error! check_list_element : List does not exist.\n");
        exit(1);
    }

    void *target;
    bool exist = 0;

    va_list args_ptr;
    va_start(args_ptr, list);

    switch (list->type) {
        case INT:
            target = intTovoid(va_arg(args_ptr, int));
            break;

        case BOOL:
            target = boolTovoid(va_arg(args_ptr, bool));
            break;

        case FLOAT:
            target = floatTovoid(va_arg(args_ptr, double));
            break;

        case STRING:
            target = stringTovoid(va_arg(args_ptr, char*));
            break;

        default:
            break;
    }

    va_end(args_ptr);

    // Perform linear scan for target
    for (int i = 0; i < list->currPos; i++) {
        switch (list->type) {
            case INT:
                if (voidToint(target) == voidToint(*(list->value + i))) {
                    exist = 1;
                    return exist;
                }
                break;

            case BOOL:
                if (voidTobool(target) == voidTobool(*(list->value + i))) {
                    exist = 1;
                    return exist;
                }
                break;

            case FLOAT:
                if (fabs(voidTofloat(target) - voidTofloat(*(list->value + i))) < 0.00001) {
                    exist = 1;
                    return exist;
                }
                break;

            case STRING:
                if (strcmp(voidTostring(target), voidTostring(*(list->value + i))) == 0) {
                    exist = 1;
                    return exist;
                }
                break;

            default:
                break;
        }
    }

    return exist;
}


//int main() {
//    // Test function: create_list
//    printf("%s\n", "TEST: create_list");
//    struct List *intList = create_list(0);
//    printf("%d\n", intList->type);
//
//    struct List *doubleList = create_list(1);
//    printf("%d\n", doubleList->type);
//
//
//    // Test function: plus_list
//    printf("%s\n", "TEST: plus_list");
//    struct List *intListTest = create_list(INT);
//    struct List *doubleListTest = create_list(FLOAT);
//    struct List *stringListTest = create_list(STRING);
//    intListTest = plus_list(intListTest, 10);
//    doubleListTest = plus_list(doubleListTest, 10.123);
//    char str1[12] = "Hello";
//    char str2[12] = "World";
//    stringListTest = plus_list(stringListTest, str1);
//    stringListTest = plus_list(stringListTest, str2);
//    printf("%s\n", voidTostring(pop_list_element(stringListTest)));
//    printf("%s\n", voidTostring(pop_list_element(stringListTest)));
//
//
//
//    // Test function: get_list_element, get_list_size
//    printf("%s\n", "TEST: get_list_element, get_list_size");
//    struct List *intListTest1;
//    intListTest1 = create_list(INT);
//    intListTest1 = plus_list(intListTest1, 10);
//    printf("%d\n", get_list_size(intListTest1));
//
//    intListTest1 = plus_list(intListTest1, 20);
//    printf("%d\n", get_list_size(intListTest1));
//
//    intListTest1 = plus_list(intListTest1, 30);
//    printf("%d\n", get_list_size(intListTest1));
//
//    printf("%d\n", intListTest1->type);
//    printf("%d\n", intListTest1->size);
//    void *intVoidPointerTest = get_list_element(intListTest1, 2);
//    int intTest = voidToint(intVoidPointerTest);
//    printf("%d\n", intTest);
//
//
//    // Test function: pop_list_element
//    printf("%s\n", "TEST: pop_list_element");
//    struct List *intListTest2;
//    intListTest2 = create_list(INT);
//    intListTest2 = plus_list(intListTest2, 10);
//    intListTest2 = plus_list(intListTest2, 20);
//    intListTest2 = plus_list(intListTest2, 30);
//    printf("%d\n", voidToint(pop_list_element(intListTest2)));
//    printf("%d\n", voidToint(pop_list_element(intListTest2)));
//    printf("%d\n", voidToint(pop_list_element(intListTest2)));
//    intListTest2 = plus_list(intListTest2, 10);
//    intListTest2 = plus_list(intListTest2, 20);
//    intListTest2 = plus_list(intListTest2, 30);
//
//
//    // Test function: remove_list_element
//    printf("%s\n", "TEST: remove_list_element");
//    struct List *intListTest3;
//    intListTest3 = create_list(INT);
//    intListTest3 = plus_list(intListTest3, 10);
//    intListTest3 = plus_list(intListTest3, 20);
//    intListTest3 = plus_list(intListTest3, 30);
//    printf("%d\n", get_list_size(intListTest3));
//    printf("%d\n", voidToint(remove_list_element(intListTest3, 0)));
//    printf("%d\n", get_list_size(intListTest3));
//    printf("%d\n", voidToint(remove_list_element(intListTest3, 0)));
//    printf("%d\n", get_list_size(intListTest3));
//    printf("%d\n", voidToint(remove_list_element(intListTest3, 0)));
//    printf("%d\n", get_list_size(intListTest3));
//    intListTest3 = plus_list(intListTest3, 40);
//
//
//    // Test function: check_list_element
//    printf("%s\n", "TEST: check_list_element");
//    printf("%d\n", check_list_element(intListTest2, 10));
//    assert(check_list_element(intListTest2, 10) == 1);
//    printf("%d\n", check_list_element(intListTest2, 20));
//    assert(check_list_element(intListTest2, 20) == 1);
//    printf("%d\n", check_list_element(intListTest2, 30));
//    assert(check_list_element(intListTest2, 30) == 1);
//    printf("%d\n", check_list_element(intListTest2, 40));
//    assert(check_list_element(intListTest2, 40) == 0);
//
//    struct List* stringListTest2 = create_list(STRING);
//    stringListTest2 = plus_list(stringListTest2, "hello");
//    stringListTest2 = plus_list(stringListTest2, "world");
//    printf("%s\n", voidTostring(get_list_element(stringListTest2, 1)));
//    printf("%d\n", check_list_element(stringListTest2, "hello"));
//    printf("%d\n", check_list_element(stringListTest2, "world"));
//    printf("%d\n", check_list_element(stringListTest2, "columbia"));
//
//
//    // Test function: concat_list
//    printf("TEST: concat_list\n");
//    printf("%d\n", get_list_size(intListTest2));
//    printf("%d\n", get_list_size(intListTest3));
//    struct List* concatListTest = concat_list(intListTest2, intListTest3);
//    printf("%d\n", get_list_size(concatListTest));
//
//    return 0;
//}
