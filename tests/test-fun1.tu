int foo(int x, bool y) {
	if (y) {
		return x;
	}
	return 0;
}
bool bar(bool x) {
	return x;
}

int main()
{
 	int i;
 	bool b;
 	i = 20;
 	b = true;
 	print(foo(5, bar(true)));
  	return 0;
}