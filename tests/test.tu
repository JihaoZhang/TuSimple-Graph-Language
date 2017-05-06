int main()
{	
	/*int i;
 	list @{int} l;
 	list @{int} l1;
 	l1 = @{4,5,6};
 	l = @{1,2,3};
 	l += @{4,5,6};
 	i = 0;
 	print (l[0]);
 	print (l[1]);
 	print (l[2]);
 	print (l[3]);
 	print (l[4]);
 	print (l[5]);
 	print(l[4]);
 	print(l[i]);

 	for(i = 0; i < 6; ) {
 		i = i+1;
 	}
 	print (l[5]);*/




 	list @{int} l;
 	int i ;
 	l = @{1,2,3};
 	print (l[0]);

 	for(i = 0; i < 6; ) {
 		i += 1;
 		print (l[i]);
 	} 
 	l += @{4,5,6};

 	print (4);
  	return 0;

 } 
