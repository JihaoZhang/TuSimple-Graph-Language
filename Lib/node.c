#include "node.h"

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

void* getNodeValue(struct Node* node) {
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
	printf("Node %s: %d\n", node->name, index);
	int size = get_list_size(node->nodes);
	printf("Size: %d\n", size);
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


// int main(){

// 	struct Node *a = createNode("a", INT, 13);
// 	printf("%d\n", voidToint(getNodeValue(a)));
// 	printf("%s\n", getNodeName(a));

// 	// printf("TEST : List of Node\n");
// 	// struct Node *node1 = createNode("node1", INT, 1);
// 	// struct Node *node2 = createNode("node2", INT, 2);
// 	// struct List *nodeListTest1 = create_list(4);
// 	// printf("%d\n", nodeListTest1->type);
// 	// printf("%d\n", get_list_size(nodeListTest1));
// 	// plus_list(nodeListTest1, node1);
// 	// printf("%d\n", get_list_size(nodeListTest1));

// 	// struct Node *node3 = get_list_element(nodeListTest1, 0);
// 	// printf("%s\n", getNodeName(node3));

// 	struct Node *b = createNode("b", INT, 11);
// 	addNodeEdge(a, b, 1.11);
// 	printf("%s\n", getNodeName(iterNode(a, 0)));
// 	printf("%f\n", weightIterNode(a, 0));

// 	printf("ADD NODE C\n");
// 	struct Node *c = createNode("c", BOOL, false);
// 	printf("%d\n", voidTobool(c->value));
// 	addNodeEdge(a, c, 2);
// 	printf("%s\n", getNodeName(iterNode(a, 1)));
// 	// printf("%f\n", voidTobool(getNodeValue(iterNode(a, 1))));
// 	printf("%d\n", voidTobool(iterNode(a, 1)->value));


// 	// struct Node *a = createNode("a", INT, 13);
//  // 	printf("%d\n", voidToint(getNodeValue(a)));
//  // 	printf("%s\n", getNodeName(a));

//  // 	 // struct Node *node3 = get_list_element(nodeListTest1, 0);
//  // 	// printf("%s\n", getNodeName(node3));

//  // 	struct Node *b = createNode("b", INT, 11);
//  // 	addNodeEdge(a, b, 1.11);
//  // 	printf("%s\n", getNodeName(iterNode(a, 0)));
//  // 	printf("%f\n", weightIterNode(a, 0));

//  // 	struct Node *c = createNode("c", BOOL, false);
//  // 	addNodeEdge(a, c, 2);
//  // 	printf("%s\n", getNodeName(iterNode(a, 1)));
//  // 	printf("%f\n", voidTobool(getNodeValue(iterNode(a, 1))));


// 	// struct Node *a = createNode("a", INT, 13);
// 	// printf("%d\n", voidToint(getNodeValue(a)));
// 	// printf("%s\n", getNodeName(a));

// 	// printf("TEST : List of Node\n");
// 	// struct Node *node1 = createNode("node1", INT, 1);
// 	// struct Node *node2 = createNode("node2", INT, 2);
// 	// struct List *nodeListTest1 = create_list(4);
// 	// printf("%d\n", nodeListTest1->type);
// 	// printf("%d\n", get_list_size(nodeListTest1));
// 	// plus_list(nodeListTest1, node1);
// 	// printf("%d\n", get_list_size(nodeListTest1));

// 	// struct Node *node3 = get_list_element(nodeListTest1, 0);
// 	// printf("%s\n", getNodeName(node3));


// 	// struct Node *boolNodeTest = createNode("boolNodeTest", BOOL, true);
// 	// printf("%d\n", voidTobool(getNodeValue(boolNodeTest)));
// 	// struct Node *b = createNode("b", INT, 11);
// 	// addNodeEdge(a, b, 1.11);
// 	// printf("%s\n", nameIterNode(a, 0));
// 	// printf("%f\n", weightIterNode(a, 0));

// 	// struct Node *c = createNode("c", BOOL, false);
// 	// addNodeEdge(a, c, 2);
// 	// printf("%s\n", nameIterNode(a, 1));

// 	return 0;
// }