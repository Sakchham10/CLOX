CFLAGS="/Users/sakchhamsangroula/Personal/CLOX/test/lox.txt"
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

final: chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o table.o
	gcc -g chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o table.o -o final $(NOWARNINGFLAG)

debugFinal: Debugchunk.o Debugcompiler.o Debugdebug.o Debugmain.o Debugmemory.o Debugscanner.o Debugvalue.o Debugvm.o Debugobject.o Debugtable.o
	gcc -g chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o table.o -o final $(NOWARNINGFLAG) $(DEBUG)

debugPrint: Printchunk.o Printcompiler.o Printdebug.o Printmain.o Printmemory.o Printscanner.o Printvalue.o Printvm.o Printobject.o Printtable.o
	gcc -g chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o Table.o -o final $(NOWARNINGFLAG) $(DEBUGPRINT)

Printchunk.o: chunk.c
	gcc -g -O0 -c  chunk.c $(NOWARNINGFLAG) $(DEBUGPRINT)

Printcompiler.o:compiler.c
	gcc -g -O0 -c  compiler.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printdebug.o:debug.c
	gcc -g -O0 -c  debug.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printmain.o:main.c
	gcc -g -O0 -c  main.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printmemory.o:memory.c
	gcc -g -O0 -c  memory.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printscanner.o:scanner.c
	gcc -g -O0 -c  scanner.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printvalue.o:value.c
	gcc -g -O0 -c  value.c $(NOWARNINGFLAG) $(DEBUGPRINT)
	
Printvm.o:vm.c
	gcc -g -O0 -c  vm.c $(NOWARNINGFLAG) $(DEBUGPRINT)

Printobject.o:object.c
	gcc -g -O0 -c  object.c $(NOWARNINGFLAG) $(DEBUGPRINT)

Printtable.o:table.c
	gcc -g -O0 -c  table.c  $(NOWARNINGFLAG) $(DEBUGPRINT)

chunk.o: chunk.c
	gcc -g -O0 -c  chunk.c $(NOWARNINGFLAG) 

compiler.o:compiler.c
	gcc -g -O0 -c  compiler.c $(NOWARNINGFLAG) 
	
debug.o:debug.c
	gcc -g -O0 -c  debug.c $(NOWARNINGFLAG) 
	
main.o:main.c
	gcc -g -O0 -c  main.c $(NOWARNINGFLAG) 
	
memory.o:memory.c
	gcc -g -O0 -c  memory.c $(NOWARNINGFLAG) 
	
scanner.o:scanner.c
	gcc -g -O0 -c  scanner.c $(NOWARNINGFLAG) 
	
value.o:value.c
	gcc -g -O0 -c  value.c $(NOWARNINGFLAG) 
	
vm.o:vm.c
	gcc -g -O0 -c  vm.c $(NOWARNINGFLAG) 

object.o:object.c
	gcc -g -O0 -c  object.c $(NOWARNINGFLAG) 

table.o:table.c
	gcc -g -O0 -c  table.c $(NOWARNINGFLAG) 

Debugchunk.o: chunk.c
	gcc -g -O0 -c  chunk.c $(NOWARNINGFLAG) $(DEBUG)

Debugcompiler.o:compiler.c
	gcc -g -O0 -c  compiler.c $(NOWARNINGFLAG) $(DEBUG)

Debugdebug.o:debug.c
	gcc -g -O0 -c  debug.c $(NOWARNINGFLAG) $(DEBUG)

Debugmain.o:main.c
	gcc -g -O0 -c  main.c $(NOWARNINGFLAG) $(DEBUG)

Debugmemory.o:memory.c
	gcc -g -O0 -c  memory.c $(NOWARNINGFLAG) $(DEBUG)

Debugscanner.o:scanner.c
	gcc -g -O0 -c  scanner.c $(NOWARNINGFLAG) $(DEBUG)

Debugvalue.o:value.c
	gcc -g -O0 -c  value.c $(NOWARNINGFLAG) $(DEBUG)

Debugvm.o:vm.c
	gcc -g -O0 -c  vm.c $(NOWARNINGFLAG) $(DEBUG)

Debugobject.o:object.c
	gcc -g -O0 -c  object.c $(NOWARNINGFLAG) $(DEBUG)

Debugtable.o:table.c
	gcc -g -O0 -c  table.c $(NOWARNINGFLAG) $(DEBUG)

clean: 
	rm chunk.o compiler.o debug.o main.o memory.o scanner.o value.o vm.o object.o table.o final
