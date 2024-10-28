#!/bin/bash

if [[ -f pichula.txt ]] ; then
	rm pichula.txt
fi

touch pichula.txt

cat /etc/passwd | head -15 >> tmp

for i in $(cat tmp) ; do
	linia=""
	for j in `seq 1 7` ; do
		camp=$(echo "$i" | cut -d: -f$j)
		if [[ $j -eq 1 ]] ; then
			linia="$camp"
		else
			if [[ $j -eq 5 ]] ; then
				linia="$linia:patata_$camp"
			else
				linia="$linia:$camp"
			fi
		fi
		# echo $linia
	done
	echo $linia >> pichula.txt
done

rm tmp
