int main(){
	// Dijkstra Algorithm in TuSimple
	
	map@{node,int} distant; 
	map@{node,bool} visited; 
	list@{node} queue; 

	node a;
	node b;
	node c;
	node d;
	node i;
	node curr;
	a -> b = 7; 
	b -> c = 5; 
	c -> d = 4; 
	d -> a = 1; 
	
	distant += @{a,b,c,d}; 
	queue += a; 
	// distant.fill(maxint); 
	while (queue != null){ 
	//  curr = queue.first
		visited[curr] = true; 
		for (i = curr; i!=null; i++){ 
		    if ( distant[i] == null || (distant[i] < (distant[curr] + curr -> i)))
		    {
		     	distant[i] = distant[curr]+ curr->i; 
		    }
		} 
		queue++; 
		// queue += distant.del(visited).min.node;
	}

}