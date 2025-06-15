#!/bin/sh

FILE=$1
OUTPUT=$(pwd)/output
mkdir -p ${OUTPUT}

if [ ! -f "${FILE}" ]; then
	echo "[!]Input file doesn't exist"
	exit
fi

chdir() {
	cd $1
}

rootdir() {
	cd $OUTPUT
}

sed 's|\(destination *= *"[^"]*"\),|\n{ \1 },\n|;s|^[[:space:]]*||' ${FILE} \
	| awk -F'"' '/name/ { print $2 } /destination/ { if ($2 != "") { print "chdir " $2 } else { print "chdir ROOTDIR" } }' \
	| while read line; do
		case $line in
			chdir*)
				if echo $line | grep -q ROOTDIR; then
					rootdir
				else
					rootdir
					mkdir -p $(echo $line | sed 's|chdir||')
					eval $line
				fi
				;;
			*)
				find /vendor -name $line | tee ${line}_res | while read FW; do
					BNAME=$(basename $line)
					NEXT=$(echo $BNAME | cut -d. -f1)
					case $line in
						*.mdt)
							echo "[+]Squashing ${BNAME}"
							pil-squasher ${NEXT}.mbn ${FW}
							;;
						*)
							echo "[+]Copying ${BNAME}"
							cp ${FW} .
							;;
					esac
				done
				if [ ! -s "${line}_res" ]; then
					echo "[!]${line} doesn't exist"
				fi
				rm "${line}_res"
				;;	
		esac
	done
