#ifndef _NODE_H_
#define _NODE_H_

#include "config.h"
#include "utils.h"
#include "list.h"

// struct Node {
// 	int32_t type;
// 	void* value;

// 	char* name;
// 	struct List* nodes;
// 	struct List* weight;
// };

struct Node* createNode(char* name, int32_t type);
struct Node* setNodeValue(struct Node* node, int32_t type, ...);
char* getNodeValue(struct Node* node, int32_t type, ...);
char* getNodeName(struct Node* node);
void addNodeEdge(struct Node* node1, struct Node* node2, double weight);
struct Node* iterNode(struct Node* node, int index);
double weightIterNode(struct Node* node, int index);

#endif