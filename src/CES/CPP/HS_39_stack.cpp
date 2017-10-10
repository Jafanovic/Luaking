#include<iostream>
using namespace std;

#define SIZE 10

// Deklaruje tridu stack pro znaky
class stack{
  char stck[SIZE];    // uklada zasobnik
  int tos;            // index vrcholu zasobniku
public:
  void init();        // inicializace stack
  void push(char ch); // vlozeni znaku do stack
  char pop();         // vyjmuti znaku ze stack
};

// inicializace stack
void stack::init()
{
  tos = 0;
}

// Vsunuti znaku.
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
  stack s1, s2; // vytvoreni dvou zasobniku
  int i;

  // inicializace zasobniku
  s1.init();
  s2.init();

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
\end{lstlisting}
