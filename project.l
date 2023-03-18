%{
#include<stdio.h>
#include "y.tab.h"
%}

keyword		"squaremeter"|"squarefeet"|"hectres"|"acres"|"jo"|"thay"|"have"|"to"|"su"
operator	"atle ketla"|"hoi to ketla"
integer		[0-9]+
float		[0-9]+"."[0-9]+
eos		"."
separator	","
ws		[ \t\n]
eop		"?"
%%
{keyword}	{printf("keyword = %s\n",yytext);return KEYWORD;}
{operator}	{printf("operator = %s\n",yytext);return OPERATOR;}
{integer}	{printf("integer = %s\n",yytext);return NUMBER;}
{float}		{printf("float = %s\n",yytext);return NUMBER;}
{eos}		{printf("eos = %s\n",yytext);return DOT;}
{separator}	{printf("separator = %s\n",yytext);return SEPERATOR;}
{ws}		{return WHITESPACE;}
{eop}		{printf("eop = %s\n",yytext);return QUEMARK;}
[#]{1}[#]{1}[a-zA-Z0-9]*	{printf("single line comment\n");}
.		{printf("Invalid Token : %s\n",yytext);return 0;return *yytext;}
%%
int yywrap()
{
return 1;
}
