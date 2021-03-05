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
    
    typealias NetWorthChanged = (Double) -> Void
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    
//    var <#name#> = <#value#>
    
    
    
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

class MonsterPerson {
    
    let monster = Monster(sex: "male")
    
    init() {
        
        monster.netWorthChangedHandler = {
            [weak self] money in //[weak self]：捕获列表. 告诉编译器弱引用捕获self
            self?.didChange(money)
        }
        
    }
    
    func didChange(_ money: Double) {
        
        print(money)
        
    }
    
    func worthChangedHandler(handler: @escaping (Double) -> Void) -> Void {// 没有@escaping的话，handler 不可以赋值给monster.netWorthChangedHandler。 因为默认函数参数形式声明的闭包（handler）是非逃逸的（也就是这个闭包不会在出了函数作用域以外被使用，这个闭包内部可以直接使用self，也就是这个闭包不会被任何类型强引用），但是netWorthChangedHandler是个逃逸闭包，是被强引用的，所以要把非逃逸闭包赋值给逃逸闭包时需要使用 @escaping。  告诉使用者  这个闭包会逃逸，所以handler内需要注意有没有造成循环引用的情况
        
        monster.netWorthChangedHandler = handler
    }
    
    
}
