//
//  MonsterClass.swift
//  SwiftLearn
//
//  Created by fk on 2021/1/28.
//

import Foundation

class Monster {
    
    var town: Town?
    var name = "Monster"

    var sex: String
    
    
    static let spookeyNoise22: String = "qqq222"//静态属性
    
    //类也有存储类属性和计算类属性
    static var spookeyNoise: String = "qqq"//类属性（存储类）

    class var spookeyNoise2: String {//类属性（计算类）(和static声明的类属性不同的是，通过class修饰的类属性子类可以提供自己的实现 见：ZombieClass.swift)
        return "Brains..."
    }
    
    required init(sex: String) {//类的必需初始化方法 一个类可以要求其子类提供特定的初始化方法
        self.sex = sex
    }
    
//    required init() {
//        self.init(sex: "male")
//    }

    func terrorizeTwon() {// 类的实例方法
            
        if town != nil {
            print("\(name) is terrorizing a twon!!")
        } else {
            print("\(name) hasn't found a twon to terrorize..")
        }
    }
    
}
