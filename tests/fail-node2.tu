int main()
{	
	node @{float} n1;
	node @{bool} n2;

	new n1;
	new n2;
	if(n1.value()) print(1);
	else print(0);
	if(n2.value()) print(1);
	else print(0);

	n1.setvalue(1);
	prints(n1.name());
	prints(n2.name());

	return 0;
}