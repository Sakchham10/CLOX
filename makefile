CFLAGS="/Users/sakchhamsangroula/Personal/CLOX/test/lox1.txt"
NOWARNINGFLAG = -Wno-all
run: final
	./final $(CFLAGS)

final: chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o
	gcc chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o -o final $(NOWARNINGFLAG)

chunk.o: chunk.c
	gcc -c chunk.c $(NOWARNINGFLAG) 
	

compiler.o:compiler.c
	gcc -c compiler.c $(NOWARNINGFLAG)
	

debug.o:debug.c
	gcc -c debug.c $(NOWARNINGFLAG)
	

main.o:main.c
	gcc -c main.c $(NOWARNINGFLAG)
	

memory.o:memory.c
	gcc -c memory.c $(NOWARNINGFLAG)
	

scanner.o:scanner.c
	gcc -c scanner.c $(NOWARNINGFLAG)
	

value.o:value.c
	gcc -c value.c $(NOWARNINGFLAG)
	

vm.o:vm.c
	gcc -c vm.c $(NOWARNINGFLAG)
	

clean: chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o
	rm chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o final
