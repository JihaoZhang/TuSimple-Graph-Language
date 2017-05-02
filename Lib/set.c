#include "set.h"


struct Set *create_set(int32_t type) {
    // Apply for memory
    struct Set *newSet = (struct Set *) malloc(sizeof(struct Set));

    // Set property
    newSet->type = type;
    newSet->size = 0;
    newSet->data = create_list(type);

    return newSet;
}

bool check_set_element(struct Set *set, ...) {
    // Corner case
    if (set == NULL) {
        printf("%s\n", "Error! check_set_element : Set does not exist.\n");
        exit(1);
    }

    bool exist = 0;

    va_list args_ptr;
    va_start(args_ptr, set);

    switch (set->type) {
        case INT:
            exist = check_list_element(set->data, va_arg(args_ptr, int));
            break;

        case FLOAT:
            exist = check_list_element(set->data, va_arg(args_ptr, double));
            break;

        case BOOL:
            exist = check_list_element(set->data, va_arg(args_ptr, bool));
            break;

        case STRING:
            exist = check_list_element(set->data, va_arg(args_ptr, char*));
            break;

        default:
            break;
    }

    va_end(args_ptr);

    return exist;
}

/*
 * Set does not have order, this function is a helper function for removing
 * elements in set
 */
int32_t get_set_element_index(struct Set *set, ...) {
    // Corner case
    if (set == NULL) {
        printf("%s\n", "Error! get_set_element_index : Set does not exist.\n");
        exit(1);
    }

    int index = 0;

    int intTemp;
    double floatTemp;
    bool boolTemp;
    char* stringTemp;

    va_list args_ptr;
    va_start(args_ptr, set);

    switch (set->type) {
        case INT:
            intTemp = va_arg(args_ptr, int);
            while (index < (set->data->currPos)) {
                if (intTemp == voidToint(*(set->data->value + index))) {
                    return index;
                }
                index++;
            }
            return -1;

        case BOOL:
            boolTemp = va_arg(args_ptr, bool);
            while (index < (set->data->currPos)) {
                if (boolTemp == voidTobool(*(set->data->value + index))) {
                    return index;
                }
                index++;
            }
            return -1;

        case FLOAT:
            floatTemp = va_arg(args_ptr, double);
            while (index < (set->data->currPos)) {
                if (fabs(floatTemp - voidTofloat(*(set->data->value + index))) < 0.00001) {
                    return index;
                }
                index++;
            }
            return -1;

        case STRING:
            stringTemp = va_arg(args_ptr, char*);
            while (index < (set->data->currPos)) {
                if (strcmp(stringTemp, voidTostring(*(set->data->value + index))) == 0) {
                    return index;
                }
                index++;
            }
            return -1;

        default:
            break;
    }

    return -1;
}

struct Set *put_set(struct Set *set, ...) {
    // Corner case
    if (set == NULL) {
        printf("%s\n", "Error! put_set : Set does not exist.\n");
        exit(1);
    }

    void *addData;

    va_list args_ptr;
    va_start(args_ptr, set);
    switch (set->type) {
        case INT:
            addData = intTovoid(va_arg(args_ptr, int));
            if (!check_set_element(set, voidToint(addData))) {
                set->data = plus_list(set->data, voidToint(addData));
                set->size++;
            } else {
                printf("Error! put_set : Element Already exist.\n");
                exit(1);
            }
            break;

        case FLOAT:
            addData = floatTovoid(va_arg(args_ptr, double));
            if (!check_set_element(set, voidTofloat(addData))) {
                set->data = plus_list(set->data, voidTofloat(addData));
                set->size++;
            } else {
                printf("Error! put_set : Element Already exist.\n");
                exit(1);
            }
            break;

        case BOOL:
            addData = boolTovoid(va_arg(args_ptr, bool));
            if (!check_set_element(set, voidTobool(addData))) {
                set->data = plus_list(set->data, voidTobool(addData));
                set->size++;
            } else {
                printf("Error! put_set : Element Already exist.\n");
                exit(1);
            }
            break;

        case STRING:
            addData = stringTovoid(va_arg(args_ptr, char*));
            if (!check_set_element(set, voidTostring(addData))) {
                set->data = plus_list(set->data, voidTostring(addData));
                set->size++;
            } else {
                printf("Error! put_set : Element Already exist.\n");
                exit(1);
            }
            break;

        default:
            break;
    }

