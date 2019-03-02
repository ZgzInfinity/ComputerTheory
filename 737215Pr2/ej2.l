/* 
 * 
 * Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 2
 *  Ejercicio 2
 *
 */

%x COMENTARIO_LARGO
%x COMENTARIO_CORTO
%x CADENA

%{
#include <stdbool.h>
int contadorJ=0;
int contadorC=0;
int vecesJ = 0;
int vecesC = 0;
bool includeDetectado=false;
bool importDetectado=false;
%}

%%
"/*"    { BEGIN (COMENTARIO_LARGO);}
"//"    { BEGIN (COMENTARIO_CORTO);}
"\""        { BEGIN (CADENA);}
^[ ]*(include) { if (!includeDetectado){
					contadorC=contadorC+10; 
					includeDetectado = true;
				}}
^[ ]*(import)		{ if (!importDetectado){
					contadorJ=contadorJ+10; 
					importDetectado = true;
				}}
[String][ ]*[a-zA-Z0-9]+[^0-9][_]  {  if ( vecesJ < 5){
							   	  contadorJ=contadorJ+1;
								  vecesJ=vecesJ+1;
							   }
							}
[int|char|float][ ]*[\&][ ]*[a-zA-Z0-9]+[^0-9][_] {  if ( vecesC < 5){
							   	  contadorC=contadorC+1;
								  vecesC=vecesC+1;
							   }
							}
<COMENTARIO_LARGO>"*/" { BEGIN (INITIAL);}
<COMENTARIO_LARGO>.|\n
<COMENTARIO_CORTO>\n { BEGIN (INITIAL);}
<COMENTARIO_CORTO>.|\n
<CADENA>"\"" { BEGIN (INITIAL);}
<CADENA>.|\n
.
%%


void main(){
 	yylex();
 	printf (" PJ : %d\n" , contadorJ );
	printf (" PC : %d\n" , contadorC );
	printf (" CLASIFICADO : ");
	if ( contadorC > contadorJ ){
		printf (" uno de C++\n");
	}
	else{
		printf (" uno de JAVA\n");
	}
}
