/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 1 
 *  Ejercicio 4
 */

%%

[0-9]    {  printf( "%d", atoi(yytext)+1);}
\n       {  printf( "\n"); printf ("\n");}

%%

