int main() {
	map @{int, int} m;
	new m;
	m.put(1,2);
	m.put(1,3);
	m.put(1,4);
	print(m.size());
	print(m.get(1));

	return 0;
}


/*
int main() {
	node @{int} n1, n2, n3,n4;
	new n1;
	new n2;
	new n3;
	new n4;

	n1->@{n2, n4} = @{1,4};
	n3--n1 = 3;
	print(n1.length());
	print(n1.iterweight());
	return 0;
}
*/