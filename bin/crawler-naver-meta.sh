#!/bin/bash

if [[ -z ${CRAWLER_HOME} ]]; then
	. ./env.sh
fi

# COMMANDS
CMD="make-naver-seeds.sh"

echo "======================================"
echo " Create Seed files :"
echo " 1. seeds.search"
echo " ${BIN}/${CMD} -s ${CRAWLER_HOME}/resources/naver/crawl-target > ${SEED_HOME}/seeds.search"
echo " 2. seeds.pages"
echo " ${BIN}/${CMD} -m ${CRAWLER_HOME}/resources/naver/movie.id > ${SEED_HOME}/seeds.pages"
echo " 3. seeds.scores"
echo "${BIN}/${CMD} -p ${CRAWLER_HOME}/resources/naver/movie.id > ${SEED_HOME}/seeds.scores"

echo "`wc -l ${SEED_HOME}/*`"
echo "======================================"

# make seeds files
# 1. seeds.search
${BIN}/${CMD} -s ${CRAWLER_HOME}/resources/naver/crawl-target > ${SEED_HOME}/seeds.search

# 2. seeds.pages
${BIN}/${CMD} -m ${CRAWLER_HOME}/resources/naver/movie.id > ${SEED_HOME}/seeds.pages

# 3. seeds.scores
${BIN}/${CMD} -p ${CRAWLER_HOME}/resources/naver/movie.id > ${SEED_HOME}/seeds.scores

