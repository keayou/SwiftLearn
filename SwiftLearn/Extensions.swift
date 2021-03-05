//
//  Extensions.swift
//  SwiftLearn
//
//  Created by fk on 2021/3/1.
//



import Foundation

typealias Velocity = Double //typealias 可以给类型起别名

extension Velocity {
    
    var kph: Velocity { return self * 1.6 }
    var mph: Velocity { return self }

    
}

protocol Vehicle {
    var topSpeed: Velocity { get }
    
}

struct Car {
    let make: String
    let model: String
    let numberOfDoors: Int
    
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "new value must 0.0 <= newValue <= 1.0")
        }
    }
    
}

extension Car: Vehicle { // 可以用扩展使类型符合协议
    
    var topSpeed: Velocity {
        return 200
    }
    
    
    enum Kind { // 扩展中可以添加嵌套类型
        case coupe, sedan
    }
    
    var kind: Kind {
        if numberOfDoors == 2 {
            return .coupe
        } else {
            return .sedan
        }
    }
    
    
    
    init(make: String) {
        self.init(make: make, model: "N/A", numberOfDoors: 2, gasLevel: 0.5)
    }
    
    mutating func fillGas() { // 这里之所以曦尧matating 是因为Car是个结构体，要改变结构体的属性就必须用mutating关键字声明
        gasLevel = 1.0
    }
    
    
    
}

class ExtensionsTest {
    
    
    var lost: Array<Any>
    
    var de: Double = 5.2
    
    init() {
        lost = []
    }
    
    func test(velo: Double) {
        print(velo.kph)
    }
    
    
}
