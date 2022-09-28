SRC_PATH=./src
BIN_PATH=./bin
INCLUDE_PATH=./include
GCC_FLAGS=-c -fPIC -I$(INCLUDE_PATH)
DEPS= bin_path $(SRC_PATH)/vector3d.cpp $(INCLUDE_PATH)/vector3d.hpp libv3d.so 

all: $(DEPS)
	mv libv3d.so /usr/local/lib/
	mv vector3d.o $(BIN_PATH)
	cp include/vector3d.hpp /usr/local/include
	ldconfig /usr/local/lib

bin_path:
	mkdir -p bin

libv3d.so: vector3d.o
	gcc -shared vector3d.o -o libv3d.so

vector3d.o:
	gcc $(GCC_FLAGS) $(SRC_PATH)/vector3d.cpp
