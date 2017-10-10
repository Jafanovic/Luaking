
#include <iostream>
using namespace std;

void date(char *date) // datum jako retezec
void date(int month, int day, int year) // datum jako cisla

int main()
{
  date("11/22/2010");
  date(11, 22, 2010 );
}

// Datum jako retezec.
void date(char *date)
{
  cout << "Date: " << date << "\n";
}

// Datum jako integer
void date(int month, int day, int year)
{
  cout << "Date: " << month << "/";
  cout << day << "/" << year << "\n";
}