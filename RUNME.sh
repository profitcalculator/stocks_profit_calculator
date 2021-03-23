rm -f data.csv
#vim tickers
cat tickers | sort | uniq | egrep -v "^$" > tickers.tmp
mv -f tickers.tmp tickers

python3 data.py

perl ./data.pl data.csv 1000 | head -n 45


