int main() {
	set @{node@{int}} s;
	node @{int} n1;
	node @{int} n2;
	node @{int} n3;
	node @{int} n4;
	list @{node@{float}} l;

	new s;
	new n1;
	new n2;
	new n3;
	new n4;
	new l;

	n1.setvalue(11);
	n2.setvalue(22);
	n3.setvalue(33);
	n4.setvalue(0.44);

	s.put(n1);
	print (s.length());
	l = @{n4};
	s+=l;
	if (s.contain(n1)) prints("true");
	else prints("false");
	if (s.contain(n4)) prints("true");
	else prints("false");

	return 0;	
}