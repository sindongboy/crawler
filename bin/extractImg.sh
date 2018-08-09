#!/bin/bash

cat $1 | awk '{printf("%s ", $0);}' | sed 's/	/ /g' | sed 's/  */ /g' | grep -o "\-\- 영화정보(basic).*\/\/영화정보(basic)" | grep -o "\-\- 포스터.*\/\/포스터 --" | grep -o "img src=[^ ]*" | grep -o "http[^\"]*"
