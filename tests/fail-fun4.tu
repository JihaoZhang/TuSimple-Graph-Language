int foo(int x, int y) {
	int i;
	i = x + y;
	return i;
}
int bar(bool x) {
	return x;
}

int main()
{
 	int i;
 	bool b;
 	i = 20;
 	b = true;
 	foo(3, bar(true));
  	return 0;
}