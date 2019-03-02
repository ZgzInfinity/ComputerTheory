/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 3
 *  Ejercicio 3
 */
%{
#include <stdio.h>
    int yylex();
    int yyerror(); 
%}
%token X Y Z 
%token EOL
%start g
%%  
g :
  | g s EOL
  |
  ;
s :
  | c X s
  ;
b :
  | X c Y
  | X c
  ;
c :
  | X b X
  | Z
  ;

%%

int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}


