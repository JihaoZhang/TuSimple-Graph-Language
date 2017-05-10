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
  node@{int} node3;
  string str1;
  string str2;
  map @{int, int} map1;
  map @{string, float} map2;
  new l1;
  new s1;
  new node1;
  new node2;
  new node3;  
  new map1;
  new map2;
  //node1 -> node2 = 128;
  //node1 -- node2 = 3;
  //node1 -> node2; 
  print(node3.length());
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
  node1 -> @{node2, node3} = @{1, 3};


/*
////////////////////////////////////
node @{int} n;

new n;

n.value(); int string bool float
n.name();
n.setvalue(int);
n.setvalue(bool);

///////////////////////////////////////

set @{int} s;
new s;

s.put(1); //一次一个
s += @{1,2,3}
s.length();
s.contain(1);
s.gettype(); //type of element

/////////////////////////////////////////
list @{int} l;

new l;
l = @{1,2,3};

l.get(int index);
l[index];

l.pop();
l.remove(index); no return
l.length();

l.cancat(list l1) 
l += l1;

//////////////////////////////////////
map @{int ,string} m;
new m;
map.put(int, string);
map.get(key) return value;
map.size();
map.haskey(key);
map.remove(key);

*/


}
