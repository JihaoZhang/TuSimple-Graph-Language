#include "graph.h"

void print_list(struct List* l){
	if (l==NULL){
		printf("print_list NULL\n");
	}
	int size = get_list_size(l);
	// printf("size: %d", size);
	for (int i=0;i<size;i++){
		struct Node* n = get_list_element(l, i);
		printf("%s ", n->name);
	}
	printf("\n");
}

void print_graph(struct Graph* g){
	printf("Printing graph %s :\n", g->name);
	int size = get_list_size(g->nodes);
	printf("size : %d\n", size);
	for (int i=0;i<size;i++){
		struct Node* n = iterGraph(g, i);
		// printf("%d: %s -> \n", i+1, n->name);
		printf("%s : %f ->\n", n->name, voidTofloat(n->value));
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

struct Graph* createGraph(char* name){
	struct Graph* new = (struct Graph*) malloc(sizeof(struct Graph));
	new->name = name;
	new->nodes = NULL;
	// new->weight = NULL;
	new->hashmap = create_hashmap(STRING, INT);
	return new;
}

struct Graph* addGraphNode(struct Graph* graph, struct Node* node){
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

	return graph;
}

struct Graph* addGraphEdge(struct Graph* graph, struct Node* node1, struct Node* node2, double weight){
	if (hashmap_get(graph->hashmap, node1->name)==NULL){
		addGraphNode(graph, node1);
	}
	if (hashmap_get(graph->hashmap, node2->name)==NULL){
		addGraphNode(graph, node2);
	}
	addNodeEdge(node1, node2, weight);

	return graph;
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
	void* tmp;
	if ((tmp=hashmap_get(graph->hashmap, nodeName))!=NULL){
		int index = voidToint(tmp);
		return iterGraph(graph, index);
	} else {
		return NULL;
	}
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

// the type of nodes must be FLOAT
struct Node* reduce(struct Graph* g, struct Node* n0){
	struct Node* n = findGraphNode(g, n0->name);
	double v_n = 0;
	getNodeValue(n, n->type, &v_n);

	int size = get_list_size(n->nodes);
	for (int i=0;i<size;i++){
		struct Node* m = iterNode(n, i);
		double v_m = 0, tmp;
		getNodeValue(m, m->type, &v_m);
		if ((tmp = v_n + weightIterNode(n, i)) < v_m){
			m->value = floatTovoid(tmp);
		}
	}
}

// the type of nodes must be FLOAT
struct Node* expand(struct Graph* g, struct Node* n0){
	struct Node* n = findGraphNode(g, n0->name);
	double v_n = 0;
	getNodeValue(n, n->type, &v_n);

	int size = get_list_size(n->nodes);
	for (int i=0;i<size;i++){
		struct Node* m = iterNode(n, i);
		double v_m = 0, tmp;
		getNodeValue(m, m->type, &v_m);
		if ((tmp = v_n + weightIterNode(n, i)) > v_m){
			m->value = floatTovoid(tmp);
		}
	}
}

struct Graph* combine(struct Graph* g1, struct Graph* g2){
	int size2 = get_list_size(g2->nodes);
	for (int i=0;i<size2;i++){
		struct Node* n = iterGraph(g2, i);
		if (findGraphNode(g1, n)==NULL){
			addGraphNode(g1, n);
		}
	}
	return g1;
}

struct List* component(struct Graph* g){

}

struct List* bfs(struct Graph* g, struct Node* n){
	// printf("g: %s\n", g->name);
	// printf("n: %s\n", n->name);
	struct List* l = create_list(NODE);
	struct List* rec = create_list(NODE);
	struct Set* visited = create_set(NODE);

	plus_list(l, n);
	plus_list(rec, n);
	put_set(visited, n);

	while (get_list_size(l)!=0){
		struct Node* n = get_list_element(l, 0);
		int size = get_list_size(n->nodes);
		for (int i=0;i<size;i++){
			struct Node* m = iterNode(n, i);
			if (check_set_element(visited, m)==false){
				plus_list(l, m);
				plus_list(rec, m);
				put_set(visited, m);
			}
		}
		remove_list_element(l, 0);
	}
	return rec;
}

struct List* dfs(struct Graph* g, struct Node* n){
	struct List* l = create_list(NODE);
	struct List* rec = create_list(NODE);
	struct Map* m = create_hashmap(STRING, INT);

	plus_list(l, n);
	plus_list(rec, n);
	hashmap_put(m, n->name, 0);

	while (get_list_size(l)!=0){
		// print_list(l);
		struct Node* n = get_list_element(l, get_list_size(l)-1);
		// printf("dfs: %s\n", n->name);
		int size = get_list_size(n->nodes);
		int now = voidToint(hashmap_get(m, n->name));
		// printf("%s -- %d\n", n->name, now);
		if (now<size){
			struct Node* x = iterNode(n, now);
			if (hashmap_haskey(m, x->name)==false){
				plus_list(l, x);
				plus_list(rec, x);
				hashmap_put(m, x->name, 0);
				// printf("ADD NEW ELEMENT %s\n", x->name);
			}
			hashmap_remove(m, n->name);
			hashmap_put(m, n->name, now+1);
		} else {
			remove_list_element(l, get_list_size(l)-1);
		}
	}
	return rec;
}

struct Node* find(struct Graph* g, struct Node* n, char* lambda){

}

struct List* find_path(struct Graph* g, struct Node* n1, struct Node* n2){

}

struct Graph* assign(struct Graph* g, char* lambda){
}

struct Graph* reverse(struct Graph* g){
	// struct Graph* r_g = createGraph("reversed");
	// int size = get_list_size(g->nodes);
	// for (int i=0;i<size;i++){
	// 	struct Node* n = iterGraph(g, i);
	// 	struct Node* new_n = createNode(n->name, n->type, n->value);
	// 	int size2 = get_list_size(n->nodes);
	// 	for (int j=0;j<size2;j++){
	// 		addNodeEdge(new_n, )
	// 	}
	// }
}

/* please do not use getNodeName() in this .c */

// int main(){
// 	struct Graph* g = createGraph("g");
// 	struct Node* n1 = createNode("n1", FLOAT);
// 	struct Node* n2 = createNode("n2", FLOAT);
// 	struct Node* n3 = createNode("n3", FLOAT);
// 	struct Node* n4 = createNode("n4", FLOAT);
// 	addGraphNode(g, n1);
// 	addGraphNode(g, n2);
// 	addGraphNode(g, n3);
// 	addGraphNode(g, n4);
// 	addNodeEdge(n1, n3, 11.1);
// 	addNodeEdge(n3, n4, 12.2);
// 	addNodeEdge(n3, n2, 13.3);
// 	print_graph(g);

// 	struct Graph* g2 = createGraph("g2");
// 	struct Node* n5 = createNode("n5", FLOAT);
// 	struct Node* n6 = createNode("n6", FLOAT);
// 	struct Node* n7 = createNode("n7", FLOAT);
// 	struct Node* n8 = createNode("n8", FLOAT);
// 	addGraphNode(g2, n5);
// 	addGraphNode(g2, n6);
// 	addGraphNode(g2, n7);
// 	addGraphNode(g2, n8);
// 	addNodeEdge(n5, n6, 14.4);
// 	addNodeEdge(n6, n7, 15.5);
// 	addNodeEdge(n7, n8, 16.6);
// 	print_graph(g2);
// 	combine(g, g2);
// 	print_graph(g);

// 	return 0;
// }