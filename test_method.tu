int main(){
	bool b;
    int i;
    int j;
    string str;
	node@{int} n1;
	list@{int} l1;
	list@{int} l2;
	set @{int} s1;
	map @{int, string} map1;
	map @{int, int} map2;
	//graph g;

	new n1;
	new l1;
	new map2;
	new s1;


	//n1.iterNode(0);
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
	b = map2.haskey(1);
	map2.haskey(0);
	map2.remove(1);


	l1 += @{1, 2, 3, 4, 5, 6};
	l2 = @{7, 8, 9};
	print(l1.get(0));
	l1.pop();
	l1.remove(0);
	j = l1.length();
	print(j);
	l1.cancat(l1);
	print(l1.length());
	if(b){
		prints("hello");
	}
	s1.put(1);
	s1.put(2);
	print(s1.length());
	b = s1.contain(1);


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