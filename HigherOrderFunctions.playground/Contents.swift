import UIKit



var myfunction = {(a: Int, b: Int)->Int in return a + b }

func doMath(a: Int, b: Int, op: (Int,Int)->Int) -> Int{
    
    return op(a,b)
    
}


doMath(a: 22, b: 33) { a, b in
    return a + b
}
doMath(a: 19, b: 20) { a, b in
    return a - b
}

func printNumbers(array: [Int]){
    for number in array {
        print (number)
    }
}
var numbers = [22,44,66,2,1,8,9,21,0,6]

numbers.filter { num in
    return num < 10
}

numbers.filter { $0 < 10 }
numbers.filter { $0 % 2 != 0}

var newNumbers =  numbers.map { num in
    return num * 2
}

numbers.map { $0 * 2}





printNumbers(array: newNumbers)

var numbersAsStrings =  numbers.map { num in
    return "\(num)"
}

