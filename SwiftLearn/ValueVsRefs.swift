//
//  ValueVsRefs.swift
//  SwiftLearn
//
//  Created by fk on 2021/2/4.
//


/*
 (1) 如果类型需要传值，那就用结构体。这么做会确保赋值或传递到函数参数中时类型被复制。
 (2) 如果类型不支持子类继承，那就用结构体。结构体不支持继承，所以不能有子类。
 (3) 如果类型要表达的行为相对比较直观，而且包含一些简单值，那么考虑优先用结构体实 现。有必要的话，之后可以随时把结构体改成类。
 (4) 其它所有情况都用类。
 */
import Foundation

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}


struct Panthen {
    var chiefGod: GreekGod
    
}


class ValueVsRefs {
    
    init() {
        
        var str = "Hello"
        
        var greeting = str
        
        greeting += " world"
        
        print(str)
        print(greeting)
        
        let hecate = GreekGod(name: "Hecate")
        
        let panthon = Panthen(chiefGod: hecate)
        let zeus = GreekGod(name: "Zeus")
        
//        panthon.chiefGod = zeus
        // 声明为常量的值类型不能改变其属性
        // 也就是说值类型被声明为常量的话，之后无法改变它的某一部分
        
        zeus.name = "Zeus Jr."
        // 声明为常量的引用类型可以改变其属性
        
        
        let greekPantheon = panthon
        hecate.name = "Trivia"
        print(panthon.chiefGod.name)
        print(greekPantheon.chiefGod.name)
        // 这里说明 ： 正常情况下，值类型的事例赋给新的常量、变量或者传递给函数时，实例会被复制；但是如果这个值类型中有引用类型属性（本例中的chiefGod），那么值类型会把同一个引用传递给新的变量、常量或者函数，所以改变那个引用类型实例的属性，新旧值类型里的引用的属性也都改了
        
        //相等 和 同一
        let x = 1
        let y = 1
        if x == y {
            print("x == y")
        }
        //值类型用 == 判断是否相等
        
        let hecate22 = GreekGod(name: "Hecsssate")
        let hecate33 = GreekGod(name: "Hecate")

        if hecate22 === hecate33 {
            print("hecate22 === hecate33")
        } else {
            print("hecate22 is not hecate33")
        }
        //引用类型用 === 判断是否指向 同一 实例
        
//        两个常量或两个变量可能相等(具有相同的值)但不同一(指向给定类型的不同实例);
//        但是反过来不成立:如果两个变量或常量指向内存中的同一个实例， 那它们一定也相等。
        
        var list = [Int]()
        list.append(12)
        
        var ate = GreekGod(name: "Hecate")

        
        if isKnownUniquelyReferenced(&ate) {
            print("ssdsdq343")
        }
    }
}

/*
 
 page:201  深入理解：写时复制（copy on write，COW）
 
写时复制(copy on write，COW)是指对值类型的底层层存储的隐式共享。这种优化能够让某个值类型的多个实例共享同一个底层存储，也就是每个实例自己并不持有一份数据的副本;反之， 每个实例会维护自己对同一份存储的隐用。如果某个实例需要修改或写入存储，那么这个实例就会产生一份自己的副本。这意味着值类型能避免创建多余的数据副本。
 
 var list = ["a", "b", "c"]
 var listB = list
 
 也就是此时 list 和 listB 其实还是指向的同一份底层存储
 
 对listB进行修改
 listB.append(12)

 此时list 和 listB就是两份不同存储了
 
 Swift的容器已经提供了写时复制支持，一般不需要我们实现。
 比如一个由数字、字典和字符串组成的结构体自动拥有COW，因为它的组成部分都有标准款实现的COW
 
 */
