int main()
{	
	  map @{string, float} m;
  	new m;
  	m.put("a", 0.23);
    m.put("b", 4.2);
    m.put("c", 1.45);
    m.put("d", 546.3);
  	m.get("c");
  	if(m.haskey("e")) print(1);
  	else print(0);
    if(m.haskey("a")) print(1);
    else print(0);
  	print(m.size());
 	  return 0;
} 