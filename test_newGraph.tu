int main(){
	int a;
	int b;
  int i;
	bool c;
	bool d;
  int size;
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
	node1 -> node2 = 11;
	node2 -> node4 = 12;
	node1 -> node3 = 14;
	node3 -> node4 = 15;
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

  prints("- - - - - -");

  /*
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
  */

  l2 += node1;
  rec += node1;
  visited.put(node1);

  while (l2.length()!=0){
    node9 = l2.get(0);
    size = l2.length();
    for (i=0;i<size;i+=1){
      node10 = node.iter
      //TODO
    }
  }

  node5 = l2.get(0);
  prints(node5.name());

  node6 = l2.get(1);
  prints(node6.name());

  node7 = l2.get(2);
  prints(node7.name());

  node8 = l2.get(3);
  prints(node8.name());

}