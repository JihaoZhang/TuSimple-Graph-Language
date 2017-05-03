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
	// printf("Graph List Type: %d\n", graph->nodes->type);
	// printf("addGraphNode: %s\n", node->name);
	plus_list(graph->nodes, node);
	// plus_list(graph->weight, node->weight);
	// printf("%s\n", node->name);
	// printf("%d\n", get_list_size(graph->nodes)-1);
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
	// printf("%d\n", index);
	return iterGraph(graph, index);
}

/* --- built-in function --- */

struct Node* init_tag(struct Graph* g){
	int size = get_list_size(g->nodes);
	for (int i=0;i<size;i++){
		struct Node* n = iterGraph(g, i);
		int w_size = get_list_size(n->nodes);
		for (int j=0;j<w_size;j++){
			change_list_element(n->weight, j, 0);
		}
	}
}

struct Node* reduce(struct Graph* g, struct Node* n0){
	struct Node* n = findGraphNode(g, n0->name);
	int size = get_list_size(n->nodes);
	for (int i=0;i<size;i++){
		struct Node* m = iterNode(g, i);
		// 
	}
}

struct Node* expand(struct Graph* g, struct Node* n0){
	struct Node* n = findGraphNode(g, n0->name);
	int size = get_list_size(n->nodes);
	for (int i=0;i<size;i++){
		struct Node* m = iterNode(g, i);
		// 
	}
}

struct Graph* combine(struct Graph* g1, struct Graph* g2){
	struct Set* s = create_set(NODE);
	int size1 = get_list_size(g1->nodes);
	for (int i=0;i<size1;i++){
		put_set(s, iterGraph(g1, i));
	}
	int size2 = get_list_size(g2->nodes);
	for (int i=0;i<size2;i++){
		put_set(s, iterGraph(g2, i));
	}
	struct List* l = get_set_elements(s);
	// create graph
}

struct List* component(struct Graph* g){

}

struct List* bfs(struct Graph* g, struct Node* n){
	// printf("g: %s\n", g->name);
	// printf("n: %s\n", n->name);
	struct List* l = create_list(NODE);
	struct Set* visited = create_set(NODE);

	plus_list(l, n);
	put_set(visited, n);

	while (get_list_size(l)!=0){
		struct Node* n = get_list_element(l, 0);
		int size = get_list_size(n->nodes);
		for (int i=0;i<size;i++){
			struct Node* m = iterNode(n, i);
			if (check_set_element(visited, m)==false){
				plus_list(l, m);
				put_set(visited, m);
			}
		}
		remove_list_element(l, 0);
	}
	return l;
}

struct List* dfs(struct Graph* g, struct Node* n){
	struct List* l = create_list(NODE);
	struct Map* m = create_hashmap(STRING, INT);


}

struct Node* find(struct Graph* g, struct Node* n, char* lambda){

}

struct List* find_path(struct Graph* g, struct Node* n1, struct Node* n2){

}

struct Graph* assign(struct Graph* g, char* lambda){
}

struct Graph* reverse(struct Graph* g){

}

/* please do not use getNodeName() in this .c */
void print_list(struct List* l){
	int size = get_list_size(l);
	for (int i=0;i<size;i++){
		struct Node* n = get_list_element(l, i);
		printf("%s ", n->name);
	}
	printf("\n");
}

void print_graph(struct Graph* g){
	printf("Printing graph %s :\n", g->name);
	int size = get_list_size(g->nodes);
	for (int i=0;i<size;i++){
		struct Node* n = iterGraph(g, i);
		// printf("%d: %s -> \n", i+1, n->name);
		printf("%s ->\n", n->name);
		int w_size = get_list_size(n->nodes);
		// printf("w_size : %d\n", w_size);
		for (int j=0;j<w_size;j++){
			// printf("EXE HERE, j = %d\n", j);
			// struct Node* m = voidTonode(get_list_element(n->nodes, j));
			struct Node* m = iterNode(n, j);
			printf("( %s, %f) ", m->name, weightIterNode(n, j));
		}
		printf("\n");
	}
}

int main(){
	struct Graph* g = createGraph("g");
	struct Node* n1 = createNode("1", FLOAT, 1.1);
	struct Node* n2 = createNode("2", FLOAT, 2.1);
	struct Node* n3 = createNode("3", FLOAT, 3.1);
	struct Node* n4 = createNode("4", FLOAT, 4.1);
	addGraphNode(g, n1);
	addGraphNode(g, n2);
	addGraphNode(g, n3);
	addGraphNode(g, n4);
	addNodeEdge(n1, n2, 11.1);
	addNodeEdge(n2, n3, 12.2);
	addNodeEdge(n3, n4, 13.3);
	print_graph(g);
	/*
	init_tag(g);
	print_graph(g);
	*/
	

	return 0;
}