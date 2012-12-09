AudioTableize
by Christopher Saunders
topher@tophersaunders.com
==========================

A bash script to help sound designers showcase a large number of audio files online. 

A bash script that (1) encodes a whole folder of .aif into mp3, ogg; 
                   (2) places them into appropriate folders; 
                   (3) creates an html table containing <audio> tags and download links to the aif. 

========================================================================================================

usage ./audioTableize.sh *.aif > test.html

This will encode every .aif file into both .mp3 and ogg, 
organize the audio files into 3 folders(/mp3, /aif, /ogg)
and create an unformatted html file with table tags and stuff.

=========================================================================================================

Dependencies - 3 binaries

1. aif24to16 - a helper program in this repository. 
  1.1 A sub-dependency is libsndfile - http://www.mega-nerd.com/libsndfile/#Download
2. lame - http://lame.sourceforge.net/
3. oggenc - http://xiph.org/downloads/

==========================================================================================================
