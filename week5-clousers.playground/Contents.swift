import UIKit


// Lab Work
//Create a function transformArray that:
//    •    Accepts an array of integers ([Int]).
//    •    Accepts a trailing closure that defines how each element should be transformed.
//    •    Returns a new array with transformed values.
//
//
//
//Call transformArray with different closures to:
//    •    Double each number
//    •    Convert each number to a string
//    •    Get the square of each number

func add(a : Int, b: Int) -> Int{
    return a + b
}

func sub(a : Int, b: Int) -> Int{
    return a - b
}
func times(a : Int, b: Int) -> Int{
    return a * b
}
func div(a : Int, b: Int) -> Int{
    return a / b
}

func doMath(num1: Int = 33, num2: Int = 22, op: (Int,Int)->Int = add) -> Int{
    return op(num1, num2)
}

doMath(num1: 33, num2: 44, op: times)
doMath(num1: 100, num2: 67) { num1, num2 in
    return num1 % num2
}
doMath()





var myfirstFunction = {(a: Int, b: Int) -> Int in
        return a + b
}

var sayHello = {() -> Void in
        print("Hello")
}


myfirstFunction(22, 33)
sayHello()
