int main(){
  node a;
  int b;
  node c;
  node d;
  node n1; // this is a node
  node n2;
  node n3;
  float e;
  string s;
  graph g;
  list @{int} l1;
  list @{list @{int}} l2;
  list @{node} l3; 
  set @{node} s1;
  map @{node, int} map1;
//  map @{list @{int}, list @{int}} m2; ERROR
//  m2[@{1, 2}] = @{1, 2}; ERROR
//  new map1; 
// new l1;
// new s1;
 @{1, 2, 3};
 @{a, c, d};
  l1 = @{1, 2, 3};
  l2 = l1;
  l1 = @{4, 5, 6};
  l2 = @{l1};
  l3 += @{a, c, d};
  l1 += @{4, 5, 6};
  s1 += @{a, c, d};
  map1 += l3;
  map1 += s1;
  g += @{n1, n2, n3};
  map1[n1];
  map1[n1] = 1;
 /* l1 = {a, c , d}; illegal assignment list@{int} = list@{node} in l1 = {a, c, d} */
 /* {1, 2, a}; Type Must be homogeneous in a list */
 // a -> c = 1;
 // a -> c = 2;
 // print(a -> c);
  a -> @{n1, n2, n3} = @{1, 2, 3};
  a -- @{n1, n2, n3} = @{2, 3, 4};
  a -> c = 1;                                                   /*  single  directed edge */
  a -- d = 2;                                                   /*  undirected edge			*/
  b = 10; 		                                                  /*  integer assignment		*/
  b += 7; 		                                                  /*  interger add assignment	*/
  b -= 3;		                                                    /*   interger minus assignment	*/
  e = e + e; 	                                                  /*  float add				*/
  e = b + e; 	                                                  /*  int add float			*/
  e = e + b; 	                                                  /*  float add int 			*/
  e = 3.1415;                                                   /*  float lit */
  e = 3.1415 + 1;                                               /*  float lit add */
  b = b % 3;                                                    /*  integer mod */
  b++;                                                          /*  test ++ for */
  s = "TuSimple 123 &@#*()$\n\t";                               /*  test string lit */
  s[b];                                                         /*  get from string */
  l1 += b;                                                      /*  add int into list */
  l2 += l1;
  map1 += a;
  s1 += a;
  s1 = null;
  while(true){
  }
}
