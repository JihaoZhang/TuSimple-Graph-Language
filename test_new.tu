int main()
{	

	node @{int} n;
 	set @{int} s;
 	list @{int} l;
 	int i;

 	new n;
 	new s;
 	n.setvalue(1);
 	n.value();
 	n.name();


 	l = @{1,2,3};
 	print(l[0]);

 	for(i = 0; i < 2; ) {
 		print(l[1]);
 		i += 1;
 	} 
 	print(l[0]);
 	return 0;

} 

