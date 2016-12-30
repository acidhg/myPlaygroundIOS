//: Playground - noun: a place where people can play

import UIKit

var arr1 = [1,2,3]
let arr2 = ["a", "b", "c"]
let arr3 = [4,5,6]
var arr6 = [1,2,3]
let joined = [arr1, arr3].joined()
print(arr2[1])
print(arr2[1..<2])
print(joined)
var a = 1
var b = 1
var arr7 = Array([1,2,3])


let idx = arr2.index(of: "b")
print(type(of: idx))
let idx2 = idx?.advanced(by: 1)
print(arr2[idx2!])
print(arr2[idx!+1])

let arr4 = arr2.reversed()
let idx5 = arr4.index(of: "b")
print(type(of: idx5))


let str = "Hello"
let idx3 = str.characters.index(of: "l")
print(str[idx3!])
print(type(of: idx3))
let idx4 = str.startIndex
print(type(of: idx4))
//str[advance(idx4, 1)]
print(str[str.index(idx4, offsetBy: 2)])

let dict = [1:"a", 2:"b", 3:"c"]
let keys = dict.keys
print(dict[2]!)
print(dict[dict.keys.index(dict.keys.startIndex, offsetBy: 2)])
print(dict[keys.first!]!)