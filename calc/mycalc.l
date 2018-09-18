%{
#include "mycalc.tab.h"
%}

%%
 /* [plans] add token: paren */
"+"             {return ADD;}
"-"             {return SUB;}
"*"             {return MUL;}
"/"             {return DIV;}

"\n"            {return CR;}
"quit"|"exit"   {return QUIT;}

[ \t]

[0-9]+ {
    yylval.double_value = atof(yytext);
    return DOUBLE_LITERAL;
}

[0-9]+\.[0-9]+ {
    yylval.double_value = atof(yytext);
    return DOUBLE_LITERAL;
}
%%
