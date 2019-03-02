/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 1 
 *  Ejercicio 7
 */


%%
(0|1)* {printf ( "%s" , yytext);}
[048]|([0-9]*([02468][048]|[13579][26])) { printf(yytext);
				   	   printf("(MULTIPLO4)");}									     
%%








