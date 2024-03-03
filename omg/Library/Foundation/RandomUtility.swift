//
//  RandomUtility.swift
//  omg
//
//  Created by Aleksey Chaykin on 03.03.2024.
//

import Foundation

struct RandomUtility {
    static var randomIntFrom10To20: Int {
        Int.random(in: 10..<20)
    }
    
    static func getRowArray(with count: Int) -> [Row] {
        return (0..<count).map { _ in
            Row(value: getCellArray(with: randomIntFrom10To20))
        }
    }
    
    static func getCellArray(with count: Int) -> [Cell] {
        return (0..<count).map { _ in Cell(value: randomIntFrom10To20) }
    }
}
