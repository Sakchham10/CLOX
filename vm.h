#ifndef clox_vm_h
#define clox_vm_h

#include "/Users/sakchhamsangroula/Personal/CLOX/chunk.h"
#include "/Users/sakchhamsangroula/Personal/CLOX/value.h"
#include "table.h"

#define STACK_MAX 256

typedef struct {
  Chunk *chunk;
  uint8_t *ip;
  Value stack[STACK_MAX];
  Value *stackTop;
  Obj *objects;
  Table strings;
  Table globals;
} VM;

typedef enum {
  INTERPRET_OK,
  INTERPRET_COMPILE_ERROR,
  INTERPRET_RUNTIME_ERROR,
} InterpretResult;

extern VM vm;

void initVM();
void freeVM();
InterpretResult interpret(const char *source);
void push(Value value);
Value pop();

#endif
