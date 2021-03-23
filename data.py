#!/usr/bin/python3

import requests
import json
from pprint import pprint
import time
import os

import random

requests.packages.urllib3.disable_warnings()

# This is where the finnhub API key goes
tokens = ['c0......', 'c1.......']
########################################

token = random.choice(tokens)

# FinnHUB personal token
#if os.environ.get('token') is None:
#    print ("env token does not exist. Please set 'export token=....' to your finnhub.io free key")
#    exit(1)
#else:
#    token = os.environ.get('token')

# Using readlines()
file1 = open('tickers', 'r')
Lines = file1.readlines()

# Strips the newline character
for symbol in Lines:
    print("\nPulling data on {} ...".format(symbol.strip()))

    symbol = symbol.strip()
    base_url = 'https://finnhub.io/api/v1/stock/metric?'
    r = requests.get(base_url, params = {'symbol': symbol, 'token':token,'metric':'price'})
    text = r.text
    company_basic_financials = json.loads(text)
    #pprint(company_basic_financials)
    rjson = json.loads(text)
    high = rjson['metric']['52WeekHigh']
    time.sleep(4)

    base_url = 'https://finnhub.io/api/v1/quote?'
    r2 = requests.get(base_url, params = {'symbol': symbol, 'token':token,'metric':'price'})
    rcontent = (r2.content)
    rjson = json.loads(rcontent)
    current = rjson['c']
    #print("FSLY,","0,",str(current),"," , high )
    #print(symbol + ",0," + str(current) + "," + str(high) )
    time.sleep(4)

    base_url = 'https://finnhub.io/api/v1/stock/profile2?'
    r2 = requests.get(base_url, params = {'symbol': symbol, 'token':token})
    rcontent = (r2.content)
    rjson = json.loads(rcontent)
    name = rjson['name']
    #print (name)

    line = symbol + ",0," + str(current) + "," + str(high) + "," + name
    print (line)
    with open("data.csv", "a") as file_object:
        file_object.write(line + "\n")

    # Slow down API requests as we are limited
    time.sleep(4)



