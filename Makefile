CC     := gcc
CFLAGS := -std=c11 -Wall -Wextra -O2 -g -D_GNU_SOURCE -Iinclude -MMD -MP
BIN    := memscope

SRC := $(wildcard src/*.c)
OBJ := $(SRC:src/%.c=obj/%.o)

.PHONY: all clean

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

obj/%.o: src/%.c | obj
	$(CC) $(CFLAGS) -c $< -o $@

obj:
	mkdir -p $@

clean:
	rm -rf obj $(BIN)

-include $(OBJ:.o=.d)
