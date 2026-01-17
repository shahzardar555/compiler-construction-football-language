# Football-Based Mini Language Compiler

This project implements:
- Lexical Analyzer using Flex
- Syntax Analyzer using Yacc/Bison

Theme: Football

## Files
- scanner.l : Lexical analyzer
- parser.y  : Syntax analyzer
- valid.txt : Valid test input
- invalid.txt : Invalid test input

## How to Run
flex scanner.l
yacc -d parser.y
gcc lex.yy.c y.tab.c -o parser
./parser < valid.txt

