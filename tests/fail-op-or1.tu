void foo(int x, bool y) {
	if (x || y) prints("true");
	else prints("false");
}

int main()
{	
	int a;
	bool b;
	a = 1;
	b = true;
	foo(a, b);
 
 	return 0;
 } 