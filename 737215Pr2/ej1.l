/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 2
 *  Ejercicio 1
 */


%{
#include <string.h>
char* name;
%}


%x CONDICION_EXCLUSIVA

%%

[^=]+ { name = strdup( yytext ); } 
= {BEGIN CONDICION_EXCLUSIVA;}

<CONDICION_EXCLUSIVA>[0-9a-fA-F][0-9a-fA-F] {printf("%s%s", "\\x" , yytext);}

<CONDICION_EXCLUSIVA>\n {BEGIN INITIAL; printf( " {printf(%s%s%s);}\n" , "\"" ,  name , "\"");}

%%

int main(){
	printf("%s\n","%%");
	yylex();
	printf ("%s\n" , ".");
	printf("%s\n","%%");

	return 0;

}