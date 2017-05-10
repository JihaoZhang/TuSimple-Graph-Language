int main(){
	int i, j, size, size_j, now;
	node@{int} node1, node2, node3, node4, node5, node6, node7;
	graph g1, g2, g3;
	map{string, int} hash;

	new node1;new node3;new node3;new node4;new node5;new node6;new node7;
	new g1;new g2;new g3;
	new hash;
	/*
	node1 -> node3 = 8;
	node1 -> node4 = 4;
	node1 -> node5 = 3;
	*/
	node1 -> @{node3, node4, node5} = @{8, 4, 3};
	/*
	node2 -> node3 = 2;
	node2 -> node4 = 9;
	node2 -> node5 = 5;
	*/
	node2 -> @{node3, node4, node5} = @{2, 9, 5};

	node3 -> node6 = 3;
	node4 -> node6 = 5;
	node5 -> node6 = 9;

	g1.addNode(node1);
	g1.addNode(node2);

	g2.addNode(node3);
	g2.addNode(node4);
	g2.addNode(node5);

	g3.addNode(node6);

	/* hidden value */
	size = g1.length();
	for (i=0;i<size;i++){
		node7 = g.iterNode(i);
		size_j = node7.length();
		for (j=0;j<size_j;j++){
			if (hashmap.haskey(node7.name())){
				// now = hash.get(node7.name());
				hash.put(node7.name(), hash.get(node7.name()) + node7.weightIter(j));
			} else {
				hash.put(node7.name(), node7.weightIter(j));
			}
		}
	}
	print(hash.get(node3.name()));
	print(hash.get(node4.name()));
	print(hash.get(node5.name()));

}