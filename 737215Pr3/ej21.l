/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion 2017/18 */
/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 3
 *  Ejercicio 2.1
 */
%{
#include "y.tab.h"
int cambio(int n)
{
    int decimalBinario = 0; 
    int valor = 1;
    int digito;
    while (n!=0)
    {
        digito = n % 10;
        n = n / 10;
        decimalBinario = decimalBinario + (digito * valor);
		valor = 2 * valor;
    }
    return decimalBinario;
}
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
[0-9]+b	{yylval = cambio(atoi(yytext)); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%






