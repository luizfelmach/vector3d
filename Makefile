all: vector3d.o
	echo "To install, use sudo make install!"

libv3d.so: vector3d.o
	gcc -shared vector3d.o -o libv3d.so

vector3d.o:
	gcc -c ./src/vector3d.cpp -fPIC

install: libv3d.so include/vector3d.hpp
	mv libv3d.so /usr/local/lib/
	cp include/vector3d.hpp /usr/local/include
	ldconfig /usr/local/lib