    va_end(args_ptr);

    return set;
}

struct Set *remove_set_element(struct Set *set, ...) {
    // Corner case
    if (set == NULL) {
        printf("%s\n", "Error! remove_element : Set does not exist.\n");
        exit(1);
    }

    int intTemp;
    bool boolTemp;
    double floatTemp;
    char *stringTemp;

    int index;

    va_list args_ptr;
    va_start(args_ptr, set);

    switch (set->type) {

        case INT:
            intTemp = va_arg(args_ptr, int);
            index = get_set_element_index(set, intTemp);
            if (index == -1) {
                printf("Error! remove_set_element : Element does not exist.\n");
                exit(1);
            } else {
                remove_list_element(set->data, index);
                set->size--;
            }
            break;

        case BOOL:
            boolTemp = va_arg(args_ptr, bool);
            index = get_set_element_index(set, boolTemp);
            if (index == -1) {
                printf("Error! remove_set_element : Element does not exist.\n");
                exit(1);
            } else {
                remove_list_element(set->data, index);
                set->size--;
            }
            break;

        case FLOAT:
            floatTemp = va_arg(args_ptr, double);
            index = get_set_element_index(set, floatTemp);
            if (index == -1) {
                printf("Error! remove_set_element : Element does not exist.\n");
                exit(1);
            } else {
                remove_list_element(set->data, index);
                set->size--;
            }
            break;

        case STRING:
            stringTemp = va_arg(args_ptr, char*);
            index = get_set_element_index(set, stringTemp);
            if (index == -1) {
                printf("Error! remove_set_element : Element does not exist.\n");
                exit(1);
            } else {
                remove_list_element(set->data, index);
                set->size--;
            }
            break;

        default:
            break;
    }

    va_end(args_ptr);

    return set;
}

struct List *get_set_elements(struct Set *set) {
    // Corner case
    if (set == NULL) {
        printf("%s\n", "Error! get-set_elements : Set does not exist.\n");
        exit(1);
    }

    struct List *list;
    int i;

    switch (set->type) {
        case INT:
            list = create_list(INT);
            list->type = INT;
            list->size = set->size;
            for (i = 0; i < set->size; i++) {
                list = plus_list(list, voidToint(get_list_element(set->data, i)));
            }
            return list;

        case FLOAT:
            list = create_list(FLOAT);
            list->type = FLOAT;
            list->size = set->size;
            for (i = 0; i < set->size; i++) {
                list = plus_list(list, voidTofloat(get_list_element(set->data, i)));
            }
            return list;

        case BOOL:
            list = create_list(BOOL);
            list->type = BOOL;
            list->size = set->size;
            for (i = 0; i < set->size; i++) {
                list = plus_list(list, voidTobool(get_list_element(set->data, i)));
            }
            return list;

        case STRING:
            list = create_list(STRING);
            list->type = STRING;
            list->size = set->size;
            for (i = 0; i < set->size; i++) {
                list = plus_list(list, voidTostring(get_list_element(set->data, i)));
            }
            return list;

        default:
            break;
    }

    return list;
}

int set_iterate(struct Set *set, Func f) {
    // Corner case
    if (set == NULL) {
        printf("Error! set_iterate : Set does not exist.\n");
        exit(1);
    } else if (get_set_size(set) < 0) {
        return SET_MISSING;
    }

    for (int i = 0; i < get_set_size(set); i++) {
        int status = f(set->data->value + i);
        if (status != SET_OK) {
            return status;
        }
    }

    return SET_OK;
}

