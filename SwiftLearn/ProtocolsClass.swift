//
//  ProtocolsClass.swift
//  SwiftLearn
//
//  Created by fk on 2021/2/25.
//

import Foundation

protocol TabularDataSource {
    var nemberOfRows: Int { get }
    var nemberOfColumns: Int { get }

    func label(forColumn column: Int) -> String
    func itemFor(row: Int, colunmn: Int) -> String
    
}

struct Person {
    let name: String
    let age: Int
    let yearOfExperinece: Int
}

struct Department: TabularDataSource, CustomStringConvertible  {

    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    // CustomStringConvertible
    var description: String {
        return "Department \(name)"
    }
    
    // TabularDataSource
    var nemberOfRows: Int {
        return people.count
    }
    
    var nemberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0:
            return "Employee Name"
        case 1:
            return "Age"
        case 2:
            return "Years of Experience"
        default:
            fatalError("invaild Column!")
        }
    }
    
    func itemFor(row: Int, colunmn: Int) -> String {
        let person = people[row]
        
        switch colunmn {
        case 0:
            return person.name
        case 1:
            return String(person.age)
        case 2:
            return String(person.yearOfExperinece)
        default:
            fatalError("Invaild Coloumn!!")
        }
        
        
    }
}



class ProtocolsCls: NSObject {
    
    func printTable2(_ dataSource: TabularDataSource & CustomStringConvertible ) {

        print("Table : \(dataSource.description)")
        
        var firstRow = "|"
        var columnWidths = Array<Int>()
        
        for i in 0...dataSource.nemberOfColumns - 1 {
            let columnLabel = dataSource.label(forColumn: i)
            let columnHeader = " \(columnLabel) |"
            firstRow += columnHeader
            columnWidths.append(columnLabel.count)
        }
        print(firstRow)
        
        for i in 0...dataSource.nemberOfRows - 1 {
            
            var out = "|"
            for j in 0...dataSource.nemberOfColumns - 1 {
                let item = dataSource.itemFor(row: i, colunmn: j)
                
                let paddingNeeded = columnWidths[j] - item.count
                
                let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
                out += " \(padding)\(item) |"
            }
            print(out)
        }
    }
    
    
    func printTable(_ data: [[String]], withColumnLabels columnLabels: String...) -> Void {
        
        var firstRow = "|"
        var columnWidths = Array<Int>()
        
        for columnLabel in columnLabels {
            let columnHeader = " \(columnLabel) |"
            firstRow += columnHeader
            columnWidths.append(columnLabel.count)
        }
        print(firstRow)
        
        for row in data {
            
            var out = "|"
            for (j, item) in row.enumerated() {
                
                let paddingNeeded = columnWidths[j] - item.count
                
                let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
                out += " \(padding)\(item) |"
            }
            print(out)
        }
    }
    
}
