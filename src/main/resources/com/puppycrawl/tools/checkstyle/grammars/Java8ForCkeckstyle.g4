/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar Java8ForCkeckstyle;



//lexer

//Reserved keywords:
ABSTRACT      : 'abstract';
ASSERT        : 'assert';
BOOLEAN       : 'boolean';
BREAK         : 'break';
BYTE          : 'byte';
CASE          : 'case';
CATCH         : 'catch';
CHAR          : 'char';
CLASS         : 'class';
CONST         : 'const';
CONTINUE      : 'continue';
DEFAULT       : 'default';
DO            : 'do';
DOUBLE        : 'double';
ELSE          : 'else';
ENUM          : 'enum';
EXTENDS       : 'extends';
FINAL         : 'final';
FINALLY       : 'finally';
FLOAT         : 'float';
FOR           : 'for';
GOTO          : 'goto';
IF            : 'if';
IMPLEMENTS    : 'implements';
IMPORT        : 'import';
INSTANCEOF    : 'instanceof';
INT           : 'int';
INTERFACE     : 'interface';
LONG          : 'long';
NATIVE        : 'native';
NEW           : 'new';
PACKAGE       : 'package';
PRIVATE       : 'private';
PROTECTED     : 'protected';
PUBLIC        : 'public';
RETURN        : 'return';
SHORT         : 'short';
STATIC        : 'static';
STRICTFP      : 'strictfp';
SUPER         : 'super';
SWITCH        : 'switch';
SYNCHRONIZED  : 'synchronized';
THIS          : 'this';
THROW         : 'throw';
THROWS        : 'throws';
TRANSIENT     : 'transient';
TRY           : 'try';
VOID          : 'void';
VOLATILE      : 'volatile';
WHILE         : 'while';

//Reserved words for literal values

LITERAL_false   : 'false';
LITERAL_null    : 'null';
LITERAL_true    : 'true';

//token signifying annotations and annotation declaration
AT  : '@';

fragment ELLIPSIS : '...';

//Operators

ASSIGN          : '=';
BAND            : '&';
BAND_ASSIGN     : '&=';
BNOT            : '~';
BOR             : '|';
BOR_ASSIGN      : '|=';
BSR		: '>>>';
BSR_ASSIGN      : '>>>=';
BXOR            : '^';
BXOR_ASSIGN     : '^=';
COLON           : ':';
DEC             : '--';
DIV             : '/';
DIV_ASSIGN      : '/=';
DOULE_COLON     : '::';
EQUAL           : '==';
GE              : '>=';
GT              : '>';
INC             : '++';
LAMBDA          : '->';
LAND            : '&&';
LE              : '<=';
LNOT            : '!';
LOR             : '||';
LT              : '<';
MINUS           : '-';
MINUS_ASSIGN    : '-=';
MOD             : '%';
MOD_ASSIGN      : '%=';
NOT_EQUAL       : '!=';
PLUS            : '+';
PLUS_ASSIGN     : '+=';
QUESTION        : '?';
SL		: '<<';
SL_ASSIGN       : '<<=';
SR 		: '>>';
SR_ASSIGN       : '>>=';
STAR            : '*';
STAR_ASSIGN     : '*=';

//Separators
COMMA           : ',';
DOT             : '.';
LBRACE          : '{';
LBRACK          : '[';
LPAREN          : '(';
RBRACE          : '}';
RBRACK          : ']';
RPAREN          : ')';
SEMI            : ';';


//DIGITS

NUM_INT
    :   INT_LITERAL
    |   LONG_LITERAL
    ;


//Integers
fragment
INT_LITERAL
    :   HexNumeral
    |   DecimalNumeral
    |   OctalNumeral
    |   BinaryNumeral
    ;

fragment
LONG_LITERAL
    :   INT_LITERAL LongTypeSuffix
    ;

fragment
LongTypeSuffix
    :   [lL]
    ;

fragment
DecimalNumeral
    :   '0'
    |   NonZeroDigit (Digits? | Underscores Digits)
    ;

fragment
Digits
    :   Digit (DigitOrUnderscore* Digit)?
    ;

fragment
Digit
    :   '0'
    |   NonZeroDigit
    ;

fragment
NonZeroDigit
    :   [1-9]
    ;

fragment
DigitOrUnderscore
    :   Digit
    |   '_'
    ;

fragment
Underscores
    :   '_'+
    ;
fragment
HexNumeral
    :   '0' [xX] HexDigits
    ;

fragment
HexDigits
    :   HexDigit (HexDigitOrUnderscore* HexDigit)?
    ;

fragment
HexDigit
    :   [0-9a-fA-F]
    ;

fragment
HexDigitOrUnderscore
    :   HexDigit
    |   '_'
    ;

fragment
OctalNumeral
    :   '0' Underscores? OctalDigits
    ;

fragment
OctalDigits
    :   OctalDigit (OctalDigitOrUnderscore* OctalDigit)?
    ;

fragment
OctalDigit
    :   [0-7]
    ;

fragment
OctalDigitOrUnderscore
    :   OctalDigit
    |   '_'
    ;

fragment
BinaryNumeral
    :   '0' [bB] BinaryDigits
    ;

fragment
BinaryDigits
    :   BinaryDigit (BinaryDigitOrUnderscore* BinaryDigit)?
    ;

fragment
BinaryDigit
    :   [01]
    ;

fragment
BinaryDigitOrUnderscore
    :   BinaryDigit
    |   '_'
    ;

//Floating-point

FloatingPointLiteral
    :   DecimalFloatingPointLiteral
    |   HexadecimalFloatingPointLiteral
    ;

fragment
DecimalFloatingPointLiteral
    :   Digits '.' Digits? ExponentPart? FloatTypeSuffix?
    |   '.' Digits ExponentPart? FloatTypeSuffix?
    |   Digits ExponentPart FloatTypeSuffix?
    |   Digits FloatTypeSuffix
    ;

fragment
ExponentPart
    :   ExponentIndicator SignedInteger
    ;

fragment
ExponentIndicator
    :   [eE]
    ;

fragment
SignedInteger
    :   Sign? Digits
    ;

fragment
Sign
    :   [+-]
    ;

fragment
FloatTypeSuffix
    :   [fFdD]
    ;

fragment
HexadecimalFloatingPointLiteral
    :   HexSignificand BinaryExponent FloatTypeSuffix?
    ;

fragment
HexSignificand
    :   HexNumeral '.'?
    |   '0' [xX] HexDigits? '.' HexDigits
    ;

fragment
BinaryExponent
    :   BinaryExponentIndicator SignedInteger
    ;

fragment
BinaryExponentIndicator
    :   [pP]
    ;

//Identificators


//Whitespaces and comments
WS  
    :  [ \t\r\n\u000C]+ -> skip
    ;

COMMENT
    :   '/*' .*? '*/' -> skip
    ;

LINE_COMMENT
    :   '//' ~[\r\n]* -> skip
    ;