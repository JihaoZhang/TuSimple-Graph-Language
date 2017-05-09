int main()
{	
	set@{int} s;
	new s;
	s += @{1,2,3};
	s.put(9);	
	print(s.length());
	if (s.contain(2)) prints("true");
	else prints("false");
	if (s.contain(8)) prints("true");
	else prints("false");
	return 0;
}