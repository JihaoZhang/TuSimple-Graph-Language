int main()
{	
	list @{float} l;
	list @{float} l1;

	l = @{0.23, 13.2};
	l1 = @{9.234,2.53,6.32};
	l.cancat(l1);
	print(l.length());
	l.pop();
	print(l.length());
	l.remove(3);
	print(l.length());

	return 0;
} 