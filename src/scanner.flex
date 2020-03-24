%%


%class Scanner
%unicode
%line
%column
%public

//Here I change the scanner function name and make it return Symbol each time
%function myscanner
%type Symbol

// We declare Three state these state are diffrent from INITIAL State
%state SIMPLECOMMENT
%state MULTIPLELINECOMMENT
%state STRING




 %{
 StringBuilder stringBuilder=new StringBuilder();

  public Symbol LineTerminator(){
      stringBuilder.setLength(0);
      stringBuilder.append("<br/>");
return new Symbol(Symbol.WHITE_SPACE);
  }
  // these function is for our reserved words like int,double and etc
  public  Symbol ReservedWord(int code){
      stringBuilder.setLength(0);
      stringBuilder.append("<span style=\" color:"+SymbolType.RESERVED.getColor()+"\""+ "<b>"+yytext()+"</b></span>");
      return new Symbol(code);
  }
  public Symbol Operators(int code,String color){
      stringBuilder.setLength(0);
      stringBuilder.append("<span style=\" color:"+color+"\""+ "<b>"+yytext()+"</b></span>");
      return  new Symbol(code);
  }
  //this function just for special charachters in string and Real numbers
  public Symbol ItalicScan(int code,String color){
       stringBuilder.setLength(0);
            stringBuilder.append("<span style=\" color:"+color+"\""+ "<b><i>"+yytext()+"</i></b></span>");
            return  new Symbol(code);
  }

%}

/* Commands */
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
// \f stands for form feed to start a new page
WhiteSpace = {LineTerminator} | [ \t\f]
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator ? is condtion maker for regex .
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
EndOfLineCommentData=[^\n\r\t ]+
TraditionalCommentData="*"+[^\/] | [^\*\n\r\t ]+
Comment = {TraditionalComment} | {EndOfLineComment} }

/* End Comments*/


CharacterData = \'[^\\]\'
SpecialCharacterData = \'\\[abfnrtv\\\'\"]\'

