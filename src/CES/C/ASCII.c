/****************************************/
/* ASCII.C                              */
/* Generate ASCII table                 */
/****************************************/
#include <stdio.h>
#include <conio.h>

#define MIN_ASCII  32
#define MAX_ASCII  127
#define BASE       ' '
#define TABLE_HEADING	"\tASCII\t\tASCII\nChar\tCode\tChar\tCode\n"

char ascii_table_tittle[]= "      ASCII CODE TABLE";

main()
{
  int index = 0, i, tisk = 0;

  printf("%s\n",ascii_table_tittle);
  printf("-----------------------------\n");
  printf("%s", TABLE_HEADING);
  printf("=============================\n");

  while(tisk < MAX_ASCII)
  {
    for(i = 0; i < 2; i++)  
    {
      tisk = BASE + index + i; 
      printf("%c\t%d\t", tisk, tisk);
    }
    printf("\n");
    index += 2;
  } /* end while */

 while (!kbhit());
 return 0;
}




