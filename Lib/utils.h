#ifndef UTILITIES_H
#define UTILITIES_H

#include "config.h"


#define MAP_MISSING -3  /* No such element */
#define MAP_FULL -2    /* Hashmap is full */
#define MAP_OMEM -1    /* Out of Memory */
#define MAP_OK 0    /* OK */

#define INITIAL_SIZE 256
#define MAX_CHAIN_LENGTH 8

#define SET_MISSING -1
#define SET_OK 1


typedef int (*Func)(void *, void *, void *);

typedef int (*Func2)(void **);


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


// Define functions
/************************************
    List Methods
************************************/
struct List *create_list(int32_t type);

struct List *plus_list_helper(struct List *list, void *data);

struct List *plus_list(struct List *list, ...);

struct List *concat_list(struct List *list1, struct List *list2);

void *get_list_element(struct List *list, int index);

void *pop_list_element(struct List *list);

void *remove_list_element(struct List *list, int index);

int get_list_size(struct List *list);

bool check_list_element(struct List *list, ...);


/************************************
    Hashmap Methods
************************************/
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


/************************************
    Set Methods
************************************/
struct Set *create_set(int type);

bool check_set_element(struct Set *set, ...);

struct Set *put_set(struct Set *set, ...);

int32_t get_set_element_index(struct Set *set, ...);

struct Set *remove_set_element(struct Set *set, ...);

struct List *get_set_elements(struct Set *set);

int set_iterate(struct Set *set, Func2 f);

int32_t get_set_type(struct Set *set);

int32_t get_set_size(struct Set *set);


/************************************
    Node Methods
************************************/
struct Node* createNode(char* name, int32_t type);
struct Node* setNodeValue(struct Node* node, ...);
char* getNodeValue(struct Node* node, int32_t type, ...);
void addNodeEdge(struct Node* node1, struct Node* node2, double weight);
void addReverseEdge(struct Node* node1, struct Node* node2, double weight);
char* nameIterNode(struct Node* node, int index);
int weightIterNode(struct Node* node, int index);
int getNodeLength(struct Node* node);
void* get_node_value(struct Node* node);

/************************************
    Graph Methods
************************************/
struct Graph* createGraph(char* name);
struct Graph* addGraphNode(struct Graph* graph, struct Node* node);
struct Graph* addGraphEdge(struct Graph* graph, struct Node* node1, struct Node* node2, double weight);
struct Node* iterGraph(struct Graph* graph, int index);
struct Node* findGraphNode(struct Graph* graph, char* nodeName);

struct Node* init_tag(struct Graph* g);
struct Node* reduce(struct Graph* g, struct Node* n0);
struct Node* expand(struct Graph* g, struct Node* n0);
struct Graph* combine(struct Graph* g1, struct Graph* g2);
struct List* bfs(struct Graph* g, struct Node* n);
struct List* dfs(struct Graph* g, struct Node* n);


#endif