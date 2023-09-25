/*jacob corletto
  CWID: 888466117
  Copyright 2023

*/


#include <stdio.h>
using namespace std;

extern "C" double manage();

int main() {
  double sum = 0.0;
  printf("Welcome to Array Management System \n");
  
  printf("This product is maintained by Your Name at jacob.corletto@csu.fullerton.edu \n");
  
  sum = manage();

  printf("The main function received %lf and will keep it for a while. \n", sum);
  
  printf("Please consider buying more software from our suite of commercial program.");
  
  printf("A zero will be returned to the operating system.  Bye \n");

  return 0;
}