int main(){
	int a, b, i;
	bool c, d;
  int size;
	node@{int} node1, node2, node3, node4, node5, node6, node7, node8, node9, node10;
  list@{node@{int}} l, l2, rec;
  set@{node@{int}} visited;
  graph g, g1;

	new node1;
	new node2;
	new node3;
	new node4;
  new node5;
  new node6;
  new node7;
  new node8;
  new node9;
  new node10;
  new l;
  new l2;
  new rec;
  new visited;
  new g;
  new g1;

	node1 -> node2 = 11;
	node1 -> node3 = 14;
	node2 -> node4 = 12;
	node3 -> node4 = 15;
	g.addNode(node1);
	g.addNode(node2);
	g.addNode(node3);
	g.addNode(node4);
  g.length();
  g.printGraph();

/*
  for (i = 0; i < 4; i+=1) {
    node7 = g.iterGraph(i);
    prints(node7.name());
  }

  g1.addEdge(node5, node6, 12);
  g.combine(g1);
  for (i = 0; i < 6; i+=1) {
    node7 = g.iterGraph(i);
    prints(node7.name());
  }
*/
}