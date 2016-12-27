//: Playground - noun: a place where people can play

import UIKit

protocol MyProtocol {
    static func protoFunc()
}

class MyClass{
    static var classValue = "100 won"
    class func myFunc(){
        print("myClass")
    }
    class func myFunc2() {
        print("See this")
    }
    class func myFunc3() {
        print("I got \(classValue)")
    }
}

protocol Initable {
    init()
}
final class MyOtherClass: MyClass, MyProtocol, Initable {
    override class func myFunc(){
        print("myOtherClass")
    }
    class func myFunc4(){
        classValue += " and 200 won"
        myFunc3()
        print("Now I got \(classValue)")
    }
    class func protoFunc() {
        print("this is a proto function")
    }
    
    var num = 0
    func increase(add: Int) {
        num += add
    }
}


var x: MyClass = MyOtherClass()
MyOtherClass.myFunc2()
MyOtherClass.myFunc3()
MyOtherClass.myFunc4()
type(of: x).myFunc() //myOtherClass
print(type(of: x))
x = MyClass()
type(of: x).myFunc() //myClass
var y: MyProtocol = MyOtherClass()
print(type(of: y))

var w = MyOtherClass()
var z = type(of: w)
print(type(of: z))
print(type(of: MyOtherClass.self))
print(type(of: w))

func generate<T: Initable>(type: T.Type) -> T {
    print("how is \(T.self)")
    return type.init()
}

let xx:MyOtherClass = generate(type: MyOtherClass.self)
print("xx is \(type(of: xx))")
