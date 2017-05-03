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

struct Node* init_tag(struct Graph* g){
	int size = get_list_size(graph->nodes);
	for (int i=0;i<size;i++){
		struct Node* n = iterGraph(g, i);
		int w_size = get_list_size(graph->nodes);
		for (int j=0;j<size;j++){
			// weightIterNode(n, j);
		}
	}
}

struct Node* reduce(struct Graph* g, struct Node* n){
	
}

struct Node* expand(struct Graph* g, struct Node* n){

}

struct Graph* combine(struct Graph* g1, struct Graph* g2){

}

struct List* component(struct Graph* g){

}

struct List* bfs(struct Graph* g, struct Node* n){

}

struct List* dfs(struct Graph* g, struct Node* n){

}

struct Node* find(struct Node* n, char* lambda){

}

struct List* find_path(struct Node* n1, struct Node* n2){

}

struct Graph* assign(struct Graph* g, char* lambda){

}

struct Graph* reverse(struct Graph* g){

}

/* please do not use getNodeName() in this .c */

int main(){
	struct Graph* g = createGraph("g");
	struct Node* floatNode1 = createNode("floatNode1", FLOAT, 1.1);
	// struct Node* stringNode1 = createNode("stringNode1", STRING, "hello");
	// struct Node* stringNode2 = createNode("stringNode2", STRING, "world");
	// addNodeEdge(stringNode1, stringNode2, 2);
	// addGraphNode(g, floatNode1);
	// addGraphNode(g, stringNode1);
	// addGraphNode(g, stringNode2);
	// printf("%d\n", floatNode1->type);
	// printf("%d\n", stringNode1->type);
	// printf("%d\n", stringNode2->type);

	// printf("Graph -> Nodes Length: %d\n", g->nodes->currPos);
	// printf("Graph Type: %d\n", g->nodes->type);
	// printf("%d\n", voidTonode(get_list_element(g->nodes, 0))->type);
	// struct Node* iterGraphNodeTest1 = iterGraph(g, 0);
	// struct Node* iterGraphNodeTest2 = iterGraph(g, 1);
	// struct Node* iterGraphNodeTest3 = iterGraph(g, 2);
	// printf("%s\n", iterGraphNodeTest1->name);
	// printf("%s\n", iterGraphNodeTest2->name);
	// printf("%s\n", voidTostring(getNodeValue(iterGraphNodeTest2)));

	// struct Node* stringNode3 = findGraphNode(g, "stringNode1");
	// printf("%s\n", stringNode3->name);
	// printf("%d\n", stringNode3->type);

	return 0;
}