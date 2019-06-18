#!/bin/bash
jv=$(google-chrome --version 2>&1 | head -1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1 | sed '/Google Chrome/s///')
if [ $jv -ge 74 ]; then
    echo ok
    exit 0
else
    echo not ok
    echo $jv
    exit 1
fi