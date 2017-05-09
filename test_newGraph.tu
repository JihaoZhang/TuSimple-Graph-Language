int main(){
	int a;
	int b;
	bool c;
	bool d;
	float f;
	node@{int} node1;
  	node@{int} node2;
  	node@{int} node3;
  	node@{int} node4;
  	new node1;
  	new node2;
  	new node3;
  	new node4;
  	node1 -> node2 = 11;
  	node2 -> node3 = 12;
  	node1 -> node3 = 14;
  	node2 -> node4 = 15;
  	graph@{int} g;
  	g.addNode(node1);
  	g.addNode(node2);
  	g.addNode(node3);
  	g.addNode(node4);
  	list@{node} l;
  	l = g.dfs();
  	
}