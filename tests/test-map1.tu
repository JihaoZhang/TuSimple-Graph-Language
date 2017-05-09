int main()
{	
	map @{int, string} m;
  	new m;
  	m.put(1,"lalalal");
  	
  	if(m.haskey(1)) print(1);
  	else print(0);
  	print(m.size());

  	
  	
  	m.remove(1);
  	if(m.haskey(1)) print(1);
  	else print(0);
  



 	return 0;
} 