StringData = [^\n\r\"\\ \t]+
StringSpecialCharacters = \\[abfnrtv\\\'\"]

UnsignedLongInteger = u?l?l? | U?L?L?
DecimalInteger = [1-9]\d*
OctalInteger = 0[0-7]*
HexaDecimal = 0x[\da-fA-F]+
Integer = ({DecimalInteger} | {OctalInteger} | {HexaDecimal}){UnsignedLongInteger}?

DecimalFloatingPointSicentific = ((E | e\+)\d+)?([fF] | {UnsignedLongInteger})?
//Double finishes with F or f
HexaDecimalFloatingPointScientific = p[\+-]?\d+[fF]?
DecimalFloatingPointLiteral = \d+\.\d+{DecimalFloatingPointSicentific}? | \d+[fF]
HexaDecimalFloatingPointLiteral = {HexaDecimal}(\.[\da-fA-F]+)?{HexaDecimalFloatingPointScientific}
FloatingPointLiteral = {DecimalFloatingPointLiteral} | {HexaDecimalFloatingPointLiteral}


// Identifier like variable name or function name this should be our last priority
Identifier = [_a-zA-Z][_a-zA-Z0-9]*


%%
<YYINITIAL>{
/*
&nbsp => is for white spaces that html tag recognize
&esmp => is for tab  that html tag recognize
we should not ignore them beacuse error happen
*/

" " { stringBuilder.setLength(0); stringBuilder.append("&nbsp;"); return new Symbol(Symbol.WHITE_SPACE); }
"\t" { stringBuilder.setLength(0); stringBuilder.append("&emsp;"); return new Symbol(Symbol.WHITE_SPACE); }

{LineTerminator} {return LineTerminator();}

"//" { stringBuilder.setLength(0); stringBuilder.append("<span style=\"color: ").append(SymbolType.COMMENTS.getColor()).append("\">//"); yybegin(SIMPLECOMMENT); }
"/*" { stringBuilder.setLength(0); stringBuilder.append("<span style=\"color: ").append(SymbolType.COMMENTS.getColor()).append("\">/*"); yybegin(MULTIPLELINECOMMENT); }



/* reserved words*/
"int" {return ReservedWord(Symbol.INT);}
"short" {return ReservedWord(Symbol.SHORT);}
"long" {return ReservedWord(Symbol.LONG);}
"float" {return ReservedWord(Symbol.FLOAT);}
"double" {return ReservedWord(Symbol.DOUBLE);}
"char" {return ReservedWord(Symbol.CHAR);}
"string" {return ReservedWord(Symbol.STRING);}
"const" {return ReservedWord(Symbol.CONST);}
"for" {return ReservedWord(Symbol.FOR);}
"foreach" {return ReservedWord(Symbol.FOREACH);}
"while" {return ReservedWord(Symbol.WHILE);}
"do" {return ReservedWord(Symbol.DO);}
"in" {return ReservedWord(Symbol.IN);}
"if" {return ReservedWord(Symbol.IF);}
"else" {return ReservedWord(Symbol.ELSE);}
"switch" {return ReservedWord(Symbol.SWITCH);}
"case" {return ReservedWord(Symbol.CASE);}
"default" {return ReservedWord(Symbol.DEFAULT);}
"auto" {return ReservedWord(Symbol.AUTO);}
"volatile" {return ReservedWord(Symbol.VOLATILE);}
"static" {return ReservedWord(Symbol.STATIC);}
"goto" {return ReservedWord(Symbol.GOTO);}
"signed" {return ReservedWord(Symbol.SIGNED);}
"bool" {return ReservedWord(Symbol.BOOL);}
"void" {return ReservedWord(Symbol.VOID);}
"return" {return ReservedWord(Symbol.RETURN);}
"break" {return ReservedWord(Symbol.BREAK);}
"continue" {return ReservedWord(Symbol.CONTINUE);}
"new" {return ReservedWord(Symbol.NEW);}
"sizeof" {return ReservedWord(Symbol.SIZEOF);}
"true" {return ReservedWord(Symbol.TRUE);}
"record" {return ReservedWord(Symbol.RECORD);}
"repeat" {return ReservedWord(Symbol.REPEAT);}
"until" {return ReservedWord(Symbol.UNTIL);}
"function" {return ReservedWord(Symbol.FUNCTION);}
"println" {return ReservedWord(Symbol.PRINTLN);}
"false" {return ReservedWord(Symbol.FALSE);}

/*operators*/

"=" {return Operators(Symbol.EQUAL,SymbolType.OPERATOR.getColor());}
"==" {return Operators(Symbol.DOUBLE_EQUAL,SymbolType.OPERATOR.getColor());}
"!=" {return Operators(Symbol.NOT_EQUAL,SymbolType.OPERATOR.getColor());}
"<=" {return Operators(Symbol.LESS_EQUAL,SymbolType.OPERATOR.getColor());}
"<" {return Operators(Symbol.LESS,SymbolType.OPERATOR.getColor());}
">" {return Operators(Symbol.GREATER,SymbolType.OPERATOR.getColor());}
"." {return Operators(Symbol.DOT,SymbolType.OPERATOR.getColor());}
"," {return Operators(Symbol.COMMA,SymbolType.OPERATOR.getColor());}
":" {return Operators(Symbol.COLON,SymbolType.OPERATOR.getColor());}
";" {return Operators(Symbol.SEMICOLON,SymbolType.OPERATOR.getColor());}
"+" {return Operators(Symbol.PLUS,SymbolType.OPERATOR.getColor());}
"++" {return Operators(Symbol.DOUBLE_PLUS,SymbolType.OPERATOR.getColor());}
"-" {return Operators(Symbol.MINUS,SymbolType.OPERATOR.getColor());}
"--" {return Operators(Symbol.DOUBLE_MINUS,SymbolType.OPERATOR.getColor());}
/*** Warning* **
** we should not put one coat and double coat here because we want to scan chars and strings
//"'" {return Operators(Symbol.CHARACTER_LITERAL,SymbolType.OPERATOR.getColor());}
//"\"" {return Operators(Symbol.STRING_LITERAL,SymbolType.OPERATOR.getColor());}

***  End Warnig ***/
"(" {return Operators(Symbol.OPENT_PARANTHESE,SymbolType.OPERATOR.getColor());}
")" {return Operators(Symbol.CLOSE_PARANTHESE,SymbolType.OPERATOR.getColor());}
"{" {return Operators(Symbol.OPEN_BRACE,SymbolType.OPERATOR.getColor());}
"}" {return Operators(Symbol.CLOSE_BRACE,SymbolType.OPERATOR.getColor());}
"%" {return Operators(Symbol.MOD,SymbolType.OPERATOR.getColor());}
"/" {return Operators(Symbol.DIVISION,SymbolType.OPERATOR.getColor());}
"/=" {return Operators(Symbol.DIVISION_EQUAL,SymbolType.OPERATOR.getColor());}
"*=" {return Operators(Symbol.STAR_EQUAL,SymbolType.OPERATOR.getColor());}
"-=" {return Operators(Symbol.MINUS_EQUAL,SymbolType.OPERATOR.getColor());}
"+=" {return Operators(Symbol.PLUS_EQUAL,SymbolType.OPERATOR.getColor());}
"~" {return Operators(Symbol.TILDA,SymbolType.OPERATOR.getColor());}
"and" {return Operators(Symbol.LOGICAL_AND,SymbolType.OPERATOR.getColor());}
"or" {return Operators(Symbol.LOGICAL_OR,SymbolType.OPERATOR.getColor());}
"not" {return Operators(Symbol.LOGICAL_NOT,SymbolType.OPERATOR.getColor());}
"&" {return Operators(Symbol.ARITHMETIC_AND,SymbolType.OPERATOR.getColor());}
"|" {return Operators(Symbol.ARITHMETIC_OR,SymbolType.OPERATOR.getColor());}
"!" {return Operators(Symbol.ARITHMETIC_NOT,SymbolType.OPERATOR.getColor());}
"^" {return Operators(Symbol.ARITHMETIC_XOR,SymbolType.OPERATOR.getColor());}
"*" {return Operators(Symbol.STAR,SymbolType.OPERATOR.getColor());}
"[" {return Operators(Symbol.OPEN_BRAKET,SymbolType.OPERATOR.getColor());}
"]" {return Operators(Symbol.CLOSE_BRAKET,SymbolType.OPERATOR.getColor());}


/*because we want to recognize characters we should not have same rule befor this command*/
{CharacterData} {return Operators(Symbol.CHAR,SymbolType.CHARACTERS.getColor());}
{SpecialCharacterData} {return ItalicScan(Symbol.CHAR,SymbolType.CHARACTERS.getColor());}

/*because we want to recognize strings we should not have " operator befor this command*/
\" { stringBuilder.setLength(0); stringBuilder.append("<span style=\"color: ").append(SymbolType.STRING.getColor()).append("\">&quot;"); yybegin(STRING); }

{Integer} {return Operators(Symbol.INTEGER,SymbolType.INTEGER.getColor());}
{FloatingPointLiteral} {return ItalicScan(Symbol.REAL_ITALIC_NUMBER,SymbolType.REAL_ITALIC_NUMBER.getColor());}
{Identifier} {return Operators(Symbol.IDENTIFIER,SymbolType.IDENTIFIER.getColor());}


}
<SIMPLECOMMENT>{
{LineTerminator} { stringBuilder.append("</span><br/>"); yybegin(YYINITIAL); return new Symbol(Symbol.COMMENT); }
{EndOfLineCommentData} { stringBuilder.append(yytext()); }
" " { stringBuilder.append("&nbsp;"); }
"\t" { stringBuilder.append("&emsp;"); }

}
<MULTIPLELINECOMMENT>{
"*/" { stringBuilder.append("*/</span>"); yybegin(YYINITIAL); return new Symbol(Symbol.COMMENT); }


{TraditionalCommentData} {stringBuilder.append(yytext());}

{LineTerminator} {stringBuilder.append("<br>");}
" " { stringBuilder.append("&nbsp;"); }
"\t" { stringBuilder.append("&emsp;"); }
}

<STRING> {

\" { stringBuilder.append("&quot;</span>"); yybegin(YYINITIAL); return new Symbol(Symbol.STRING_LITERAL); }

[^\n\r\"\\]+ { stringBuilder.append( yytext() ); }
" " { stringBuilder.append("&nbsp;"); }
"\t" { stringBuilder.append("&emsp;"); }
      /*I make the special character color red and italic to find the diffrent clearly*/
 {StringSpecialCharacters} { stringBuilder.append("<span style=\"color: ").append(SymbolType.SPECIAL_ITALIC_CHARS.getColor()).append("\"><i>").append(yytext()).append("</i></span>"); }



}