int32_t get_set_type(struct Set *set) {
    if (set == NULL) {
        printf("%s\n", "Error! get_set_type : Set does not exist.\n");
        exit(1);
    }

    return set->type;
}

int32_t get_set_size(struct Set *set) {
    if (set == NULL) {
        printf("%s\n", "Error! get_set_type : Set does not exist.\n");
        exit(1);
    }

    return set->size;
}


int test_int_set_iterate(void **data) {
    printf("%s", "SET ELEMENT: ");
    printf("%d\n", voidToint(*data));

    return SET_OK;
}

int test_int_set_iterate_2(void **data) {
    int value = voidToint(*data) + 1;
    *data = intTovoid(value);
    return SET_OK;
}


// int main() {

//     // Test function: create_set, get_set_type
//     printf("%s\n", "TEST: create_set");
//     struct Set *intSet = create_set(INT);
//     printf("%d\n", intSet->type);
//     printf("%d\n", intSet->data->type);
//     printf("%d\n", intSet->size);
//     printf("%d\n", get_set_type(intSet));

//     struct Set *stringSet = create_set(STRING);
//     printf("%d\n", stringSet->type);
//     printf("%d\n", stringSet->data->type);
//     printf("%d\n", stringSet->size);
//     printf("%d\n", get_set_type(stringSet));


//     // Test function: put_set, get_set_size
//     printf("%s\n", "TEST: put_set, get_set_size");
//     struct Set *intSet2 = create_set(INT);
//     intSet2 = put_set(intSet2, 1);
//     printf("%d\n", get_set_size(intSet2));
//     assert(get_set_size(intSet2) == 1);
//     intSet2 = put_set(intSet2, 2);
//     printf("%d\n", get_set_size(intSet2));
//     assert(get_set_size(intSet2) == 2);
//     intSet2 = put_set(intSet2, 3);
//     printf("%d\n", get_set_size(intSet2));
//     assert(get_set_size(intSet2) == 3);

//     struct Set *stringSet2 = create_set(STRING);
//     stringSet2 = put_set(stringSet2, "hello");
//     printf("%d\n", get_set_size(stringSet2));
//     assert(get_set_size(stringSet2) == 1);
//     stringSet2 = put_set(stringSet2, "world");
//     printf("%d\n", get_set_size(stringSet2));
//     assert(get_set_size(stringSet2) == 2);
//     printf("%d\n", check_set_element(stringSet2, "hello"));
//     printf("%d\n", check_set_element(stringSet2, "world"));
//     printf("%d\n", check_set_element(stringSet2, "columbia"));


//     // Test function: get_set_elements
//     printf("%s\n", "TEST: get_set_elements");
//     struct List *intList1 = get_set_elements(intSet2);
//     printf("%d\n", get_list_size(intList1));
//     struct List *stringList1 = get_set_elements(stringSet2);
//     printf("%d\n", get_list_size(stringList1));


//     // Test function: set_iterate
//     printf("%s\n", "TEST: set_iterate");
//     int status = set_iterate(intSet2, test_int_set_iterate);
//     status = set_iterate(intSet2, test_int_set_iterate_2);
//     status = set_iterate(intSet2, test_int_set_iterate);


//     // Test function: get_set_element_index
//     printf("%s\n", "TEST: get_set_element_index");
//     printf("%d\n", get_set_element_index(intSet2, 1));
//     printf("%d\n", get_set_element_index(intSet2, 2));
//     printf("%d\n", get_set_element_index(intSet2, 3));
//     printf("%d\n", get_set_element_index(intSet2, 4));


//     // Test function: remove_set_element
//     printf("%s\n", "TEST: remove_set_element");
//     intSet2 = remove_set_element(intSet2, 2);
//     printf("%d\n", get_set_size(intSet2));
//     printf("%d\n", intSet2->data->currPos);
//     intSet2 = remove_set_element(intSet2, 3);
//     printf("%d\n", get_set_size(intSet2));
//     printf("%d\n", intSet2->data->currPos);
// }