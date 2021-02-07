//
//  ViewController.swift
//  SwiftLearn
//
//  Created by fk on 2021/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("sdsds")

        var num: Int = 4
        num += 4
        print(num)

        let labl = UILabel.init()
        labl.text = "dsdsssssssssssssssssse"
//        labl
        self.view.addSubview(labl)
        
        let labl2 = labl
        
        if labl === labl2 {
            print("ddddd")
        } else {
            print("qqqqq")
        }
        
        let a = 10
        
        var z = 120 + a
        
        z = 131
        print(z)
        switch z {
        case 130:
            print("a")
        case 120...140:
            print("b")
        default:
            print("c")
        }
        
        
        let rang = 5...(Int.max - 1)
        let num2: Int = Int.max
        
        print(num2)
        if rang.contains(5)  {
            print("d")
        }
        
        
        
        let point = (x: 1, y: 4)
        
        switch point {
        case var q1 where (point.x > 0) && (point.y > 0):
            q1.x = 4
            print("\(q1) is me!")
        default:
            print("bbbbb")
        }
        
        let aAcute = "\u{0061}\u{0301}"
        print(aAcute)
        
        for _ in 0...3 {
            print("this is FOR!")
        }
        
        for i in 0...2 {
            print("this is FOR_\(i)")
        }
        
        
        let str = "helqo!evrtyu"
        
        for c: Character in str {
            print("'\(c)'")
        }
        
        
        let sidx = str.index(str.startIndex, offsetBy: 3)
        let eidx = str.index(str.startIndex, offsetBy: 6)
        
        print(str[sidx...eidx])
        
        let empty = ""
        if empty.count <= 0 {
            print("empty")
        }
        let s = empty.startIndex
        let e = empty.endIndex
        if s == e {
            print("empty 222")
        }
        
        var codeStr: String? = "sdsd"

        if codeStr != nil {
            let str = codeStr! // 区分let str2 = codeStr 后者没有强制展开，所以str2的类型是 String?， 前者有强制展开，str的类型是String
            print(str)
        }
        if let str = codeStr {//可空实例绑定
            print(str)
        }
        print(codeStr!)
        
        codeStr = nil
        print(codeStr as Any)

        var errorCodeString: String?
        errorCodeString = "404"
        if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
            print(theError)
//            if let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
                print("\(theError): \(errorCodeInteger)")
//            }
        }
        
        
        let des = errorCodeString ?? "defalut" //nil合并运算符 ： errorCodeString必须为可空实例
        print(des)

        let list2: [String] = []
        let list3 = ["a"]
        let list4 = Array<Any>()
        print(list2,list3,list4)

        var list: Array<String> = []
        
        list.append("dd")
        list.append("cc")
        list.append("ee")
        list.append("qq")

        list.remove(at: 0)
        print(list[0...2])
        
        print(list[0])
        
        
        var dict2 = Dictionary<String, String>()
        dict2["q"] = "p"
        print(dict2)
        
        var dict3 = Dictionary<String, Any>()

        let dict4 = ["a": "e", "b": "c", "c": "q"]
        print(dict4)
        
        var dict:Dictionary<String, String> = [:]
        dict["ss"] = "qq"
        
        let val = dict["sss"]
        print(val as Any)
        
        let oldVal = dict.updateValue("q", forKey: "ss")
        print(oldVal!)
        
        var hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]

        if let oldValue = hues.updateValue(18, forKey: "Coral") {
            print("The old value of \(oldValue) was replaced with a new one.")
        }
        // Prints "The old value of 16 was replaced with a new one."
        if let oldValue = hues.updateValue(330, forKey: "Cerise") {
            print("The old value of \(oldValue) was replaced with a new one.")
        } else {
            print("No value was found in the dictionary for that key.")
        }
        // Prints "No value was found in the dictionary for that key."
        
        dict["ss"] = nil
        
        for (a, b) in dict4 {
            print(a + "+" + b)
        }
        
        let arr = Array(dict4.keys)
        let arr2 = dict4.keys
        print(arr)
        print(arr2)
        
        var setBag = Set<String>()
        setBag.insert("dede")
        setBag.insert("qqqq")
        
        let set2 = Set(["qqq","qwwww"])
        for val in set2 {
            print(val)
        }
        
        var ran: Any
        ran = "ranran"
        print(ran)
        
        
        self.printGreeting()
        self.printPersonGreeting(name: "fengke")
        self.printHello(to: "FK")
        self.sayHello(to: "fk2","fkk","ZZ")
        
        self.sayGreeting(to: "KK", withSentence: "hao")
        self.sayGreeting(to: "FF")
        
        var name = "ffffkkkkk"
        self.createGreetingWord("哈哈哈", to: &name)
        print(name)
        
        let creWord = self.createWordwith(word: "dedee")
        print(creWord)
        
        let res = areaOfTriangleWith(base: 20, height: 10)
        print(res)
        
        let tuple = self.sortedEvenOddNumbers([4, 56, 32, 76, 55, 88])
        print(tuple)
        
        let evenoddFunc: ([Int]) -> ([Int], [Int]) = self.sortedEvenOddNumbers // 可以将函数赋值给一遍变量/常量,([Int]) -> ([Int], [Int]) 是函数类型
