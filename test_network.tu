int func(int in){
	if (in>0) return in;
	else return 0;
}

int main(){
	
	int i, j, size, size_j, now, sum, error, de, update, hidden_to_outer, count;
	node@{int} node1, node2, node3, node4, node5, node6, node7, node8;
	graph g1, g2, g3;
	map@{string, int} hash;
	list@{int} l, w, update_l, delta_w, update_w;

	new node1;new node2;new node3;new node4;new node5;new node6;new node7;new node8;
	new g1;new g2;new g3;new hash;
	new l;new w;new update_l;new delta_w;new update_w;
	
	node1 -> @{node3, node4, node5} = @{8, 4, 3};
	
	node2 -> @{node3, node4, node5} = @{2, 9, 5};

	node3 -> node6 = 3;
	node4 -> node6 = 5;
	node5 -> node6 = 9;
	
	w += @{8, 4, 3, 2, 9, 5, 3, 5, 9};
	w.printList();

	g1.addNode(node1);
	g1.addNode(node2);

	g2.addNode(node3);
	g2.addNode(node4);
	g2.addNode(node5);

	g3.addNode(node6);

	hidden_to_outer = g1.length() * g2.length();

	size = g1.length();
	for (i=0;i<size;i+=1){
		node7 = g1.iterGraph(i);
		size_j = node7.length();
		for (j=0;j<size_j;j+=1){
			node8 = node7.iterNode(j);
			if (hash.haskey(node8.name())){
				now = i * g2.length() + j;
				hash.put(node8.name(), hash.get(node8.name()) + w.get(now));	
			} 
			else {
				now = i * g2.length() + j;
				hash.put(node8.name(), w.get(now));		
			}
		}
	}
	
	size = g2.length();
	for (i=0;i<size;i+=1){
		node7 = g2.iterGraph(i);
		now = func(hash.get(node7.name()));
		l += @{now};
	}
	
	sum = 0;
	size = g2.length();
	for (i=0;i<size;i+=1){
		node7 = g2.iterGraph(i);
		sum += l.get(i) * w.get(hidden_to_outer+i) / 10;
		
	}

	error = 0 - func(sum);
	de = ((func(sum+1) - func(sum))/1 + (func(sum) - func(sum-1))/1)/2;
	sum = de * error / 10;

	for(i=0;i<size;i+=1){
		update = sum * w.get(hidden_to_outer+i) * 1;
		delta_w += @{update};
	}
	
	count = 0;
	for (i=0;i<hidden_to_outer;i+=1){
		update = w.get(i) + delta_w.get(count);
		update_w += @{update};

		count += 1;
		if (count==g2.length()) count = 0;
	}

	size = g2.length();
	for (i=0;i<size;i+=1){
		node7 = g2.iterGraph(i);
		update = w.get(hidden_to_outer+i) + sum * l.get(i) / 10;
		update_l += @{update};
	}
	// update_l.printList();
	update_w.cancat(update_l);

	w = update_w;
	w.printList();

	/*
		 second iteration
	*/

	new l;new update_l;new delta_w;new update_w;

	size = g2.length();
	for (i=0;i<size;i+=1){
		node7 = g2.iterGraph(i);
		hash.remove(node7.name());
	}

	size = g1.length();
	for (i=0;i<size;i+=1){
		node7 = g1.iterGraph(i);
		size_j = node7.length();
		for (j=0;j<size_j;j+=1){
			node8 = node7.iterNode(j);
			if (hash.haskey(node8.name())){
				now = i * g2.length() + j;
				hash.put(node8.name(), hash.get(node8.name()) + w.get(now));	
			} 
			else {
				now = i * g2.length() + j;
				hash.put(node8.name(), w.get(now));		
			}
		}
	}
	
	size = g2.length();
	for (i=0;i<size;i+=1){
		node7 = g2.iterGraph(i);
		now = func(hash.get(node7.name()));
		l += @{now};
	}
	
	sum = 0;
	size = g2.length();
	for (i=0;i<size;i+=1){
		node7 = g2.iterGraph(i);
		sum += l.get(i) * w.get(hidden_to_outer+i) / 10;
		
	}

	error = 0 - func(sum);
	de = ((func(sum+1) - func(sum))/1 + (func(sum) - func(sum-1))/1)/2;
	sum = de * error / 10;

	for(i=0;i<size;i+=1){
		update = sum * w.get(hidden_to_outer+i) * 1;
		delta_w += @{update};
	}
	
	count = 0;
	for (i=0;i<hidden_to_outer;i+=1){
		update = w.get(i) + delta_w.get(count);
		update_w += @{update};

		count += 1;
		if (count==g2.length()) count = 0;
	}

	size = g2.length();
	for (i=0;i<size;i+=1){
		node7 = g2.iterGraph(i);
		update = w.get(hidden_to_outer+i) + sum * l.get(i) / 10;
		update_l += @{update};
	}
	// update_l.printList();
	update_w.cancat(update_l);

	w = update_w;
	w.printList();
	
}