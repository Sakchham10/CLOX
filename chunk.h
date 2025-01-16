#ifndef clox_chunk_h
#define clox_chunk_h

#include "/Users/sakchhamsangroula/Personal/CLOX/common.h"
#include "/Users/sakchhamsangroula/Personal/CLOX/value.h"

typedef enum {
  OP_RETURN,
  OP_CONSTANT,
  OP_ADD,
  OP_SUBTRACT,
  OP_MULTIPLY,
  OP_DIVIDE,
  OP_NEGATE,
} OpCode;

typedef struct {
  int count;
  int capacity;
  uint8_t *code;
  int *lines;
  ValueArray constants;
} Chunk;

void initChunk(Chunk *chunk);
void freeChunk(Chunk *chunk);
void writeChunk(Chunk *chunk, uint8_t byte, int line);
int addConstant(Chunk *chunk, Value value);

#endif
