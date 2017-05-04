int main(){
  int a;
  int b;
  bool c;
  bool d;
  list@{int} l1;
  set @{int} s1;
<<<<<<< Updated upstream
  node n1;
  new l1;
  l1 = null;
=======
  node node1;
  node node2;

  node1->node2;


>>>>>>> Stashed changes
  b = 1;
  d = true;
  a = b + b;
  c = d + d;
  l1 = @{1, 2, 3};
  l1 += @{4, 5, 6};
  l1++;
  print(l1[1]);
//  @{1, 2 ,3} + @{3, 4 ,5};

//  s1 += @{1, 2, 3};
}
