/***********************************************/
/* soubor CPYARRY.C                            */
/* na funkcich kopirujicich prvky jednoho pole */
/* do druheho ukazuje pristup k prvkum pole    */
/* pomoci indexu i pomociukazatele, tedy       */  
/* pointerovou aritmetiku    peříčko           */
/***********************************************/
#include <stdio.h>

#define N    6

// a - vstupni pole, b - vystupni pole, 
// n - pocet prvku
void copy_array1(int *a, int *b, int n){
  register int i = 0;
  for (; i < n; i++)
   b[i] = a[i];
}

// a - vstupni pole, b - vystupni pole, 
// n - pocet prvku
void copy_array2(int *a, int *b, int n){
  while (n-- > 0)
    *b++ = *a++;
}

// vytiskne celociselne pole o n prvcich
// zacne a skonci na novem radku
void print_array(int *p, int n){
  puts("");
  while (n-- > 0)
    printf("\t%d", *p++);
  puts("");
}

int main(void){
  int pole1[] = {1, 2, 3, 4, 5, 6, 7, 8, 9},
     pole2[N], dim1;
  dim1 = sizeof(pole1) / sizeof(int);
  
  print_array(pole1, dim1);
  copy_array1(pole1, pole2, N);
  print_array(pole2, N);
  copy_array2(pole1 + 3, pole2, N);
  print_array(pole2, N);
  return 0;
}