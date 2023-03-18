%{
#include<stdio.h>
#include<stdlib.h>
#define YYERROR_VERBOSE 1
void yyerror(char *err);
%}
%token KEYWORD OPERATOR NUMBER QUEMARK SEPERATOR DOT WHITESPACE
%%
S : A	{printf("\nSentence is valid !!!\n");return 0;};
A : B SEPERATOR WHITESPACE A | B DOT WHITESPACE A | B WHITESPACE QUEMARK;
B : KEYWORD WHITESPACE C | D;
C : D WHITESPACE KEYWORD;
D : NUMBER WHITESPACE KEYWORD WHITESPACE OPERATOR WHITESPACE KEYWORD;
%%
void yyerror(char *err)
{
printf("Error: ");
fprintf(stderr,"%s\n",err);
exit(1);
}
int main()
{
printf("Enter Sentence in Gujarati :\n");
yyparse();
}