CFLAGS = -arch x86_64 -iwithsysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk

default: aif24to16
 aif24to16: aif24to16.o
	gcc $(CFLAGS) aif24to16.o libsndfile.a -framework CoreAudio -framework AudioToolbox -framework AudioUnit -framework CoreServices -o aif24to16
 aif24to16.o: aif24to16.c
	gcc $(CFLAGS) -c -g -std=c99 -o aif24to16.o aif24to16.c

clean:
	/bin/rm -f *.o aif24to16