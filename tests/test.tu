

int main()
{	
	int i;
 	list @{int} l;
 	list @{int} l1;
 	l1 = @{4,5,6};
 	l = @{1,2,3};
 	l += @{4,5,6};
 	print(l[4]);
 	for(i = 0; i < 6; i=i+1) {
 		print(i);
 		print(l[i]);
 	}

  	return 0;
 } 
