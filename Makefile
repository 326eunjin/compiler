CC = gcc
CFLAG = -w -m32
LEX = lex
YACC = yacc
TARGET = mygcc
TEST = test.c
HEADER = y.tab.h
SRCS = lex.yy.c \
        y.tab.c\

all: $(TARGET)

$(TARGET): $(SRCS)
    $(CC) $(CFLAG) $^ syntax.c print.c -o $@

$(SRCS): lex.l yacc.y
    $(LEX) lex.l
    $(YACC) -d yacc.y

clean:
    rm -f $(SRCS) $(HEADER)

fclean: clean
    rm -f $(TARGET)

re: fclean all

test: re
    ./$(TARGET) < $(TEST)

.PHONY: all clean fclean re test