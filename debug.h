#ifndef clox_debug_h
#define clox_debug_h

#include "/Users/sakchhamsangroula/Personal/CLOX/chunk.h"

void disassembleChunk(Chunk *chunk, const char *name);
int disassembleInstruction(Chunk *chunk, int offset);

#endif
