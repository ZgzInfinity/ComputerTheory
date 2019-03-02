/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion 2017/18 */
/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 3
 *  Ejercicio 2.3
 */
%{
#include <stdio.h>
    int total=0;
    int yylex();
    int yyerror();   
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token ACUM ASIGN
%%
calclist : /* nada */
    | calclist ACUM ASIGN exp EOL {total = $4;} // Asignar cualquier cosa
    | calclist acum EOL {printf("%d\n", $2 );}
    ;

acum: exp
    | ACUM ADD exp {$$ = total + $3;}
    | ACUM SUB exp {$$ = total - $3;}
    | ACUM ADD NUMBER {$$ = total + $3;}
    | ACUM SUB NUMBER {$$ = total - $3;}
    //MultiPLOX
    
    | ACUM MUL exp {$$ = total * $3;}
    | ACUM DIV exp {$$ = total / $3;}
 
exp :     factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }    
    | exp ADD NUMBER { $$ = $1 + $3; }
    | exp SUB NUMBER { $$ = $1 - $3; }
    | NUMBER { $$ = $1; }
    |
    ;
factor :     factor MUL factorsimple { $$ = $1 * $3; }
        | factor DIV factorsimple { $$ = $1 / $3; }
        | factorsimple MUL factorsimple { $$ = $1 * $3; }
        | factorsimple DIV factorsimple { $$ = $1 / $3; }
        | factorsimple
        ;
factorsimple :     OP exp CP { $$ = $2; }
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
