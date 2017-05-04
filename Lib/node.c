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

char* getNodeValue(struct Node* node, int32_t type, ...) {
	if (node == NULL) {
		printf("Node does not exist.\n");
		return NULL;
	}
	
	va_list ap;
	va_start(ap, type);
	switch (type) {
		case INT:
			printf("INT\n");
			(*va_arg(ap, int*)) = voidToint(node->value);
			break;
		case FLOAT:
			(*va_arg(ap, double*)) = voidTofloat(node->value);
			break;
		case BOOL:
			(*va_arg(ap, bool*)) = voidTobool(node->value);
			break;
		case STRING:
			return voidTostring(node->value);
		default:
			break;
	}
  	va_end(ap);

	return "";
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
	// printf("Node %s: %d\n", node->name, index);
	int size = get_list_size(node->nodes);
	// printf("Size: %d\n", size);
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

double getEdgeValue(struct Node* node1, struct Node* node2) {
	int size1 = get_list_size(node1->weight);

	for (int i = 0; i < size1; i++) {
		if (strcmp(voidTonode(get_list_element(node1->nodes, i))->name, node2->name) == 0) {
			// Found node
			return voidTofloat(get_list_element(node1->weight, i));
		}
	}

	printf("%s\n", "Error! getEdgeValue : Node not found!");
	return 0;
}

// int main(){

// 	// struct Node *a = createNode("a", FLOAT, 3.24);
// 	// double x = 0;
// 	// printf("%s\n", getNodeName(a));
// 	// getNodeValue(a, FLOAT, &x);
// 	// printf("%f\n", x);

// 	// struct Node *b = createNode("b", STRING, "Hello!");
// 	// printf("%s\n", getNodeName(b));
// 	// char* y = getNodeValue(b, STRING, y);
// 	// printf("%s\n", y);

// 	// Test function: getEdgeValue
// 	struct Node *testIntNode1 = createNode("testIntNode1", INT, 0);
// 	struct Node *testIntNode2 = createNode("testIntNode2", INT, 1);
// 	struct Node *testIntNode3 = createNode("testIntNode3", INT, 2);
// 	addNodeEdge(testIntNode1, testIntNode2, 5.6);
// 	addNodeEdge(testIntNode1, testIntNode3, 7.8);
// 	printf("%f\n", getEdgeValue(testIntNode1, testIntNode2));
// 	printf("%f\n", getEdgeValue(testIntNode1, testIntNode3));
// 	printf("%f\n", getEdgeValue(testIntNode2, testIntNode3));

// 	return 0;
// }