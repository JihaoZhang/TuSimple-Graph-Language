int main(){
  int a;
  int b;
  bool c;
  bool d;
  list@{int} l1;
  b = 1;
  d = true;
  a = b + b;
  c = d + d;
  l1 = @{1, 2, 3};
  l1 += @{4, 5, 6};
  l1++;
  print(l1[0]);
//  @{1, 2 ,3} + @{3, 4 ,5};
}

