int main(){
	int a;
	int b;
	bool c;
	bool d;
	node@{int} node1;
  node@{int} node2;
	node@{int} node3;
	node@{int} node4;
  list@{node@{int}} l;
  //list@{int} l1;
  //new l1;
  graph g;
	new node1;
	new node2;
	new node3;
	new node4;
  new l;
  new g;
	node1 -> node2 = 11;
	node2 -> node4 = 12;
	node1 -> node3 = 14;
	node3 -> node4 = 15;
	g.addNode(node1);
	g.addNode(node2);
	g.addNode(node3);
	g.addNode(node4);
  l = g.dfs(node1);	

  node1 = l.get(0);
  prints(node1.name());

  node2 = l.get(1);
  prints(node2.name());

  node3 = l.get(2);
  prints(node3.name());

  node4 = l.get(3);
  prints(node4.name());

  print(l.length());
  //print(l[0].value());
}