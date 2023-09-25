#include <stdio.h>
//#include <string.h>
using namespace std;

extern "C" double manage();
//extern "C" double input_array(double *,long);

int main() {
  //double return_code = 0.00;
  double sum = 0.00;
  printf("Welcome to Array Management System \n");
  
  printf("This product is maintained by Your Name at jacob.corletto@csu.fullerton.edu \n");
  
  sum = manage();

  printf("The main function received %lf and will keep it for a while. \n", sum);
  
  printf("Please consider buying more software from our suite of commercial program.");
  
  printf("A zero will be returned to the operating system.  Bye \n");

  return 0;
}