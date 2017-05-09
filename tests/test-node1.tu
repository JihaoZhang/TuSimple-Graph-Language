int main()
{	

	node @{int} n1;
	node @{int} n2;

	new n1;
	new n2;

	print (n1.value());
	prints(n1.name());

	n1.setvalue(3);
	n2.setvalue(1);
	print (n1.value());
	prints(n1.name());
	print (n2.value());
	prints(n2.name());

	return 0;
}