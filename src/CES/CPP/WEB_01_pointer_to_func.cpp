
#include <iostream>
using namespace std;
int add(int a, int b) 
{ 
  return a+b; 
} 
int multiply(int a, int b) 
{ 
  return a*b; 
} 
int main() 
{ 
  int (*operation) (int, int); 
  int x, y, sel; 
  cout << "We will add (1) or multiply (2)?"; 
  do { 
    cin >> sel; 
  } while (sel != 1 && sel != 2); 
  if (sel == 1) operation = add; 
  if (sel == 2) operation = multiply; 
  cout << "Enter two integers: "; 
  cin >> x >> y; 
  cout << "Result is " << operation(x, y) << endl; 
  return 0; 
} 
