import requests

url = 'https://quotes.rest/qod'
response = requests.get(url)

if response.ok:
    json = response.json()
    print(json)
    citat = json['contents']['quotes'][0]['quote']
    print("---------------")
    print(citat)
else:
    print("Neuspesno dovlacenje citata.")