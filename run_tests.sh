jv=$(java -version 2>&1 | head -1 | cut -d'"' -f2 | sed '/^1\./s///' | cut -d'.' -f1)
if [ $jv -ge 11 ]; then
    exit 0
else
    exit 1
fi