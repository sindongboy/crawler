#!/bin/bash

# check if env. set
if [[ -z ${CRAWLER_HOME} ]]; then
	. ./env.sh
fi

# ---- Functions ---- #
function usage() {
	echo "Usage: $0 [options]"
	echo "-s [full path to the movie title file]: make naver movie search seeds"
	echo "-m [full path to the naver movie id]: make naver movie page seeds"
	echo "-p [full path to the naver movie id]: make naver movie points seeds"
	exit 1
}

if [[ $# != 2 ]]; then
	usage
fi

function crawl_naver_search() {
	prefix=`cat ${SEED_HEADER} | grep "NSEARCH_PREFIX=" | grep -o "http:[^\"]*"`
	suffix=`cat ${SEED_HEADER} | grep "NSEARCH_SUFFIX=" | grep -o "&section[^\"]*"`
	while read line
	do
		echo "${prefix}${line}${suffix}"
	done < ${MOVIE_TITLE_FILE}
}

function crawl_naver_movie() {
	prefix=`cat ${SEED_HEADER} | grep "NMOVIE=" | grep -o "http:[^\"]*"`
	while read line
	do
		echo "${prefix}${line}"
	done < ${MOVIE_ID_FILE}
}

function crawl_naver_point() {
	prefix=`cat ${SEED_HEADER} | grep "NSCORE=" | grep -o "http:[^\"]*"`
	while read line
	do
		echo "${prefix}${line}"
	done < ${MOVIE_ID_FILE}
}

while : ; do
	case "$1" in 
		-s)
			MOVIE_TITLE_FILE=$2
			crawl_naver_search;
			break ;;
		-m)
			MOVIE_ID_FILE=$2
			crawl_naver_movie;
			break ;;
		-p)
			MOVIE_ID_FILE=$2
			crawl_naver_point;
			break ;;
		*)
			break ;;
	esac
done
