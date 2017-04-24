int main(){
	// Dijkstra Algorithm in TuSimple
	
	map@{node,int} distant; 
	map@{node,bool} visited; 
	list@{node} queue; 

	node a;
	node b;
	node c;
	node d;
	node n; 
	node i;
	a -> b = 7; 
	b -> c = 5; 
	c -> d = 4; 
	d -> a = 1; 
	
	distant += @{a,b,c,d}; 
	queue += a; 
	// distant.fill(maxint); 
	while (b != a){ 
//		visited[queue] = true; 
//		for (i =queue ;i!=null; i++){ 
//		    if (distant[i]==null || distant[i]<distant[queue]+queue->i)
//		    {
//		     	distant[i] = distant[queue]+queue->i; 
//		    }
//		} 
//		queue++; 
//		// queue += distant.del(visited).min.node;
	}

}