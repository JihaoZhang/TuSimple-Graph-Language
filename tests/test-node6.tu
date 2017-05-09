int main() {
	node @{int} n1, n2, n3,n4, n5,n6, n7, n8;
	graph g;
	int i;

	new n1;
	new n2;
	new n3;
	new n4;
	new n5;
	new n6;
	new n7;
	new n8;
	new g;

	n1.setvalue(1);
	n2.setvalue(2);
	n3.setvalue(3);
	n4.setvalue(4);
	n5.setvalue(5);
	n6.setvalue(6);
	n7.setvalue(7);


	n1->@{n2, n3, n4} = @{22, 33, 44};
	n5--@{n1, n6, n7} = @{22,66, 77};
	print(n1.length());	

	for (i = 0; i < n1.length(); i+=1) {
		n8 = n1.iterNode(i);
		prints(n8.name());
		print(n8.value());		
	}

	
	return 0;
}

