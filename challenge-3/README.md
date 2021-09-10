## Challenge 3
We have a nested object, we would like a function that you pass in the object and a key and get back the value. How this is implemented is up to you.
Example Inputs
object = {"a":{"b":{"c":"d"}}}
key = a/b/c
object = {"x":{"y":{"z":"a"}}}
key = x/y/z
value = a
Hints
We would like to see some tests. A quick read to help you along the way
We would expect it in any other language apart from elixir.


## Solution 
Python Script splits the keys and start parsing nested object accordingly. Read inline comments for explanation in script.

Few inputs I have passed the function and response is - 

```
Object Supplied: {'a': {'b': {'c': 'd'}}}
Keys Supplied: a/b/c
Split Keys = ['a', 'b', 'c']
key a value in nested object: {'b': {'c': 'd'}}
key b value in nested object: {'c': 'd'}
key c value in nested object: d
value of key: d

Object Supplied: {'x': {'y': {'z': 'a'}}}
Keys Supplied: x/y/z
Split Keys = ['x', 'y', 'z']
key x value in nested object: {'y': {'z': 'a'}}
key y value in nested object: {'z': 'a'}
key z value in nested object: a
value of key: a

Object Supplied: {'x': {'y': {'z': 'a'}}}
Keys Supplied: x/y
Split Keys = ['x', 'y']
key x value in nested object: {'y': {'z': 'a'}}
key y value in nested object: {'z': 'a'}
value of key: {'z': 'a'}

Object Supplied: {'x': {'y': {'z': 'a'}}}
Keys Supplied: x
Split Keys = ['x']
key x value in nested object: {'y': {'z': 'a'}}
value of key: {'y': {'z': 'a'}}
```