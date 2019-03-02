/* 
 *  Autor: Ruben Rodriguez 
 *  NIP:   737215 
 *  Práctica: 1 
 *  Ejercicio 5
 */


%{
 int C = 0;
 int L = 0;
 int V = 0;
 int M = 0;
 int N = 0;
%}

%%
,                         { V++; 
			    C += 1;
                          }
[0-9]+                    { N++;
			    C += strlen(yytext);
			  }
[0-9]*[a-zA-Z ]+[0-9]*    { int parcial = strlen(yytext);
	   		    if (parcial > M){
	      		    M = parcial;
	   		    }
			    C += strlen(yytext);	
	 		  }								
\n    	 { L++;
	   V++;
	 }

%%

int main(){
      yylex();
      printf ( " Total de caracteres excepto saltos de linea --> C: %d\n" , C );
      printf ( " Total de lineas : %d\n" , L );
      printf ( " Total de valores : %d\n" , V);
      printf ( " Total de caracteres de valor mas largo : %d\n" , M );
      printf ( " Total de valores numericos : %d\n" , N );
      }










