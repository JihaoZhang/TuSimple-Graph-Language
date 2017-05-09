int main()
{	
	node @{string} n1;
	node @{string} n2;

	new n1;
	new n2;
	prints(n1.value());
	prints(n2.value());

	n1.setvalue("abc");
	n2.setvalue("def");

	prints(n1.value());
	prints(n2.value());

	prints(n1.name());
	prints(n2.name());

	return 0;
}