//        let evenoddFunc: ([Int]) -> (sw: [Int], de: [Int]) = self.sortedEvenOddNumbers
        let tuple2 = evenoddFunc([56, 76, 333, 66, 42, 98])
        print(tuple2)

        
        let middleName = self.grabMiddleName(fromFullName: ("ke", nil, "feng"))
        if let name = middleName {
            // 不执行
            print(name)
        }
        self.greetByMiddleName(fromFullName: ("ke", nil, "feng"))
        
        
        let result = self.siftBeans(fromGroceryList: ["green beans",
                                                      "milk",
                                                      "black beans",
                                                      "pinto beans",
                                                      "apples"])
        print(result.beans)
        print(result.others)
        
        var volunteerCounts = [1,3,40,32,2,53,77,13]
        volunteerCounts.sort { (i, j) -> Bool in
            i < j
        }
        print(volunteerCounts)
        
        let volunteerCounts2 = [1,3,40,32,2,53,77,13]
        let reslutList = volunteerCounts2.sorted { (i: Int, j: Int) -> Bool in
            i < j
        }
        print(volunteerCounts2)
        print(reslutList)

        let reslutList2 = volunteerCounts2.sorted(by: {i, j in i < j})
        print(reslutList2)

        let reslutList3 = volunteerCounts2.sorted { $0 < $1 }//如果一个闭包是以一个函数的最后一个参数传递的，那么它就可以在函数的圆括号以外内联。因为sorted(by:)只接受一个参数，所 以根本不需要圆括号。之所以可以省略闭包的参数名，是因为尾部闭包语法允许这么做。
        print(reslutList3)

        
        let townFunc = maketowngrand()
        let stoplights = townFunc(4, 4)
        print(stoplights)
        
        
        let currentPopulation = 5_422
        let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
        growBy(500)
        let curr = growBy(500)
        print(currentPopulation)
        print(curr)
        
        let currentPopulation2 = 6_422
        let growBy2 = makePopulationTracker(forInitialPopulation: currentPopulation2)
        let curr2 = growBy2(100)
        print(curr2)
        // 以上growBy 和 growBy2 分别是两个引用类型  growBy的重复调用只影响growBy 不影响growBy2  即 闭包是类型引用: 当你把函数赋给常量或变量时，实际上是在让这个常量或变量指向这个函数。我们并没有为这个函数创建新的副本。这个事实的一个重要结果 是，如果通过新的常量或变量调用这个函数，那么其作用域捕获的任何信息都会改变。
        
        /*
         Swift 采用可函数式编程, 函数是一等公民，可以作为参数和返回值,以及赋值给其他变量/常量
         Swift 还提供了一些高阶函数 sorted(by:)、map(_:)、filter(_:)和reduce(_:_:)。
         */
        
        let populations = [1024, 2048, 4036]
        //map 的操作是遍历这个数组，处理后返回一个新数组
        let projectedPo = populations.map { (population: Int) -> String in
            return "\(population)人"
        }
        print(projectedPo)
        
        //filter 的操作是遍历整个数组, 处理后返回过滤后的值组成的数组（即新数组元素可能会比原数组少）
        let bigPo = populations.filter { (population: Int) -> Bool in
            return population > 2000
        }
        let bigPo2 = populations.filter { $0 > 2000 }
        print(bigPo)
        print(bigPo2)

        //reduce 的操作是遍历整个数组, 每一次可以获得上一次闭包的结果，需要给一个初始值（例子中的20 和 0，accumulatedProjection就是上一次的结果，precinctProjection是本次循环的值），最终得到一个值作为返回
        //Returns the result of combining the elements of the sequence using the given closure.(返回按序通过闭包把所有元素结合后的结果)
        let totalProjection2 = populations.reduce(20) { (accumulatedProjection: Int, precinctProjection: Int) -> Int in
            return accumulatedProjection + precinctProjection
        }
        let totalProjection = populations.reduce(0) { (accumulatedProjection: Int, precinctProjection: Int) -> Int in
            return accumulatedProjection + precinctProjection
        }
        let totalProjection3 = populations.reduce(0) { $0 + $1 }
        print(totalProjection2)
        print(totalProjection)
        print(totalProjection3)

        print("------------------------------------")

        let enuClass = TypeClass()
        enuClass.insFunction()
        
        var myTown = Town(val: 50, deVa: "dsds")
        let townSize = myTown.sizee22
        myTown.printDescription()
        print(townSize)
