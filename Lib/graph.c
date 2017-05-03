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
	int index = voidToint(hashmap_get(graph->hashmap, nodeName));
	printf("%d\n", index);
	return iterGraph(graph, index);
}

int main(){
	struct Graph* g = createGraph("g");
	// struct Node* a = createNode("a", INT, 13);
	// struct Node* b = createNode("b", INT, 11);
	// printf("EXE HERE!\n");
	// addNodeEdge(a, b, 1);
	// printf("%d\n", voidToint(getNodeValue(a)));
	// addGraphNode(g, a);


	struct Node* floatNode1 = createNode("floatNode1", FLOAT, 1.1);
	struct Node* stringNode1 = createNode("stringNode1", STRING, "hello");
	struct Node* stringNode2 = createNode("stringNode2", STRING, "world");
	addNodeEdge(stringNode1, stringNode2, 2);
	//printf("%d\n", voidToint(getNodeValue(stringNode1)));
	addGraphNode(g, floatNode1);
	addGraphNode(g, stringNode1);
	addGraphNode(g, stringNode2);
	printf("%d\n", floatNode1->type);
	printf("%d\n", stringNode1->type);
	printf("%d\n", stringNode2->type);

	// Test function: iterGraph
	printf("%s\n", "TEST function : iterGraph");
	printf("Graph -> Nodes Length: %d\n", g->nodes->currPos);
	printf("Graph Type: %d\n", g->nodes->type);
	printf("%d\n", voidTonode(get_list_element(g->nodes, 0))->type);
	struct Node* iterGraphNodeTest1 = iterGraph(g, 0);
	struct Node* iterGraphNodeTest2 = iterGraph(g, 1);
	struct Node* iterGraphNodeTest3 = iterGraph(g, 2);
	printf("%s\n", iterGraphNodeTest1->name);
	printf("%s\n", iterGraphNodeTest2->name);
	printf("%s\n", voidTostring(getNodeValue(iterGraphNodeTest2)));
	//printf("%s\n", getNodeName(iterGraphNodeTest3));


	// Test function: findGraphNode
	printf("%s\n", "TEST function : findGraphNode");
	struct Node* stringNode3 = findGraphNode(g, "stringNode1");
	printf("%s\n", stringNode3->name);
	printf("%d\n", stringNode3->type);
	// printf("%d\n", get_list_size(g->nodes));
	// printf("%s\n", iterGraph(g, 0)->name);
	// printf("%s\n", findGraphNode(g, "a")->name);
	// addGraphNode(g, a);
	// addGraphNode(g, b);
	// printf("%s\n", b->name);


	// printf("%s\n", getNodeName(findGraphNode(g, "a")));
	return 0;
}