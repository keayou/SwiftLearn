//
//  TownClass.swift
//  SwiftLearn
//
//  Created by fk on 2021/1/28.
//

import Foundation

struct Town {
    
    static let region22 = "South" //类属性（和具体的类型实例无关, 在同类型实例间共享，这类属性适合存储对于所有实例来说都相同的信息）
    
    let region = "South"//常量 只读存储属性
    let region33: String//也可以在初始化过程中初始化常量属性（见init）

    var population = 5_422 //变量 读写存储属性
    var numberOfStoplights = 4
    
    enum Size {// 嵌套类型
        case small
        case medium
        case large
    }
    
    var sizee: Size = .large
    
    var value11: Int
    
    //懒加载属性： 首次调用时才进行初始化操作 (初始化闭包里可以使用self访问自身的相关属性，因为是lazy loading,所以访问sizee22这个属性的时候，self肯定是存在的)
    //懒加载属性只会在第一次调用的时候执行闭包，后续调用不会再执行闭包（也就是说即使后面self.population的大小变了，sizee22的值不变，除非给sizee22重新赋值 ）
    lazy var sizee22: Size = {
        
        switch self.population {
        case 0...1000:
            return .small
        case 1001...10000:
            return .medium
        default:
            return .large
        }
    }() //lazy需要和()一起使用  确保在第一次调用这个属性的时候调用闭包并将结果赋给它
    

    lazy var value22: Int = {
        return 2
    }()

    // 只读计算属性(只读属性)
    var townSize: Size {
        get {
            switch self.population {
            case 0...1000:
                return .small
            case 1001...10000:
                return .medium
            default:
                return .large
            }
        }
    }
    
    // 只读计算属性 --
    var vicit22: Int {
        return 50  // 只有get时 可以省略get
    }
    
    // 读写计算属性
    var vicit: Int {
        get {
            return 50
        }
        set (newVicit) {
            population = newVicit + 20
        }
    }
    
    var population22 = 5000 {//属性观察
        willSet {
            print("population22 will change to \(newValue)")
        }
        didSet {
            print("population22 did change to \(population22) from \(oldValue) ")
        }
    }
    
    var de: String
    
    
    init(val: Int, deVa: String) {
        self.value11 = val
        self.region33 = "dsd"
        de = deVa
    }
    init(val: Int) {
        self.init(val: val, deVa: "default")//委托初始化
    }
    
    init(_ val: Int) {// 省略外部参数名 可以直接这样调用 let myTown2222 = Town(23)
        self.init(val: val, deVa: "default")//委托初始化

    }
    
//    init?(val: Int, deVa: String) {//可失败的初始化方法 返回的是可空实例 如果参数不满足什么情况就不生成实例可以用这个方式
//        guard deVa.count < 0 else {
//            return nil
//        }
//        self.region33 = "sd"
//        self.value11 = 12
//        de = deVa
//    }
//
//    init?(val: Int) {
//        self.init(val: val, deVa: "default")//委托初始化
//    }
    

    
    func printDescription() -> () {//结构体的实例方法
        print("Population: \(population), Stoplights: \(numberOfStoplights)")
    }
    func printDescription2(str: String) -> () {//结构体的实例方法
        print("Population: \(population), Stoplights: \(numberOfStoplights), str: \(str)")
    }
    
    mutating func changePopulation(by amount: Int) {//如果结构体的一个实例方法要修改结构体的属性，就必须标记为mutating
        population += amount
    }
    
    mutating func changeTo(firstName: String, lastName: String) {//如果结构体的一个实例方法要修改结构体的属性，就必须标记为mutating
        population = 1232
    }
    
    static func numberOfRoads() -> Int {//结构体的类型方法（类方法）
        return 10
    }
    
}
