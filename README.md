# stocks_profit_calculator

What is this?
-------------

In a bear market, the 52 week hith price will be higher than current stock price for example for NASDAQ 100 tech companies which have been down for over a month.


How does it work ?
------------------

The programs look at 'tickers' file and pull the data on each of them as writes to a data.csv file ( Company name, 52 week high, current price ). If for example you can invest in stocks, which company you choose from in order to maximize the profit ?

The program assumes that you invest 1000 USD in a company. It connects to finnhub API and grabs the data and write to data.csv file.


Requirements
------------

*  At least one finnhub API key ( there is a limit on the number of API requests, open multiple browsers and using multiple email accounts, register on finnhub.io )
* python3 for the finnhub api calls and write to data.csv file
* perl to read the data.csv and disaplay the most profitable stock if you were to invest 1000 USD

* edit data.py and replace the token with your finnhub API keys, separated by "," if multiple

Sample output
-------------

TICKER   PRICE         # stocks             Profit on 1000 USD    52_Week_high   Company

QS       ( 57.46 )        17                   1280    (132.73)    Quantumscape Corp

BLDP     ( 23.60 )        42                   1273    (53.9)    Ballard Power Systems Inc

SFIX     ( 50.54 )        19                   1201    (113.7594)    Stitch Fix Inc

TIGR     ( 17.80 )        56                   1159    (38.5)    UP Fintech Holding Ltd

FCEL     ( 13.94 )        71                   1100    (29.4396)    Fuelcell Energy Inc

FUBO     ( 30.09 )        33                   1063    (62.29)    Fubotv Inc

PLUG     ( 36.79 )        27                   1045    (75.49)    Plug Power Inc

XPEV     ( 36.33 )        27                   1030    (74.49)    Xpeng Inc

SPCE     ( 30.93 )        32                   1020    (62.8)    Virgin Galactic Holdings Inc

WISH     ( 16.56 )        60                   977    (32.8499)    ContextLogic Inc

NNDM     ( 9.12  )        109                  956    (17.89)    Nano Dimension Ltd

LMND     ( 95.88 )        10                   924    (188.3)    Lemonade Inc

FSLY     ( 70.78 )        14                   920    (136.5)    Fastly Inc

PLTR     ( 23.26 )        42                   913    (45)    Palantir Technologies Inc

AMC      ( 10.66 )        93                   902    (20.36)    AMC Entertainment Holdings Inc

DASH     ( 131.76)        7                    870    (256.09)    DoorDash Inc

FROG     ( 50.53 )        19                   849    (95.2)    Jfrog Ltd

SNOW     ( 220.00)        4                    836    (429)    Snowflake Inc.

LI       ( 26.37 )        37                   789    (47.7)    Li Auto Inc.

JMIA     ( 38.67 )        25                   780    (69.89)    Jumia Technologies AG

U        ( 97.19 )        10                   778    (174.94)    Unity Software Inc

FUTU     ( 115.26)        8                    712    (204.25)    Futu Holdings Ltd

UWMC     ( 8.44  )        118                  701    (14.38)    UWM Holdings Corp

EBON     ( 8.84  )        113                  690    (14.95)    Ebang International Holdings Inc

LAZR     ( 28.33 )        35                   681    (47.8)    Luminar Technologies Inc

BE       ( 26.58 )        37                   680    (44.95)    Bloom Energy Corp

XM       ( 34.71 )        28                   632    (57.2779)    Qualtrics International Inc

NIO      ( 41.18 )        24                   619    (66.99)    NIO Inc

LSPD     ( 64.00 )        15                   615    (104.98)    Lightspeed POS Inc

