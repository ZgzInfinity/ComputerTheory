/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion 2017/18 */
/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 3
 *  Ejercicio 3
 */
%{
#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
"acum" {return (ACUM);}
":=" {return (ASIGN);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%



