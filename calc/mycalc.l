%{
#include "mycalc.tab.h"
//#include <stdio.h>
//int yywrap(void) return 1;
%}

%%
 /* [plans] add two tokens: paren-token, exit(quit)-token */
"+"		{return ADD;}
"-"		{return SUB;}
"*"		{return MUL;}
"/"		{return DIV;}

"quit"	{return QUIT;}
"exit"	{return QUIT;}

"\n"	{return CR;}

[1-9][0-9]* {
	yylval.double_value = atof(yytext);
	return DOUBLE_LITERAL;
}

[0-9]*\.[0-9]* {
	yylval.double_value = atof(yytext);
	return DOUBLE_LITERAL;
}
%%
