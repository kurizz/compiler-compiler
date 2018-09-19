%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1
extern int yylex(void);
extern int yyerror(char const *str);
%}

%union {
    int     integer_value;
    double  double_value;
}

%token  ADD SUB MUL DIV CR QUIT
%token  <double_value>  DOUBLE_LITERAL
%type   <double_value>  expression term primary_expression

%%
line_list:      line
        |       line_list line
                ;

line:           expression CR   {printf("%lf\n>>> ", $1);}
        |       QUIT CR         {printf("Sayounara !\n"); exit(0);}
        |       CR              {printf(">>> ");}
                ;

expression:     term
        |       expression ADD term {$$ = $1 + $3;}
        |       expression SUB term {$$ = $1 - $3;}
                ;

term:           primary_expression
        |       term MUL primary_expression {$$ = $1 * $3}
        |       term DIV primary_expression {$$ = $1 / $3}
                ;

primary_expression:
                DOUBLE_LITERAL
                ;
%%

int yyerror(char const *str) {
    extern char *yytext;
    fprintf(stderr, "parser error near \"%s\"\n", yytext);
    return 0;
}

int main(void) {
    printf("Welcome to mycalc !\n");
    printf(">>> ");
    extern int yyparse(void);
    extern FILE *yyin;
    yyin = stdin;
    if (yyparse()) {
        fprintf(stderr, "Error !\n");
        exit(1);
    }
}
