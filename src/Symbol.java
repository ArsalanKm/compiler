public class Symbol {

    public static final int WHITE_SPACE = 1;
    public static final int COMMENT = 2;

    public static final int INT = 3;
    public static final int SHORT = 4;
    public static final int LONG = 5;
    public static final int FLOAT = 6;
    public static final int DOUBLE = 7;
    public static final int CHAR = 8;
    public static final int STRING = 9;
    public static final int CONST = 10;
    public static final int FOR = 11;
    public static final int FOREACH = 12;
    public static final int WHILE = 13;
    public static final int DO = 14;
    public static final int IN = 15;
    public static final int IF = 16;
    public static final int ELSE = 17;
    public static final int SWITCH = 18;
    public static final int CASE = 19;
    public static final int DEFAULT = 20;
    public static final int AUTO = 21;
    public static final int VOLATILE = 22;
    public static final int STATIC = 23;
    public static final int GOTO = 24;
    public static final int SIGNED = 25;
    public static final int BOOL = 26;
    public static final int VOID = 27;
    public static final int RETURN = 28;
    public static final int BREAK = 29;
    public static final int CONTINUE = 30;
    public static final int NEW = 31;
    public static final int SIZEOF = 32;
    public static final int TRUE = 33;
    public static final int RECORD = 34;
    public static final int REPEAT = 35;
    public static final int UNTIL = 36;
    public static final int FUNCTION = 37;
    public static final int PRINTLN = 38;
    public static final int FALSE = 39;
//OPERATORS

    public static final int EQUAL = 40;
    public static final int DOUBLE_EQUAL = 41;
    public static final int NOT_EQUAL = 42;
    public static final int LESS_EQUAL = 43;
    public static final int LESS = 44;
    public static final int GREATER = 45;
    public static final int GREATER_EQUAL = 46;
    public static final int DOT = 47;
    public static final int COMMA = 48;
    public static final int COLON = 49;
    public static final int SEMICOLON = 50;

    public static final int PLUS = 53;
    public static final int DOUBLE_PLUS = 54;
    public static final int MINUS = 55;
    public static final int DOUBLE_MINUS = 56;

    public static final int CHARACTER_LITERAL = 57;
    public static final int STRING_LITERAL = 58;

    public static final int OPENT_PARANTHESE = 59;
    public static final int CLOSE_PARANTHESE = 60;
    public static final int OPEN_BRACE = 51;
    public static final int CLOSE_BRACE = 52;


    public static final int MOD = 61;
    public static final int DIVISION = 62;
    public static final int DIVISION_EQUAL = 63;
    public static final int STAR_EQUAL = 64;
    public static final int MINUS_EQUAL = 65;
    public static final int PLUS_EQUAL = 66;

    public static final int TILDA = 67;

    public static final int LOGICAL_AND = 68;
    public static final int LOGICAL_OR = 69;
    public static final int LOGICAL_NOT = 70;

    public static final int ARITHMETIC_AND = 71;
    public static final int ARITHMETIC_OR = 72;
    public static final int ARITHMETIC_NOT = 73;
    public static final int ARITHMETIC_XOR = 74;

    public static final int STAR = 75;
    public static final int OPEN_BRAKET = 76;
    public static final int CLOSE_BRAKET = 77;
    public static final int IDENTIFIER = 78;
    public static final int INTEGER = 79;
    public static final int REAL_ITALIC_NUMBER = 80;
    public static final int INPUT_STRING = 81;
    public static final int CHARACTERS = 82;
    public static final int SPECIAL_ITALIC_CHARS = 83;




    private int code;
    private SymbolType type;

    public Symbol(int code) {
        this.type = SymbolType.getTypeByCode(code);
    }

    public SymbolType getType() {
        return type;
    }
}
