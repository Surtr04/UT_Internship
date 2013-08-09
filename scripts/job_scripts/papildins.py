#! /usr/bin/python

import glob
import csv
import os
import sys
import re

folder = sys.argv[-1]
list = os.listdir(folder)

rex = 'gmetis_(\d+)_(\d+)' 
edgecut = '.+PAPI_LD_INS,\d+,(\d+),.+'
parse = re.compile(rex)
edgeparse = re.compile(edgecut)

db = dict()

for i in list:
    elements = parse.match(i)
    partition, thread = elements.groups()
    try:
        if db[partition] == None:
            db[partition] = dict()
    except:
        db[partition] = dict()
    path = folder + '/' + i
    with open( path, 'r') as file:
        for line in file:
            edgeCut = edgeparse.match(line)
            if edgeCut != None:
                edgeValue = edgeCut.groups()
                db[partition][thread] = edgeValue[0]

for key, value in db.items():
    with open('papildins_' + key + '.csv', 'w') as file:
        data = [[edgeK, value[edgeK]] for edgeK in sorted(value, key=int)]
        writer = csv.writer(file,delimiter=',')
        writer.writerows(data)
