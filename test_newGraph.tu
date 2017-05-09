int main(){
	int a, b, i;
	bool c, d;
  int size;
	node@{int} node1, node2, node3, node4, node5, node6, node7, node8, node9, node10;
  list@{node@{int}} l, l2, rec;
  set@{node@{int}} visited;
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
  new g;
  node1.weightIter(0);
	node1 -> node2 = 11;
	node2 -> node4 = 12;
	node1 -> node3 = 14;
	node3 -> node4 = 15;
	g.addNode(node1);
	g.addNode(node2);
	g.addNode(node3);
	g.addNode(node4);
  l = g.bfs(node1);	

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
  visited.put(node1);

  while (l2.length()!=0){
    node9 = l2.get(0);
    size = node9.length();

    print(size);
    for (i=0;i<size;){      
      node10 = node9.iterNode(i);
      if (!visited.contain(node10)){
          prints("EXECUTED");
          l2 += @{node10};
          rec += @{node10};
          visited.put(node10);
      }
      i+=1;
    }
    l2.remove(0);
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