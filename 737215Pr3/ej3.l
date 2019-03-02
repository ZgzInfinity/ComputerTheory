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
"x"	{return(X);}
"y"	{return(Y);}
"z"	{return(Z);}
\n	{return(EOL);}
.	{return(yytext[0]); /* caracter inesperado */}
	
%%
