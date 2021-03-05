//
//  Enumerations.swift
//  SwiftLearn
//
//  Created by fk on 2021/1/27.
//

import Foundation

protocol Toggleable{
    mutating func toggle()
}

enum Lightbulb: Toggleable {
    
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}



enum TextAlignment {
    case left
    case right
    case center
    
}

enum TextAlignment2: Int {
    case left   = 10
    case right
    case center
    case justify

    
    func createAlignmentName() -> String {
        
        switch self {
        case .left:
            return "i am left"
        default:
            return "i am not left"
        }
    }
    
    mutating func changeAlignment() {
        switch self {
        case .left:
            self = .right
        case .right:
            self = .left
        case .center:
            self = .justify
        case .justify:
            self = .center
        }
    }
}

enum ShapeDimensions {
    case square(side: Double)
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case let .rectangle(width: w, height: h):
            return w * h
        case let .square(side: w):
            return w * w
        }
    }
}

indirect enum FamilyTree {//当枚举的关联值类型是这个枚举本身的时候，需要用indirect告诉编译器把枚举的数据放到一个指针指向的地方。（也就是说，关联的值的指针引用的，不然存在递归引用，编译器无法确定这个枚举的内存大小) page:133,递归枚举
    case noKnowParents
    case oneKnowParents(name: String, ancestors: FamilyTree)
    case twoKnowParents(fName: String, fAncestors: FamilyTree, mName: String, mAncestors: FamilyTree)
}
enum FamilyTree2 {
    case noKnowParents
    indirect case oneKnowParents(name: String, ancestors: FamilyTree2)
    indirect case twoKnowParents(fName: String, fAncestors: FamilyTree2, mName: String, mAncestors: FamilyTree2)
}
// FamilyTree 和 FamilyTree2 是一样的




class TypeClass: NSObject {
    
    var squareShape: ShapeDimensions
    
    
    override init() {
        self.squareShape = ShapeDimensions.square(side: 10)
    }
    
    func insFunction() {
        
        var alignment = TextAlignment.left
        alignment = .right
        print(alignment)
        
        var ali: TextAlignment
        ali = .center
        print(ali)
        
        switch alignment {
        case .center:
            print("it's center")
        case .left:
            print("it's left")
        case .right:
            print("it's right")
        }
        
        
        let ali2 = TextAlignment2.right
        if ali2.rawValue == 11 {
            print("qqqq")
        }
        
        let myRawVal = 12
        if let myAli = TextAlignment2(rawValue: myRawVal) {
            print("converted OK: \(myAli)")
        } else {
            print("converted FALSE")
        }
        
        let alignment2 = TextAlignment2.left
        print(alignment2.createAlignmentName())
        
        var alignment3 = TextAlignment2.right
        alignment3.changeAlignment()
        print(alignment3)
        
        
        squareShape = ShapeDimensions.square(side: 10.0)
        squareShape = ShapeDimensions.rectangle(width: 11, height: 22)

        switch squareShape {
        case let .square(side: side):
            print("\(squareShape) \(side)")
        case let .rectangle(width: width, height: height):
            print("\(squareShape) \(width) \(height)")
        }
        
        print(squareShape.area())
        
        let fredAncestors = FamilyTree.twoKnowParents(fName: "f.f", fAncestors: .noKnowParents, mName: "f.m", mAncestors: .oneKnowParents(name: "f.m.m", ancestors: .noKnowParents))
        print(fredAncestors)
        
        
        
    }
    
}
