#!/usr/bin/env python

def nestedObj(objdata,key):
    # splitting the key
    print(f'Object Supplied: {objdata}')
    print(f'Keys Supplied: {key}')
    keys = key.split("/")
    # printing keys value
    print(f'Split Keys = {keys}')
    for k in keys:
        # list key values
        print(f'key {k} value in nested object: {objdata[k]}')
        # setting rest of the nested object
        objdata=objdata[k]
    # returning the object
    return objdata

# varifying the scenerios

objdata = {"a":{"b":{"c":"d"}}}
key1 = "a/b/c"
test1 = nestedObj(objdata,key1)
print(f'value of key: {test1}')

objdata = {"x":{"y":{"z":"a"}}}
key1 = "x/y/z"
test1 = nestedObj(objdata,key1)
print(f'value of key: {test1}')

objdata = {"x":{"y":{"z":"a"}}}
key1 = "x/y"
test1 = nestedObj(objdata,key1)
print(f'value of key: {test1}')

objdata = {"x":{"y":{"z":"a"}}}
key1 = "x"
test1 = nestedObj(objdata,key1)
print(f'value of key: {test1}')