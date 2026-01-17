%{
#include <stdio.h>
extern int yylex();
extern int line;
void yyerror(const char *s);
%}

%token KICKOFF FULLTIME
%token STRIKER WINGER KEEPER
%token DEFEND ATTACK REPLAY
%token SHOOT
%token ID NUMBER STRING
%token ASSIGN INC

%%

Match
    : KICKOFF '<' event_list '>' FULLTIME
      { printf("Syntax analysis successful\n"); }
    ;

event_list
    : event event_list
    | event
    ;

event
    : lineup_event
    | pass_event
    | defend_event
    | replay_event
    | shoot_event
    ;

lineup_event
    : STRIKER ID
    | WINGER ID
    | KEEPER ID
    ;

pass_event
    : ID ASSIGN play_value
    | ID INC
    ;

play_value
    : NUMBER
    | ID
    ;

defend_event
    : DEFEND '<' event_list '>' attack_event_opt
    ;

attack_event_opt
    : ATTACK '<' event_list '>'
    | /* empty */
    ;

replay_event
    : REPLAY '<' event_list '>'
    ;

shoot_event
    : SHOOT STRING
    ;

%%

void yyerror(const char *s)
{
    printf("Syntax Error at line %d\n", line);
}

int main()
{
    yyparse();
    return 0;
}

