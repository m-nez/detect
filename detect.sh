#!/bin/bash

#	Detect and list possible correct encodings based on if a pattern is found

#	Copyright (C) 2017 Michał Nieznańs
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <http://www.gnu.org/licenses/>.

if [ $# -ne 2 ]
then
	echo "Usage: $0 FILE PATTERN"
	exit
fi

SOURCE=$1
PATTERN=$2

IFS=$'//\n' ENCODINGS=($(iconv -l))
for e in "${ENCODINGS[@]}"
do
	if iconv -f $e $SOURCE 2> /dev/null | grep -q $PATTERN
	then
		echo $e
	fi
done
