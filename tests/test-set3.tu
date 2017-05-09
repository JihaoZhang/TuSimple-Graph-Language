int main()
{	
	set@{string} s;
	new s;
	s += @{"asdf" , "sdfsdf"};
	s.put("were");
	print (s.length());

	if (s.contain("asdf")) prints("true");
	else prints("false");
	if (s.contain("c")) prints("true");
	else prints("false");

	return 0;
}