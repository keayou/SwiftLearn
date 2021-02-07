//
//  ZombieClass.swift
//  SwiftLearn
//
//  Created by fk on 2021/1/28.
//

import Foundation

class Zombie: Monster {
    
    override class var spookeyNoise2: String {//覆盖父类的类属性
        return "Zombie - Brains..."
    }
    
    var walksWithLimp = true
    
    private var isFallingApart = true//本类中可使用
    
    internal private(set) var isFallingApart22 = true //内部可写  外部只能读
    private(set) var isFallingApart33 = true//和上面一样， 只是省略了默认值internal

    private(set) var isFallingApart44: Bool


    init(fallingApart: Bool, sex: String) {//指定初始化方法
        
        isFallingApart44 = fallingApart
        super.init(sex: sex)

    }
    
    convenience init(fallingApart: Bool) {//便捷初始化方法 里面必须调用指定初始化方法
        self.init(fallingApart: fallingApart, sex: "sd")
    }
    
    required init(sex: String) {//父类要求的指定初始化方法
        isFallingApart44 = false
        super.init(sex: sex)
    }
    
    deinit {
        print("Zombie of \(name) has been deinit")
    }
    
    

    
    final override func terrorizeTwon() {//override 表示这个方法是重写的父类的方法，final 表示这个方法禁止Zombie的子类再进行重写
        
        town?.changePopulation(by: 20)
        
        if !isFallingApart {
            town?.changePopulation(by: 10)
        }
        
        if var terrorTwon = town {//town是个结构体  这样子赋值属于值传递，也就是改变terrorTwon属性的值，不影响town
            
            terrorTwon.changePopulation(by: 30)
            
            print(terrorTwon.population) //5472
            print(town?.population as Any)//5442
        }
        
    }

    
    class func makeSpookyNoise() -> String {// 类的类型方法（类方法）
        return "Brains..."
    }

    final class func makeSpookyNoise22() -> String {// 类的类型方法（类方法） 用final标记表示这个类方法不能被子类覆盖
        return "Brains..."
    }
    
    static func makeSpookyNoise33() -> String {//这也是类方法  用static标记也表示这个类方法不能被子类覆盖
        return "Brains..."
    }
    
    
    
}
