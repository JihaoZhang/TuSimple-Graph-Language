int main()
{	
	int i;
 	list @{int} l;
 	list @{int} l1;
 	new l1;
 	l = @{11,22,33};
 	l += @{44,55,66};
 	print (l.length());
 	print (l[5]);
 	l.pop();
 	l.pop();
 	print(l.length());
 	print (l[5]);

 	/*for (i = 0; i < l.length(); i+=1) {
 		l.get(1);
 	}
 	*/

 	print (l.length());
 	l.cancat(l1);
 	print (l.length());
 	l.cancat(@{11,22,33});
 	l.remove(1);
 	/*
 	for (i = 0; i < l.length(); i+=1) {
 		print(l.get(i));
 	} 
 	*/
 	l.pop();
 	/*
 	for (i = 0; i < l.length(); i+=1) {
 		print(l.get(i));
 	} 
 	*/
 	return 0;
 } 