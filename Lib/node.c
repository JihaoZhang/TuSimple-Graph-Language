#include "node.h"

struct Node* createNode(char* name, int32_t type) {
	struct Node* new = (struct Node*) malloc(sizeof(struct Node));
	 new->name = name;
	 new->type = type;
	 new->nodes = NULL;
	 new->weight = NULL;

	 switch (type) {
	 	case INT:
	 		// new->value = intTovoid(va_arg(ap, int));
	 		new->value = 0;
	 		break;
	 	case FLOAT:
	 		// new->value = floatTovoid(va_arg(ap, double));
	 		new->value = 0;
	 		break;
	 	case BOOL:
	 		// new->value = boolTovoid(va_arg(ap, bool));
	 		new->value = 0;
	 		break;
	 	case STRING:
	 		// new->value = stringTovoid(va_arg(ap, char*));
	 		new->value = "";
	 		break;
	 	default:
	 		break;
	 }

  	return new;
}

struct Node* setNodeValue(struct Node* node, ...) {

	va_list ap;
	va_start(ap, node);
	switch (node->type) {
		case INT:
			node->value = intTovoid(va_arg(ap, int));
			break;
		case FLOAT:
			node->value = floatTovoid(va_arg(ap, double));
			break;
		case BOOL:
			node->value = boolTovoid(va_arg(ap, bool));
			break;
		case STRING:
			node->value = stringTovoid(va_arg(ap, char*));
			break;
		default:
			break;
	}
  	va_end(ap);

  	return node;
}

void* getNodeValue(struct Node* node) {
	if (node == NULL) {
		printf("%s\n", "Error! : getNodeValue - Node does not exist!");
		return NULL;
	}
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

void addReverseEdge(struct Node* node1, struct Node* node2, double weight){
	if (node2->nodes==NULL){
		node2->nodes = create_list(NODE);
		node2->weight = create_list(FLOAT);
	}
	// printf("EXECUTED at addNodeEdge");
	plus_list(node2->nodes, node1);
	plus_list(node2->weight, weight);
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

// 	// Test function: getEdgeValue
// 	printf("%s\n", "TEST function: createNode, getNodeValue, getNodeName");
// 	struct Node *testIntNode1 = createNode("testIntNode1", FLOAT);
// 	struct Node *testIntNode2 = createNode("testIntNode2", INT);
// 	struct Node *testIntNode3 = createNode("testIntNode3", STRING);
// 	setNodeValue(testIntNode1, 1.11);
// 	setNodeValue(testIntNode2, 2);
// 	setNodeValue(testIntNode3, "Hello");
// 	printf("%f\n", voidTofloat(getNodeValue(testIntNode1)));
// 	printf("%d\n", voidToint(getNodeValue(testIntNode2)));
// 	printf("%s\n", voidTostring(getNodeValue(testIntNode3)));
// 	printf("%s\n", getNodeName(testIntNode1));
// 	printf("%s\n", getNodeName(testIntNode2));
// 	printf("%s\n", getNodeName(testIntNode3));

// 	// test part of edge
// 	addReverseEdge(testIntNode2, testIntNode1, 2.37);
// 	addReverseEdge(testIntNode3, testIntNode2, 3.76);
// 	addReverseEdge(testIntNode3, testIntNode1, 5486.09);
// 	printf("%f\n", getEdgeValue(testIntNode1, testIntNode2));
// 	printf("%f\n", getEdgeValue(testIntNode2, testIntNode3));
// 	printf("%f\n", getEdgeValue(testIntNode1, testIntNode3));
// 	printf("%f\n", getEdgeValue(testIntNode2, testIntNode1));
// 	return 0;
// }