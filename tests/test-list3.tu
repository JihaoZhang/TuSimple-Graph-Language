int main() {
	int i;
 	list @{int} l;
 	list @{int} l1;
 	new l1;
 	new l;
	print (l.length());
 	l.cancat(l1);
 	print (l.length());
 	for (i = 0; i < l.length(); i+=1) {
 		print(l.get(i));
 	} 
 	l.cancat(@{11,22,33});
 	l.remove(1);
 
 	for (i = 0; i < l.length(); i+=1) {
 		print(l.get(i));
 	} 
 	
 	l.pop();
 	
 	for (i = 0; i < l.length(); i+=1) {
 		print(l.get(i));
 	} 
 	
}