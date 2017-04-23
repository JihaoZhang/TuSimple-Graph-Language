node a;
node c;
node d;
int b;
float e;

int main(){
  a -> c = 1; /* single  directed edge */
  a -- d = 2; /* undirected edge			*/
  b = 10; 		/* integer assignment		*/
  b += 7; 		/* interger add assignment	*/
  b -= 3;		/* interger minus assignment	*/
  e = e + e; 	/* float add				*/
  e = b + e; 	/* int add float			*/
  e = e + b; 	/* float add int 			*/
  e = 3.1415;   /* float lit */
  e = 3.1415 + 1; /* float lit add */
  b = b % 3; /* integer mod */
  b++;
}
