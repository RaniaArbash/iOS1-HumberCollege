import UIKit

protocol Drawable{
    func draw()
}

class Shape {
    var name: String = ""
}
class Circle : Shape , Drawable{
    var rad: Int
    init (r : Int){
        rad = r
    }
    func draw() {
        print("draw one circle")
    }
}

class Rectangle : Shape{
    var width: Int
    var height: Int
    
    init(w: Int, h: Int){
        width = w
        height = h
    }
}
