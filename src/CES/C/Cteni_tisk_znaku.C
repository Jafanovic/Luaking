/****************************************/
/* Cteni_tisk_znaku.C                   */
/* Cteni a tisk znaku                   */ 
/* P.Herout   10.1991                   */
/****************************************/
#include <stdio.h>

main()
{
  int c;

  printf("\nZadej znak : ");
  c = getchar() + 1;
  printf("%c (ASCII %d)\n", c, c);
}
