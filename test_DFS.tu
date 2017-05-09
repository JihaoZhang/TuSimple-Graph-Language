int main(){
	int a;
	int b;
  int i;
	bool c;
	bool d;
	int size;
	int now;
	node@{int} node1;
  node@{int} node2;
	node@{int} node3;
	node@{int} node4;
	node@{int} node5;
	node@{int} node6;
	node@{int} node7;
	node@{int} node8;
	node@{int} node9;
	node@{int} node10;
	list@{node@{int}} l;
	list@{node@{int}} l2;
	list@{node@{int}} rec;
	set@{node@{int}} visited;
	map@{string,int} hash;
  graph g;
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
	new hash;
	new g;

	node1 -> node2 = 11;
	node2 -> node4 = 12;
	node1 -> node3 = 14;
	node3 -> node4 = 15;

  
  node1.setvalue(1);
  node2.setvalue(2);
  node3.setvalue(3);
  node4.setvalue(4);

  
  print(node1.value());
  print(node2.value());
  print(node3.value());
  print(node4.value());
  

	g.addNode(node1);
	g.addNode(node2);
	g.addNode(node3);
	g.addNode(node4);

	l = g.dfs(node1);	

	node5 = l.get(0);
	prints(node5.name());

	node6 = l.get(1);
	prints(node6.name());

	node7 = l.get(2);
	prints(node7.name());

	node8 = l.get(3);
	prints(node8.name());

	l2 += @{node1};
	rec += @{node1};
	hash.put(node1.name(), 0);
	
	while (l2.length()!=0){
		node9 = l2.get(l2.length()-1);
		size = node9.length();
		now = hash.get(node9.name());
		if (now<size){
			node10 = node9.iterNode(now);
			if (!hash.haskey(node10.name())){
				l2 += @{node10};
				rec += @{node10};
				hash.put(node10.name(),0);
			}
			hash.put(node9.name(), now+1);
		} else {
			l2.remove(l2.length()-1);
		}
	}

	print(rec.length());

	node5 = rec.get(0);
	prints(node5.name());

	node6 = rec.get(1);
	prints(node6.name());

	node7 = rec.get(2);
	prints(node7.name());

	node8 = rec.get(3);
	prints(node8.name());

}