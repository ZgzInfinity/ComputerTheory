/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 1 
 *  Ejercicio 2
 */

%{
 int contador = 0;
%}

%%

@hotmail { ++contador; printf ( "%s" , yytext); }

%%

int main(){
      yylex();
      printf ( " Total de usuarios : %d\n" , contador );
      }
