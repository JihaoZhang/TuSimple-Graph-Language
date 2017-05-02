#ifndef _GRAPH_H_
#define _GRAPH_H_

#include "config.h"
#include "utils.h"
#include "hashmap.h"
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
// struct List* weightIterGraph(struct Graph* graph, int index);
struct Node* findGraphNode(struct Graph* graph, char* nodeName);

#endif