int main()
{	
	node @{float} n1;
	node @{float} n2;

	new n1;
	new n2;

	n1.setvalue(3.1);
	n2.setvalue(1.2);

	prints(n1.name());
	prints(n2.name());
	
	return 0;
}