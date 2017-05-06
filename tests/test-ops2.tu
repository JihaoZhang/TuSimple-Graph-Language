int main()
{
  if(true) print(1); else print(0);
  if(false) print(1); else print(0);
  if(true && true) print(1); else print(0);
  if(true && false) print(1); else print(0);
  if(false && true) print(1); else print(0);
  if(false && false) print(1); else print(0);
  if(true || true) print(1); else print(0);
  if(true || false) print(1); else print(0);
  if(false || true) print(1); else print(0);
  if(false || false) print(1); else print(0);
  if(!false) print(1); else print(0);
  if(!true) print(1); else print(0);
  print(-10);
}
