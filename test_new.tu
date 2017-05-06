int main()
{	
// 	set @{int} s;
// 	new s;
// 	s.put(1);
// 	return 0;
	node@{int} node1;
	node@{int} node2;
	node@{int} node3;
	new node1;
	new node2;
	new node3;
	node1 -> @{node2, node3} = @{1, 3};
} 