//        print("my town population is \(myTown.population)")
        
        myTown.vicit = 100
        print(myTown.vicit)
        print(myTown.population)

        myTown.population22 = 10000
        
        let myTown2222 = Town(23)
        print(myTown2222.value11)

        
        let genericMonster = Monster(sex: "male")
        genericMonster.town = myTown
        genericMonster.terrorizeTwon()
        
        Monster.spookeyNoise = "qweqwee"
        print(Monster.spookeyNoise)//调用类的类属性
        print(Monster.spookeyNoise2)//调用类的类属性

        let zombie = Zombie(fallingApart: true, sex: "female")
        zombie.name = "monster111"
        zombie.town = myTown
        zombie.terrorizeTwon()
        zombie.town?.printDescription()
        
        var zombie2: Zombie? = Zombie(sex: "sd")
        zombie2?.name = "monster222"
        zombie2?.terrorizeTwon()
        zombie2 = nil
        
        
        print(Zombie.spookeyNoise2)//调用类的类属性(子类有覆盖父类的类属性)
        
        Zombie.spookeyNoise = "sds"
        print(Monster.spookeyNoise)//调用类的类属性(子类有覆盖父类的类属性)

        
        let roads = Town.numberOfRoads()//结构体的类方法的调用
        print(roads)
        let lan = Zombie.makeSpookyNoise()//类的类方法的调用
        print(lan)
        
        myTown.changePopulation(by: 11)
        print(myTown.population)
        
        print("------------------------------------")

        ValueVsRefs()
        
    }
    
    
    func printGreeting() {
        print("Greeting!!22")
    }
    
    func printGreeting(nsame: String) {
        print("Greeting!!")
    }
    
    func printPersonGreeting(name: String) {
        print("\(name) PersonGreeting")
    }
    
    func printHello(to name: String) {
        print("\(name) hello")
    }
    
    func sayHello(to names: String...) {//变长参数
        for name in names {
            print("\(name) say Hello")
        }
    }

    func sayGreeting(to name: String, withSentence sen:String = "nihao") {//参数默认值
        print("\(name) \(sen)")
    }
    
    func createGreetingWord(_ word: String, to name: inout String) {//inout 指针传递
        name = "nihao \(name), \(word)"
        print(name)
    }
    
    func createWordwith(word: String) -> String {
        return "\(word) 456798"
    }
    
    func areaOfTriangleWith(base: Double, height: Double) -> Double {//嵌套函数
        
        let numerator = base * height
        func divide() -> Double {
            return numerator / 2
        }
        return divide()
    }
    
    func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {//多个返回值，可通过元组的方式返回
        
        var evens = [Int]()
        var odds: [Int] = []
        
        for number in numbers {
            if number % 2 == 0 {
                evens.append(number)
            } else {
                odds.append(number)
            }
        }
        return (evens, odds)
    }
    
    func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
        return name.1
    }
    
    func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
       
        guard let middleName = name.middle else {//如果某些条件没有满足，可以用guard语句来提前退出函数
            print("Hey there!")
            return
        }
        print("Hey \(middleName)")
    }
    
    func siftBeans(fromGroceryList: [String]) -> (beans: [String], others: [String]) {
        
        var beansList: [String] = []
        var othersList = [String]()
        
        for name in fromGroceryList {
            
            if name.hasSuffix("beans") {
                beansList.append(name)
            } else {
                othersList.append(name)
            }
        }
        return (beansList, othersList)
    }
    
    func maketowngrand() -> (Int, Int) -> Int {//函数作为返回值
        func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    }

    func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {//闭包能捕获变量
        var totalPopulation = population
        func populationTracker(growth: Int) -> Int {
            totalPopulation += growth
            return totalPopulation
        }
        return populationTracker
    }
    
}
