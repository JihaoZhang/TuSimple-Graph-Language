int main(){
  
    int max;
    int i;
    int size;
    int tmp;
    int now;
    string name;
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
    list@{node@{int}} queue;
    set@{string} inList;
    map@{string, int} dis;
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
    new queue;
    new inList;
    new dis;
    new g;

    node1 -> node2 = 11;
    node2 -> node4 = 11;
    node1 -> node3 = 3;
    node3 -> node4 = 3;

    max = 32767;

    queue+=@{node1};
    inList.put(node1.name());
    // print(inList.length());
    dis.put(node1.name(), 0);
    
    
    /*
    l+=@{node2}; remain+=@{node2}; hash.put(node2.name(), 0);
    l+=@{node3}; remain+=@{node3}; hash.put(node3.name(), 0);
    l+=@{node4}; remain+=@{node4}; hash.put(node4.name(), 0);
    l+=@{node5}; remain+=@{node5}; hash.put(node5.name(), 0);
    l+=@{node6}; remain+=@{node6}; hash.put(node6.name(), 0);
    l+=@{node7}; remain+=@{node7}; hash.put(node7.name(), 0);
    l+=@{node8}; remain+=@{node8}; hash.put(node8.name(), 0);
    l+=@{node9}; remain+=@{node9}; hash.put(node9.name(), 0);
    l+=@{node10};remain+=@{node10};hash.put(node10.name(),0);
    */

    
    while (queue.length()!=0){
      node9 = queue.get(0);
      prints(node9.name());
      size = node9.length();
      now = dis.get(node9.name());
      for (i=0;i<size;i+=1){
        print(i);
        node10 = node9.iterNode(i);
        tmp = now + node9.weightIter(i);
        if (!dis.haskey(node10.name())){
          dis.put(node10.name(), max);
        }
        if (tmp<dis.get(node10.name())){
          dis.put(node10.name(), tmp);
          if (!inList.contain(node10.name())){
            queue += @{node10};
            inList.put(node10.name());
            // print(inList.length());
          }
        }
        // i+=1;
      }
      print(inList.length());
      inList.remove(node9.name());
      queue.remove(0);
    }
    
    name = node1.name();
    print(dis.get(name));
    name = node2.name();
    print(dis.get(name));
    name = node3.name();
    print(dis.get(name));
    name = node4.name();
    print(dis.get(name));
    
}