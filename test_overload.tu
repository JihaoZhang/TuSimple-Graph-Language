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
  string str1;
  string str2;
  map @{int, int} map1;
  map @{string, float} map2;
  new l1;
  new s1;
  new node1;
  new node2;  
  new map1;
  new map2;
  node1 -> node2 = 128;
  node1 -- node2 = 3;
  node1 -> node2; 
  a = 100;
  print(a);
// string cannot contain space and special chars 
  str1 = "hello"; 
  prints(str1);
  //node1->node2;
  l1 = null;
  f = 1.1;
  f += 1.1;
  b = 1;
  b += 1;
  print(b);
  b -= 1;
  print(b);
  d = true;
  a = b + b;
  c = d + d;
  prints("________");
  l1 = @{1, 2, 3};
  l1 += @{4, 5, 6};
  print(l1[0]);
  print(l1[1]);
  print(l1[2]);
  print(l1[3]);
  print(l1[4]);
  print(l1[5]);
  prints("________");
  
//  map1[1];
//  l1[1] = 100;
  print(l1[1]);
//  @{1, 2 ,3} + @{3, 4 ,5};

  s1 += @{1, 2, 3};
}
