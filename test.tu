int main(){
  node a;
  node c;
  node d;
  int b;
  float e;
  string s;
  list @{int} l1;
  list @{list @{int}} l2;
  set @{node} s1;
  map @{node, int} map1;
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
}
