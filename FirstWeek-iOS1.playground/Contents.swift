import UIKit
// higher order functions
var numbers : [Double] = [3.4,4,2,6.5]


var search : ([Double], Double) -> Void =
{ list, searchfor in
    var index = 0
    var found = false
    for num in list {
        if num == searchfor {
            print("The Number \(num) is found in position Number \(index + 1)")
            found = true
        }
        index += 1
    }
    if !found {
        print("The Number is not in the list")
    }
    
}

search(numbers,6.5)





var myFunction = {
    
    return "This is my first clouser in Swift"
}

var clo2 : (Int,Int)->Int = { a, b in
    return a + b
}
// write a clouser that get an array of double and a double number as inputs and search for that number in the array and print its position - no return

clo2(33,44)



func firstFunc () -> String {
    return "This is my first function in Swift"
}
myFunction()
firstFunc()
var name : String? = "Winter 25"
var ios : String? = nil //"iOS1"

numbers.append(33)

for num in numbers {
    print(num)
}



print(numbers)



// not safe
print(name!)

if let courseName = ios {
    print(courseName)
}



var myNumAsString = "99"

var myNumAsInt : Int? = Int(myNumAsString)

if let value = myNumAsInt {
    print(value)

}




var firstInt : Int = 90
var secondInt: Int? = 9999

print(firstInt)
print(secondInt)

// optinal binding == if let
if let goodNum = secondInt {
    var r = firstInt + goodNum
    print(goodNum)
}

// force unwrapping
print(secondInt!)







//


var a :Int = 9
var b : Int = 8
var result = a + b

var College = " Humber"
var semester = "Winter"

var welcomeMessege = "Welcome to \(semester) semester at \(College) College"


var d1: Double = 0.66
var d2: Double = 0.3

var dresult = d1 + d2

var mixOp : Double = Double(b) + d1
var mixOp2 : Int = b +  Int(d1)

print(result, mixOp, mixOp2, separator: "-", terminator: "$$")

if (result > 0) {
    print ( result)
}




func doMath(_ a: Int, secondNum b: Int,TheOp op: String) -> Int{
    var result = 0
    if op == "+"
    {
        result = a + b
    }else if op == "-" {
        result = a - b
    }
    return result
}

doMath(11,secondNum: 12, TheOp: "+")
doMath(2,secondNum: 9,TheOp: "-")





