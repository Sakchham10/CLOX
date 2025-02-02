CFLAGS="/Users/sakchhamsangroula/Personal/CLOX/test/lox1.txt"
NOWARNINGFLAG = -Wno-all 
DEBUG =  -D DEBUG_TRACE_EXECUTION
DEBUGPRINT = -D DEBUG_PRINT_CODE 

run: final
	./final $(CFLAGS)

debug:debugFinal
	./final $(CFLAGS)

repl: final
	./final

print:debugPrint
	./final $(CFLAGS)

final: chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o
	gcc chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o -o final $(NOWARNINGFLAG)

debugFinal: Debugchunk.o Debugcompiler.o Debugdebug.o Debugmain.o Debugmemory.o Debugscanner.o Debugvalue.o Debugvm.o Debugobject.o
	gcc chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o -o final $(NOWARNINGFLAG) $(DEBUG)

debugPrint: Printchunk.o Printcompiler.o Printdebug.o Printmain.o Printmemory.o Printscanner.o Printvalue.o Printvm.o Printobject.o
	gcc chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o -o final $(NOWARNINGFLAG) $(DEBUGPRINT)

Printchunk.o: chunk.c
	gcc -c chunk.c $(NOWARNINGFLAG) $(DEBUGPRINT)

Printcompiler.o:compiler.c
	gcc -c compiler.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printdebug.o:debug.c
	gcc -c debug.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printmain.o:main.c
	gcc -c main.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printmemory.o:memory.c
	gcc -c memory.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printscanner.o:scanner.c
	gcc -c scanner.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printvalue.o:value.c
	gcc -c value.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printvm.o:vm.c
	gcc -c vm.c $(NOWARNINGFLAG) $(DEBUGPRINT)

Printobject.o:object.c
	gcc -c object.c $(NOWARNINGFLAG) $(DEBUGPRINT)

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

object.o:object.c
	gcc -c object.c $(NOWARNINGFLAG) 

Debugchunk.o: chunk.c
	gcc -c chunk.c $(NOWARNINGFLAG) $(DEBUG)

Debugcompiler.o:compiler.c
	gcc -c compiler.c $(NOWARNINGFLAG) $(DEBUG)

Debugdebug.o:debug.c
	gcc -c debug.c $(NOWARNINGFLAG) $(DEBUG)

Debugmain.o:main.c
	gcc -c main.c $(NOWARNINGFLAG) $(DEBUG)

Debugmemory.o:memory.c
	gcc -c memory.c $(NOWARNINGFLAG) $(DEBUG)

Debugscanner.o:scanner.c
	gcc -c scanner.c $(NOWARNINGFLAG) $(DEBUG)

Debugvalue.o:value.c
	gcc -c value.c $(NOWARNINGFLAG) $(DEBUG)

Debugvm.o:vm.c
	gcc -c vm.c $(NOWARNINGFLAG) $(DEBUG)

Debugobject.o:object.c
	gcc -c object.c $(NOWARNINGFLAG) $(DEBUG)

clean: 
	rm chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o final
