#include "table.h"
#include "memory.h"
#include <stdlib.h>
#include <string.h>

#define TABLE_MAX_LOAD 0.75

void initTable(Table *table) {
  table->count = 0;
  table->capacity = 0;
  table->entires = NULL;
}

void freeTable(Table *table) {
  FREE_ARRAY(Entry, table->entires, table->capacity);
  initTable(table);
}

static Entry *findEntry(Entry *entries, int capacity, ObjString *key) {
  uint32_t index = key->hash % capacity;
  Entry *tombstone = NULL;
  for (;;) {
    Entry *entry = &entries[index];
    if (entry->key == NULL) {
      if (IS_NIL(entry->value)) {
        return tombstone != NULL ? tombstone : entry;
      } else {
        if (tombstone == NULL)
          tombstone = entry;
      }
    } else if (entry->key == key) {
      return entry;
    }
  }
  index = (index + 1) % capacity;
}

bool tableGet(Table *table, ObjString *key, Value *value) {
  if (table->count == 0)
    return false;
  Entry *entry = findEntry(table->entires, table->capacity, key);
  if (entry->key == NULL)
    return false;
  *value = entry->value;
  return true;
}

static void adjustCapacity(Table *table, int capacity) {
  Entry *entires = ALLOCATE(Entry, capacity);
  for (int i = 0; i < capacity; i++) {
    entires[i].key = NULL;
    entires[i].value = NIL_VAL;
  }
  table->count = 0;
  for (int i = 0; i < table->capacity; i++) {
    Entry *entry = &table->entires[i];
    if (entry->key == NULL)
      continue;

    Entry *dest = findEntry(entires, capacity, entry->key);
    dest->key = entry->key;
    dest->value = entry->value;
    table->count++;
  }
  FREE_ARRAY(Entry, table->entires, table->capacity);
  table->entires = entires;
  table->capacity = capacity;
}

bool tableSet(Table *table, ObjString *key, Value value) {
  if (table->count + 1 > table->capacity * TABLE_MAX_LOAD) {
    int capacity = GROW_CAPACITY(table->capacity);
    adjustCapacity(table, capacity);
  }
  Entry *entry = findEntry(table->entires, table->capacity, key);
  bool isNewKey = entry->key == NULL;
  if (isNewKey && IS_NIL(entry->value)) {
    table->count++;
  }

  entry->key = key;
  entry->value = value;
  return isNewKey;
}

bool tableDelete(Table *table, ObjString *key) {
  if (table->count == 0)
    return false;
  Entry *entry = findEntry(table->entires, table->capacity, key);
  if (entry->key == NULL)
    return false;
  entry->key = NULL;
  entry->value = BOOL_VAL(true);
  return true;
}

void tableAddAll(Table *from, Table *to) {
  for (int i = 0; i < from->capacity; i++) {
    Entry *entry = &from->entires[i];
    if (entry->key != NULL) {
      tableSet(to, entry->key, entry->value);
    }
  }
}
