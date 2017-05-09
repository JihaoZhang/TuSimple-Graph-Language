int main()
{	
 	set @{int} s;
 	node @{int} n1;
 	node @{int} n2;
 	graph g;

 	new g;
 	new n1;
 	new n2;

 	g.init();
 	g.addNode(n1);
 	g.addNode(n2);
 	g.addEdge(n1, n2, 2);
 	g.bfs(n);
 	g.dfs(n);
 	g.iter(1);
 	g.find("n1");
 	g = g.combine(g);
 	g.component();
 	g.reduce(n1);
 	g.expand(n1);

 	return 0;
 } 
