int main(){
	bool b;
    int i;
    int j;
    string str;
	node@{int} n1;
	list@{int} l1;
<<<<<<< HEAD
=======
	list@{int} l2;
	set @{node@{int}} s1;
>>>>>>> 0db6851fcc8b7390d7e6f768e2bcde46a3d47c19
	map @{int, string} map1;
	map @{int, int} map2;
//	graph g;
	new n1;
	new l1;
	new map2;
	n1.value();
	i = n1.value();
	str = n1.name();
	map2.put(1, 2);
	prints("mapGet");
	i = map2.get(1);
	print(i);
	prints("mapSize");
	i = map2.size();
	print(i);
	prints("nodeName");
	prints(str);

	l1 += @{1, 2, 3, 4, 5, 6};
	l2 = @{7, 8, 9};
	print(l1.get(0));
	l1.pop();
	l1.remove(0);
	j = l1.length();
	print(j);
	l1.cancat(l1);
	print(l1.length());

	//n1.setvalue(i);
	//n1.setvalue(b);
	//n1.setvalue(str);
	//n1.name();

	//l1.get(i+i);
	//l1.pop();
	//l1.remove(i+i);
	//l1 = l1.cancat(l1);
	//b = s1.contain(n1);
	//s1.gettype();
	//n1 = s1.minimum();
	//n1 = s1.maximum();
	//str = map1.get(1);
	//map1.haskey(5);
	//map1.remove(1);
	//map1.keytype();
	//str = map1.valuetype();
}