//
//  Row.swift
//  omg
//
//  Created by Aleksey Chaykin on 02.03.2024.
//

import Foundation

struct Row: Identifiable {
    let id = UUID().uuidString
    let value: [Cell]
}

struct Cell: Identifiable {
    let id = UUID().uuidString
    let value: Int
}
