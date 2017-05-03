#ifndef _GRAPH_H_
#define _GRAPH_H_

#include "config.h"
#include "utils.h"
#include "hashmap.h"
#include "set.h"
#include "node.h"

// struct Graph {
// 	char* name;
// 	struct List* nodes;
// 	// struct List* weight;
// 	struct hashmap* hashmap;
// };

struct Graph* createGraph(char* name);
void addGraphNode(struct Graph* graph, struct Node* node);
void addGraphEdge(struct Graph* graph, struct Node* node1, struct Node* node2, double weight);
struct Node* iterGraph(struct Graph* graph, int index);
struct Node* findGraphNode(struct Graph* graph, char* nodeName);

/* built-in function */
struct Node* init_tag(struct Graph* g);
struct Node* reduce(struct Graph* g, struct Node* n);
struct Node* expand(struct Graph* g, struct Node* n);
struct Graph* combine(struct Graph* g1, struct Graph* g2);
struct List* component(struct Graph* g);
struct List* bfs(struct Graph* g, struct Node* n);
struct List* dfs(struct Graph* g, struct Node* n);
struct Node* find(struct Graph* g, struct Node* n, char* lambda);// only need one of the parameters
struct List* find_path(struct Graph* g, struct Node* n1, struct Node* n2);
struct Graph* assign(struct Graph* g, char* lambda);
struct Graph* reverse(struct Graph* g);

#endif