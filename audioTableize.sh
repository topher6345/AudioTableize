#!/bin/bash
#--puts all of the files in the directory inside <td></td> tags--#
#--Geeze this one got out of hand, alright in order--#
#--1. creates mp3/ and ogg/ directories
#--2. encodes *.aif into .mp3 & .ogg
#--3. pipes out a html table with name, name.mp3, download name

#dependencies - lame, oggenc, libsndfile 

echo "<table><tr>
	  <th>Name</th><th>Listen</th><th>Download</th>
	  </tr><tr>"



COUNTER=0
CHECK=0

	for f in *
	do 
		let COUNTER=$COUNTER+1
		let CHECK=$COUNTER%2

		if [ $CHECK -eq 0 ];
		then
		echo "</td><tr>"
		else
		aif24to16 $f 16$f #must be installed
		lame $f         #must be installed
		oggenc 16$f	#must be installed
		for fullpath in $f
		do
		    filename="${fullpath##*/}"                      # Strip longest match of */ from start
		    dir="${fullpath:0:${#fullpath} - ${#filename}}" # Substring from 0 thru pos of filename
		    base="${filename%.[^.]*}"                       # Strip shortest match of . plus at least one non-dot char from end
		    ext="${filename:${#base} + 1}"                  # Substring from len of base thru end
		    if [[ -z "$base" && -n "$ext" ]]; then          # If we have an extension and no base, it's really the base
		        base=".$ext"
		        ext=""
		    fi
		done
		mkdir -p "mp3"
		mkdir -p "ogg"
		mkdir -p "aif-24"
		mkdir -p "aif-16"
		mv "$base.mp3" "mp3/$base.mp3"
		mv "16$base.ogg" "ogg/$base.ogg"
		cp "$base.aif" "aif-24/$base.aif"
		mv "16$base.aif" "aif-16/$base.aif"


		echo  "<td>$base</td>
			   <td><audio controls=\"controls\" preload=\"none\">
			   <source src=\"mp3/$base.mp3\" type="audio/mpeg" />
  			   <source src=\"mp3/$base.ogg\" type="audio/ogg" />
			   </audio></td>
			   <td><a href=\"aif-24/$base.aif\">$base.aif</a></td>
			   "
		fi
	done

echo "</tr></table>" 
