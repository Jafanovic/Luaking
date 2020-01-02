#include<iostream>
using namespace std;

#define SIZE 10
// Deklaruje tridu stack pro znaky
class stack{
  char stck[SIZE];    // uklada zasobnik
  // index vrcholu zasobniku:
  int tos;            
public:
  // inicializace stack:
  void init();  
  // vlozeni znaku do stack:      
  void push(char ch); 
  // vyjmuti znaku ze stack:
  char pop();         
};

// inicializace stack
void stack::init(){
  tos = 0;
}

// Vsunuti znaku.
void stack::push(char ch){
  if(tos == SIZE) {
    cout << "Stack is full";
    return;
  }  
  
  stck[tos] = ch
  tos++; 
}

// Vyjmuti znaku.
char stack::pop(){
  if(tos == 0){    
    cout << "Stack is empty"; 
  }
  tos--;
  return stck[tos];
}

int main(){
  // vytvoreni dvou zasobniku:
  stack s1, s2; 
  int i;

  // inicializace zasobniku:
  s1.init();
  s2.init();

  // vlozeni znaku do zasobniku:
  s1.push(a);
  s2.push(x);
  s1.push(b);
  s2.push(y);
  s1.push(c);
  s2.push(z);
  
  //vyjmuti znaku ze zasobniku:
  for(i=0; i<3; i++) 
    cout << "Pop s1:" << s1.pop() << "\n"; 
  for(i=0; i<3; i++) 
    cout << "Pop s2:" << s2.pop() << "\n";

  return 0;  
}