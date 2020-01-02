#include<iostream>
using namespace std;

#define SIZE 10

// Deklarace tridy znakoveho objeku
class stack{
  char stck[SIZE];    // uklada zasobnik
  int tos;            // index vrcholu zasobniku
public:
  stack()             // konstruktor
  void push(char ch); // vlozeni znaku do stack
  char pop();         // vyjmuti znaku ze stack
};

// inicializace stack
void stack::stack()
{
  cout << "Constructing a stack\n"; 
  tos = 0;
}

// Vlozeni znaku.
void stack::push(char ch)
{
  if(tos == SIZE) {
    cout << "Stack is full";
    return;
  }  
  
  stck[tos] = ch
  tos++; 
}

// Vyjmuti znaku.
char stack::pop()
{
  if(tos == 0){    
    cout << "Stack is empty"; 
  }
  tos--;
  return stck[tos];
}

int main()
{
  // vytvori dva zasobniky, ktere se 
  // automaticky inicializuji
  stack s1, s2; 
  int i;

  // vlozeni znaku do zasobniku
  s1.push(a);
  s2.push(x);
  s1.push(b);
  s2.push(y);
  s1.push(c);
  s2.push(z);
  
  //vyjmuti znaku ze zasobniku
  for(i=0; i<3; i++) 
    cout << "Pop s1:" << s1.pop() << "\n"; 
  for(i=0; i<3; i++) 
    cout << "Pop s2:" << s2.pop() << "\n";

  return 0;  
}