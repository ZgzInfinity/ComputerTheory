/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion 2017/18 */
/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 3
 *  Ejercicio 2.2
 */
%{
#include <stdio.h>
	int yylex();
	int yyerror();
void convertidorABinario(int valor)
{
    if (valor/2 != 0) {
        convertidorABinario(valor/2);
    }
    printf("%d", valor%2);
}
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token BINARIO DELIMITADOR
%%

calclist : /* nada */
	| calclist exp DELIMITADOR EOL { printf("=%d\n", $2); }
	| calclist exp DELIMITADOR BINARIO EOL{ convertidorABinario($2); printf("\n"); }
	;
exp : 	factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	| exp ADD NUMBER { $$ = $1 + $3; }
	| exp SUB NUMBER { $$ = $1 - $3; }
	| NUMBER { $$ = $1; }	
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
  return 0;
}

