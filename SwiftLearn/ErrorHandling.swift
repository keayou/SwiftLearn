//
//  ErrorHandling.swift
//  SwiftLearn
//
//  Created by fk on 2021/3/1.
//

import Foundation

enum Token {
    case number(Int)
    case plus
}

class Lexer {
    
    enum Error: Swift.Error {
        case invalidCharacter(Character)
    }
//    let input: String.CharacterView
    let position: String.Index
    
    init(input: String) {
        
//        input
        self.position = input.startIndex
        
    }
    
    
    
    
    
    
    
}
