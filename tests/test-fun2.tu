int foo(list@{int} l) {
	return l[0];
}
bool bar(bool x) {
	return x;
}

int main()
{
 	int i;
 	bool b;
 	list @{int} l;
 	i = 20;
 	b = true;
 	l = @{1,2,3};
 	print(foo(l));
  	return 0;
}