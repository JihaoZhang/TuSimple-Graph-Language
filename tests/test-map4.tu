int main()
{	
	map @{string, int} m;
  	new m;

  	m.put("hello", 1);
    m.put("hello", 2);
    m.put("hi", 4);
    m.put("hello", 3);


  	print(m.get("hello"));

  	print(m.size());

  	if (m.haskey("hello")) prints("true");
  	else prints("false");

  	m.remove("hello");

  	if (m.haskey("hello")) prints("true");
  	else prints("false");
  	
  	print(m.size());


 	return 0;
} 