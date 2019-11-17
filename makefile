CC=gcc

all: mymathd mymaths mains maind

mymathd:libmyMath.so
mymaths:libmyMath.a

mains: main.o libmyMath.a
	$(CC) -Wall -g -o mains main.o libmyMath.a
maind: main.o libmyMath.so
	$(CC) -Wall -g -o maind main.o ./libmyMath.so
libmyMath.a: basicMath.o power.o 
	ar rcs -o libmyMath.a basicMath.o  power.o  
libmyMath.so: basicMath.o power.o 
	$(CC) -shared basicMath.o power.o  -o libmyMath.so
power.o:power.c myMath.h
	$(CC) -Wall -g -c  power.c
basicMath.o:basicMath.c myMath.h
	$(CC) -Wall -g -c basicMath.c
main.o:myMath.h main.c
	$(CC) -Wall -g -c main.c

clean:
	rm -f *.o *.a *.so mains maind