CFLAGS="/Users/sakchhamsangroula/Personal/CLOX/test/lox1.txt"
NOWARNINGFLAG = -Wno-all
DEBUG =  -D DEBUG_TRACE_EXECUTION
run: final
	./final $(CFLAGS)

debug:debugFinal
	./final $(CFLAGS)

final: chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o
	gcc chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o -o final $(NOWARNINGFLAG)


debugFinal: chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o
	gcc chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o -o final $(NOWARNINGFLAG) $(DEBUG)

chunk.o: chunk.c
	gcc -c $(DEBUG) chunk.c $(NOWARNINGFLAG) 
	

compiler.o:compiler.c
	gcc -c $(DEBUG) compiler.c $(NOWARNINGFLAG)
	

debug.o:debug.c
	gcc -c $(DEBUG) debug.c $(NOWARNINGFLAG)
	

main.o:main.c
	gcc -c $(DEBUG) main.c $(NOWARNINGFLAG)
	

memory.o:memory.c
	gcc -c $(DEBUG) memory.c $(NOWARNINGFLAG)
	

scanner.o:scanner.c
	gcc -c $(DEBUG) scanner.c $(NOWARNINGFLAG)
	

value.o:value.c
	gcc -c $(DEBUG) value.c $(NOWARNINGFLAG)
	

vm.o:vm.c
	gcc -c $(DEBUG) vm.c $(NOWARNINGFLAG)
	

clean: chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o
	rm chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o final
