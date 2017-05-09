int main()
{	
	set@{node@{int}} s;
	list@{node@{int}} l;

	node @{int} n1;
	node @{int} n2;

	new s;
	new l;
	new n1;
	new n2;

	n1.setvalue(3);
	n2.setvalue(1);
	l = @{n1,n2};
	s += @{n1, n2};
	print (s.length());
	return 0;
}