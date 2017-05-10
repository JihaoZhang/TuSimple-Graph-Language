int main(){
  int a, b, i;
  bool c, d;
  int size;
  node@{int} node1, node2, node3, node4, node5, node6, node7, node8, node9, node10;
  list@{node@{int}} l, l2, rec;
  set@{node@{int}} visited;
  graph g;
  new node1; new node2; new node3; new node4; new node5; new node6; new node7; new node8; new node9; new node10;
  new l; new l2; new rec; new visited; new g;
//  node1.weightIter(0);
  node1 -> node2 = 11;
  node2 -> node4 = 12;
  node1 -> node3 = 14;
  node3 -> node4 = 15;
  node4 -> node5 = 1;
  node1 -> node5 = 100;
  g.addNode(node1);
  g.addNode(node2);
  g.addNode(node3);
  g.addNode(node4);
  l = g.bfs(node1);	
  l.printList();
  l2 += @{node1};
  rec += @{node1};
  visited.put(node1);

  while (l2.length()!=0){
    node9 = l2.get(0);
    size = node9.length();

    for (i=0;i<size;){      
      node10 = node9.iterNode(i);
      if (!visited.contain(node10)){
          l2 += @{node10};
          rec += @{node10};
          visited.put(node10);
      }
      i+=1;
    }
    l2.remove(0);
  }

  rec.printList();


}
