//
//  Generics.swift
//  SwiftLearn
//
//  Created by fk on 2021/3/1.
//

import Foundation


struct Stack<Element>: Sequence {

    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {// 方法也可以用泛型
        
        var stack = Stack<U>()
        for item in items {
            stack.push(f(item))
        }
        return stack
    }
    
    
    func checkIfEquatable<T: Equatable>(_ first: T, _ second: T) -> Bool {//<T: Equatable> 给泛型添加约束  这里表明该实际类型必须满足Equatable协议, 还可以约束类型必须是给定类的子类
        return first == second
    }
    
    
    typealias Iterator = StackIterator<Element>//Sequence协议中有一个关联类型Iterator，Iterator这个类型需要满足IteratorProtocol协议，之所以这里为StackIterator的泛型指明是Element类型是因为最后 return StackIterator(stack: self) 中的 self 里是Element类型, 所以也可以是下面注释的那种方式
    __consuming func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
//    typealias Iterator = StackIterator<Int>
//    __consuming func makeIterator() -> StackIterator<Int> {
//        return StackIterator(stack: Stack<Int>(items: [1, 5]))
//    }
    

    mutating func pushAll(_ array: [Element]) {
        for item in array {
            self.push(item)
        }
    }
    mutating func pushAll<S: Sequence>(_ sequece: S) where S.Iterator.Element == Element {// 类型约束中的where子句
        for item in sequece {
            self.push(item)
        }
    }
    // 比较上面两个pushAll： 第二个没有 “where S.Iterator.Element == Element”时就是一个泛型方法，之所以需要where是为了限制 S.Iterator 的迭代结果类型与self.push的参数类型保持一致
    
    
//补充：
    // 带约束的泛型函数也符合多态的定义：一个函数可以接受不同的类型。 所以给泛型添加约束的能力带来了另一种形式的多态：编译时多态，也称为参数多态。（常规的通过继承方式实现的多态叫做运行时多态或者子类多态）
    // 比如 checkIfEquatable<T: Equatable> 和 pushAll<S: Sequence>  他俩都可以接受不同的参数类型，只要这个参数类型符合其约束
    // 继承方式实现的运行时多态需要有继承关系的类紧密的联系在一起，很难改变一个不影响另一个；而编译时多态的类型可能毫不相关
    // ******* 所以在写继承时，应该首先考虑问题是不是可以用协议和泛型来解决更好 ********
    
    
    
}


struct StackIterator<T>: IteratorProtocol {// 关联类型协议
    
    typealias Element = T //由于声明了IteratorProtocol，其内部有一个关联类型 associatedtype Element  所以需要为Element提供typealias定义 (也可以不写这句，SWift可以推断出关联的类型, 但是下面的 Element? 需要改成 T? )

    var stack: Stack<T>
    
    mutating func next() -> Element? {
        return stack.pop()
    }
}

class Generics {
    
    func genericsTest() {
        

        
        let strings = ["one", "two", "three"]
        let stringsLengths: Array<Int> = myMap(strings) { $0.count }
        print(stringsLengths)
        
        let strings2 = ["one", "two", "three"]
        let stringsLengths2: Array<String> = myMap(strings2) { $0 + " | " }
        print(stringsLengths2)
        
        
        var stack = Stack<Int>()
        stack.push(5)
        stack.push(4)
        stack.push(3)

        let doubleStack: Stack<String> = stack.map { (ele) -> String in
            return " \(ele * 2) "
        }
        let doubleStack2: Stack<String> = stack.map { " \($0 * 2) "
        }
        print(doubleStack)
        print(doubleStack2)

        
        var myStack = Stack<Int>()
        myStack.push(1)
        myStack.push(2)
        myStack.push(3)

        var stackIte = StackIterator(stack: myStack)
        while let value = stackIte.next() {
            print("StackIterator had got \(value)")
        }
        
        for item in stack { // 这里可以直接遍历stack这个结构体  是因为Stack实现了Sequence 这个协议
            print(" pushing : \(item) ")
        }
        
        var myOtherStack = Stack<Int>()
        myOtherStack.pushAll([10,20,30])
        
        myStack.pushAll(myOtherStack)
        for value in myStack {
            print(" after pushAll: \(value)")
        }
    }
    
    func myMap<T,U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
        
        var result = [U]()
        
        for item in items {
            
            result.append(f(item))
        }
        return result
    }

    
}
