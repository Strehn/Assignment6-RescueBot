# Define the compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -g

# Define the source and object files
SRC = main.c map.c pathfinding.c
OBJ = $(SRC:.c=.o)
EXEC = rescuebot

# Target to build the final executable
all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

# Rule to compile .c files to .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to clean the compiled files
clean:
	rm -f $(OBJ) $(EXEC)

# Rule to run the program
run: $(EXEC)
	./$(EXEC)

# Rule to run the test cases
test: $(EXEC)
	@echo "Running tests..."
	@./test.sh

# Phony targets
.PHONY: all clean run test
