#include "config.h"
#include "utils.h"


/************************************
    Cast Methods
************************************/

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



/************************************
	List Methods
************************************/

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

        case NODE:
            data = nodeTovoid(va_arg(arg_ptr, struct Node*));
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

        case NODE:
            for (i = 0; i < size2; i++) {
                list1 = plus_list(list1, voidTonode(list2->value + i));
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

        case NODE:
            target = nodeTovoid(va_arg(args_ptr, struct Node*));
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

            case NODE:
                if (strcmp(voidTonode(target)->name, voidTonode(*(list->value + i))->name) == 0) {
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


/************************************
	Hashmap Methods
************************************/

static unsigned long crc32_tab[] = {
        0x00000000L, 0x77073096L, 0xee0e612cL, 0x990951baL, 0x076dc419L,
        0x706af48fL, 0xe963a535L, 0x9e6495a3L, 0x0edb8832L, 0x79dcb8a4L,
        0xe0d5e91eL, 0x97d2d988L, 0x09b64c2bL, 0x7eb17cbdL, 0xe7b82d07L,
        0x90bf1d91L, 0x1db71064L, 0x6ab020f2L, 0xf3b97148L, 0x84be41deL,
        0x1adad47dL, 0x6ddde4ebL, 0xf4d4b551L, 0x83d385c7L, 0x136c9856L,
        0x646ba8c0L, 0xfd62f97aL, 0x8a65c9ecL, 0x14015c4fL, 0x63066cd9L,
        0xfa0f3d63L, 0x8d080df5L, 0x3b6e20c8L, 0x4c69105eL, 0xd56041e4L,
        0xa2677172L, 0x3c03e4d1L, 0x4b04d447L, 0xd20d85fdL, 0xa50ab56bL,
        0x35b5a8faL, 0x42b2986cL, 0xdbbbc9d6L, 0xacbcf940L, 0x32d86ce3L,
        0x45df5c75L, 0xdcd60dcfL, 0xabd13d59L, 0x26d930acL, 0x51de003aL,
        0xc8d75180L, 0xbfd06116L, 0x21b4f4b5L, 0x56b3c423L, 0xcfba9599L,
        0xb8bda50fL, 0x2802b89eL, 0x5f058808L, 0xc60cd9b2L, 0xb10be924L,
        0x2f6f7c87L, 0x58684c11L, 0xc1611dabL, 0xb6662d3dL, 0x76dc4190L,
        0x01db7106L, 0x98d220bcL, 0xefd5102aL, 0x71b18589L, 0x06b6b51fL,
        0x9fbfe4a5L, 0xe8b8d433L, 0x7807c9a2L, 0x0f00f934L, 0x9609a88eL,
        0xe10e9818L, 0x7f6a0dbbL, 0x086d3d2dL, 0x91646c97L, 0xe6635c01L,
        0x6b6b51f4L, 0x1c6c6162L, 0x856530d8L, 0xf262004eL, 0x6c0695edL,
        0x1b01a57bL, 0x8208f4c1L, 0xf50fc457L, 0x65b0d9c6L, 0x12b7e950L,
        0x8bbeb8eaL, 0xfcb9887cL, 0x62dd1ddfL, 0x15da2d49L, 0x8cd37cf3L,
        0xfbd44c65L, 0x4db26158L, 0x3ab551ceL, 0xa3bc0074L, 0xd4bb30e2L,
        0x4adfa541L, 0x3dd895d7L, 0xa4d1c46dL, 0xd3d6f4fbL, 0x4369e96aL,
        0x346ed9fcL, 0xad678846L, 0xda60b8d0L, 0x44042d73L, 0x33031de5L,
        0xaa0a4c5fL, 0xdd0d7cc9L, 0x5005713cL, 0x270241aaL, 0xbe0b1010L,
        0xc90c2086L, 0x5768b525L, 0x206f85b3L, 0xb966d409L, 0xce61e49fL,
        0x5edef90eL, 0x29d9c998L, 0xb0d09822L, 0xc7d7a8b4L, 0x59b33d17L,
        0x2eb40d81L, 0xb7bd5c3bL, 0xc0ba6cadL, 0xedb88320L, 0x9abfb3b6L,
        0x03b6e20cL, 0x74b1d29aL, 0xead54739L, 0x9dd277afL, 0x04db2615L,
        0x73dc1683L, 0xe3630b12L, 0x94643b84L, 0x0d6d6a3eL, 0x7a6a5aa8L,
        0xe40ecf0bL, 0x9309ff9dL, 0x0a00ae27L, 0x7d079eb1L, 0xf00f9344L,
        0x8708a3d2L, 0x1e01f268L, 0x6906c2feL, 0xf762575dL, 0x806567cbL,
        0x196c3671L, 0x6e6b06e7L, 0xfed41b76L, 0x89d32be0L, 0x10da7a5aL,
        0x67dd4accL, 0xf9b9df6fL, 0x8ebeeff9L, 0x17b7be43L, 0x60b08ed5L,
        0xd6d6a3e8L, 0xa1d1937eL, 0x38d8c2c4L, 0x4fdff252L, 0xd1bb67f1L,
        0xa6bc5767L, 0x3fb506ddL, 0x48b2364bL, 0xd80d2bdaL, 0xaf0a1b4cL,
        0x36034af6L, 0x41047a60L, 0xdf60efc3L, 0xa867df55L, 0x316e8eefL,
        0x4669be79L, 0xcb61b38cL, 0xbc66831aL, 0x256fd2a0L, 0x5268e236L,
        0xcc0c7795L, 0xbb0b4703L, 0x220216b9L, 0x5505262fL, 0xc5ba3bbeL,
        0xb2bd0b28L, 0x2bb45a92L, 0x5cb36a04L, 0xc2d7ffa7L, 0xb5d0cf31L,
        0x2cd99e8bL, 0x5bdeae1dL, 0x9b64c2b0L, 0xec63f226L, 0x756aa39cL,
        0x026d930aL, 0x9c0906a9L, 0xeb0e363fL, 0x72076785L, 0x05005713L,
        0x95bf4a82L, 0xe2b87a14L, 0x7bb12baeL, 0x0cb61b38L, 0x92d28e9bL,
        0xe5d5be0dL, 0x7cdcefb7L, 0x0bdbdf21L, 0x86d3d2d4L, 0xf1d4e242L,
        0x68ddb3f8L, 0x1fda836eL, 0x81be16cdL, 0xf6b9265bL, 0x6fb077e1L,
        0x18b74777L, 0x88085ae6L, 0xff0f6a70L, 0x66063bcaL, 0x11010b5cL,
        0x8f659effL, 0xf862ae69L, 0x616bffd3L, 0x166ccf45L, 0xa00ae278L,
        0xd70dd2eeL, 0x4e048354L, 0x3903b3c2L, 0xa7672661L, 0xd06016f7L,
        0x4969474dL, 0x3e6e77dbL, 0xaed16a4aL, 0xd9d65adcL, 0x40df0b66L,
        0x37d83bf0L, 0xa9bcae53L, 0xdebb9ec5L, 0x47b2cf7fL, 0x30b5ffe9L,
        0xbdbdf21cL, 0xcabac28aL, 0x53b39330L, 0x24b4a3a6L, 0xbad03605L,
        0xcdd70693L, 0x54de5729L, 0x23d967bfL, 0xb3667a2eL, 0xc4614ab8L,
        0x5d681b02L, 0x2a6f2b94L, 0xb40bbe37L, 0xc30c8ea1L, 0x5a05df1bL,
        0x2d02ef8dL
};

/* Return a 32-bit CRC of the contents of the buffer. */
unsigned long crc32(const unsigned char *s, unsigned int len) {
    unsigned int i;
    unsigned long crc32val;

    crc32val = 0;
    for (i = 0; i < len; i++) {
        crc32val =
                crc32_tab[(crc32val ^ s[i]) & 0xff] ^
                (crc32val >> 8);
    }
    return crc32val;
}

/*
 * Hashing function for a string
 */
unsigned int hashmap_hash_int(struct hashmap *map, char *keystring) {

    unsigned long key = crc32((unsigned char *) (keystring), strlen(keystring));

    /* Robert Jenkins' 32 bit Mix Function */
    key += (key << 12);
    key ^= (key >> 22);
    key += (key << 4);
    key ^= (key >> 9);
    key += (key << 10);
    key ^= (key >> 2);
    key += (key << 7);
    key ^= (key >> 12);

    /* Knuth's Multiplicative Method */
    key = (key >> 3) * 2654435761;

    return key % map->tableSize;
}

int hashmap_hash(struct hashmap *map, char *key) {
    int curr;

    // Test if map is full
    if (map->size >= map->tableSize / 2) return MAP_FULL;

    curr = hashmap_hash_int(map, key);
    for (int i = 0; i < MAX_CHAIN_LENGTH; i++) {
        if (map->data[curr].used == 0) {
            return curr;
        }

        if (map->data[curr].used == 1 && strcmp(map->data[curr].key, key) == 0) {
            return curr;
        }

        curr = (curr + 1) % map->tableSize;
    }

    return MAP_FULL;
}

int hashmap_rehash(struct hashmap *map) {
    struct hashmap_element *curr;

    // Apply for new space, twice as large as before
    struct hashmap_element *temp = (struct hashmap_element *) calloc(2 * map->tableSize,
                                                                     sizeof(struct hashmap_element));
    if (!temp) return MAP_OMEM;

    // Update data pointers
    curr = map->data;
    map->data = temp;

    // Update size
    int oldSize = map->tableSize;
    map->tableSize = 2 * map->tableSize;
    map->size = 0;

    // Rehash
    for (int i = 0; i < oldSize; i++) {
        // Only hash those used position
        if (curr[i].used == 0) continue;

        hashmap_put(map, curr[i].key, curr[i].data);
    }

    free(curr);

    return MAP_OK;
}


// Functions for hashmap features
struct hashmap *create_hashmap(int32_t keyType, int32_t valueType) {
    // Apply memory
    struct hashmap *newMap = (struct hashmap *) malloc(sizeof(struct hashmap));

    // Set properties
    newMap->keyType = keyType;
    newMap->valueType = valueType;
    newMap->size = 0;
    newMap->data = (struct hashmap_element *) calloc(INITIAL_SIZE, sizeof(struct hashmap_element));
    newMap->tableSize = INITIAL_SIZE;

    return newMap;
}

struct hashmap *hashmap_put(struct hashmap *map, ...) {
    // Variables to store var_args
    void *keyData;
    void *valueData;
    char *key;

    va_list arg_ptr;
    va_start(arg_ptr, map);

    // Extract and format key
    switch (map->keyType) {
        case INT:
            keyData = intTovoid(va_arg(arg_ptr, int));
            key = malloc(16);
            snprintf(key, 16, "%d", voidToint(keyData));
            break;

        case STRING:
            keyData = stringTovoid(va_arg(arg_ptr, char*));
            key = voidTostring(keyData);
            break;

        default:
            break;
    }

    // Extract and format value
    switch (map->valueType) {
        case INT:
            valueData = intTovoid(va_arg(arg_ptr, int));
            break;

        case FLOAT:
            valueData = floatTovoid(va_arg(arg_ptr, double));
            break;

        case BOOL:
            valueData = boolTovoid(va_arg(arg_ptr, bool));
            break;

        case STRING:
            valueData = stringTovoid(va_arg(arg_ptr, char*));
            break;

        default:
            break;
    }

    va_end(arg_ptr);

    // Find where to put
    int index = hashmap_hash(map, key);
    while (index == MAP_FULL) {
        if (hashmap_rehash(map) == MAP_OMEM) {
            printf("Error! hashmap_put() : Out of Memory.\n");
            exit(1);
        }
        index = hashmap_hash(map, key);
    }

    // Put
    map->data[index].data[0] = keyData;
    map->data[index].data[1] = valueData;
    map->data[index].key = key;
    map->data[index].used = 1;
    map->size++;

    return map;
}

bool hashmap_haskey(struct hashmap *map, ...) {
    char *key;

    va_list args_ptr;
    va_start(args_ptr, map);

    switch (map->keyType) {
        case INT:
            key = malloc(16);
            snprintf(key, 16, "%d", va_arg(args_ptr,
                    int));
            break;

        case STRING:
            key = va_arg(args_ptr, char*);
            break;

        default:
            break;
    }

    va_end(args_ptr);

    int index = hashmap_hash_int(map, key);
    for (int i = 0; i < MAX_CHAIN_LENGTH; i++) {
        int usedFlag = map->data[index].used;
        if (usedFlag == 1) {
            if (strcmp(map->data[index].key, key) == 0) {
                return 1;
            }
        }
        index = (index + 1) % map->tableSize;
    }

    return 0;
}

void *hashmap_get(struct hashmap *map, ...) {
    char *key;

    va_list args_ptr;
    va_start(args_ptr, map);

    switch (map->keyType) {
        case INT:
            key = malloc(16);
            snprintf(key, 16, "%d", va_arg(args_ptr,
                    int));
            break;

        case STRING:
            key = va_arg(args_ptr, char*);
            break;

        default:
            break;
    }

    va_end(args_ptr);

    int index = hashmap_hash_int(map, key);
    for (int i = 0; i < MAX_CHAIN_LENGTH; i++) {
        int useFlag = map->data[index].used;
        if (useFlag == 1) {
            if (strcmp(map->data[index].key, key) == 0) {
                return map->data[index].data[1];
            }
        }

        index = (index + 1) % map->tableSize;
    }

    printf("Error! hashmap_get() : Key does not exist.\n");
    exit(1);
    //return boolTovoid(false);
}

struct hashmap *hashmap_remove(struct hashmap *map, ...) {
    char *key;

    va_list args_ptr;
    va_start(args_ptr, map);

    switch (map->keyType) {
        case INT:
            key = malloc(16);
            snprintf(key, 16, "%d", va_arg(args_ptr,
                    int));
            break;

        case STRING:
            key = va_arg(args_ptr, char*);
            break;

        default:
            break;
    }

    va_end(args_ptr);

    int index = hashmap_hash_int(map, key);

    for (int i = 0; i < MAX_CHAIN_LENGTH; i++) {
        int useFlag = map->data[index].used;
        if (useFlag == 1) {
            if (strcmp(map->data[index].key, key) == 0) {
                map->data[index].used = 0;
                map->data[index].data[0] = NULL;
                map->data[index].data[1] = NULL;
                map->data[index].key = NULL;
                map->size--;

                return map;
            }
        }
        index = (index + 1) % map->tableSize;
    }
    printf("Error! hashmap_remove() : No such key");
    exit(1);
}

struct List *hashmap_keys(struct hashmap *map) {
    if (map == NULL) {
        printf("Error! hashmap_keys() : Map does not exist.\n");
        exit(1);
    } else if (hashmap_length(map) <= 0) {
        printf("Error! hashmap_keys() : Map does not have key.\n");
        exit(1);
    }

    struct List *keys = create_list(map->keyType);
    for (int i = 0; i < map->tableSize; i++) {
        if (map->data[i].used != 0) {
            switch (map->keyType) {
                case INT:
                    plus_list(keys, voidToint(map->data[i].data[0]));
                    break;

                case STRING:
                    plus_list(keys, voidTostring(map->data[i].data[0]));
                    break;

                default:
                    break;
            }
        }
    }

    return keys;
}

int hashmap_iterate(struct hashmap *map, Func f) {
    if (map == NULL) {
        printf("Error! hashmap_iterate() : Map does not exist.\n");
        exit(1);
    } else if (hashmap_length(map) <= 0) {
        return MAP_MISSING;
    }

    for(int i = 0; i < map->tableSize; i++) {
        if (map->data[i].used != 0) {
            int status = f(map->data[i].key, map->data[i].data[0], map->data[i].data[1]);
            if (status != MAP_OK) {
                return status;
            }
        }
    }

    return MAP_OK;
}

int hashmap_length(struct hashmap *map) {
    if (map == NULL) {
        printf("Error! hashmap_length() : Map does not exist.\n");
        exit(1);
    }
    return map->size;
}

int32_t hashmap_keytype(struct hashmap *map) {
    if (map == NULL) {
        printf("Error! hashmap_length() : map does not exist.\n");
        exit(1);
    }
    return map->keyType;
}

int32_t hashmap_valuetype(struct hashmap *map) {
    if (map == NULL) {
        printf("Error! hashmap_length() : map does not exist.\n");
        exit(1);
    }
    return map->valueType;
}


/************************************
	Set Methods
************************************/

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

int set_iterate(struct Set *set, Func2 f) {
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


/************************************
	Node Methods
************************************/

struct Node* createNode(char* name, int32_t type, ...) {
	struct Node* new = (struct Node*) malloc(sizeof(struct Node));
	new->name = name;
	new->type = type;
	new->nodes = NULL;
	new->weight = NULL;

	va_list ap;
	va_start(ap, type);
	switch (type) {
		case INT:
			new->value = intTovoid(va_arg(ap, int));
			break;
		case FLOAT:
			new->value = floatTovoid(va_arg(ap, double));
			break;
		case BOOL:
			new->value = boolTovoid(va_arg(ap, bool));
			break;
		case STRING:
			new->value = stringTovoid(va_arg(ap, char*));
		default:
			break;
	}
  	va_end(ap);

  	return new;
}

char* getNodeValue(struct Node* node, int32_t type, ...) {
	if (node == NULL) {
		printf("Node does not exist.\n");
		return NULL;
	}
	// if (type!=node->type){
	// 	printf("Node is not matching input type\n");
	// 	return NULL;
	// }
	return node->value;
}

char* getNodeName(struct Node* node) {
	if (node == NULL) {
		printf("Node does not exist.\n");
		return NULL;
	}
	return node->name;
}

void addNodeEdge(struct Node* node1, struct Node* node2, double weight){
	if (node1->nodes==NULL){
		node1->nodes = create_list(NODE);
		node1->weight = create_list(FLOAT);
	}
	// printf("EXECUTED at addNodeEdge");
	plus_list(node1->nodes, node2);
	plus_list(node1->weight, weight);
	// printf("%d\n", voidToint(newEdge->value));
	// printf("%d\n", voidToint(node->nodes->value));
}

struct Node* iterNode(struct Node* node, int index){
	int size = get_list_size(node->nodes);
	// printf("%d\n", size);
	if (0<=index && index<size)
		return voidTonode(get_list_element(node->nodes, index));
	else{
		printf("Node does not exist.\n");
		return NULL;
	}
}

double weightIterNode(struct Node* node, int index){
	int size = get_list_size(node->weight);
	// printf("%d\n", size);
	if (0<=index && index<size)
		return voidTofloat(get_list_element(node->weight, index));
	else{
		printf("Node does not exist.\n");
		return 0;
	}
}


/************************************
	Graph Methods
************************************/

struct Graph* createGraph(char* name){
	struct Graph* new = (struct Graph*) malloc(sizeof(struct Graph));
	new->name = name;
	new->nodes = NULL;
	// new->weight = NULL;
	new->hashmap = create_hashmap(STRING, INT);
	return new;
}

void addGraphNode(struct Graph* graph, struct Node* node){
	if (graph==NULL){
		printf("Graph does not exist.\n");
		return;
	}
	if (graph->nodes==NULL){
		graph->nodes = create_list(NODE);
		// graph->weight = create_list(LIST);
	}
	printf("Graph List Type: %d\n", graph->nodes->type);
	printf("addGraphNode: %s\n", node->name);
	plus_list(graph->nodes, node);
	// plus_list(graph->weight, node->weight);
	printf("%s\n", node->name);
	printf("%d\n", get_list_size(graph->nodes)-1);
	graph->hashmap = hashmap_put(graph->hashmap, node->name, get_list_size(graph->nodes)-1);
}

void addGraphEdge(struct Graph* graph, struct Node* node1, struct Node* node2, double weight){
	if (hashmap_get(graph->hashmap, node1->name)==NULL){
		addGraphNode(graph, node1);
	}
	if (hashmap_get(graph->hashmap, node2->name)==NULL){
		addGraphNode(graph, node2);
	}
	addNodeEdge(node1, node2, weight);
}

struct Node* iterGraph(struct Graph* graph, int index){
	int size = get_list_size(graph->nodes);
	// printf("%d\n", size);
	if (0<=index && index<size)
		return (struct Node*)get_list_element(graph->nodes, index);
	else{
		printf("Node does not exist.\n");
		return NULL;
	}
}

struct Node* findGraphNode(struct Graph* graph, char* nodeName){
	int index = voidToint(hashmap_get(graph->hashmap, nodeName));
	printf("%d\n", index);
	return iterGraph(graph, index);
}

int test_inttoint_hashmap_iterate_func(void* key, void* keyData, void* keyValue) {
    printf("%s ", "MAPKEY:");
    printf("%s\n", voidTostring(key));
    printf("%s ", "KEY DATA:");
    printf("%d\n", voidToint(keyData));
    printf("%s ", "VALUE DATA");
    printf("%d\n", voidToint(keyValue));

    return MAP_OK;
}


// int main() {
// 	// Test function: create_list
//     printf("%s\n", "TEST: create_list");
//     struct List *intList = create_list(0);
//     printf("%d\n", intList->type);

//     struct List *doubleList = create_list(1);
//     printf("%d\n", doubleList->type);


//     // Test function: plus_list
//     printf("%s\n", "TEST: plus_list");
//     struct List *intListTest = create_list(INT);
//     struct List *doubleListTest = create_list(FLOAT);
//     struct List *stringListTest = create_list(STRING);
//     intListTest = plus_list(intListTest, 10);
//     doubleListTest = plus_list(doubleListTest, 10.123);
//     char str1[12] = "Hello";
//     char str2[12] = "World";
//     stringListTest = plus_list(stringListTest, str1);
//     stringListTest = plus_list(stringListTest, str2);
//     printf("%s\n", voidTostring(pop_list_element(stringListTest)));
//     printf("%s\n", voidTostring(pop_list_element(stringListTest)));



//     // Test function: get_list_element, get_list_size
//     printf("%s\n", "TEST: get_list_element, get_list_size");
//     struct List *intListTest1;
//     intListTest1 = create_list(INT);
//     intListTest1 = plus_list(intListTest1, 10);
//     printf("%d\n", get_list_size(intListTest1));

//     intListTest1 = plus_list(intListTest1, 20);
//     printf("%d\n", get_list_size(intListTest1));

//     intListTest1 = plus_list(intListTest1, 30);
//     printf("%d\n", get_list_size(intListTest1));

//     printf("%d\n", intListTest1->type);
//     printf("%d\n", intListTest1->size);
//     void *intVoidPointerTest = get_list_element(intListTest1, 2);
//     int intTest = voidToint(intVoidPointerTest);
//     printf("%d\n", intTest);


//     // Test function: pop_list_element
//     printf("%s\n", "TEST: pop_list_element");
//     struct List *intListTest2;
//     intListTest2 = create_list(INT);
//     intListTest2 = plus_list(intListTest2, 10);
//     intListTest2 = plus_list(intListTest2, 20);
//     intListTest2 = plus_list(intListTest2, 30);
//     printf("%d\n", voidToint(pop_list_element(intListTest2)));
//     printf("%d\n", voidToint(pop_list_element(intListTest2)));
//     printf("%d\n", voidToint(pop_list_element(intListTest2)));
//     intListTest2 = plus_list(intListTest2, 10);
//     intListTest2 = plus_list(intListTest2, 20);
//     intListTest2 = plus_list(intListTest2, 30);


//     // Test function: remove_list_element
//     printf("%s\n", "TEST: remove_list_element");
//     struct List *intListTest3;
//     intListTest3 = create_list(INT);
//     intListTest3 = plus_list(intListTest3, 10);
//     intListTest3 = plus_list(intListTest3, 20);
//     intListTest3 = plus_list(intListTest3, 30);
//     printf("%d\n", get_list_size(intListTest3));
//     printf("%d\n", voidToint(remove_list_element(intListTest3, 0)));
//     printf("%d\n", get_list_size(intListTest3));
//     printf("%d\n", voidToint(remove_list_element(intListTest3, 0)));
//     printf("%d\n", get_list_size(intListTest3));
//     printf("%d\n", voidToint(remove_list_element(intListTest3, 0)));
//     printf("%d\n", get_list_size(intListTest3));
//     intListTest3 = plus_list(intListTest3, 40);


//     // Test function: check_list_element
//     printf("%s\n", "TEST: check_list_element");
//     printf("%d\n", check_list_element(intListTest2, 10));
//     assert(check_list_element(intListTest2, 10) == 1);
//     printf("%d\n", check_list_element(intListTest2, 20));
//     assert(check_list_element(intListTest2, 20) == 1);
//     printf("%d\n", check_list_element(intListTest2, 30));
//     assert(check_list_element(intListTest2, 30) == 1);
//     printf("%d\n", check_list_element(intListTest2, 40));
//     assert(check_list_element(intListTest2, 40) == 0);

//     struct List* stringListTest2 = create_list(STRING);
//     stringListTest2 = plus_list(stringListTest2, "hello");
//     stringListTest2 = plus_list(stringListTest2, "world");
//     printf("%s\n", voidTostring(get_list_element(stringListTest2, 1)));
//     printf("%d\n", check_list_element(stringListTest2, "hello"));
//     printf("%d\n", check_list_element(stringListTest2, "world"));
//     printf("%d\n", check_list_element(stringListTest2, "columbia"));


//     // Test function: concat_list
//     printf("TEST: concat_list\n");
//     printf("%d\n", get_list_size(intListTest2));
//     printf("%d\n", get_list_size(intListTest3));
//     struct List* concatListTest = concat_list(intListTest2, intListTest3);
//     printf("%d\n", get_list_size(concatListTest));


//     // Test function: create_hashmap
//     printf("%s\n", "TEST: create_hashmap");
//     struct hashmap *intToInt = create_hashmap(INT, INT);
//     struct hashmap *intToString = create_hashmap(INT, STRING);
//     printf("%d\n", intToInt->keyType);
//     printf("%d\n", intToInt->valueType);
//     printf("%d\n", intToString->keyType);
//     printf("%d\n", intToString->valueType);


//     // Test function: hashmap_hash_int
//     printf("%s\n", "TEST: hashmap_hash_int");
//     struct hashmap *intToIntTwo = create_hashmap(INT, INT);
//     printf("%d\n", hashmap_hash_int(intToIntTwo, "Hello"));
//     printf("%d\n", hashmap_hash_int(intToIntTwo, "World"));


//     // Test function: hashmap_put
//     printf("%s\n", "TEST: hashmap_put");
//     struct hashmap *intToInt3 = create_hashmap(INT, INT);
//     intToInt3 = hashmap_put(intToInt3, 10, 99);
//     printf("%d\n", intToInt3->size);

//     intToInt3 = hashmap_put(intToInt3, 11, 88);
//     printf("%d\n", intToInt3->size);

//     struct hashmap *stringToInt1 = create_hashmap(STRING, INT);
//     printf("%d\n", stringToInt1->size);
//     stringToInt1 = hashmap_put(stringToInt1, "hello", 10);
//     printf("%d\n", stringToInt1->size);
//     stringToInt1 = hashmap_put(stringToInt1, "world", 11);
//     printf("%d\n", stringToInt1->size);


//     // Test function: hashmap_length, hashmap_keytype, hashmap_valuetype
//     printf("%s\n", "TEST: hashmap_length, hashmap_keytype, hashmap_valuetype");
//     printf("%d\n", hashmap_length(stringToInt1));
//     printf("%d\n", hashmap_keytype(stringToInt1));
//     printf("%d\n", hashmap_valuetype(stringToInt1));


//     // Test function: hashmap_hashkey
//     printf("%s\n", "TEST: hashmap_haskey");
//     printf("%d\n", hashmap_haskey(stringToInt1, "hello"));
//     printf("%d\n", hashmap_haskey(stringToInt1, "world"));
//     printf("%d\n", hashmap_haskey(stringToInt1, "columbia"));
//     printf("%d\n", hashmap_haskey(intToInt3, 10));
//     printf("%d\n", hashmap_haskey(intToInt3, 11));
//     printf("%d\n", hashmap_haskey(intToInt3, 12));


//     // Test function: hashmap_get
//     printf("%s\n", "TEST: hashmap_get");
//     printf("%d\n", voidToint(hashmap_get(stringToInt1, "hello")));
//     printf("%d\n", voidToint(hashmap_get(stringToInt1, "world")));
//     //printf("%d\n", voidToint(hashmap_get(stringToInt1, "columbia")));
//     printf("%d\n", voidToint(hashmap_get(intToInt3, 10)));
//     printf("%d\n", voidToint(hashmap_get(intToInt3, 11)));
//     //printf("%d\n", voidToint(hashmap_get(intToInt3, 12)));


//     // Test function: hashmap_remove
//     printf("%s\n", "TEST: hashmap_remove");
//     stringToInt1 = hashmap_remove(stringToInt1, "hello");
//     assert(hashmap_length(stringToInt1) == 1);
//     stringToInt1 = hashmap_remove(stringToInt1, "world");
//     assert(hashmap_length(stringToInt1) == 0);
//     stringToInt1 = hashmap_put(stringToInt1, "hello", 10);
//     assert(hashmap_length(stringToInt1) == 1);
//     stringToInt1 = hashmap_put(stringToInt1, "world", 100);
//     assert(hashmap_length(stringToInt1) == 2);

//     intToInt3 = hashmap_remove(intToInt3, 10);
//     assert(hashmap_length(intToInt3) == 1);
//     intToInt3 = hashmap_put(intToInt3, 20, 100);
//     assert(hashmap_length(intToInt3) == 2);


//     // Test function: hashmap_keys
//     struct List *stringKeysList = hashmap_keys(stringToInt1);
//     for (int i = 0; i < get_list_size(stringKeysList); i++) {
//         printf("%s\n", voidTostring(get_list_element(stringKeysList, i)));
//     }
//     struct List *intKeysList = hashmap_keys(intToInt3);
//     for (int i = 0; i < get_list_size(intKeysList); i++) {
//         printf("%d\n", voidToint(get_list_element(intKeysList, i)));
//     }


//     // Test function: hashmap_iterate
//     struct hashmap* intToInt4 = create_hashmap(INT, INT);
//     intToInt4 = hashmap_put(intToInt4, 1, 10);
//     intToInt4 = hashmap_put(intToInt4, 2, 20);
//     intToInt4 = hashmap_put(intToInt4, 3, 30);
//     intToInt4 = hashmap_put(intToInt4, 4, 40);
//     intToInt4 = hashmap_put(intToInt4, 5, 50);
//     printf("%s\n", "TEST: hashmap_iterate");
//     int status = hashmap_iterate(intToInt4, test_inttoint_hashmap_iterate_func);


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
//     status = set_iterate(intSet2, test_int_set_iterate);
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

//     return 0;
// }