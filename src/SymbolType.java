/**
 * Enum class for finding the type of the entring symbol and our myscanner() return the object of this class
 * written by arsalankarimzd
 */

public enum SymbolType {
    /*RESERVED SHOULD BE BOLD AND BLUE*/
    WHITE_SPACE("white"),
    RESERVED("blue"),
    IDENTIFIER("purple"),
    INTEGER("blue"),
    /* should be orange and italic*/
    REAL_ITALIC_NUMBER("orange"),
    STRING("green"),
    CHARACTERS("green"),
    /* ITALIC AND GREEN I make red for better understanding*/
    SPECIAL_ITALIC_CHARS("red"),
    COMMENTS("gray"),
    OPERATOR("black");


    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    private String color;

    SymbolType(String color) {
        this.color = color;
    }

    //    this function we use to find the symbol of entered value
    public static SymbolType getTypeByCode(int code) {
        switch (code) {
            case 1:
                return WHITE_SPACE;

            case 2:
                return COMMENTS;

            case 78:
                return IDENTIFIER;
            case 79:
                return INTEGER;
            case 80:
                return REAL_ITALIC_NUMBER;
            case 81:
                return STRING;
            case 82:
                return CHARACTERS;
            case 83:
                return SPECIAL_ITALIC_CHARS;

            default:
                return 3 <= code && code <= 39 ? RESERVED : OPERATOR;

        }
    }

}
