#!/bin/bash
# Author : Donghun Shin @ SK planet
# Date : 2013. Dec. 28
#
# Simple Webcrawling tool
#

# --- Functions --- #
function usage() {
	echo "Usage: $0 [options]"
	echo "	-s(--seed) : file that contains seed urls"
	echo "	-p(--numproc) : number of processes"
	echo "	-d(--depth) : depth of the link following (1 by default)"
	echo "	-o(--output) : where crawled documents saved into"
	exit 1
}


# ------------------------------------------
# Options
# ------------------------------------------
# s, seed : file that contains seed urls (required)
# p, numproc : number of processes (required)
# o, output : where crawled documents saved into (required)
# d, depth : depth of the link following

SEED=""
NUMPROC=""
OUTPUT=""
DEPTH=""

while : ; do
	case "$1" in 
		-s|--seed)
			[ -n "${SEED}" ] && usage
			SEED="$2"
			shift 2 ;;
		-p|--numproc)
			[ -n "${NUMPROC}" ] && usage
			NUMPROC="$2"
			shift 2 ;;
		-d|--depth)
			[ -n "${DEPTH}" ] && usage
			DEPTH="$2"
			shift 2 ;;    
		-o|--output)
			[ -n "${OUTPUT}" ] && usage
			OUTPUT="$2"
			shift 2 ;;
		*)
			break ;;
	esac
done


# --------------------------
# Arguments Validation
# --------------------------
if [ -z $DEPTH ]; then 
	# if no depth is specified, then 1-depth crawling is set by default
	DEPTH=1
fi

if [ -z ${SEED} ] || [ -z ${NUMPROC} ] || [ -z ${OUTPUT} ]
then
	usage
fi

echo "=================================================="
echo "Crawler Setting"
echo "=================================================="
echo "seed: ${SEED}, numproc: ${NUMPROC}, depth: ${DEPTH}, output: ${OUTPUT}"

# --- Wget Options --- #
# Attempts
TRIES="--tries=5"

# DNS timeout

mkdir -p ${OUTPUT}


	#--recursive \
	#--level=${DEPTH} \

WGET_CMD="wget \
	--load-cookies ./cookies.txt \
	--continue \
	--tries=5 \
	--dns-timeout=30 \
	--connect-timeout=5 \
	--read-timeout=5 \
	--restrict-file-names=nocontrol \
	--directory-prefix=${OUTPUT} \
	--wait=2 \
	--random-wait \
	--no-parent \
	--no-verbose \
	--reject *.gz  --reject *.zip \
	--reject *.mov --reject *.fla \
	--reject *.xml \
	--no-check-certificate"

# image filter
#--reject *.jpg --reject *.gif \
#--reject *.png --reject *.css \
#--reject *.pdf --reject *.bz2 \


# Time stamping <- not work with -O
#--timestamping \

cat ${SEED} | xargs -P ${NUMPROC} -I _URL_ $WGET_CMD _URL_

