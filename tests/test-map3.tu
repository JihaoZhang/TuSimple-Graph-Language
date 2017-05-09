int main()
{	
	map @{string, int} m;
  	new m;
  	m.put("a", 3434);
    m.put("b", 112);
    m.put("c", 65);
    m.put("d", 192);
  	print(m.get("c"));

  	print(m.size());

 	return 0;
} 