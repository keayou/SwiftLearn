//
//  EquatableComparable.swift
//  SwiftLearn
//
//  Created by fk on 2021/3/3.
//

import Foundation

infix operator +++ // 声明一个自定义的中缀运算符 （ 和 +、 -、 ==、 >、 <、 != 这些类似，这些是Swift已经声明了的   ）  page:291 自定义运算符


struct Point: Equatable, Comparable {

    
    
    let x: Int
    let y: Int
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.x == rhs.x && lhs.y == lhs.y
    }
    
    static func < (lhs: Point, rhs: Point) -> Bool {
        
        return lhs.x < rhs.x && lhs.y < lhs.y
    }
    
    static func + (lhs: Point, rhs: Point) -> Point {
        let p = Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
        return p
    }
}

class EquatableComparablePerson: Equatable {
    static func == (lhs: EquatableComparablePerson, rhs: EquatableComparablePerson) -> Bool {
        return true
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        
        self.name = name
        self.age = age
        
    }
    
    
}

class EquatableComparableTest {
    
    func test() {
        
        
        let a = Point(x: 3, y: 4)
        let b = Point(x: 3, y: 4)
        
        let adEqual = (a == b) //adEqual == true
        let adNotEqual = (a != b)// adNotEqual == false 虽然Point结构体里没有实现 != 方法  只实现了 == 方法， 但是实现了 == ，!= 也可以使用了

        if adEqual {
            print(" adEqual is true!! ")
        } else {
            print(" adEqual is false!! ")

        }
        
        let c = a + b
        
        let p1 = EquatableComparablePerson(name: "fk", age: 20)
        let p2 = EquatableComparablePerson(name: "zp", age: 18)
        
        let list: Array<EquatableComparablePerson> = [p1, p2]
        
        list.firstIndex(of:p2)
        
        

        
        
        
    }
    
    
}
