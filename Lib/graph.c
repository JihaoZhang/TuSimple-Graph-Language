#include "graph.h"

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
	// printf("addGraphNode: EXE HERE!\n");
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
	// addNodeEdge(node1, node2, weight);
	// if (node1->nodes==NULL){
	// 	node1->nodes = create_list(STRING);
	// 	node1->weight = create_list(FLOAT);
	// }
	// plus_list(node1->nodes, getNodeName(node2));
	// plus_list(node1->weight, weight);
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

// struct List* weightIterGraph(struct Graph* graph, int index){
// 	int size = get_list_size(graph->weight);
// 	// printf("%d\n", size);
// 	if (0<=index && index<size)
// 		return (struct List*)get_list_element(graph->weight, index);
// 	else{
// 		printf("Node does not exist.\n");
// 		return NULL;
// 	}
// }

struct Node* findGraphNode(struct Graph* graph, char* nodeName){
	int index = hashmap_get(graph->hashmap, nodeName);
	return iterGraph(graph, index);
}

int main(){
	struct Graph* g = createGraph("g");
	struct Node* a = createNode("a", INT, 13);
	struct Node* b = createNode("b", INT, 11);
	printf("EXE HERE!\n");
	addNodeEdge(a, b, 1);
	printf("%d\n", voidToint(getNodeValue(a)));
	addGraphNode(g, a);


	struct Node* floatNode1 = createNode("floatNode1", FLOAT, 1.1);
	struct Node* stringNode1 = createNode("stringNode1", STRING, "hello");
	struct Node* stringNode2 = createNode("stringNode2", STRING, "world");
	addNodeEdge(stringNode1, stringNode2, 2);
	printf("%d\n", voidToint(getNodeValue(stringNode1)));
	addGraphNode(g, floatNode1);
	addGraphNode(g, stringNode1);
	addGraphNode(g, stringNode2);

	printf("%d\n", g->hashmap->size);
	// printf("%d\n", get_list_size(g->nodes));
	// printf("%s\n", iterGraph(g, 0)->name);
	// printf("%s\n", findGraphNode(g, "a")->name);
	// addGraphNode(g, a);
	// addGraphNode(g, b);
	// printf("%s\n", b->name);


	// printf("%s\n", getNodeName(findGraphNode(g, "a")));
	return 0;
}