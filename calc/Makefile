mycalc: lex.yy.c mycalc.tab.c
	gcc -o mycalc mycalc.tab.c lex.yy.c -ll

mycalc.tab.c mycalc.tab.h: mycalc.y
	bison -d mycalc.y

lex.yy.c: mycalc.l
	flex mycalc.l

clean:
	rm mycalc mycalc.tab.c lex.yy.c mycalc.tab.h
