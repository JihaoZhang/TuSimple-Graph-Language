int main(){
	node@{int} s, a, b, c, d;
	graph g;
	node@{int} t1, t2, t3, t4, t5;
	list@{node@{int}} l;	
	new s; new a; new b; new c; new d;
	new t1; new t2; new t3; new t4; new t5;
	s -- @{a , b , c} = @{1, 1, 1};
	d -- @{a , b, c} = @{1, 1, 1};
	l = g.dfs(s);
	l.printList();
	return 0;	
}
