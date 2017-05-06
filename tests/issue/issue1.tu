int main() {
	list @{int} l;
 	int i ;
 	l = @{1,2,3,4,5,6};
 	print (l[0]);

//	for(i = 0; i < 6; ) {
		print(l.get(0));
// 		print(i);
// 	} 
// 	i = l.get(0);
// 	print(i);
 	return 0;
 }