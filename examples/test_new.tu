int main()
{	

	node @{int} n;
 	set @{int} s;
 	list @{int} l;
 	list @{string} lString;
 	map @{int, string} map1;
 	map @{string, int} map2;
 	int i;
 	graph g;

 	new lString;
 	new map1;
 	new map2;
 	new g;
 	new n;
 	new s;
 	n.setvalue(1);
 	n.value();
 	n.name();
 	g.bfs(n);
 	g.dfs(n);
 	g.iterGraph(0);
 	g.findGraphNode("node");
 	g.init();
 	g.addNode(n);
 	g.addEdge(n, n, 2);
 	g.expand(n);
 	g.reduce(n);
 	g.combine(g);

 	lString += @{"hello", "world"};
 	prints(lString.get(1));
 	map1.put(1, "hello");
 	map2.put("hello", 1);
 	print(map2.get("hello"));
 	prints(map1.get(1));
 	l = @{1,2,3};
 	print(l[0]);

 	for(i = 0; i < 2; ) {
 		print(l[1]);
 		i += 1;
 	} 
 	print(l[0]);
 	return 0;

} 

