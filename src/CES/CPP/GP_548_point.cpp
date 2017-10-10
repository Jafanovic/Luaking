
// Demonstrates the use of pointer declarations
// and operators.
#include <iostream>
using namespace std;
int main()
{
   int num=123;      // A regular integer variable.
   int *p_num;       // Declares an integer pointer.
   cout << "num is " << num << "\n";  // Prints value of num.
   cout << "The address of num is " << &num << "\n";
   // Prints num’s location.Puts address of 
   // num in p_num,in effect making p_num point
   // to num. No * in front of p_num.
   p_num = &num;     
   // Prints value of num.
   cout << "*p_num is " << *p_num << "\n"; 
   // Prints location of num.                                    
   cout << "p_num is " << p_num << "\n";   
   return 0;
}   
