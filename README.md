#AudioTableize
by Christopher Saunders
topher@tophersaunders.com

Script to help sound designers sort, upload and format a large number of soundfiles. 

A bash script that

1. encodes a whole folder of .aif into mp3, ogg; 
2. sorts them into appropriate folders; 
3. via pipe - writes an html table containing <audio> tags and download link to aif. 

```bash
./audioTableize.sh *.aif > test.html
```
This will encode every .aif file into both .mp3 and ogg, 
organize the audio files into 3 folders(/mp3, /aif, /ogg)
and create an unformatted html file with table tags and stuff.

###Dependencies 

1. [libsndfile](http://www.mega-nerd.com/libsndfile/#Download)
2. [lame](http://lame.sourceforge.net/)
3. [oggenc](http://xiph.org/downloads/)

