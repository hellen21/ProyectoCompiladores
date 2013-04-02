package proyecto;

import java_cup.runtime.*;

/**
 * Scanner para la gramatica de prueba del curso de Compiladores e Interpretes.
 */
%%

%class Scanner
%unicode
%cup
%line
%column
%function next_token

%{
  StringBuffer string = new StringBuffer();

  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*



Identifier = [:jletter:] [:jletterdigit:]*
IntegerLiteral = 0 | [1-9][0-9]*
StringConstant = " [:jletter:] [:jletterdigit:]* "


%state STRING

%%

/* Palabras reservadas */

<YYINITIAL> "import"         	  { return symbol(sym.IMPORT,yytext()); }
<YYINITIAL> "class"         	  { return symbol(sym.CLASS,yytext()); }
<YYINITIAL> "public"        	  { return symbol(sym.PUBLIC,yytext()); }
<YYINITIAL> "static"        	  { return symbol(sym.STATIC,yytext()); }
<YYINITIAL> "void"          	  { return symbol(sym.VOID,yytext()); }
<YYINITIAL> "main"           	  { return symbol(sym.MAIN,yytext()); }

<YYINITIAL> "return"         	  { return symbol(sym.RETURN,yytext()); }
<YYINITIAL> "if"             	  { return symbol(sym.IF,yytext()); }
<YYINITIAL> "while"          	  { return symbol(sym.WHILE,yytext()); }
<YYINITIAL> "else"           	  { return symbol(sym.ELSE,yytext()); }
<YYINITIAL> "this"          	  { return symbol(sym.THIS,yytext()); }
<YYINITIAL> "lenght"          	  { return symbol(sym.LENGHT,yytext()); }

<YYINITIAL> "boolean"        	  { return symbol(sym.BOOLEAN,yytext()); }
<YYINITIAL> "int"            	  { return symbol(sym.INT,yytext()); }
<YYINITIAL> "String"         	  { return symbol(sym.STRING,yytext()); }



<YYINITIAL> "System" 		 { return symbol(sym.SYSTEM,yytext()); }
<YYINITIAL> "out" 		 { return symbol(sym.OUT,yytext()); }
<YYINITIAL> "in"  		 { return symbol(sym.IN,yytext()); }
<YYINITIAL> "println" 		 { return symbol(sym.PRINTln,yytext()); }
<YYINITIAL> "read"  		 { return symbol(sym.READ,yytext()); }

<YYINITIAL> "true"          	  { return symbol(sym.TRUE,yytext()); }
<YYINITIAL> "false"          	  { return symbol(sym.FALSE,yytext()); }

<YYINITIAL> "new"          	  	  { return symbol(sym.NEW,yytext()); }





//Revisar esto y como agregar las comillas a los string

<YYINITIAL> {

   /* literales Char */
   {StringConstant}		 { return symbol(sym.mySTRING_CONSTANT,yytext()); }
 

 /* identificadores */ 
  {Identifier}                   { return symbol(sym.myIDENTIFIER,yytext()); }
 
  /* literales enteros positivos */
  {IntegerLiteral}            { return symbol(sym.myINTEGER_LITERAL,yytext()); }

/* Inicia reconocimiento de string literal */
  \"                             { string.setLength(0); yybegin(STRING); }

 


  /* operadores */
  "="                            { return symbol(sym.IGUAL,yytext()); }
  "*"                            { return symbol(sym.MULT,yytext()); }
  "+"                            { return symbol(sym.SUMA,yytext()); }
  "-"                            { return symbol(sym.RESTA,yytext()); }
  "/"                            { return symbol(sym.DIV,yytext()); }
  "<"                            { return symbol(sym.MENOR,yytext()); }
  ">"                            { return symbol(sym.MAYOR,yytext()); }

  /* otros simbolos validos */

  "{"                            { return symbol(sym.LLAVEi,yytext()); }
  "}"                            { return symbol(sym.LLAVEd,yytext()); }
  "["                            { return symbol(sym.CORCHETEi,yytext()); }
  "]"                            { return symbol(sym.CORCHETEd,yytext()); }
  "("                            { return symbol(sym.PARENi,yytext()); }
  ")"                           { return symbol(sym.PARENd,yytext()); }
  ";"                            { return symbol(sym.PUNTOyCOMA,yytext()); }
  ","                            { return symbol(sym.COMA,yytext()); }
  "&&"                            { return symbol(sym.AND,yytext()); }
  "."                            { return symbol(sym.PUNTO,yytext()); }
  "!"                            { return symbol(sym.NOT,yytext()); }

    /* combinaciones */

  "=="                            { return symbol(sym.IGUALIGUAL,yytext()); }
  "!="                            { return symbol(sym.DIFERENTE,yytext()); }
  "<="                            { return symbol(sym.MENORIGUAL,yytext()); }
  ">="                            { return symbol(sym.MAYORIGUAL,yytext()); }

  /* commentarios */
  {Comment}                      { /* ignore */ }
 
  /* espacios en blanco */
  {WhiteSpace}                   { /* ignore */ }
}

<STRING> {
  \"                             { yybegin(YYINITIAL); 
                                   return symbol(sym.mySTRING_LITERAL,string.toString()); }
  [^\n\r\"\\]+                   { string.append( yytext() ); }
  \\t                            { string.append('\t'); }
  \\n                            { string.append('\n'); }

  \\r                            { string.append('\r'); }
  \\\"                           { string.append('\"'); }
  \\                             { string.append('\\'); }
}

/* caracteres no validos */
.|\n                             { throw new MyException("Caracter no permitido <"+
                                                    yytext()+">", yyline, yycolumn); }