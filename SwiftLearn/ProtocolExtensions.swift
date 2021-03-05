//
//  ProtocolExtensions.swift
//  SwiftLearn
//
//  Created by fk on 2021/3/2.
//

import Foundation

protocol Exercise {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

extension Exercise {// 协议扩展： 可以给任何协议添加方法和计算属性，不过，协议扩展中添加的属性和方法只能使用肯定存在的其他属性和方法
    
    var name: String { return "FF·KK" }//用协议扩展提供默认实现
    
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

extension Sequence where Iterator.Element == Exercise {// 带where子句的协议扩展： 用where子句可以限制协议扩展只对Element是某个类型的Sequence生效
    
    func totalCaloriesBurned() -> Double {
        
        var total: Double = 0.0
        for exercise in self {// self 是一种满足Sequence协议的序列，这个序列里的元素都是Exercise类型
            total += exercise.caloriesBurned
        }
        return total
    }
}


struct ElipticalWorkout: Exercise {
//    let name: String = "Eliptical Workout"
    let caloriesBurned: Double
    let minutes: Double
}

struct TreadmillWorkout: Exercise {
    let name: String = "Treadmill Workout"
    let caloriesBurned: Double
    let minutes: Double
    let laps: Double
}


class ProtocolExtensionsTest {

    func test() {
        let ellipticalWorkout = ElipticalWorkout(caloriesBurned: 335, minutes: 30)
        
        let runningWorkout = TreadmillWorkout(caloriesBurned: 350, minutes: 25, laps: 10.5)
//        ellipticalWorkout.caloriesBurnedPerMinute
        
        print(ellipticalWorkout.caloriesBurnedPerMinute)
        print(runningWorkout.caloriesBurnedPerMinute)

        
        let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
        print(mondayWorkout.totalCaloriesBurned())
        //这里的mondayWorkout数组可以用totalCaloriesBurned()是因为首先数组符合Sequence这个协议，其次totalCaloriesBurned()这个方法在协议扩展里指明了序列里的元素必须是Exercise类型。mondayWorkout满足这两个条件，所以可以使用totalCaloriesBurned()这个方法，其他数组不可以调用
    }
}

/*
 在考虑写一个协议扩展添加加属性或方法时，如果它们不是协议所需的属性或方法的默认实现，那就得小心了。如果符合协议的类型也实现了这些属性或方法，那么运行时行为可能就不是你所预期的。
 page:268 关于命名：一个警世故事
 */
