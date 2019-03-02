/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 1 
 *  Ejercicio 3
 */


%s espera

%%
espera-cadena 	BEGIN(espera);

<espera>"@unizar"".""es" {}
<espera>\n { BEGIN(INITIAL);}

@unizar { printf ("@gmail");}
"."	{ printf (".");}
es	{ printf ("com");}
%%
