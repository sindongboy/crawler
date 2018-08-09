#!/bin/bash

cd ../
export CRAWLER_HOME=`pwd`
cd -
export BIN="${CRAWLER_HOME}/bin"
export SEED_HEADER="${CRAWLER_HOME}/seeds/seeds.header"
export SEED_HOME="${CRAWLER_HOME}/seeds"
export MOVIE_TITLE_FILE=""
export MOVIE_ID_FILE=""

function info() {
	echo "============================"
	echo "::: CRAWLER ENV :::"
	echo ""
	echo "CRAWLER_HOME=${CRAWLER_HOME}"
	echo "SEED_HEADER=${SEED_HEADER}"
	echo "MOVIE_ID_FILE=${MOVIE_ID_FILE}"
	echo "MOVIE_TITLE_FILE=${MOVIE_TITLE_FILE}"
	echo "============================"
	echo ""
}

