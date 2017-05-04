int main(){
  int a;
  int b;
  bool c;
  bool d;
  float f;
  list@{int} l1;
  set @{int} s1;
  node@{int} n1;
  node@{int} node1;
  node@{int} node2;
  new node1;
  //node1->node2;
  l1 = null;
  f = 1.1;
  f += 1.1;
  new l1;
  b = 1;
  b += 1;
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
