#include<iostream>
using namespace std;

class myclass{
  int a;
public:
  myclass();   // konstruktor
  ~myclass();  // destruktor
  void show();
};

myclass::myclass()
{
  cout << "In constructor \n";
  a = 10;
}   

myclass::~myclass()
{
  cout << "Destructing ... \n"
}

void myclass::show()
{
  cout << a;
}

int main()
{
  myclass ob;

  ob.show();

  return 0;
}