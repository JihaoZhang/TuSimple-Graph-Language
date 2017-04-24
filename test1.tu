

	
	while (queue!= null){ 
		visited[queue] = true; 
		for (node i=queue ;i!=null; i++){ 
		    if (distant[i]==null || distant[i]<distant[queue]+queue->i)
		    {
		     	distant[i] = distant[queue]+queue->i; 
		    }
	} 
		queue++; 
		// queue += distant.del(visited).min.node;
	}
