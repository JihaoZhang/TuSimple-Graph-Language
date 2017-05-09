int main()
{	
	int i;
 	list @{node@{int}} l;
 	list @{node@{int}} l1;
	node@{int} n1;
 	node@{int} n2;
 	node@{int} n3;
 	node@{int} n4;
 	node@{int} n5;
 	node@{int} n6;

 	new l1;
 	new l;
 	new n1;
 	new n2;
 	new n3;
 	new n4;
 	new n5;
 	new n6;

 	n1.setvalue(1);
 	n2.setvalue(2);
 	n3.setvalue(3);
 	n4.setvalue(4);
 	n5.setvalue(5);

 	l = @{n1,n2,n3};
 	l += @{n4,n5};

 	n6 = n1;
 	print(n6.value());

 	for (i = 0; i < l.length(); i+=1) {
 		n6 = l[i];
 		print(n6.value());
 	}
 	l.pop();
 	l.pop();
 	print(l.length());


 	for (i = 0; i < l.length(); i+=1) {
 		n6 = l[i];
 		print(n6.value());
 	}
 
 	return 0;
 } 