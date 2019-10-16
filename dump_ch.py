#!/usr/bin/env python3
# coding: utf-8

import lxml.html
import requests
import time
import json
import sys

url = "https://ecsc.eu/leaderboard"

tree = lxml.html.fromstring(requests.get(url).content)

scores = tree.xpath("//table/tbody/tr/td/div/span[@class='progress-number']/text()")
teams = tree.xpath("//table/tbody/tr/td/div/span[@class='liveboard-country']/text()")

data = ""

for score, team in list(zip(scores, teams)):
    data += json.dumps({
        'timestamp': int(time.time()),
        'team': team,
        'score': score
    }) + '\n'

print(data)

r = requests.post("http://localhost:8123", params={
        'query': 'INSERT INTO scoreboard FORMAT JSONEachRow'},
        data=data)

print(r)
print(r.text)

