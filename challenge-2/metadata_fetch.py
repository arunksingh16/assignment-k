#!/usr/bin/env python

import json
from json import JSONDecodeError
import requests

results = requests.get("http://169.254.169.254/metadata/instance/compute?api-version=2021-01-01&format=json",
    headers={'Metadata': 'true'},
)
#dataObj = results.json()

try:
    jdata = json.loads(results.text)
    print(f'Loading full response: {json.dumps(jdata,indent=1)}')

except JSONDecodeError as err:
    print("Something is wrong ! Please check")
    print(err.msg)
    print(err.lineno, err.colno)

keyv = input("Enter a key value: \n")

def jsonvalue(d, key):
    for k, v in d.items():
        # The items() method returns a view object. The view object contains the key-value pairs of the dictionary, as tuples in a list.   
        if k == key:
            yield v
            # yield is a keyword that is used like return, except the function will return a generator. The isinstance() function returns True if the specified object is of the specified type, otherwise False.
            
        elif isinstance(v, dict):
            for id_val in jsonvalue(v, key):
                yield id_val

if __name__ == '__main__':
    for i in jsonvalue(jdata, keyv):
        print(i)